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

