import os

const template = """
 %s
< %s >
 %s
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
"""

func border(text: string, char: char): string =
  char.chr * (text.len + 2)

if paramCount() == 1:
  let text = paramStr(1)
  let result = template % [border(text, '_'), text, border(text, '-')]
  echo result
else:
  echo "Usage: cowsay [message]"

