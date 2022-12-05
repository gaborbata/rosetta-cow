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
