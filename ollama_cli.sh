#!/bin/bash

# Combine all arguments into one string
PROMPT=$(printf "%s " "$@")

# Send a request to Ollama and display only the generated text
ollama run llama3 "$PROMPT"
