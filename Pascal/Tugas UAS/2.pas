uses crt;

const
	enter = #13;		//tombol enter
	atas = #72;			//tombol panah keatas
	bawah = #80;		//tombol panah kebawah
	ESC = #27;			//tombil keluar
	max = 10;			//Jumlah maximal data
	P = '<<==';			//penunjuk

type
	str5 = String[5];
	point = ^RecKar;
	RecKar = Record
				NIK			: str5;
				NmKar		: String[20];
				Gaji		: Longint;
				Next, Prev	: Point;
			end;

var
	head, tail: Point;

procedure Push; //membuat simpul
var
	Now: Point;
begin
	New(Now);
	if head= nil then
	begin
	 	head:= now;
	 	tail:= now;
	 	head^.prev:= nil;
	 	tail^.prev:= nil;
	 end else
	 begin
	 	tail^.next:= now;
	 	now^.prev:= tail;
	 	tail:= now;
	 	tail^.next:= nil;
	 end;
end;

procedure pop; //menghapus simpul
var
	Now: Point;
	begin
		while head<>nil do
		begin
		 	Now:= head;
		 	head:= head^.next;
		 	Dispose(Now);
		 end ;
	end;

procedure Judul (T: boolean); //membuat judul/ tampilan program
	begin
		clrscr;
		gotoxy(1, 1); writeln('PT pt aja udah gpp');
		gotoxy(1, 2); writeln('Jl pt aja udah gpp');
		gotoxy(1, 3); writeln('Bekasi');
		gotoxy(30, 5);
		if t= true then
		writeln('Data Karyawan')
		else 
		writeln('Nomor Induk Karyawan');
		gotoxy(28, 6); writeln('=================');
	end;

procedure Output(jml:Byte);	//Membuat laporan
var
	i: Byte;
	Now: Point;
	begin
		Judul(false);
		Now:= head;
		for i := 1 to jml do
		begin
			gotoxy(30, 6+i); writeln(i, '.  ',Now^.NIK);
			Now:= Now^.next;
		end;
	end;

procedure Tampil;	// menampilkan data terpilih
	begin
		gotoxy(2, 17); writeln('Data Yang Dipilih : ');
		gotoxy(2, 18); writeln('NIK : ', tail^.NIK);
		gotoxy(2, 19); writeln('Nama Karyawan : ', tail^.NmKar);
		gotoxy(2, 20); writeln('Gaji : ', tail^.Gaji); 	
	end;

procedure Anim(jml:Byte);
var
	i: Byte;
	tekan: char;
	begin
		i:=1;
		tail:= head;
		gotoxy(39, 6+i); write(P);
		repeat
			tekan:= ReadKey;
			if (tekan=bawah) and (i<>jml) then 
			begin
				gotoxy(39, 6+i);inc(i); //menggerakan panah ke bawah
				gotoxy(39, 6+i); write(P); //panah kebawah
				tail:= tail^.next;
			end else 
			if (tekan=atas) and (i<>1) then //menggerakan panah ke atas
			begin
				gotoxy(39, 6+i); ClrEol;dec(i);
				gotoxy(39, 6+i); write(P);
				tail:= tail^.prev;
			end else
			if tekan=enter then //memilih data untuk ditampilkan
			begin
			 	Tampil; ReadKey;
			 	gotoxy(2, 17); ClrEol; gotoxy(2, 18);ClrEol;
			 	gotoxy(2, 19); ClrEol; gotoxy(2, 20); ClrEol;
			 end;
		until tekan=ESC;
	end;

procedure Input;	//mengisi data
	var
		Jml: Byte;
		temp: str5;
	begin
		Jml:= 0;
		repeat
			clrscr;
			Judul(true);
			gotoxy(25, 8); write('NIK : ');ReadLn(temp);
			if temp<>'' then
			begin
				inc(Jml);
				Push; //memasukan ke dalam simpul
				tail^.NIK:= temp;
				gotoxy(25, 9); write('Nama karyawan : ');
									ReadLn(tail^.NmKar);
				gotoxy(25, 10); write('Gaji : ');
									ReadLn(tail^.Gaji);

			end else 
			if ((jml>max)) or (temp='') and (jml<>0) then
			begin
				Output(jml); //membuat laporan
				Anim(jml);	//animasi panah
			end;
		until (Jml>max) or (temp='');
	end;

	begin //Main Program
	clrscr;
	Input;
	pop;
	end.
