package main

import (
	"log"
)

func square(x *float64) {
	log.Println(x)
	log.Println(*x)
	*x = *x * *x
}

type Cat struct {
	full1 bool
	full2 bool
}

func (c *Cat) eat1() {
	c.full1 = true
}

func (c Cat) eat2() {
	c.full2 = true
}

func feedCat1(c Cat) {
	c.eat1()
}

func feedCat2(c *Cat) {
	c.eat1()
}

// 2017/11/24 16:57:01 0xc42000e248
// 2017/11/24 16:57:01 1.5
// 2017/11/24 16:57:01 2.25
// 2017/11/24 16:57:01 {true false}
// 2017/11/24 16:57:01 &{true false}
// 2017/11/24 16:57:01 &{false false}
func main() {
	x := 1.5
	square(&x)
	log.Println(x)

	c1 := Cat{}
	// auto compiles to (&c1).eat1()
	c1.eat1()
	c1.eat2()
	log.Println(c1)

	c2 := &Cat{}
	c2.eat1()
	// auto compiles to (*c2).eat1()
	c2.eat2()
	log.Println(c2)

	log.Println(new(Cat))

	feedCat1(c1)
	feedCat1(*c2)

	feedCat2(&c1)
	feedCat2(c2)
}
