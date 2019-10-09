uses crt;
var
	i: byte;
begin
	i:= 5;
	repeat
		
		writeln('i');
		//i:= i+1; 
	until i=50;
	if i<>50 then readkey();
	//writeln(i);
end.