uses crt;
var
	c: byte;
begin
	 c:= 0;
	 repeat
	 	Inc(c);
	 	if c mod 2= 1 then
	 	writeln(c); 
	 until c>=10;
	 if c=10 then readkey;
end.