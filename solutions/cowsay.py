#!/usr/bin/python

import sys

template = """
 %s
< %s >
 %s
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\\
                ||----w |
                ||     ||
"""

def border(text, char):
  return char * (len(text) + 2)

if len(sys.argv) == 2:
  text = sys.argv[1]
  print(template % (border(text, "_"), text, border(text, "-")))
else:
  print("Usage: cowsay [message]")
