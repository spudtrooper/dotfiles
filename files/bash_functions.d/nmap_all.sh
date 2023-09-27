#!/bin/sh

set -e

arp-scan --localnet
ips_str=$(arp-scan --localnet | \
  grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' | \
  tr '\n' ' ' | \
  sort)
read -ra ips <<< "$ips_str"

echo "Scanning the following IPs:"
for ip in "${ips[@]}"; do
  echo " - $ip"
done

nmap -A --osscan-guess -T4 -v -sV -Pn "${ips[@]}"