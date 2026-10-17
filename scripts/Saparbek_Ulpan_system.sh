#!/bin/bash
# Student and system information script

PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
INFO_FILE="$PROJECT_DIR/Saparbek_Ulpan_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Ulpan"
echo "Surname: Saparbek"
echo "Group: IT2-2310"
echo "Student ID: 37615"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"
echo "Operating System: $(uname -sr)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "Memory Usage: $(free -h | awk '/Mem:/ {print $3 " used of " $2}')"
echo

if [ -f "$INFO_FILE" ]; then
    echo "Student information file exists."
else
    echo "Student information file does not exist."
fi
