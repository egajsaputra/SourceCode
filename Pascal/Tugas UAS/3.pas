uses crt;
const
	atas = #72;			//tombol panah keatas
	bawah = #80;		//tombol panah kebawah
	ESC = #27;			//tombil keluar
type
	str30 = String[30];
	Point = ^rec;
	rec = record
		item : str30;
		next : Point;
		prev : Point;
	end;

var
	j: Byte;
	now, head, tail : Point;

procedure Create; //menyatakan nilai pointer awal
	begin
		head:= nil; tail:=nil; now:= nil;
	end;

procedure Push(item:str30); //memasukan simpul
	var
		temp: Point;
		 begin
		 	New(Temp); //membuat simpul baru
		 	if head = nil then
		 		head:= Temp else
		 	begin
		 		Temp^.prev:= tail; //menyambungkan simpul baru dengan yang sudah ada
		 		tail^.next:= Temp;
		 	end;
		 	Temp^.item:= item; tail:=Temp;
		 	tail^.next:= head; 	//menyambung simpul akhir ke awal
		 	head^.prev:= tail;	//menyambung simpul awal ke akhir
		 end;

procedure Input;
var
	item: str30;
	jumlah: Byte;
 begin
 	clrscr;
 	writeln('Circular Double link list');
 	writeln('==============================');
 	writeln;
 	jumlah:= 0;
 	repeat
 		inc(jumlah);
 		write('Menu  item ke - ', jumlah, ' = '); ReadLn(item);
 		if item<>'' then Push(item);
 	until (item= '') or (jumlah= 10);
 end;

 procedure Pilih;
 begin
 	gotoxy(7, j+7); ClrEol;
 	textAttr:= $07;
 	write('Pilihan anda : ', now^.item);
 end;

 procedure Anim; //animasi
 var
 	i: Byte;
 	tekan: char;
 	begin
 		clrscr;
 		gotoxy(6, 1); write('Circular Double link list');
 		gotoxy(6, 2); write('============================');
 		gotoxy(12, 4); write('Menu pilih : ');
 		gotoxy(12, 5); write('=================');
 		now:= head;
 		j:=0;
 		repeat
 			inc(j);
 			gotoxy(13, 5+j); write(j, '.  ', now^.item);
 			now:= now^.next;
 		until now = head;
 		i:=1; now:= head;

 		Pilih; gotoxy(13, 6); textAttr:=$1f;
 		write(i, '.  ', now^.item);;
 		repeat
 			Tekan:= ReadKey;
 			case Tekan of
 				atas: begin //menggerakan pilihan atas
 					gotoxy(13, i+5); textAttr:=$07;
 					write(i, '.  ', now^.item); dec(i);
 					if i<1 then i:=j;
 					now:= now^.prev;
 					Pilih;
 					gotoxy(13, i+5); textAttr:=$1f;
 					write(i, '.  ', now^.item);
 				end;

 				bawah : begin //menggerakan pilihan bawah
 					gotoxy(13, i+5); textAttr:=$07;
 					write(i, '.  ', now^.item); inc(i);
 					if i>j then i:= 1;
 					now:= now^.next;
 					Pilih;
 					gotoxy(13, i+5); textAttr:=$1f;
 					write(i, '.  ', now^.item);
 				end;
 			end;
 		until Tekan=ESC 
 		end;

  begin // Main Program
  	Create;
  	Input; Anim;
  end.
