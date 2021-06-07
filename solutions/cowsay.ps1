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
