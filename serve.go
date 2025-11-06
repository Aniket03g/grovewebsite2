package main

import (
	"log"
	"net/http"
	"os"
)

func main() {
	// Serve the dist directory
	fs := http.FileServer(http.Dir("dist"))
	http.Handle("/", fs)

	port := os.Getenv("PORT")
	if port == "" {
		port = "8000"
	}

	log.Printf("🌐 Serving static site on http://localhost:%s", port)
	log.Printf("📁 Serving from: dist/")
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
