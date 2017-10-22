package main

import "fmt"

func average(xs []float64) float64  {
	total := float64(0)
	for _, x := range xs{
		total += x
	}
	return total/float64(len(xs))
}

func main()  {
	xs := []float64{1,2}
	avg := average(xs)
	fmt.Print(avg)
}



