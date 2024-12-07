#!/bin/bash
# Check the operating system
OS=$(uname)

if [ "$OS" == "Linux" ]; then
    /home/linuxbrew/.linuxbrew/bin/hugo server --disableFastRender --bind 0.0.0.0
elif [ "$OS" == "Darwin" ]; then
    hugo server --disableFastRender --bind 0.0.0.0
else
    echo "Unsupported OS: $OS"
    exit 1
fi