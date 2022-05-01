#!/bin/bash
# Create daily commit file with a name like 20191231_01.md

i="1"
DATE="$(date '+%Y%m%d')"
SEPARATOR="_"
while [[ -f "$DATE$SEPARATOR$(printf '%02d' $i).md" ]]; do
i=$[$i+1]
done

touch "$DATE$SEPARATOR$(printf '%02d' $i).md"

