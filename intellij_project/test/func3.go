package main

import "fmt"

func sums(nums ...int){
	fmt.Print(nums, " ")
	total := 0
	for _, num := range nums{
		total+=num
	}
	fmt.Print(total, "\n")
}
func main()  {

	sums(1, 2)
	sums(1, 2, 3)

	nums := []int{1, 2, 3, 4, 5}
	sums(nums...)
}