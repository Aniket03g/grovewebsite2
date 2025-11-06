#!/bin/bash

echo "================================"
echo "Grove Technologies Static Build"
echo "================================"
echo ""

echo "[1/3] Generating templ files..."
templ generate
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to generate templ files"
    exit 1
fi
echo "[OK] Templ files generated"

echo ""
echo "[2/3] Building static site..."
go run generate-static.go
if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to build static site"
    exit 1
fi
echo "[OK] Static site built"

echo ""
echo "[3/3] Build complete!"
echo ""
echo "================================"
echo "To serve the static site:"
echo "  go run serve.go"
echo "  or"
echo "  cd dist"
echo "  python -m http.server 8000"
echo "================================"
