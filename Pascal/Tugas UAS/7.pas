
uses crt;

type
	Point = ^rec;
	rec = record
		nilai : String[2];
		next : Point;
		prev : Point;
	end;

var
	head, now: Point;
	nullNo : Byte;

procedure createDblist;
var
	i: char;
	begin
		head:= nil;
		now:= nil;
		for i := '1' to '9' do
		begin
			new(now);
			if i<>'9' then 
			now^.nilai:= i
			else 
			now^.nilai:= ' ';
		now^.prev:= nil;
		now^.next:= nil;
		if head= nil then
		begin
			head:= now;
			head^.prev:= head;
			head^.next:= head;
		end else
		begin
			now^.prev:= head^.prev;
			head^.prev^.next:= now;
			head^.prev:= now;
			now^.next:= head;
		end;
	end;
	nullNo:= 9;
end;

procedure deleteDblist;
	var
		temp: Point;
		begin
			temp:= head;
			while temp^.next <> head do
			begin
				head:= head^.next;
				head^.prev:= temp^.prev;
				temp^.prev^.next:= head;
				dispose(temp);
				temp:= head;
			end;
           dispose(temp);
		end;

procedure writelList(x,y: Integer);
	var
		i,j,k: Byte;
		temp: Point;
	begin
		temp:= head;
		j:= 0;
		for i := 1 to 9 do
		begin
			if j<3 then inc(j) else j:=1;
			k:=(i-1) div 3;
			gotoxy(x + (j-1) * 4 + 2, y + 1 + k * 2); write(temp^.nilai);
			temp:= temp^.next;
		end;
	end;

function upValid: Boolean; 
    begin
    	if nullNo <= 6 then 
    	upValid:= true
    	else 
    	upValid:= false;
    end;

function downValid: Boolean;
    begin
    	if nullNo >= 4 then 
    	downValid:= true
    	else 
    	downValid:= false; 
    end;

function leftValid: Boolean;
    begin
    	if not (nullNo in [3,6,9]) then 
    	leftValid:= true
    	else
    	leftValid:= false;
    end;

function rightValid: Boolean;
begin
	if not (nullNo in [1,4,7]) then
	  rightValid:= true
	  else
      rightValid:= false;
end;

procedure changeValue(var a, b : string);
	var
		c: string;
    begin
    	c:= a;
    	a:= b;
    	b:= c;
    end;

function checIfWin: Boolean;
var
	i: char;
	temp: Point;
	begin
		temp:= head;
		for i := '1' to '8' do
		begin
			if temp^.nilai<>i then
			begin
				checIfWin:= false;
				exit;
			end;
			temp:= temp^.next;
		end;
		checIfWin:= true;
	end;

procedure ifYouWin;
	begin
		if checIfWin then 
		begin
			gotoxy(14, 20); write('Congratulation, you won!');
			gotoxy(14, 20); ClrEol;
		end;
	end;

procedure move(key:char);
	var
		i: Byte;
		temp: Point;
	begin
		case key of
			#72: begin
				if upValid then
				begin
					temp:= now;
					for i := 1 to 3 do
					temp:= temp^.next;
				changeValue(now^.nilai, temp^.nilai);
				nullNo:= nullNo + 3;
				now:= temp;
				end;
			end;
			#75 : begin
				if leftValid then
				begin
					temp:= now;
					temp:= temp^.next;
					changeValue(now^.nilai, temp^.nilai);
					nullNo:= nullNo +1;
					now:= temp;
				end;
			end;
			#77: begin
				if rightValid then
				begin
					temp:= now;
					temp:= temp^.prev;
					changeValue(now^.nilai, temp^.nilai);
					nullNo:= nullNo - 1;
					now:= temp;
				end;
			end;
			#80 : begin
				if downValid then
				temp:= now;
				for i := 1 to 3 do
				 temp:= temp^.prev;
				changeValue(now^.nilai, temp^.nilai);
				nullNo:= nullNo - 3;
				now:= temp;
			end;
		end;
	end;


procedure randomList;
	var
		i: Byte;
	begin
		for i := 1 to 10
		 do
		case random(4) of
			0: Move(#72);
			1: Move(#75);
			2: Move(#77);
			3: Move(#80);
		end;
	end;

procedure createFrame;
	begin
		gotoxy(28, 2); write('PUZZLE FKCV');
		gotoxy(25, 3); write('=======================');
		gotoxy(10, 10); write('                  ENTER --> Mengacak');
		gotoxy(10, 12); write('                  ESC   --> Keluar');
		gotoxy(10, 13); write('                  ');
		gotoxy(10, 14); write('                  Tombol Fungsi: ');
		gotoxy(10, 15); write('                  Panah atas,bawah,kiri,kanan ');
		gotoxy(10, 16); write('                  Untuk menggeser angka ');
	end;

procedure menu;
	var key : char;
	begin
		createFrame;
		randomList;
		writelList(10,10);
		repeat
			ifYouWin;
			key:= ReadKey;
			if key= #000 then
			key:= ReadKey;
		case key of
			#13: randomList;
			else Move(key);
		end;
		writelList(10,10);
		until key = #27;
	end;

begin
	clrscr;
	textcolor(White);
	randomize;
	createDblist;
	menu;
	deleteDblist;
end.
