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
