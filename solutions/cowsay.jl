#!/usr/bin/env julia

template(text) =
    """
     $(border(text, '_'))
    < $text >
     $(border(text, '-'))
            \\   ^__^
             \\  (oo)\\_______
                (__)\\       )\\/\\
                    ||----w |
                    ||     ||
    """

border(text, char) = repeat(char, length(text) + 2)

if length(ARGS) == 1
    text = ARGS[1]
    println(template(text))
else
    println("Usage: cowsay [message]")
end
