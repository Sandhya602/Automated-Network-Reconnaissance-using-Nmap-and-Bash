#!/bin/bash

echo "======================================"
echo " Welcome to Simple Nmap Bash Scanner "
echo "======================================"
read -p "Enter the target IP or domain: " target

mkdir -p results
filename="results/${target}_scan.txt"

echo "Scanning host: $target"
echo "Results will be saved in $filename"

# Ping Scan
echo -e "\nRunning Ping Scan..." | tee -a "$filename"
nmap -sn "$target" | tee -a "$filename"

# Port Scan
echo -e "\nRunning Port Scan..." | tee -a "$filename"
nmap -p- "$target" | tee -a "$filename"

# OS Detection and Service Version
echo -e "\nRunning OS Detection and Service Version Scan..." | tee -a "$filename"
nmap -A "$target" | tee -a "$filename"

echo -e "\nScan completed. Results saved to $filename"

