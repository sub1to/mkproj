#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

if [ -z "$SCRIPT_DIR" ]; then
    echo "Error: Could not determine script directory."
    exit 1
fi

cd "$SCRIPT_DIR" || { echo "Failed to enter $SCRIPT_DIR"; exit 1; }

if [ ! -f "$SCRIPT_DIR/premake5.lua" ]; then
    echo "Error: Safety check failed."
    echo "premake5.lua not found in $SCRIPT_DIR"
    echo "Aborting clean to prevent accidental deletion."
    exit 1
fi

rm -rf "$SCRIPT_DIR/.build" "$SCRIPT_DIR/.projects"
echo "Cleaned build artifacts in $SCRIPT_DIR"
