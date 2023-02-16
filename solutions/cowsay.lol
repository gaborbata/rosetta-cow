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

