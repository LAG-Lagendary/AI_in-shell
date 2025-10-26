#!/bin/bash

# Объединяем все аргументы в одну строку
PROMPT=$(printf "%s " "$@")

# Отправляем запрос в Ollama и выводим только сгенерированный текст
ollama run llama3 "$PROMPT"
