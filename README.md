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

<details><summary>C</summary>

```c
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

char *template =
    " %s \n"
    "< %s >\n"
    " %s\n"
    "        \\   ^__^\n"
    "         \\  (oo)\\_______\n"
    "            (__)\\       )\\/\\\n"
    "                ||----w |\n"
    "                ||     ||\n";

char *border(char *text, char borderChar) {
    int length = strlen(text) + 2;
    char *buffer = malloc(length + 1);
    memset(buffer, borderChar, length);
    buffer[length] = '\0';
    return buffer;
}

int main(int argc, char *argv[]) {
    if (argc == 2) {
        char *text = argv[1];
        printf(template, border(text, '_'), text, border(text, '-'));
    } else {
        printf("Usage: cowsay [message]\n");
    }
    return 0;
}
```

> Implemented using: gcc (GCC) 7.4.0
</details>

<details><summary>Goby</summary>

```gb
#!/usr/bin/env goby

def template(text)
String.fmt "
 %s
< %s >
 %s
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
", border(text, '_'), text, border(text, '-')
end

def border(text, char)
  char * (text.length + 2)
end

if ARGV.length == 1
  text = ARGV[0]
  puts template(text)
else
  puts "Usage: cowsay [message]"
end
```

> Implemented using: goby 0.1.13
</details>

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

    private static final String TEMPLATE = """
         %s
        < %s >
         %s
                \\   ^__^
                 \\  (oo)\\_______
                    (__)\\       )\\/\\
                        ||----w |
                        ||     ||
        """;

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

> Implemented using: openjdk version 17.0.4
</details>

<details><summary>Julia</summary>

```jl
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
```

> Implemented using: julia version 1.6.3
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

> Implemented using: Node.js v8.10.0
</details>

<details><summary>Kotlin</summary>

```kt
fun template(text: String) =
    """
     ${border(text, "_")}
    < ${text} >
     ${border(text, "-")}
            \   ^__^
             \  (oo)\_______
                (__)\       )\/\
                    ||----w |
                    ||     ||
    """.trimIndent()

fun border(text: String, chr: String) = chr.repeat(text.length + 2)

fun main(args: Array<String>) {
    if (args.size == 1) {
        val text = args[0]
        println(template(text))
    } else {
        println("Usage: cowsay [message]")
    }
}
```

> Implemented using: Kotlin version 1.5.0-release-749
</details>

<details><summary>LOLCODE</summary>

```lol
HAI 1.2

VISIBLE "Welcome to Lolcode Cow!"
I HAS A num_args ITZ COUNT Args
VISIBLE num_args
IF num_args IS 1
    I HAS A text ITZ Args
    I HAS A length ITZ BOTH SAEM text AN text
    I HAS A top_border ITZ REPEAT "_", SUM OF length, 2
    I HAS A bottom_border ITZ REPEAT "-", SUM OF length, 2
    VISIBLE top_border
    VISIBLE " " + text + " "
    VISIBLE bottom_border
    VISIBLE "        \   ^__^"
    VISIBLE "         \  (oo)\_______"
    VISIBLE "            (__)\       )\/\"
    VISIBLE "                ||----w |"
    VISIBLE "                ||     ||"
ELSE
    VISIBLE "Usage: cowsay [message]"
KTHXBYE

```

> Implemented using: ChatGPT Feb 13 Version
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

> Implemented using: Lua 5.3.3
</details>

<details><summary>Nim</summary>

```nim
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

```

> Implemented using: ChatGPT Feb 13 Version
</details>

<details><summary>Pascal</summary>

```pas
program cowsay;

uses sysutils, strutils;

const
  template: string = concat(
    ' %s', lineending,
    '< %s >', lineending,
    ' %s', lineending,
    '        \   ^__^', lineending,
    '         \  (oo)\_______', lineending,
    '            (__)\       )\/\', lineending,
    '                ||----w |', lineending,
    '                ||     ||', lineending
  );

var
  text: string;

function border(text, char: string): string;
begin
  border := dupestring(char, length(text) + 2);
end;

begin
  if paramcount = 1 then
  begin
    text := paramstr(1);
    writeln(format(template, [border(text, '_'), text, border(text, '-')]));
  end
  else
    writeln('Usage: cowsay [message]');
end.
```

