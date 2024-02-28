package main

import (
	"fmt"
	"strconv"
	"strings"
)

func main() {
	var s string

L:
	for {
		fmt.Print("Kolik rohlíků? ")
		fmt.Scan(&s)

		i, err := strconv.Atoi(s)
		if err != nil {
			fmt.Println("Jsi kokot!")
			continue
		}

	L1:
		fmt.Print("Kolik zaplatíš? ")
		fmt.Scan(&s)

		i2, err := strconv.Atoi(s)
		if err != nil {
			fmt.Println("Jsi kokot!")
			goto L1
		}

		if i2 >= i*3 {
			fmt.Println(i)
			break
		}

		var maloVyber string
	L2:
		fmt.Print("To nestačí, zaplať víc! Z = Znovu, C = Změnit cenu: ")
		fmt.Scan(&maloVyber)
		velkoVyber := strings.ToUpper(maloVyber)

		if velkoVyber == "Z" {
			continue L
		} else if velkoVyber == "C" {
			goto L1
		}

		fmt.Println("Jsi kokot!")
		goto L2
	}
}
