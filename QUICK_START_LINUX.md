# 🚀 Quick Start - Linux Server

## One-Command Setup & Build

```bash
chmod +x setup-linux.sh && ./setup-linux.sh
```

This will:
1. Check if Go is installed
2. Install templ CLI
3. Generate templ files
4. Build static site to `dist/` folder

---

## Manual Steps (if needed)

### 1. Install templ
```bash
go install github.com/a-h/templ/cmd/templ@latest
export PATH=$PATH:~/go/bin
```

### 2. Build Static Site
```bash
templ generate
go run generate-static.go
```

### 3. Serve Locally
```bash
go run serve.go
# or
cd dist && python3 -m http.server 8000
```

---

## Deploy to Production

```bash
# Build
./build.sh

# Copy to web server
sudo cp -r dist/* /var/www/html/
```

---

## Troubleshooting

**"templ: command not found"**
```bash
go install github.com/a-h/templ/cmd/templ@latest
echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
source ~/.bashrc
```

**"dist folder not created"**
```bash
# Check for errors
templ generate
go run generate-static.go
```

---

## ✅ Expected Output

```
================================================
Grove Technologies - Linux Setup & Build
================================================

✅ Go is installed: go version go1.21.5 linux/amd64
✅ templ is already installed: v0.2.778

================================================
Building Static Site
================================================

[1/2] Generating templ files...
✅ Templ files generated

[2/2] Building static site...
2025/11/07 11:02:15 🚀 Starting static site build...
2025/11/07 11:02:15 📄 Generating index.html...
2025/11/07 11:02:15 ✅ Generated index.html (36468 bytes)
2025/11/07 11:02:15 📦 Copying static assets...
2025/11/07 11:02:15 ✨ Static site build complete!

================================================
✅ Setup and Build Complete!
================================================

📁 Static site generated in: dist/
```

---

## 🌐 Access Your Site

**Local:** http://localhost:8000  
**Production:** http://your-domain.com

---

See **LINUX_DEPLOY.md** for complete deployment guide.
