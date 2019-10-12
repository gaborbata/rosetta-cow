#!/usr/bin/env ruby

def template(text)
"
 #{border text, '_'}
< #{text} >
 #{border text, '-'}
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
"
end

def border(text, char)
  char * (text.length + 2)
end

if ARGV.size == 1
  text = ARGV[0]
  puts template(text)
else
  puts "Usage: cowsay [message]"
end
