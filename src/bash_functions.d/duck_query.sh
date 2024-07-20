#!/bin/sh
#
# Usage: duck_query.sh <csv> <query>
#

set -e

csv=$1
shift
query="$@"
# Replace 'from t' with "from $csv"
query=$(echo "$query" | sed 's/from t/from '"$csv"'/g')

duckdb -c "$query"
