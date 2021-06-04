Function template(text)
  template = Join(Array( _
    " " & border(text, "_"), _
    "< " & text & " >", _
    " " & border(text, "-"), _
    "        \   ^__^", _
    "         \  (oo)\_______", _
    "            (__)\       )\/\", _
    "                ||----w |", _
    "                ||     ||" _
  ), vbNewLine)
End Function

Function border(text, char)
  Dim i, result
  For i = 1 To Len(text) + 2
    result = result & char
  Next
  border = result
End Function

If WScript.Arguments.Length = 1 Then
  Dim text
  text = WScript.Arguments(0)
  WScript.Echo(template(text))
Else
  WScript.Echo("Usage: cowsay [message]")
End If
