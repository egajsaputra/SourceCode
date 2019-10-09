program Single_Lingked_List_FIFO;
uses crt;
const
	s = '@';
	max = 100;

type
	PKar = ^RecKar;
	RecKar = Record
			 isi : char;
			 x,y,col : Byte;
			 Next : Pkar;
			 end;
var
	head, tail, now : Pkar;

procedure Push;
	begin
		New(now);
		if head= Nil then
		   head:= now
		else 
			tail^.Next:= now;
			tail:= now;; tail^.Next:= Nil;
			now^.isi:= s;
			now^.x:= random(79)+1; //mengisi nilai x dengan nilai acak
			now^.col:= random(16); //mengisi nilai col dengan nilai acak
			now^.y:= 1;
	end; 

procedure Anim;
	var
		ch : char;
		jml : Byte;
		procedure Tekan;
		begin
			Ch:= ReadKey;
			if (ch<>#27) and (ch='+') and (jml< max) then //Menambah salju
			begin
			 	Push;
			 	inc(jml);
			 end;
		end;
	begin
		repeat
			now:= head;
			while (now<>nil) do
			begin
			 	textcolor(now^.col);
			 	gotoxy(now^.x, now^.y);writeln(now^.isi);
			 	if now^.y= 25 then now^.y:= 1;
			 	inc(now^.y);
			 	now:= now^.Next; 
			 end ;
			delay(10);clrscr; //Menghapus layar
			if KeyPressed then Tekan; 
		until ch= #27; //tombol escape di tekan
	end;


begin
	clrscr;
	head:= nil; tail:= nil;
	randomize;
	Push;
	Anim;
end.
