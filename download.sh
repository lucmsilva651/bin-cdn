#!/bin/bash

# Lê cada link do arquivo e baixa o áudio em background
while IFS= read -r url; do
  echo "Baixando: $url"
  yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" "$url" &
done < links.txt

# Espera todos os downloads terminarem
wait

echo "Todos os downloads concluídos."

# Adiciona e faz push para o repositório
echo "Enviando para o GitHub..."
git add .
git commit -m "."
git push

echo "Finalizado com sucesso!"
