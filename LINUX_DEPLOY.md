# 🐧 Linux Server Deployment Guide

## 🚀 Complete Steps to Deploy on Linux Server

### Step 1: Install Go (if not installed)

```bash
# Check if Go is installed
go version

# If not installed, install Go 1.21+
wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz

# Add to PATH
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify
go version
```

---

### Step 2: Install templ CLI

```bash
# Install templ
go install github.com/a-h/templ/cmd/templ@latest

# Add Go bin to PATH (if not already)
echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
source ~/.bashrc

# Verify templ is installed
templ version
```

---

### Step 3: Navigate to Your Project

```bash
cd ~/website_alt/grovewebsite2
```

---

### Step 4: Build Static Site

```bash
# Make build script executable
chmod +x build.sh

# Run build
./build.sh
```

**OR manually:**

```bash
# Step 1: Generate templ files
templ generate

# Step 2: Build static site
go run generate-static.go
```

---

### Step 5: Verify dist Folder Created

```bash
ls -la dist/
# Should show:
# - index.html
# - static/ folder
```

---

### Step 6: Serve the Static Site

#### Option A: Using Go Server (Recommended)
```bash
go run serve.go
# Serves on http://localhost:8000
```

#### Option B: Using Python
```bash
cd dist
python3 -m http.server 8000
```

#### Option C: Using Nginx (Production)
```bash
# Copy dist to web root
sudo cp -r dist/* /var/www/html/

# Or create new site
sudo cp -r dist /var/www/grove-site
sudo chown -R www-data:www-data /var/www/grove-site
```

---

## 🔧 Complete Command Sequence

```bash
# 1. Install templ (one-time setup)
go install github.com/a-h/templ/cmd/templ@latest
export PATH=$PATH:~/go/bin

# 2. Navigate to project
cd ~/website_alt/grovewebsite2

# 3. Build static site
chmod +x build.sh
./build.sh

# 4. Serve locally (for testing)
go run serve.go

# 5. For production, copy to web server
sudo cp -r dist/* /var/www/html/
```

---

## 📋 Troubleshooting

### Error: "templ: command not found"
```bash
# Install templ
go install github.com/a-h/templ/cmd/templ@latest

# Add to PATH
echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### Error: "dist folder not created"
```bash
# Check for errors
templ generate
go run generate-static.go

# Check if dist exists
ls -la | grep dist
```

### Error: "Permission denied"
```bash
# Make scripts executable
chmod +x build.sh
chmod +x *.sh
```

---

## 🌐 Production Nginx Setup

### 1. Install Nginx
```bash
sudo apt update
sudo apt install nginx
```

### 2. Create Site Configuration
```bash
sudo nano /etc/nginx/sites-available/grove-site
```

**Add this configuration:**
```nginx
server {
    listen 80;
    server_name your-domain.com;
    
    root /var/www/grove-site;
    index index.html;
    
    location / {
        try_files $uri $uri/ =404;
    }
    
    # Cache static assets
    location /static/ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
```

### 3. Enable Site
```bash
sudo ln -s /etc/nginx/sites-available/grove-site /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

### 4. Deploy Site
```bash
cd ~/website_alt/grovewebsite2
./build.sh
sudo mkdir -p /var/www/grove-site
sudo cp -r dist/* /var/www/grove-site/
sudo chown -R www-data:www-data /var/www/grove-site
```

---

## 🔒 Add SSL (HTTPS)

```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx

# Get SSL certificate
sudo certbot --nginx -d your-domain.com

# Auto-renewal is set up automatically
```

---

## 🚀 Quick Deploy Script

Create `deploy.sh`:

```bash
#!/bin/bash

echo "🚀 Deploying Grove Technologies Website..."

# Build static site
echo "📦 Building static site..."
./build.sh

# Copy to web root
echo "📁 Copying to web server..."
sudo cp -r dist/* /var/www/grove-site/
sudo chown -R www-data:www-data /var/www/grove-site

# Reload Nginx
echo "🔄 Reloading Nginx..."
sudo systemctl reload nginx

echo "✅ Deployment complete!"
echo "🌐 Site live at: http://your-domain.com"
```

Make it executable:
```bash
chmod +x deploy.sh
```

Use it:
```bash
./deploy.sh
```

---

## 📊 System Requirements

- **Go:** 1.21 or higher
- **templ:** Latest version
- **Disk Space:** ~50MB
- **RAM:** 512MB minimum
- **OS:** Ubuntu 20.04+ / Debian 10+ / Any Linux

---

## ✅ Verification Checklist

After deployment, verify:

- [ ] `templ` command works
- [ ] `go version` shows 1.21+
- [ ] `./build.sh` completes successfully
- [ ] `dist/` folder exists
- [ ] `dist/index.html` exists (~36KB)
- [ ] `dist/static/` folder has images
- [ ] Site loads on http://localhost:8000
- [ ] All animations work
- [ ] Partner carousel scrolls
- [ ] All images load
- [ ] Mobile responsive

---

## 🎯 Common Issues & Solutions

### Issue: "go: command not found"
**Solution:**
```bash
# Install Go
wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### Issue: "templ: command not found"
**Solution:**
```bash
go install github.com/a-h/templ/cmd/templ@latest
echo 'export PATH=$PATH:~/go/bin' >> ~/.bashrc
source ~/.bashrc
```

### Issue: "Permission denied: ./build.sh"
**Solution:**
```bash
chmod +x build.sh
```

### Issue: "dist folder empty"
**Solution:**
```bash
# Check for build errors
templ generate 2>&1 | tee templ.log
go run generate-static.go 2>&1 | tee build.log
```

---

## 📝 Environment Variables

For production, you can set:

```bash
# In ~/.bashrc or /etc/environment
export PORT=8000
export GO_ENV=production
```

---

## 🔄 Update Workflow

When you make changes:

```bash
# 1. Edit files on your local machine
# 2. Upload to server (via git, scp, etc.)
# 3. Rebuild and deploy

cd ~/website_alt/grovewebsite2
git pull  # if using git
./build.sh
sudo cp -r dist/* /var/www/grove-site/
```

---

## 📦 Using Git for Deployment

```bash
# On server, clone repo
cd ~/website_alt
git clone <your-repo-url> grovewebsite2
cd grovewebsite2

# Install dependencies
go install github.com/a-h/templ/cmd/templ@latest

# Build and deploy
./build.sh
sudo cp -r dist/* /var/www/grove-site/

# For updates
git pull
./build.sh
sudo cp -r dist/* /var/www/grove-site/
```

---

## 🎉 Success!

Once completed, your site will be:
- ✅ Live on your Linux server
- ✅ Serving static files (fast!)
- ✅ All animations working
- ✅ Production-ready

**Access at:** `http://your-server-ip` or `http://your-domain.com`
