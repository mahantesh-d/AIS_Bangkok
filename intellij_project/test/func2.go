package main

import "fmt"

func vals() (int, int) {
	return 3, 7
}
func main() {
	a, b := vals()
	fmt.Print(a, "\n")
	fmt.Print(b, "\n")

	c , _ := vals()
	fmt.Print(c)
}