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
