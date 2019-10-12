#!/usr/bin/env lua

local template = [[
 %s
< %s >
 %s
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
]]

function border (text, char)
  return string.rep(char, #text + 2)
end

if #arg == 1 then
  local text = arg[1]
  print(string.format(template, border(text, '_'), text, border(text, '-')))
else
  print('Usage: cowsay [message]')
end
