#!/bin/sh
#
# Skips the first n columns of a line
#

n=$1

awk "{print substr(\$0, index(\$0,\$${n}))}"
