#!/bin/sh
#
# Runs an nmap for all the local IPs
#
set -e

arp_scan=$(arp-scan --localnet 2>&1)
echo "$arp_scan"

ips=()
manufacturers=()

while read -r line; do
    ip=$(echo "$line" | awk '{print $1}')
    manufacturer=$(echo "$line" | awk '{for(i=3;i<=NF;++i) printf $i " "; print ""}')
    ips+=("$ip")
    manufacturers+=("$manufacturer")
done <<< "$(echo "$arp_scan" | grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}.*$')"

tmp_dir=$(mktemp -d)
echo "saving to $tmp_dir ..."

for ip in "${ips[@]}"; do
    nmap -A --osscan-guess -T4 -v -sV "$ip" | tee "$tmp_dir/$ip" &
done

wait

for f in $tmp_dir/*; do
  ip=$(basename "$f")

  for i in "${!ips[@]}"; do
    if [ "${ips[$i]}" = "$ip" ]; then
      manufacturer="${manufacturers[$i]}"
      break
    fi
  done

  echo
  echo "--- $ip ($manufacturer) ---"
  awk '/PORT/,/Nmap scan report for/ {if (!/Nmap scan report for/ && !/PORT/) print}' "$f"
done
