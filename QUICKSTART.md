# 🚀 Quick Start Guide

## Get Started in 3 Steps

### 1️⃣ Run Setup (Windows)

```bash
# Option A: Using batch file
setup.bat

# Option B: Using PowerShell
.\setup.ps1

# Option C: Manual setup
go mod download
go install github.com/a-h/templ/cmd/templ@latest
templ generate
```

### 2️⃣ Start the Server

```bash
go run main.go
```

### 3️⃣ Open Your Browser

Navigate to: **http://localhost:8080**

---

## 🎨 Customization Quick Tips

### Change Colors

Edit any `.templ` file and modify TailwindCSS classes:
- `bg-blue-600` → `bg-purple-600` (change primary color)
- `text-gray-600` → `text-slate-600` (change text color)

### Add/Edit Content

**Hero Section** (`templates/hero.templ`):
```go
<h1 class="text-4xl font-bold mb-4">Your Title Here</h1>
```

**Product Features** (`templates/product.templ`):
Add more feature cards in the grid.

**Projects** (`templates/projects.templ`):
Replace placeholder images with your own in `static/img/`.

### Change Animations

Modify `data-aos` attributes:
- `data-aos="fade-up"` - Fade in from bottom
- `data-aos="fade-left"` - Slide from right
- `data-aos="zoom-in"` - Zoom effect
- `data-aos="flip-left"` - Flip animation

Full list: https://michalsnik.github.io/aos/

---

## 🔄 Development Workflow

1. Edit `.templ` files
2. Run `templ generate` (regenerates Go code)
3. Refresh browser (server auto-reloads)

---

## 📸 Replace Placeholder Images

Add your images to `static/img/`:
- `product.png` - Hero section (800x600px recommended)
- `project1.jpg` - First project card
- `project2.jpg` - Second project card
- `project3.jpg` - Third project card

---

## 🐛 Troubleshooting

**Server won't start?**
- Check if port 8080 is already in use
- Run `go mod tidy` to fix dependencies

**Templates not updating?**
- Run `templ generate` after every `.templ` file change
- Restart the server

**Images not showing?**
- Verify images are in `static/img/` directory
- Check file names match exactly in `.templ` files

---

## 📚 Learn More

- **Go templ**: https://templ.guide/
- **TailwindCSS**: https://tailwindcss.com/docs
- **AOS.js**: https://michalsnik.github.io/aos/

---

**Need help?** Check the full README.md for detailed documentation.
