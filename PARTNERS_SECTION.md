# 🤝 Partners Section Documentation

## Overview

A beautiful, infinitely scrolling horizontal carousel showcasing partner logos using Swiper.js. The section features smooth, continuous auto-scrolling with hover effects and responsive breakpoints.

---

## ✨ Features Implemented

### 1. **Swiper.js Integration**
- ✅ Loaded via CDN (no npm build required)
- ✅ Version: Swiper 11 (latest)
- ✅ Fully static - works with Go's http.FileServer

### 2. **Infinite Auto-Scroll**
- ✅ Continuous scrolling with no pause
- ✅ Speed: 3000ms per transition
- ✅ Loop: true (infinite)
- ✅ Free mode enabled for smooth continuous motion
- ✅ Delay: 0 (no pause between slides)

### 3. **Visual Effects**
- ✅ Logos start at 70% opacity (faded)
- ✅ Brighten to 100% on hover
- ✅ Grayscale filter by default
- ✅ Full color on hover
- ✅ Scale up 110% on hover
- ✅ Smooth transitions (300ms)
- ✅ Gradient fade overlays on edges

### 4. **Responsive Breakpoints**
- ✅ Mobile (< 640px): 2 logos visible
- ✅ Tablet (640px - 1024px): 3 logos visible
- ✅ Desktop (> 1024px): 5 logos visible
- ✅ Adaptive spacing between slides

### 5. **AOS Animations**
- ✅ Section header: fade-up
- ✅ Carousel container: fade-up with delay
- ✅ Smooth entrance when scrolling into view

### 6. **Design Elements**
- ✅ Clean white background
- ✅ Section badge with emoji (🤝 Trusted Partners)
- ✅ Gradient heading (purple to blue)
- ✅ Descriptive subtitle
- ✅ Edge gradient overlays for fade effect

---

## 📁 File Structure

```
templates/
├── partners.templ          # New Partners component
├── home.templ             # Updated to include Partners
└── base.templ             # Updated with Swiper CDN

static/img/distribution/   # Partner logos
├── ahuja.jpg
├── benq.png
├── bosch.png
├── trueview.png
└── yealink.jpg
```

---

## 🎨 Partner Logos

### Current Partners (5 logos):
1. **Ahuja** - Audio equipment manufacturer
2. **BenQ** - Display and projector solutions
3. **Bosch** - Professional audio systems
4. **Trueview** - Security and surveillance
5. **Yealink** - Video conferencing solutions

### Logo Specifications:
- **Format**: JPG/PNG
- **Max Height**: 80px (auto-width)
- **Aspect Ratio**: Maintained
- **Background**: Transparent or white recommended

---

## ⚙️ Swiper Configuration

```javascript
const partnersSwiper = new Swiper('.partnersSwiper', {
    slidesPerView: 2,           // Mobile default
    spaceBetween: 30,           // Gap between slides
    loop: true,                 // Infinite loop
    autoplay: {
        delay: 0,               // No pause
        disableOnInteraction: false,
    },
    speed: 3000,                // 3 seconds per slide
    freeMode: true,             // Smooth continuous scroll
    freeModeMomentum: false,    // No momentum bounce
    breakpoints: {
        640: {                  // Tablet
            slidesPerView: 3,
            spaceBetween: 40,
        },
        1024: {                 // Desktop
            slidesPerView: 5,
            spaceBetween: 50,
        },
    },
});
```

---

## 🎭 CSS Effects

### Logo Hover Effects:
```css
/* Default state */
opacity: 0.7
grayscale: 100%
scale: 1

/* Hover state */
opacity: 1
grayscale: 0%
scale: 1.1
transition: 300ms
```

### Edge Gradients:
```css
/* Left fade */
background: linear-gradient(to right, white, transparent)
width: 128px (8rem)

/* Right fade */
background: linear-gradient(to left, white, transparent)
width: 128px (8rem)
```

---

## 📱 Responsive Behavior

| Screen Size | Logos Visible | Spacing | Container Width |
|-------------|---------------|---------|-----------------|
| Mobile      | 2             | 30px    | Full width      |
| Tablet      | 3             | 40px    | Full width      |
| Desktop     | 5             | 50px    | 1280px (max-w-7xl) |

