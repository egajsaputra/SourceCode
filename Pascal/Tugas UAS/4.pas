//program NonCircular_Single_linked_List_LIFO_OR_FIFO;
uses crt;

const
A= 'Action'; //konstanta
D= 'Drama';
K= 'Komedi';

type
	Str5 = String[5];
	PointVCD = ^RecVCD;
	RecVCD = record
		KdVCD : Str5;
		Jns : String[10];
		JdlVCD : String[20];
		Jml : Byte;
		Next : PointVCD; // pointer
	end;
var
	head, tail, now: PointVCD;

procedure Judul1; //prosedur tampilan judul aplikasi
	begin
		clrscr;
		writeln('Rental CD Pinggir JL');
		writeln('JL. Pinggiran');
		writeln('Jakarta');
		gotoxy(26, 5); writeln('Pendataan VCD');
		gotoxy(26, 6); writeln('===============');
	end;

procedure Judul2; //tampilan judul untuk input
	begin
		gotoxy(21, 8); write('Kode VCD A/D/K : ');
		gotoxy(21, 9); write('Jenis VCD : ');
		gotoxy(21, 10); write('Judul VCD : ');
		gotoxy(21, 11); write('Jumlah VCD : ');
	end;

procedure Buat_Simpul_FIFO; //Simpul untuk first in first out
	begin
		new(now); //membuat simpul baru
		if head= nil then 
		begin
		 	now^.next:= nil;
		 	head:= now;
		 	tail:= now;
		 end else //sudah ada simpul
		 begin
		 	tail^.next:= now;
		 	tail:= now;
		 	tail^.next:= nil;
		 end;
	end;
procedure Buat_Simpul_LIFO; //Buat simpul Last In First Out
	begin
		new(now);
		if head= nil then //belum ada simpul
		   now^.next:= nil
		else 
		   now^.next:= head; //sudah ada simpul
		head:= now;
	end;

procedure Besar(var Kode:Str5);
var
	i: Byte;
	begin
		for i := 1 to length(Kode) do
		Kode[i]:= upcase(Kode[i]); 
	end;

procedure Input;
var
	n: Byte;
	Pil:char;
	temp: Str5;
  begin
  	n:=0;
  	head:= nil; tail:= nil; // simpul awa dan akhir dikosongkan
  	clrscr;
  	Judul1;
  	gotoxy(21, 7); write('LIFO or FIFO [L/F] : ');
  	repeat
  		gotoxy(42, 7); ClrEol; Pil:= upcase(readkey);
  	until Pil in ['L', 'F'];
  		repeat
  		clrscr;
  		Judul1;
  		Judul2;
  		repeat
  			gotoxy(41, 8); read(temp); Besar(temp);
  			gotoxy(21, 9); write('Jenis VCD : ');
  		until ((temp[1] in ['A','D','K']) or (temp=''));
  		if temp<>'' then 
  		begin
  			inc(n);
  			if Pil= 'L' then 
  			 Buat_Simpul_LIFO //menjalankan LIFO
  			else
  			 Buat_Simpul_FIFO; //menjalan FIFO
  			if temp[1] = 'A' then
  			begin
  			 	now^.jns:=A;
  			 	gotoxy(41, 9); write('A-', A);
  			 end else 
  			if temp[1]= 'D' then 
  			begin
  				now^.Jns:= D;
  				gotoxy(41, 9); write('D-',D);
  			end else
  			begin
  				if temp[1]= 'K' then
  				begin
  					now^.Jns:=K;
  					gotoxy(41, 9); write('K-', K);
  				end;
  		now^.KdVCD:= temp;
  		gotoxy(41, 10);readln(now^.JdlVCD); // membaca input
  		gotoxy(41, 11); readln(now^.Jml);
  			end;

  		end;
  	until (temp='') or (n=2);
  end;

  procedure Output; //prosedur pembuat laporan
  var
  	y: Byte;
  	begin
  		clrscr;
  		Judul1;
  		gotoxy(26, 5); writeln('D A F T A R  V C D');
  		gotoxy(26, 6); writeln('=====================');
  		gotoxy(17, 8); writeln('KdVCD jenis film judul video CD Jumlah ');

  		gotoxy(17, 9); writeln('===========================================');
  		now:= head; y:=9;
  		while (now<>nil) do 
  		begin
  			inc(y);
  			gotoxy(17, y); write(now^.KdVCD);
  			gotoxy(28, y); write(now^.jns);
  			gotoxy(45, y); write(now^.JdlVCD);
  			gotoxy(65, y); write(now^.Jml);
  			now:= now^.next;
  		end;
  		ReadKey;
  		now:= head;
  		while now<>nil do 
  		begin
  			head:= now^.next;
  			dispose(now);
  			now:=head;
  		end;
  	end;

  	begin // Main Program
  		Input;
  		Output;
  	end.
