uses crt;

const
	pos : array[1..20, 1..2] of Integer= 
	 ((40,7),(38,8),(36,9),(34,10),(32,11),
	 (30,12),(32,13),(34,14),(36,15),(38,16),
	 (40,17),(42,16),(44,15),(46,14),(48,13),
	 (50,12),(48,11),(46,10),(44,9),(42,8));
	

type
 	Point = ^rec;
 	Rec = record
 		x,y : Byte;
 		next,prev: Point;
 	end ;

var
	i: Byte;
	tekan : char;
	kanan, kiri: Boolean;
	head, tail, now: Point;

{procedure cursorOff;assembler;
	assembler;
	  mov ah,1
	  mov cx, 2020h
	  int 10h
	end;
}
{procedure cursorOn;assembler;
	asm 
	  mov ah,1
	  mov cx, 0607h
	  int 10h
	end;}

procedure Show;
	begin
		cursorOff;
		clrscr;
		writeln();
		now:= head;
		i:=0;
	repeat //looping tampilan simpul
		inc(i);
		gotoxy(now^.x, now^.y); writeln('*');
		now:= now^.next;
	until i=20;

now:= head;
gotoxy(1, 7); write('Tekan ENTER pada saat ');
gotoxy(1, 8); write('Lampu di atas panah. ');
gotoxy(1, 11); write('Tekan -> putar kiri ');
gotoxy(1, 12); write('Tekan <- putar kanan ');
gotoxy(40, 18); write(char(24));
kiri:=true;
kanan:= false;
repeat
	repeat
		gotoxy(now^.x, now^.y);textAttr:=$5F; write('*');
		textAttr:=$F;
		delay(20);
		if KeyPressed then tekan:= ReadKey;
	if tekan= 'M' then //mengganti arah putarahn kekanan
	begin
	 	kanan:=true;
	 	kiri:= false;
	 end;
	if tekan = 'K' then //mengganti arah putaran kekiri
	begin
		kiri:= true;
		kanan:= false;
	end;
	if tekan=#13 then //cek kalau penekanan enter
	begin
		if now^.y = 17 then
		begin
			gotoxy(1, 24); write('Selamat anda menang!');
			sound(1000);delay(100); noSound;
		end else
		begin
		 gotoxy(1, 24); write('Game Over!')
		 end;	
		end else
		begin
			gotoxy(now^.x, now^.y); write('*');
			if kiri then now:= now^.next;
			if kanan then now:= now^.prev;
		end;

	until tekan = #13;
	cursorOn;
	repeat
		gotoxy(1, 20); write('Play again [Y/T] ? ');
		tekan:= upcase (ReadKey);
until tekan in ['Y', 'T'];
gotoxy(1, 20);ClrEol;
gotoxy(1, 24);ClrEol;
until tekan= 'T'
	end;

procedure initPos; //membuat simpul
	begin
		head:= nil;
		i:= 0;
		repeat
			inc(i);
			new(tail);
			tail^.x:= pos[i,1];
			tail^.y:= pos[i,2];
			if head=nil then 
			begin
				tail^.next:= tail;
				tail^.prev:= tail;
				head:= tail;
				now:= tail;
			end else 
			begin
				now^.next:= tail; tail^.prev:= now;
				now:= tail; head^.prev:= tail;
				tail^.next:= head;
			end;
		until i= 20;
	end;

begin //program
	initPos;
	Show;
end.