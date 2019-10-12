program cowsay;

uses sysutils, strutils;

var
  text: string;
  template: array[0..7] of string = (
    ' %s',
    '< %s >',
    ' %s',
    '        \   ^__^',
    '         \  (oo)\_______',
    '            (__)\       )\/\',
    '                ||----w |',
    '                ||     ||'
  );

function border(text, char: string): string;
begin
  border := dupestring(char, length(text) + 2);
end;

function join(strings: array of string): string;
var
  i: integer;
begin
  join := '';
  for i := low(strings) to high(strings) do
    join := join + strings[i] + #10;
end;

begin
  if paramcount = 1 then
  begin
    text := paramstr(1);
    writeln(format(join(template), [border(text, '_'), text, border(text, '-')]));
  end
  else
    writeln('Usage: cowsay [message]');
end.
