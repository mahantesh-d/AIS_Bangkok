package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"net/http/httptest"
)

func main() {
	fmt.Print("Start\n")
	ts := httptest.NewServer(http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		fmt.Print("1111111\n")
		fmt.Fprintln(w, "Hello, client")
	}))
	fmt.Print("22222222\n")
	defer ts.Close()
	fmt.Print("3333333\n")
	res, err := http.Get(ts.URL)
	fmt.Print("44444444444\n")
	if err != nil {
		log.Fatal(err)
	}
	fmt.Print("5555555555555\n")
	greeting, err := ioutil.ReadAll(res.Body)
	res.Body.Close()
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s", greeting)
}

