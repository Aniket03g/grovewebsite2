# 🔧 Fix templ PATH Issue

## The Problem

`templ` was installed successfully, but it's not in your PATH. The binary is in `~/go/bin/templ` but your shell can't find it.

---

## ✅ Quick Fix - Run These Commands

```bash
# Add Go bin to PATH for current session
export PATH=$PATH:~/go/bin

# Verify templ is now available
templ version

# Make it permanent (add to .bashrc)
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc
source ~/.bashrc
```

---

## 🎯 Complete Solution

Run this in your terminal:

```bash
# 1. Add to PATH for current session
export PATH=$PATH:~/go/bin

# 2. Verify it works
templ version
# Should show: v0.2.778 or similar

# 3. Make it permanent
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc

# 4. Reload shell config
source ~/.bashrc

# 5. Verify again
templ version
```

---

## 🔍 Verify Installation

```bash
# Check if templ binary exists
ls -la ~/go/bin/templ

# Should show something like:
# -rwxr-xr-x 1 aniket aniket 12345678 Nov 7 11:09 /home/aniket/go/bin/templ

# Check current PATH
echo $PATH

# Should include: /home/aniket/go/bin
```

---

## 🚀 After Fixing PATH

Once `templ version` works, build your site:

```bash
cd ~/website_alt/grovewebsite2

# Generate templ files
templ generate

# Build static site
go run generate-static.go

# Verify dist folder created
ls -la dist/
```

---

## 📝 What Happened

1. ✅ `go install` successfully installed templ to `~/go/bin/templ`
2. ❌ Your shell's PATH doesn't include `~/go/bin`
3. ✅ Adding `~/go/bin` to PATH fixes it

---

## 🎯 One-Liner Fix

```bash
export PATH=$PATH:~/go/bin && echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc && templ version
```

This will:
- Add to PATH immediately
- Make it permanent in .bashrc
- Verify templ works

---

## ✅ Expected Output After Fix

```bash
aniket@grovetechsys:~/website_alt/grovewebsite2$ export PATH=$PATH:~/go/bin
aniket@grovetechsys:~/website_alt/grovewebsite2$ templ version
v0.2.778
aniket@grovetechsys:~/website_alt/grovewebsite2$ templ generate
(✓) Complete [ updates=0 duration=42ms ]
```

---

## 🔄 Alternative: Use Full Path

If you don't want to modify PATH, use the full path:

```bash
~/go/bin/templ generate
go run generate-static.go
```

But adding to PATH is cleaner and recommended.
