#!/bin/sh

# Prints a formatted version of the input file depending on its type.
# Type is determined by extension.

# Usage: print_formatted <file>

print_formatted() {
    local file="$1"
    local ext="${file##*.}"
    case "$ext" in
    "json")
        cat "$file" | jq .
        ;;
    "yaml" | "yml")
        cat "$file" | python -c 'import yaml, sys; print(yaml.dump(yaml.load(sys.stdin), default_flow_style=False))'
        ;;
    "xml")
        xmllint --format "$file"
        ;;
    "csv")
        column -t -s, "$file"
        ;;
    "tsv")
        column -t -s$'\t' "$file"
        ;;
    "md")
        glow "$file"
        ;;
    "plist")
        plutil -p "$file"
        ;;
    *)
        cat "$file"
        ;;
    esac
}

print_formatted_all() {
    for file in "$@"; do
        print_formatted "$file"
    done
}

print_formatted_all "$@"