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
