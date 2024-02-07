#!/bin/sh
#
# Adds scripts/commit.sh and scripts/push
#
set -e

dir=${1:-.}

mkdir -p scripts

cat <<EOF > "$dir/scripts/commit.sh"
#!/bin/sh

git add .
git commit -m "update \$(date)" "\$@"
EOF

cat <<EOF > "$dir/scripts/push.sh"
#!/bin/sh

scripts=$(dirname $0)

$scripts/commit.sh --allow-empty "$@"

git push -u
EOF

