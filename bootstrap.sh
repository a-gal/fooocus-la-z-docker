#!/bin/bash

repo_url="https://github.com/lllyasviel/Fooocus.git"

if [ ! -e /app/fooocus/entry_with_update.py ]; then
    echo "Script file does not exist. Cloning..."
    cd /app/fooocus && \
    git init && \
    git remote add origin "$repo_url" && \
    git fetch && \
    git reset origin/main && \
    git checkout -t origin/main
    if $? -ne 0; then
        echo "Failed to clone repo"
        exit 1
    fi
fi

if [ ! -e /app/venv ]; then
    echo "Venv does not exist. Creating..."
    if ! venv /app/venv; then
        echo "Failed to venv"
        exit 1
    fi
fi

. /app/venv/bin/activate
pip3 install -r requirements_versions.txt

# Execute the script with the provided arguments
python3 /app/fooocus/entry_with_update.py "$@"