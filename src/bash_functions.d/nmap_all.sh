#!/bin/sh
#
# Runs an nmap for all the local IPs
#
set -e

arp_scan=$(arp-scan --localnet 2>&1)
echo "$arp_scan"
ips_str=$(echo $arp_scan | \
  grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' | \
  tr '\n' ' ' | \
  sort)

tmp_dir=$(mktemp -d)

echo $ips_str | \
  xargs -I {} -n 1 -P 30 sh -c \
    "nmap -A --osscan-guess -T4 -v -sV {} | tee $tmp_dir/{}"

for f in $tmp_dir/*; do
  ip=$(basename $f)
  echo "--- $ip"
  grep /tcp "$f"
done