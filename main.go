package main

import (
	"fmt"
	"log"
	"net/http"
	"github.com/gorilla/mux"
	"io"
)

func main() {
	r := mux.NewRouter()
	r.HandleFunc("/", Hello)
        r.HandleFunc("/health", HealthCheckHandler)
	http.Handle("/", r)

	fmt.Println("Starting up on 11130")
	log.Fatal(http.ListenAndServe(":11130", nil))
}

func Hello(w http.ResponseWriter, req *http.Request) {
	fmt.Fprintln(w, "Hello Ziraat Team from Özkan 2")
}

func HealthCheckHandler(w http.ResponseWriter, r *http.Request) {
    // A very simple health check.
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusOK)

    // In the future we could report back on the status of our DB, or our cache
    // (e.g. Redis) by performing a simple PING, and include them in the response.
    io.WriteString(w, `{"alive": true}`)
}
