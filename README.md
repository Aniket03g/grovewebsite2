# Grove Technologies Website

A clean, modern static website built with Go templ, TailwindCSS, and AOS.js animations.

## 🚀 Features

- **Framework**: Go + templ for type-safe templating
- **Styling**: TailwindCSS (via CDN)
- **Animations**: AOS.js (Animate On Scroll)
- **Design**: Clean white header, dark text, smooth scrolling sections
- **Sections**: Hero, Product, Projects, About, Footer

## 📁 Project Structure

```
grove-site/
│
├── go.mod
├── main.go
├── setup.bat
├── setup.ps1
│
├── static/
│   ├── css/
│   │   └── tailwind.css
│   ├── js/
│   │   └── aos-init.js
│   └── img/
│       ├── product.png
│       ├── project1.jpg
│       ├── project2.jpg
│       └── project3.jpg
│
└── templates/
    ├── base.templ
    ├── header.templ
    ├── footer.templ
    ├── home.templ
    ├── hero.templ
    ├── product.templ
    ├── projects.templ
    └── about.templ
```

## 🛠️ Setup & Installation

### Prerequisites

- Go 1.21 or higher
- templ CLI tool

### Install templ

```bash
go install github.com/a-h/templ/cmd/templ@latest
```

### Install Dependencies

```bash
cd grove-site
go mod download
```

### Generate Templates

```bash
templ generate
```

### Add Images

Place your images in the `static/img/` directory:
- `product.png` - Hero section product image
- `project1.jpg` - Corporate Boardroom project
- `project2.jpg` - University Auditorium project
- `project3.jpg` - Digital Signage Network project

You can use placeholder images from services like:
- https://placehold.co/800x600
- https://picsum.photos/800/600
- https://via.placeholder.com/800x600

## 🏃 Running the Server

```bash
go run main.go
```

The server will start on `http://localhost:8080`

## 🎨 Customization

### Colors

The site uses TailwindCSS utility classes. Main colors:
- Primary: `blue-500`, `blue-600`, `blue-700`
- Text: `gray-600`, `gray-700`, `gray-800`, `gray-900`
- Background: `white`, `gray-50`

### Animations

AOS.js animations are configured with:
- Duration: 800ms
- Once: true (animations trigger only once)

Common data attributes used:
- `data-aos="fade-up"`
- `data-aos="fade-right"`
- `data-aos="fade-left"`

### Sections

Edit individual section files in `templates/`:
- `hero.templ` - Main hero section with CTA
- `product.templ` - Product features grid
- `projects.templ` - Featured projects showcase
- `about.templ` - Company information

## 📝 Development Workflow

1. Make changes to `.templ` files
2. Run `templ generate` to regenerate Go code
3. Restart the server with `go run main.go`
4. View changes at `http://localhost:8080`

## 🚢 Deployment

### Option 1: Static Site (Recommended)

Build a fully static site that can be deployed anywhere:

```bash
# Windows
.\build.bat

# Linux/Mac
./build.sh
```

Output: `dist/` folder with static HTML/CSS/JS

**Deploy to:**
- Netlify, Vercel, GitHub Pages
- AWS S3 + CloudFront
- Any static hosting service
- Traditional web servers (Nginx, Apache)

**Serve locally:**
```bash
go run serve.go
# or
cd dist && python -m http.server 8000
```

### Option 2: Dynamic Go Server

Deploy as a Go application:

```bash
templ generate
go build -o grove-site
./grove-site
```

**Deploy to:**
- Any VPS with Go installed
- Docker containers
- Cloud platforms (Heroku, Railway, Render)

**See STATIC_BUILD.md for complete static deployment guide.**

## 📄 License

© 2025 Grove Technologies. All Rights Reserved.
