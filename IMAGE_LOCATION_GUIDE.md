# 📁 Image Location Guide

## ✅ Where to Put Images

All images must be placed in the **`static/img/`** directory to be accessible on the website.

---

## 📂 Correct Directory Structure

```
grove-site/
├── static/
│   └── img/
│       ├── meeting.png              ← Your images go here
│       ├── scheduler_mockup.jpeg
│       ├── grove_logo_black.png
│       ├── grove_logo_white.png
│       ├── home.jpg
│       ├── vision.jpg
│       ├── distribution/
│       │   └── (partner logos)
│       └── featuredsectionimges/
│           └── (project images)
├── dist/                            ← Generated static site (auto-created)
├── templates/                       ← Template files
└── main.go
```

---

## 🎯 How to Add Images

### **Step 1: Copy Image to Correct Location**

**Windows:**
```bash
copy your-image.png static\img\your-image.png
```

**Linux/Mac:**
```bash
cp your-image.png static/img/your-image.png
```

### **Step 2: Reference in Template**

```html
<img src="/static/img/your-image.png" alt="Description" />
```

**Important:** 
- Path starts with `/static/img/`
- Use forward slashes `/` even on Windows
- Include file extension (.png, .jpg, .jpeg, etc.)

---

## 🔍 Current Images in Project

### **Main Images:**
- `meeting.png` - Meeting room (hero section)
- `scheduler_mockup.jpeg` - Scheduler dashboard
- `grove_logo_black.png` - Logo (header)
- `grove_logo_white.png` - Logo (footer)
- `home.jpg` - Home image
- `vision.jpg` - Vision image
- `product.png` - Product image

### **Project Images:**
Located in `static/img/featuredsectionimges/`
- Project showcase images

### **Partner Logos:**
Located in `static/img/distribution/`
- Partner company logos

---

## ❌ Common Mistakes

### **Wrong:**
```
grove-site/
├── meeting.png              ← Wrong! Root directory
└── static/
    └── img/
```

### **Correct:**
```
grove-site/
└── static/
    └── img/
        └── meeting.png      ← Correct! Inside static/img/
```

---

## 🔄 After Adding Images

### **For Development Server:**
1. Images are served automatically
2. Just refresh browser
3. No rebuild needed

### **For Static Build:**
```bash
# Rebuild static site
go run generate-static.go

# Images are automatically copied to dist/static/img/
```

---

## 🌐 URL Paths

### **In Templates:**
```html
<!-- Correct -->
<img src="/static/img/meeting.png" />

<!-- Also works (relative) -->
<img src="static/img/meeting.png" />
```

### **In Browser:**
```
http://localhost:8080/static/img/meeting.png
```

---

## 📊 Image Recommendations

### **Format:**
- **PNG** - For logos, graphics with transparency
- **JPEG/JPG** - For photos, screenshots
- **SVG** - For icons, simple graphics

### **Size:**
- **Hero images:** 1200-1600px wide
- **Project images:** 800-1200px wide
- **Logos:** 200-400px wide
- **Icons:** 64-128px

### **Optimization:**
- Compress images before uploading
- Use tools like TinyPNG, ImageOptim
- Keep file sizes under 500KB when possible

---

## 🛠️ Quick Commands

### **Copy image to correct location:**
```bash
# Windows
copy meeting.png static\img\meeting.png

# Linux/Mac
cp meeting.png static/img/meeting.png
```

### **List all images:**
```bash
# Windows
dir static\img

# Linux/Mac
ls -la static/img/
```

### **Verify image exists:**
```bash
# Windows
dir static\img\meeting.png

# Linux/Mac
ls static/img/meeting.png
```

---

## ✅ Checklist for Adding Images

- [ ] Image file is in `static/img/` directory
- [ ] File name has no spaces (use hyphens or underscores)
- [ ] File extension is correct (.png, .jpg, .jpeg)
- [ ] Template references correct path: `/static/img/filename.ext`
- [ ] Image is optimized (compressed)
- [ ] Alt text is descriptive
- [ ] Server is restarted (if needed)
- [ ] Browser is refreshed

---

## 🚀 Your Meeting Image

**Location:** `static/img/meeting.png` ✅

**Referenced in:** `templates/hero.templ`

**URL:** `http://localhost:8080/static/img/meeting.png`

**Status:** ✅ Correctly placed and should now be visible!

---

## 📝 Summary

**Always put images in:** `static/img/`

**Reference them as:** `/static/img/filename.ext`

**That's it!** The server automatically serves files from the `static/` directory.
