#!/bin/sh

set -e

msg="$@"
if [[ -z "$msg" ]]; then
	msg="update $(date)"
fi
git add .
git commit -m "$msg"
git push