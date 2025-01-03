#!/bin/sh

lsof -i | grep "\->" | awk -F "\->" '{print $2}' | awk '{print $1}' | awk -F ":" '{print $2 "://" $1}' | sort -u