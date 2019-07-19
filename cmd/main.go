package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	port := "3000"
	if os.Getenv("PORT") != "" {
		port = os.Getenv("PORT")
	}
	http.HandleFunc("/helloworld", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "Hello World")
	})

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%s", port), nil))
}
