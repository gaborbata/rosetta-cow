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
