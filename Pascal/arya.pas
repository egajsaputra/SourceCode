uses crt;
	const
		Max = 10;
	type
		Node = ^Queue;
		Queue = Record
						kar : char;
						next: node;
	end;

var
	Pil 		  : char;
	jml 	  	  : byte;
	Head,Now,Tail : Node; 

procedure Push(ch:char); //membuat simpul
	begin
		New (Now);
		if head = nil then
		Head :=Now 
		else Tail^.next:=now;
		Tail:= Now;
		Tail^.next:= nil;
		Now^.kar:=ch;
	end;

procedure pop; //menghapus simpul
	begin
		Now:=Head;
		Head:= Head^.next;
		Dispose (Now);
	end;

procedure Enqueue; // mengisis antrian
	var
		i   : byte;
		temp: char;
	begin
		gotoxy(1, 6);clrEol;write('Masukan @ Karakter : ');
		repeat
			gotoxy(25, 6);clrEol;temp:= ReadKey; write(temp);
		until temp<>'';
		Push(temp);
		for i := 1 to 75-Jml*6 do //animasi mengisi antrian
			begin
				gotoxy(i+1, 20);write('  O');
				gotoxy(i, 21);write(' =(',Now^.kar,')=');
				gotoxy(i+1, 22);write(' / \');delay(10);
				if 1<>75-Jml*6 then 
					begin
						gotoxy(i+1, 20);write(' ');
						gotoxy(i, 21);write('	');
						gotoxy(i+1, 22);write('	');
					end;
			end;
	end;

procedure Dequeue; //mengeluarkan antrian
	var
		i,byk: byte;
	begin
			Now:= Head;
			for i := 69 to 76 do //animasi mengeluarkan antrian 
		begin
			gotoxy(i+1, 20);write(' O');
			gotoxy(i, 21);write('= (',Now^.kar,')=');
			gotoxy(i+1, 22);write('/\');delay(10);
			gotoxy(i+1, 20);write('  ');
			gotoxy(i, 21);write('		');
			gotoxy(i+1, 22);write('	 ');
		end;

	Byk:= 0;
	while Byk<> Jml do 
		begin
			inc(byk);
			Now:=Now^.Next;
			for i := 69-Byk*6 to 75-byk*6 do //animasi memajukan antrian
				begin
					gotoxy(i+1, 20);write(' O');
					gotoxy(i, 21);write('=(' ,Now^.kar,')=');
					gotoxy(i+1, 22);write('/ \');delay(25);
					if i <> 75-byk*6 then
						begin
						 	gotoxy(i+1, 20);write(' ');
							gotoxy(i, 21);write('	  ');
							gotoxy(i+1, 22);write('	');
						 end; 
				end;
		end;
	end;

	procedure Input;//membuat menu
	begin
		gotoxy(1, 1); writeln('1. Enqueue ');
		gotoxy(1, 2); writeln('2. Dequeue ');
		gotoxy(1, 3); writeln('3. Exit ');
	repeat
		repeat
			gotoxy(1, 4); ClrEol; write('Your choice : ');
			Pil:= ReadKey;write(Pil);
		until Pil in ['1','2','3'];
		case Pil of
			'1': begin //menambah pengantri
				if jml < max then
				begin
				 	inc(Jml);
				 	Enqueue;
				 end else
				begin
					gotoxy(1, 8);write('Antrian penuh !');
					 delay(500);
					gotoxy(1, 8);ClrEol;
					end;
				    end;

			 '2' : begin //mengeluarkan pengantri
			 	if jml >=1 then
			 		begin
			 		 	Dec(Jml);
			 		 	Dequeue;
			 		 	Pop;
			 		 end else
			 		 begin
			 		 	gotoxy(1, 8);write('Antrian kosong !');
					 				delay(500);
						gotoxy(1, 8);ClrEol;
			 		 end;
			 end;
		end;
	until Pil= '3'; //keluar dari program
	end;

begin //PROGRAM UTAMA
	Jml:=0;
	clrscr;
	Input;
end.
