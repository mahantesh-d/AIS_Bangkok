package main

import "fmt"

type pair struct {
	values []float64
}

var a = []pair{
	{[]float64{1,2,9}},
	{[]float64{5,8,2}},
	{[]float64{4,2,3}},
	{[]float64{100,50,0}},
	{[]float64{200,25,75}},
}

func sum(x []float64)float64{
	sum := float64(0)
	for _, i :=range x{
		sum += i
	}
	return sum
}

func average1(xs []float64) float64  {
	total := float64(0)
	for _, x := range xs{
		total += x
	}
	return total/float64(len(xs))

}

func main()  {
	for _, b := range a{
		//fmt.Print("b = ",b.values[2], "\n")
		v := average1(b.values)
		s := sum(b.values)
		fmt.Print("sum of the ", b.values, " = ", s," and average", " = ",v, "\n")
	}
}