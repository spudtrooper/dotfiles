#!/bin/sh

gh repo create $1 --public -y
gh repo clone $1
echo "Now change to $1"