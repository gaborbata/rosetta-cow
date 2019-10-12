# Rosetta Cow 🐄

Rosetta Cow project is intended to present solutions to the same task
(i.e. to implement [cowsay](https://en.wikipedia.org/wiki/Cowsay) which prints an ASCII cow with a message)
in as many different programming languages as possible, to demonstrate how languages are similar and different
(similarly as in [Rosetta Code](https://en.wikipedia.org/wiki/Rosetta_Code)).

> The Rosetta name comes from [The Rosetta Stone](https://en.wikipedia.org/wiki/Rosetta_Stone).

## Description of the task

Implement a command-line application (called cowsay) which prints an ASCII cow with a message in a speech bubble.
The width of the enclosing speech bubble must be dynamic, depending on the length of the message.

The first argument of the application is the message.
If zero or more than one parameters are provided then a usage information is printed in the console.

The solution must be in a single file. Only standard libraries of the given programming language can be used.

## Examples

cowsay without arguments:

```
$ cowsay
Usage: cowsay [message]
```

cowsay with the "Hello World!" message as argument:

```
$ cowsay "Hello World!"
  ____________
< Hello World! >
  ------------
         \   ^__^ 
          \  (oo)\_______
             (__)\       )\/\
                 ||----w |
                 ||     ||
```

## Solutions

<details><summary>Go (Golang)</summary>

```go
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
```

> Implemented using: go version go1.13
</details>

<details><summary>Groovy</summary>

```groovy
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
```

> Implemented using: Groovy Version: 2.5.8
</details>

<details><summary>Io</summary>

```io
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

```

> Implemented using: Io Programming Language, v. 20110905
</details>

<details><summary>Java</summary>

```java
public class Cowsay {

    private static final String TEMPLATE = String.join("\n",
        "",
        " %s",
        "< %s >",
        " %s",
        "        \\   ^__^",
        "         \\  (oo)\\_______",
        "            (__)\\       )\\/\\",
        "                ||----w |",
        "                ||     ||",
        ""
    );

    private static String border(String text, String border) {
        return border.repeat(text.length() + 2);
    }

    public static void main(String[] args) {
        if (args.length == 1) {
            var text = args[0];
            System.out.printf(TEMPLATE, border(text, "_"), text, border(text, "-"));
        } else {
            System.out.println("Usage: cowsay [message]");
        }
    }
}
```

> Implemented using: openjdk 11.0.3
</details>

<details><summary>JavaScript</summary>

```js
#!/usr/bin/env node

function template(text) {
return `
 ${border(text, '_')}
< ${text} >
 ${border(text, '-')}
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
`;
}

function border(text, char) {
  return char.repeat(text.length + 2);
}

const args = process.argv.slice(2);
if (args.length === 1) {
  const text = args[0];
  console.log(template(text));
} else {
  console.log('Usage: cowsay [message]');
}
```

> Implemented using: node v8.10.0
</details>

<details><summary>Lua</summary>

```lua
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
```

> Implemented using: Lua 5.3.5
</details>

<details><summary>Pascal</summary>

```pas
program cowsay;

uses sysutils, strutils;

var
  text: string;
  template: array[0..7] of string = (
    ' %s',
    '< %s >',
    ' %s',
    '        \   ^__^',
    '         \  (oo)\_______',
    '            (__)\       )\/\',
    '                ||----w |',
    '                ||     ||'
  );

function border(text, char: string): string;
begin
  border := dupestring(char, length(text) + 2);
end;

function join(strings: array of string): string;
var
  i: integer;
begin
  join := '';
  for i := low(strings) to high(strings) do
    join := join + strings[i] + #10;
end;

begin
  if paramcount = 1 then
  begin
    text := paramstr(1);
    writeln(format(join(template), [border(text, '_'), text, border(text, '-')]));
  end
  else
    writeln('Usage: cowsay [message]');
end.
```

> Implemented using: Free Pascal Compiler version 3.0.4
</details>

<details><summary>Python</summary>

```py
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
```

> Implemented using: Python 2.7.15rc1
</details>

<details><summary>Ruby</summary>

```rb
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
```

> Implemented using: ruby 2.5.1p57
</details>

