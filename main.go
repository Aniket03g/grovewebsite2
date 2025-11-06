package main

import (
	"log"
	"net/http"
	"os"

	"github.com/a-h/templ"
	"grove-site/templates"
)

func main() {
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("static"))))
	http.Handle("/", templ.Handler(templates.Home()))

	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}
	log.Printf("Serving on http://localhost:%s", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
