package main

import (
	"fmt"
)

func beyondHello() {
	var x int
	x = 3
	y := 4
	sum, prod := learnMultiple(x, y)
	fmt.Println("sum:", sum, "prod:", prod)
	learnTypes()
}

func learnMultiple(x, y int) (sum, prod int) {
	return x + y, x * y
}

func learnTypes() {
	str := "少說話多讀書！"
	s2 := `這是一個
可以換行的字符串`
	g := 'Σ'
	f := 3.14196
	c := 3 + 4i
	var u uint = 7
	var pi float32 = 22. / 7
	n := byte('\n')
	var a4 [4]int
	a3 := [...]int{3, 1, 5}
	s3 := []int{4, 5, 9}
	s4 := make([]int, 4)
	var d2 [][]float64
	bs := []byte("a slice")
	s := []int{1, 2, 3}
	s = append(s, 4, 5, 6)
	fmt.Println(s)
	s = append(s, []int{7, 8, 9}...)
	fmt.Println(s)
	p, q := learnMemory()
	fmt.Println(*p, *q)
	m := map[string]int{"three": 3, "four": 4}
	_, _, _, _, _, _, _, _, _, _ = str, s2, g, f, u, pi, n, a3, s4, bs
	//file, _ := os.Create("output.txt")
	//fmt.Fprint(file, "這句代碼示範如何寫入文件")
	//file.Close()
	fmt.Println(s, c, a4, s3, d2, m)
	learnFlowControl()
}

func learnFlowControl() {
	if true {
		fmt.Println("這句話肯定被執行")
	}
	if false {

	} else {
	}
	x := 1
	switch x {
	case 0:
	case 1:
	case 2:
	}

	for x := 0; x < 3; x++ {
		fmt.Println("遍歷", x)
	}

	for {
		break
		continue
	}

	for key, value := range map[string]int{"one": 1, "two": 2} {
		fmt.Printf("索引: %s, 值: %d, ", key, value)
	}
}

func learnMemory() (p, q *int) {
	p = new(int)
	s := make([]int, 20)
	s[3] = 7
	r := -2
	return &s[3], &r
}

func main() {
	fmt.Println("你好世界")
	beyondHello()
}
