package main

import "fmt"

func plus(a, b int) int{
	return a+b
}

func plusplus(a, b, c int) int{
	return a+b+c
}

func main()  {
	res := plus(1, 3)
	fmt.Print("1 + 3 = ", res, "\n")

	res1 := plusplus(1, 3, 6)
	fmt.Print("1 + 3 + 6 = ", res1)
}