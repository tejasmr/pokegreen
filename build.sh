#!/usr/bin/env bash
set -e

# Detect number of CPU cores
if command -v nproc >/dev/null 2>&1; then
    CORES=$(nproc)
elif command -v sysctl >/dev/null 2>&1; then
    CORES=$(sysctl -n hw.ncpu)
else
    CORES=2
fi

# Check for RGBDS tools
REQUIRED_TOOLS=("rgbasm" "rgblink" "rgbfix" "rgbgfx" "make")
MISSING=0

for tool in "${REQUIRED_TOOLS[@]}"; do
    if ! command -v "$tool" >/dev/null 2>&1; then
        echo "Error: '$tool' is not installed or not in your PATH." >&2
        MISSING=1
    fi
done

if [ $MISSING -eq 1 ]; then
    REQUIRED_VER=$(cat .rgbds-version 2>/dev/null || echo "1.0.3")
    echo "" >&2
    echo "Please install RGBDS (recommended version: $REQUIRED_VER):" >&2
    echo "  - macOS: brew install rgbds" >&2
    echo "  - Linux / Windows (WSL): see INSTALL.md or https://rgbds.gbdev.io/install" >&2
    exit 1
fi

TARGET="${1:-all}"
echo "==> Building pokegreen target '$TARGET' using $CORES cores..."
make -j"$CORES" "$TARGET"

echo ""
echo "==> Build complete! Output files:"
ls -lh *.gb 2>/dev/null || true