> Implemented using: Free Pascal Compiler version 3.0.4
</details>

<details><summary>PHP</summary>

```php
#!/usr/local/bin/php
<?php
function template($text, $border) {
return "
 {$border($text, '_')}
< {$text} >
 {$border($text, '-')}
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
";
}

$border = function($text, $char) {
  return str_repeat($char, strlen($text) + 2);
};

if ($argc == 2) {
  print template($argv[1], $border);
} else {
  print "Usage: cowsay [message]\n";
}
?>
```

> Implemented using: PHP 8.0.0 (cli)
</details>

<details><summary>PowerShell</summary>

```ps1
function template($text) {
" $(border $text '_')
< $text >
 $(border $text '-')
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||"
}

function border($text, $char) {
  $char * ($text.length + 2)
}

if ($args.length -eq 1) {
  $text = $args[0]
  Write-Host (template $text)
} else {
  Write-Host "Usage: cowsay [message]"
}
```

> Implemented using: PowerShell version 5.1.19041.906
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

> Implemented using: Python 2.7.15+
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

<details><summary>Rust</summary>

```rs
use std::env;

fn template(text: &str) -> String {
    format!(
        r#"
 {}
< {} >
 {}
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
"#,
        border(text, "_"),
        text,
        border(text, "-")
    )
}

fn border(text: &str, chr: &str) -> String {
    chr.repeat(text.chars().count() + 2)
}

fn main() {
    let args: Vec<String> = env::args().skip(1).collect();
    if args.len() == 1 {
        let text = &args[0];
        println!("{}", template(text));
    } else {
        println!("Usage: cowsay [message]");
    }
}
```

> Implemented using: rustc 1.65.0
</details>

<details><summary>Scala</summary>

```scala
object Cowsay {
  val template = """ 
 %s
< %s >
 %s
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
  """

  def border(text: String, char: Char): String = char.toString * (text.length + 2)

  def main(args: Array[String]): Unit = {
    if (args.length == 1) {
      val text = args(0)
      val result = template.format(border(text, '_'), text, border(text, '-'))
      println(result)
    } else {
      println("Usage: cowsay [message]")
    }
  }
}

```

> Implemented using: ChatGPT Feb 13 Version
</details>

<details><summary>Bash</summary>

```sh
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

```

> Implemented using: GNU bash, version 5.0.7
</details>

<details><summary>TypeScript</summary>

```ts
#!/usr/bin/env ts-node

function template(text: string) {
return `
 ${border(text, '_')}
< ${text} >
 ${border(text, '-')}
        \\   ^__^
         \\  (oo)\\_______
            (__)\\       )\\/\\
                ||----w |
                ||     ||
`
}

function border(text: string, char: string) {
  return char.repeat(text.length + 2)
}

const args: string[] = process.argv.slice(2)
if (args.length === 1) {
  const text = args[0]
  console.log(template(text))
} else {
  console.log('Usage: cowsay [message]')
}
```

> Implemented using: ts-node v8.6.2
</details>

<details><summary>VBScript</summary>

```vbs
Function template(text)
  template = Join(Array( _
    " " & border(text, "_"), _
    "< " & text & " >", _
    " " & border(text, "-"), _
    "        \   ^__^", _
    "         \  (oo)\_______", _
    "            (__)\       )\/\", _
    "                ||----w |", _
    "                ||     ||" _
  ), vbNewLine)
End Function

Function border(text, char)
  Dim i, result
  For i = 1 To Len(text) + 2
    result = result & char
  Next
  border = result
End Function

If WScript.Arguments.Length = 1 Then
  Dim text
  text = WScript.Arguments(0)
  WScript.Echo(template(text))
Else
  WScript.Echo("Usage: cowsay [message]")
End If
```

> Implemented using: Microsoft (R) Windows Script Host Version 5.812
</details>

