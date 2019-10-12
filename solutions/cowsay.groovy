#!/usr/bin/env groovy

def template(text) {
"""
 ${border(text, '_')}
< ${text} >
 ${border(text, '-')}
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
"""
}

def border(text, chr) {
  chr * (text.length() + 2)
}

if (args.length == 1) {
  text = args[0]
  println template(text)
} else {
  println "Usage: cowsay [message]"
}
