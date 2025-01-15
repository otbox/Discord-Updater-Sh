#!/bin/bash

# Caminho para o arquivo JSON em /opt
file="/opt/discord/resources/build_info.json"

# Verifica se o arquivo existe
if [ ! -f "$file" ]; then
  echo "Arquivo $file não encontrado!"
  exit 1
fi

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
  echo "Por favor, execute o script com sudo."
  exit 1
fi

# Lê a versão atual do arquivo JSON
version=$(grep -oP '(?<="version": ")[^"]*' $file)

# Divide a versão em componentes (major, minor, patch)
IFS='.' read -r major minor patch <<< "$version"

# Incrementa o número de versão (ajustável: major, minor ou patch)
minor=0
patch=$((patch + 1)) # Reinicia o patch

# Nova versão formatada
new_version="$major.$minor.$patch"

# Substitui a versão no arquivo JSON (usando sudo)
sed -i "s/\"version\": \"$version\"/\"version\": \"$new_version\"/" $file

echo "Versão atualizada de $version para $new_version"
