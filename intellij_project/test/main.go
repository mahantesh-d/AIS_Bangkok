package main

import (
	"log"
	"net/http"
	"sync"
	"fmt"
	"testing"
	"net/http/httptest"
	"io/ioutil"
)

const addr = "http://localhost"

func main() {
	mux := http.NewServeMux()
	handler := MyHandler{}
	mux.Handle("/favicon.ico", http.NotFoundHandler())
	mux.Handle("/", &handler)
	log.Printf("Now listening on %s...\n", addr)
	server := http.Server{Handler: mux, Addr: addr}
	log.Fatal(server.ListenAndServe())
}

type MyHandler struct {
	sync.Mutex
	count int
}

func (h *MyHandler) ServeHTTP(w http.ResponseWriter, r *http.Request) {
	var count int
	h.Lock()
	h.count++
	count = h.count
	h.Unlock()

	fmt.Fprintf(w, "Visitor count: %d.", count)
}

func TestMyHandler(t *testing.T) {
	handler := &MyHandler{}
	server := httptest.NewServer(handler)
	defer server.Close()

	for _, i := range []int{1, 2} {
		resp, err := http.Get(server.URL)
		if err != nil {
			t.Fatal(err)
		}
		if resp.StatusCode != 200 {
			t.Fatalf("Received non-200 response: %d\n", resp.StatusCode)
		}
		expected := fmt.Sprintf("Visitor count: %d.", i)
		actual, err := ioutil.ReadAll(resp.Body)
		if err != nil {
			t.Fatal(err)
		}
		if expected != string(actual) {
			t.Errorf("Expected the message '%s'\n", expected)
		}
	}
}