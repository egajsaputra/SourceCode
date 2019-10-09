Program Single_Linked_list_FIFO;
Uses Crt;

Const
     s = '@';
     Max = 100;

Type
    PKar = ^RecKar;
    RecKar = Record
        isi : char;
        x,y,col : byte;
        Next : Pkar;
            end;

Var
    Head, Tail, Now : Pkar;

Procedure Push;
    begin
        New(Now);                       //Membuat simpul baru
        if  Head=Nil then
            Head:=Now
        else
            Tail^.Next:=Now;
        Tail:=Now; Tail^.Next:=nil;
        Now^.isi:=s;
        Now^.x:=random(79)+1;           //Mengisi nilai x dengan nilai acak
        Now^.col:=random(16);           //Mengisi nilai col dengan nilai acak
    end;

Procedure Anim;
Var
    ch : char;
    i,jml : byte;

        Procedure Tekan;
            begin
                Ch:=Readkey;
                if (ch<>#27) and (ch='+') and (Jml<Max) then    //Menambah Salju
                begin
                    Push;
                    inc(jml);
                end;
            end;
        begin
            repeat
                Now:=Head;
                while (Now<>nil)do
                    begin
                        TextColor (Now^.col);       //Mengeset warna tulisan
                        GotoXY (Now^.x.Now^.y);write(Now^.isi);
                        if Now^.y=25 then Now^.y:=1;
                        inc(Now^.y);
                        Now:=Now^.next;
                    end;
                delay(10);ClrScr;                   //Menghapus layar
                if keyPressed then Tekan;
            until ch=#27;                           //Tombol escape ditekan
        end;

begin
    ClrScr;
    Head:=Nil; Tail:=Nil;
    Randomize;
    Push;
    Anim;
end;
