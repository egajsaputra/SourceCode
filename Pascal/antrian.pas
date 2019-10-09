Program antrian;
Uses Crt;
Const
    Max=10;

Type
    Node=^Queue;
    Queue=Record
        kar:char;
        next:node;
end;

Var
    Pil:char;
    Jml:byte;
    Head,Now,Tail:Node;

procedure Push(ch:char); //membuat simpul
    begin
        New(Now);
        if head=nil then
            Head:=Now
        else
            Tail^.next:=now;
            Tail:=Now;
            Tail^.next:=nil;
            Now^.kar:=ch;
    end;

procedure Pop; //menghapus simpul
begin
    Now:=Head;
    Head:=Head^.next;
    Dispose(Now);
end;

procedure Enqueque; //mengisi antrian
Var
    i:byte;
    temp:char;
begin
    GotoXY(1,6);ClrEol;write('Masukan @ karakter : ');
    repeat
        GotoXY(25,6); ClrEol;temp:=ReadKey;write(temp);
        until temp<>'';
        push(temp);
        for i:=1 to 75-Jml*6 do //animasi mengisi antrian
            begin
                GotoXY(i+1,20);write(' O');
                GotoXY(i,21);write('=(',Now^.kar,')=');
                GotoXY(i+1,22);write('/ \');delay(10);
                if i<>75-Jml*6 then
                    begin
                        GotoXY(i+1,20);write(' ');
                        GotoXY(i,21);write('    ');
                        GotoXY(i+1,22);write('  ');
                    end;
            end;
end;

procedure Dequeque;
Var i,byk:byte;
begin
    Now:=Head;
    for i:=69 to 76 do //animasi mengeluarkan antrian
        begin
            GotoXY(i+1,20);write(' O');
            GotoXY(i.21);write('=(',Now^.kar,')=');
            GotoXY(i+1,22);write('/ \');delay(10);
            GotoXY(i+1,20);write('   ');
            GotoXY(i,21);write('      ');
            GotoXY(i+1,22);write('   ');
        end;

        Byk:=0;
        While Byk<>Jml do
            begin
                inc(byk);
                Now:=Now^.next;
                for i:=69-Byk*6 to 75-Byk*6 do //animasi memajukan
                    begin                       //pengantri
                        GotoXY(i+1,20);write(' O');
                        GotoXY(i,21);write('=(',Now^.kar,')=');
                        GotoXY(i+1,22);write('/ \');delay(25);
                        if i<>75-byk*6 then
                            begin
                                GotoXY(i+1,20);write('   ');
                                GotoXY(i,21);write('      ');
                                GotoXY(i+1,22);write('   ');
                            end;
                    end;
            end;
end;

procedure Input; //membuat menu
    begin
        GotoXY(1,1);WriteLn('1. Enqueque ');
        GotoXY(1,2);WriteLn('2. Dequeque ');
        GotoXY(1,3);WriteLn('3. Exit ');
        Repeat
            Repeat
                GotoXY(1,4);ClrEol;write('Your Choice : ');
                Pil:=ReadKey;write(Pil);
            Until Pil in ['1','2','3'];
            Case Pil of
            '1':begin (menambah pengantri)
                if jml<max then
                    begin
                        Inc(Jml);
                        Enqueque;
                    end else
                    begin
                        GotoXY(1,8);write('Antrian Penuh !');
                        delay(500);
                        GotoXY(1,8);ClrEol;
                    end;
                    end;

            '2':begin //mengueluarkan pengantri
                if jml>=1 then
                    begin
                        Dec(Jml);
                        Dequeque;
                        Pop;
                    end else
                    begin
                        GotoXY(1,8);write('Antrian Kosong !');
                        delay(500);
                        GotoXY(1,8);ClrEol
                    end;
                    end;
            end;
            Until Pil='3'; //keluar dari program
            end;

            begin //program utama
                Jml:=0;
                ClrScr;
                Input;
            end;
