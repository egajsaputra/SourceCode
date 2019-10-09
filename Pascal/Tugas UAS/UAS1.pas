uses crt;
var
        cari            : integer;
        data            : array[1..100] of integer;
        n,i,j,indeks    : integer;
        pilih           : char;

function sequen(cari: integer): integer;
begin
        i:=1;
        while ((i<n) and (data[i]<>cari)) do
        i:= i+1;
                if data[i]= cari then
                        sequen:=i
                else
                        sequen:=0;
end;


function binary(cari: integer):integer;
var
        awal,akhir,tengah: integer;
        ketemu:boolean;
        indeksxx: integer;
begin
        awal:= 1;
        akhir:= n;
        ketemu :=false;
        indeksxx := 0;
        while ((awal <= akhir) and (not ketemu)) do
        begin
                tengah:= (awal+akhir) div 2;
                if cari = data[tengah] then
                begin
                        ketemu := true;
                        indeksxx := tengah;
                end
                else
                begin
                        if cari < data[tengah] then
                        akhir :=  tengah-1
                        else
                        awal := tengah+1;
                end;
        end;
        binary:=indeksxx;
end;


procedure insert;
var     min,urut,k : integer;
        l,m:string;
begin
urut:= 1;
        for i:= 1 to n-1 do
        begin
        min:=i;
                for j:= urut to n do
                begin
                        if data[j] < data[min] then
                        min:=j;

                        if data[i] <> data[min] then
                        begin
                        k:= data[i];
                       end;

                        if data[i] > data[min]  then
                        begin
                                data[i] := data[min];
                                data[min]:= k;
                        end;
                end;
        urut:=urut+1;
        end;
end;

procedure menu1;
begin   writeln('--------------------------------------');
        writeln('         Pencarian Sequential        ');
        writeln('--------------------------------------');
        write('Jumlah data : '); readln(n);
        writeln;
                for i:= 1 to n do
                begin
                write('Indeks [',i,'] : '); readln(data[i]);
                end;
                writeln;

        write('Cari     : '); readln(cari);
        indeks:=sequen(cari);
        writeln;
        if indeks <> 0 then
        begin
                writeln('Data yang dicari : ',cari);
                writeln('Ditemukan pada indeks ke-',indeks);
        end
        else
                write(cari,' Tidak ditemukan');
end;

procedure menu2;
begin   writeln('--------------------------------------');
        writeln('           Pencarian Binary             ');
        writeln('--------------------------------------');
        write('Jumlah data : '); readln(n);
        writeln;
                for i:= 1 to n do
                begin
                write('Indeks [',i,'] : '); readln(data[i]);
                end;
                writeln;
        insert;
        write('Data setelah diurutkan : ');
        for i:= 1 to n do
        write(data[i]:2);

        writeln;
        writeln;
        write('Cari     : '); readln(cari);
        indeks:=binary(cari);
        writeln;
        if indeks <> 0 then
        begin
                writeln('Data yang dicari : ',cari);
                writeln('Ditemukan pada indeks ke-',indeks);
        end
        else
                write(cari,' Tidak ditemukan');
end;


begin
        repeat
        clrscr;
        writeln('+----------------------------------------------+');
        writeln('|               Program Pencarian              |');
        writeln('+----------------------------------------------+');
        writeln('|       [1] Pencarian Sequential               |');
        writeln('|       [2] Pencarian Binary                   |');
        writeln('|       [0] Keluar                             |');
        writeln('+----------------------------------------------+');
        writeln('|       Pilih :                                |');
        writeln('+----------------------------------------------+');
        gotoxy(17,8);readln(pilih);
        case pilih of
        '1' : begin
                clrscr;
                menu1;
                readkey;
                end;
        '2' : begin
                clrscr;
                menu2;
                readkey;
                end;
        '0': exit;
               end;
until pilih='0';
end.
