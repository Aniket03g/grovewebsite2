#!/bin/bash

echo "================================================"
echo "Grove Technologies - Linux Setup & Build"
echo "================================================"
echo ""

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "❌ Go is not installed!"
    echo ""
    echo "Please install Go first:"
    echo "  wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz"
    echo "  sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz"
    echo "  export PATH=\$PATH:/usr/local/go/bin"
    echo ""
    exit 1
fi

echo "✅ Go is installed: $(go version)"
echo ""

# Add Go bin to PATH if not already there
if [[ ":$PATH:" != *":$HOME/go/bin:"* ]]; then
    echo "📝 Adding ~/go/bin to PATH..."
    export PATH=$PATH:$HOME/go/bin
    
    # Make it permanent
    if ! grep -q 'export PATH=$PATH:$HOME/go/bin' ~/.bashrc; then
        echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
        echo "✅ Added to ~/.bashrc (will persist after restart)"
    fi
fi

# Check if templ is installed
if ! command -v templ &> /dev/null; then
    echo "📦 Installing templ..."
    go install github.com/a-h/templ/cmd/templ@latest
    
    # Refresh PATH
    export PATH=$PATH:$HOME/go/bin
    
    # Verify installation
    if command -v templ &> /dev/null; then
        echo "✅ templ installed successfully: $(templ version)"
    else
        echo "⚠️  templ installed but not found in PATH"
        echo "    Run: export PATH=\$PATH:~/go/bin"
        exit 1
    fi
else
    echo "✅ templ is already installed: $(templ version)"
fi

echo ""
echo "================================================"
echo "Building Static Site"
echo "================================================"
echo ""

# Generate templ files
echo "[1/2] Generating templ files..."
templ generate
if [ $? -ne 0 ]; then
    echo "❌ Failed to generate templ files"
    exit 1
fi
echo "✅ Templ files generated"

echo ""

# Build static site
echo "[2/2] Building static site..."
go run generate-static.go
if [ $? -ne 0 ]; then
    echo "❌ Failed to build static site"
    exit 1
fi

echo ""
echo "================================================"
echo "✅ Setup and Build Complete!"
echo "================================================"
echo ""
echo "📁 Static site generated in: dist/"
echo ""
echo "To serve locally:"
echo "  go run serve.go"
echo ""
echo "To deploy to web server:"
echo "  sudo cp -r dist/* /var/www/html/"
echo ""
echo "To serve with Python:"
echo "  cd dist && python3 -m http.server 8000"
echo ""
echo "================================================"
