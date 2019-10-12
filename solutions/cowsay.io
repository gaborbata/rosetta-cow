#!/usr/local/bin/io

template := method(text,
"""
 #{border(text, "_")}
< #{text} >
 #{border(text, "-")}
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
""" interpolate
)

border := method(text, char,
  char repeated(text size + 2)
)

if(System args size == 2) then(
  text := System args at(1)
  template(text) println
) else(
  "Usage: cowsay [message]" println
)

