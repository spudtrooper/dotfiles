#
# extract and compare query strings from two URLs
#

URL1=$1
URL2=$2

diff <(echo "URL1" | grep -oP '\?.*' | sed 's/^?//') <(echo "URL2" | grep -oP '\?.*' | sed 's/^?//')