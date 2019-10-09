program antrian;
uses crt;
const max_Elemen=10;
type
    TAntri = array[1..max_elemen] of char;
var head,tail,pilih: byte; antri: TAntri;
    masukan:char;
procedure init;
var i: byte;
begin
    head:=0; tail:=0;
    for i:=1 to max_elemen do
        antri[i]:='-';
end;

function kosong: boolean;
begin
    kosong:=(tail=0);
end;

function penuh: boolean;
begin
    penuh:=(tail=max_elemen);
end;

procedure tambahElemen(elemen:char);
begin
    if not penuh then begin
        if kosong then begin
            head:=1; tail:=1;
            end else
                inc(tail);
        antri[tail]:= elemen;
    end;
end;

function keluarkan:char;
var i: byte;
begin
    if not kosong then begin
        if tail=1 then begin
            antri[tail]:='-';
            tail:= 0; head:=0;
        end else begin
                keluarkan:=antri[head];
                for i:=head to tail-1 do begin
                    antri[i]:= antri[i+1];
                end;
                dec(tail);
    end;
        if not kosong then
            antri[tail+1]:='-' else
            antri[tail]:='-';
    end;
end;

procedure tampilkan;
var i:byte;
begin
    gotoxy(10,8); writeln(' ':20);
    gotoxy(10,8);
    for i:= 1 to 10 do
        write('|',antri[i]:3);
    write('|');
end;

begin
    clrscr;
    init;
    begin
    writeln('1-Masukan Antrian');
    writeln('2-Keluarkan Antrian');
    writeln('3-Keluar');

    while not pilih <> 0 do begin
    gotoxy(1,4); write(' ':30);gotoxy(1,4);
    write('Pilihan Anda?'); readln(pilih);
    case pilih of
        1: begin
            if not penuh then begin
            gotoxy(30,4); write('Masukan Karakter: '); readln(masukan);
            tambahElemen(masukan);tampilkan;
            end else begin
                gotoxy(30,4); write('antrian penuh'); readln;
            end;
        end;

        2: begin
            if not kosong then begin
                gotoxy(30,4); write(keluarkan,' Telah Dikeluarkan');
                readln;tampilkan;
            end else begin
                gotoxy(30,4); write('Ipss! Kosong'); readln;
            end;
        end;
        0:exit;
    end;
    gotoxy(30,4);writeln(' ':30);
    end;
    end;
end.
