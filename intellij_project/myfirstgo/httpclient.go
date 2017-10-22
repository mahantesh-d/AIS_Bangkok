package main

import (
	"fmt"
	"io"
	"io/ioutil"
	"net/http"
	"net/http/httptest"
)

func main() {
	fmt.Print("Start\n")
	handler := func(w http.ResponseWriter, r *http.Request) {
		fmt.Print(w)
		io.WriteString(w, "abcd")
		//io.WriteString(w, "<html><body>Hello World!</body></html>")
	}
	fmt.Print("2222222222222\n")
	req := httptest.NewRequest("POST", "http://google.com", nil)
	fmt.Print(req ,"1\n")
	w := httptest.NewRecorder()
	fmt.Print(w, "2\n")
	handler(w, req)
	fmt.Print("5555555555555\n")
	resp := w.Result()
	fmt.Print(resp, "3\n")
	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Print(body, "4\n")
	fmt.Println(resp.StatusCode)
	fmt.Println(resp.Header.Get("Content-Type"))
	fmt.Println(string(body))

}