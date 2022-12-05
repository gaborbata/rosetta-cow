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
