#!/usr/bin/env bash


json_output="{}"

for dir in $1; do
    # Verifica se é um diretório
    if [ -d "$dir" ]; then
        # Obtém o tamanho da pasta usando du
        size=$(du -sh "$dir" | cut -f1)
        # Obtém o nome da pasta
        folder_name=$(basename "$dir")
        # Usa jq para adicionar o par chave-valor ao JSON
        json_output=$(echo "$json_output" | jq --arg folder "$folder_name" --arg size "$size" '. + {($folder): $size}')
    fi
done

final_output=$(echo "$json_output" | jq -c '{outputs: .}')

# Exibe o JSON final no formato especificado
echo "::${final_output}::"
