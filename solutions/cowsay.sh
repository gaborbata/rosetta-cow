#!/bin/bash

TEMPLATE=" %s
< %s >
 %s
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||\n"

border() {
  v=$(printf "%-${#1}s" "$2")
  echo "$2${v// /$2}$2"
}

if [ $# -eq 1 ]; then
  printf "$TEMPLATE" $(border "$1" "_") "$1" $(border "$1" "-")
else
  echo "Usage: cowsay [message]"
fi

