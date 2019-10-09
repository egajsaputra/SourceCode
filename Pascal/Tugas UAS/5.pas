uses crt;

const
	max = 200;
type
	PKar = ^RecKar;
	RecKar = record
		kar : char;
		next: Pkar;
	end;

var
	jml: Byte;
	head, tail, now: Pkar;

procedure push(Ch:Char);
	begin
		new(now); //membuat simpul baru
		if head=nil then 
		head:= now
		else
		tail^.next:= now;
		tail:= now;
		tail^.next:=nil;
		now^.kar:= ch;
	end;

procedure pop; //menghapus simpul
	begin
		now := tail;
		tail:= head;
		while (tail^.next<>now) and (tail<>nil) do
		      tail:= tail^.next;
		 dispose(now);
		 dec(Jml);
		 if tail=nil then head:=nil;
	end;

procedure Input; //input karakter
	var
		i: Byte;
		Kal:String[50];
    begin
    	Jml:=1;
    	write('Masukan @ karakter : '); readln(Kal);
    	if Kal<>'' then //memasukan karakter kesimpul
    	for i := 1 to length(Kal) do
    	begin
    	 	push(Kal[i]);
    	 	inc(jml);
    	 end 
    	 else exit;
    end;

procedure Anim; 
	var
		ch: char;
		x, y, i, tx, ty: Byte;
		procedure gerak;
		begin
			repeat
				if (y=1) and (x<>1) then 
				begin
				 	dec(x); gotoxy(x, y); write(now^.kar);
				end else
				if (x<>80) and (y=24) then
				begin
					inc(x); gotoxy(x, y); write(now^.kar);
				end else
				if x=80 then 
				begin
					dec(y); gotoxy(x, y); write(now^.kar);
				end else
				if x=1 then
				begin
					inc(y);gotoxy(x, y); write(now^.kar);
				end;
			inc(i);
			if (now^.next<>nil) then now:=now^.next; 
			until i>= jml;
		end;

procedure tekan;
	begin
		Ch:= ReadKey;
		if (ch<>#27) and (Jml<max) and (ch<>'') then
		begin
		 	push(ch); inc(jml);
		 end else 
		if (ch= '-') then
		if head<>nil then pop else exit;  
	end;

begin
	x:= 2; y:=1;
	repeat
		i:=1;
		now:= head;
		tx:= x; ty:= y;
		if head<>nil then gerak;
		Delay(50);
		clrscr;
		x:=tx; y:=ty;
	if (x<>80) and (y=1) then inc(x) else
	   if (x=1) and (y=24) then dec(x) else
	   if (x=80) and (y<>24) then inc(y) else
	   if (x=1) and (y<>1) then dec(y);
	   if KeyPressed then tekan;
	until ch=#27;
end;

begin
	clrscr;
	head:= nil; tail:=nil;
	Input;
	clrscr; Anim;
end.