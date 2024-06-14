#!/bin/sh
#
# Finds the largest files under the current directory.
#
# Examples:
#
#  # Find the 10 largest files
#  largest_files.sh 10
#
#  # Find the 5 largest files
#  largest_files.sh 5
#

n=${1:-10}

find . -type f -exec du -h {} + | sort -rh | head -$n