---

## 🔧 Customization Guide

### Add More Partners:
```html
<div class="swiper-slide">
    <div class="flex items-center justify-center p-8 transition-all duration-300 hover:scale-110">
        <img 
            src="/static/img/distribution/your-logo.png" 
            alt="Partner Name" 
            class="max-h-20 w-auto object-contain opacity-70 hover:opacity-100 transition-opacity duration-300 grayscale hover:grayscale-0"
        />
    </div>
</div>
```

### Adjust Scroll Speed:
```javascript
speed: 3000,  // Change to 2000 for faster, 4000 for slower
```

### Change Number of Visible Logos:
```javascript
breakpoints: {
    1024: {
        slidesPerView: 7,  // Show 7 on desktop instead of 5
    },
}
```

### Modify Opacity:
```html
class="opacity-70"  <!-- Change to opacity-60 or opacity-80 -->
```

---

## 🎯 Placement in Homepage

**Order of Sections:**
1. Hero
2. Product (Features)
3. Projects (Portfolio)
4. **Partners** ← NEW
5. About

**Rationale:**
- Placed after Projects to showcase credibility
- Before About to build trust
- Natural flow from work examples to partnerships

---

## 🚀 Performance

### Optimizations:
- ✅ CDN-hosted Swiper.js (cached globally)
- ✅ Lazy loading ready (can be added)
- ✅ GPU-accelerated transforms
- ✅ Minimal JavaScript overhead
- ✅ No external API calls
- ✅ Static assets served efficiently

### Load Impact:
- **Swiper CSS**: ~20KB (minified)
- **Swiper JS**: ~50KB (minified)
- **Partner Logos**: ~300KB total (5 images)
- **Total Added**: ~370KB

---

## 🎨 Design Consistency

### Matches Site Theme:
- ✅ Purple-to-blue gradient headings
- ✅ Section badges with emojis
- ✅ Clean white background
- ✅ Consistent spacing (py-24)
- ✅ AOS animations
- ✅ Hover effects
- ✅ Modern card-style design

---

## 🐛 Troubleshooting

### Carousel Not Scrolling?
- Check if Swiper.js loaded: `console.log(Swiper)`
- Verify `.partnersSwiper` class exists
- Check browser console for errors

### Logos Not Showing?
- Verify image paths are correct
- Check file permissions
- Ensure images exist in `/static/img/distribution/`

### Hover Effects Not Working?
- Check if TailwindCSS loaded properly
- Verify `hover:` classes are applied
- Test in different browsers

---

## 📊 Image Updates Applied

### Hero Section:
- ✅ Updated to use `scheduler_mockup.jpeg`
- Better quality, more professional

### Projects Section:
- ✅ Project 1: `CorporateBoardroom.jpg`
- ✅ Project 2: `UniversityAudotorium.jpg`
- ✅ Project 3: `Digitalsinage.png`
- Higher resolution, better visual appeal

---

## 🎯 Future Enhancements

### Potential Additions:
1. **Click-through links** - Link logos to partner websites
2. **Tooltips** - Show partner names on hover
3. **More partners** - Add 5-10 more logos
4. **Pause on hover** - Stop scrolling when hovering
5. **Navigation arrows** - Optional manual control
6. **Partner testimonials** - Quotes from partners
7. **Case studies** - Link to detailed partner stories

---

## 📝 Code Quality

### Best Practices Followed:
- ✅ Modular component (separate .templ file)
- ✅ Semantic HTML5
- ✅ Accessible alt text
- ✅ Responsive design
- ✅ Performance optimized
- ✅ Clean, readable code
- ✅ Consistent naming conventions
- ✅ Well-commented

---

## ✅ Checklist

- [x] Swiper.js integrated via CDN
- [x] Infinite auto-scroll working
- [x] Responsive breakpoints (2/3/5)
- [x] Hover effects (opacity + grayscale)
- [x] AOS animations on section
- [x] Edge gradient overlays
- [x] Clean white background
- [x] Modular templ component
- [x] Placed after Projects section
- [x] Static file serving compatible
- [x] Performance optimized
- [x] Design matches site theme

---

**The Partners section is now live and fully functional! 🎉**

View it at: **http://localhost:8080#partners**
