#!/usr/bin/env bash


json_output="{}"

for dir in $1; do
    if [ -d "$dir" ]; then
        size=$(du -sh "$dir" | cut -f1)
        folder_name=$(basename "$dir")
        json_output=$(echo "$json_output" | jq --arg folder "$folder_name" --arg size "$size" '. + {($folder): $size}')
    fi
done

final_output=$(echo "$json_output" | jq -c '{outputs: .}')

echo "::${final_output}::"
