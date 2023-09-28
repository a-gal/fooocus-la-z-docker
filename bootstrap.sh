#!/bin/bash

script_url="https://raw.githubusercontent.com/AUTOMATIC1111/stable-diffusion-webui/master/webui.sh"

if [ ! -e /app/webui.sh ]; then
    echo "Script file does not exist. Downloading..."
    if ! wget -O /app/webui.sh "$script_url"; then
        echo "Failed to download the script file."
        exit 1
    fi
fi

# Execute the script with the provided arguments
bash /app/webui.sh "$@"