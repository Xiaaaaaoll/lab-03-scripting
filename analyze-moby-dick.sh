#!/bin/bash
set -euo pipefail

SEARCH_PATTERN="$1"
OUTPUT="${2:-results.txt}"

if [ -f "$OUTPUT" ]; then
    echo "Output file '$OUTPUT' already exists. Aborting."
    exit 1
fi

curl -s -o mobydick.txt "https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt"

OCCURRENCES=$(grep -oi "$SEARCH_PATTERN" mobydick.txt | wc -l | tr -d ' ')

echo "The search pattern $SEARCH_PATTERN was found $OCCURRENCES time(s)." > "$OUTPUT"
grep -ni "$SEARCH_PATTERN" mobydick.txt | cut -d: -f1 >> "$OUTPUT"
