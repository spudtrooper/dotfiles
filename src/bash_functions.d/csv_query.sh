#!/bin/sh
#
# Usage: csv_query.sh <csv> <query>
#

set -e

csv=$1
shift
query="$@"

sqlite3 :memory: -cmd ".import -csv $csv t" "$query"
