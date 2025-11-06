package main

import (
	"bytes"
	"context"
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"

	"grove-site/templates"
)

func main() {
	log.Println("🚀 Starting static site build...")

	// Create dist directory
	distDir := "dist"
	if err := os.RemoveAll(distDir); err != nil {
		log.Fatalf("Failed to clean dist directory: %v", err)
	}
	if err := os.MkdirAll(distDir, 0755); err != nil {
		log.Fatalf("Failed to create dist directory: %v", err)
	}

	// Generate index.html
	log.Println("📄 Generating index.html...")
	if err := generatePage(distDir, "index.html", templates.Home()); err != nil {
		log.Fatalf("Failed to generate index.html: %v", err)
	}

	// Copy static assets
	log.Println("📦 Copying static assets...")
	if err := copyDir("static", filepath.Join(distDir, "static")); err != nil {
		log.Fatalf("Failed to copy static assets: %v", err)
	}

	log.Println("✨ Static site build complete!")
	log.Println("📁 Output directory:", distDir)
	log.Println("")
	log.Println("🌐 To serve the static site:")
	log.Println("   cd dist")
	log.Println("   python -m http.server 8000")
	log.Println("   # or use any static file server")
}

func generatePage(distDir, filename string, component interface{ Render(ctx context.Context, w io.Writer) error }) error {
	var buf bytes.Buffer
	if err := component.Render(context.Background(), &buf); err != nil {
		return fmt.Errorf("render failed: %w", err)
	}

	outputPath := filepath.Join(distDir, filename)
	if err := os.WriteFile(outputPath, buf.Bytes(), 0644); err != nil {
		return fmt.Errorf("write failed: %w", err)
	}

	log.Printf("✅ Generated %s (%d bytes)", filename, buf.Len())
	return nil
}

func copyDir(src, dst string) error {
	return filepath.Walk(src, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}

		// Get relative path
		relPath, err := filepath.Rel(src, path)
		if err != nil {
			return err
		}

		// Create destination path
		dstPath := filepath.Join(dst, relPath)

		if info.IsDir() {
			return os.MkdirAll(dstPath, info.Mode())
		}

		// Copy file
		return copyFile(path, dstPath)
	})
}

func copyFile(src, dst string) error {
	sourceFile, err := os.Open(src)
	if err != nil {
		return err
	}
	defer sourceFile.Close()

	// Create destination directory if it doesn't exist
	if err := os.MkdirAll(filepath.Dir(dst), 0755); err != nil {
		return err
	}

	destFile, err := os.Create(dst)
	if err != nil {
		return err
	}
	defer destFile.Close()

	_, err = io.Copy(destFile, sourceFile)
	return err
}
