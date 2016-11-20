#!/bin/sh
for f in ./katas/**/*.js; do
    question_desc="$(head -1 "$f")"

    number=$(echo ${question_desc} | awk '{print $2}' | awk -F  ":" '{print $1}')
    padded_number=`printf "%02d\n" ${number}`

    name=$(echo ${question_desc} | awk '{$1=""; $2=""; print}' | awk '{$1=$1};1' | sed -e 's/[ \.]/-/g' | sed -e 's/[/`()]//g' | tr -s "-" | tr A-Z a-z)
    filename=$(echo ${number}-${name}.js)
    if [ ! -f "$filename" ]; then
        mv "$f" "katas/$filename"
    else
        echo "File '$filename' already exists! Skipped '$f'"
    fi
done