#!/bin/bash
# Compile LaTeX document using Tectonic
# Usage: compile.sh [TEX_FILE]
# Default: main.tex

set -e

TEX_FILE="${1:-main.tex}"

# Ensure build directory exists
mkdir -p build

# Compile with tectonic
echo "Compiling ${TEX_FILE} with Tectonic..."
tectonic -o build "${TEX_FILE}"

if [ $? -eq 0 ]; then
    echo "✓ Compilation successful. Output: build/$(basename ${TEX_FILE%.tex}.pdf)"
else
    echo "✗ Compilation failed."
    exit 1
fi

