package main

import (
	"fmt"
	"os"
	"strings"
)

const template string = `
 %s
< %s >
 %s
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
`

func border(text, char string) string {
	return strings.Repeat(char, len([]rune(text))+2)
}

func main() {
	if len(os.Args) == 2 {
		text := os.Args[1]
		fmt.Printf(template, border(text, "_"), text, border(text, "-"))
	} else {
		fmt.Println("Usage: cowsay [message]")
	}
}
