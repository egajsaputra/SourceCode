uses crt;

type

pointer = ^ptr;

ptr = record
        isi :byte;
        kiri,kanan:pointer;
        end;
var
        x,y, sel, pil : byte;
        tree, root, Now : pointer;
procedure create;
        begin
                root:=nil; tree:=nil;
        end;
procedure clear;
        begin

           if root <> nil then
           begin
           tree:=root; dispose(tree); root:=nil;
           end;
        end;
procedure push (var tree: pointer; bil:byte);
        begin
                if tree=nil then
                begin
                new(tree);
                tree^.isi :=bil;
                tree^.kiri :=nil;
                tree^.kanan :=nil;
                end
                else
                if tree^.isi < bil then
                push(tree^.kanan,bil)
                else
                push(tree^.kiri,bil)
        end;
Procedure find(var ketemu:boolean; tree:pointer; angka:byte);
        begin
                ketemu:=false;
                if tree<>nil then
                        begin
                                if tree^.isi=angka then
                                begin
                                         ketemu:=true; exit;
                                end;
                                find(ketemu,tree^.kiri,angka);
                                if not ketemu then
                                find(ketemu,tree^.kiri,angka);
                        end;

        end;
procedure show (var tree:pointer; x, y, sel:byte);
        var i:byte;
        begin
                gotoXY(x,y); write(tree^.isi);
                        if (tree^.kiri <> nil) or (tree^.kanan <> nil) then
                        begin
                gotoXY(x-sel,y+1); write ('*');
                gotoXY(x+sel,y+1); write ('*');
                for i:=(x-sel)+1 to (x+sel)-1 do
                        begin
                                gotoXY(i,y+1); write('-');
                        end;
                gotoXY(x,y+1); write ('~');
        end;

        inc(y,2);
        if tree^.kiri <> nil then show(tree^.kiri, x-sel, y, sel div 2);
        if tree^.kanan <> nil then show(tree^.kanan, x+sel, y, sel div 2)
end;
procedure checklevel (var tree:Pointer; var level:byte; bil:byte);
        begin
                if tree<>nil then
                begin
                        inc(level);
                        if tree^.isi < bil then
                                checklevel (tree^.kiri,level,bil)
                                else
                                checklevel (tree^.kanan,level,bil);
                end;
                end;
procedure           preorder(tree:pointer);
begin
if tree<> nil then
begin
        gotoXY(x,y);write(tree^.isi);   inc(x,3);
        Preorder(tree^.kiri);
        preorder(tree^.kanan);
        end;
end;
procedure           inorder(tree:pointer);
begin
if tree<> nil then
begin
        inorder(tree^.kiri);
        gotoXY(x,y);write(tree^.isi);   inc(x,3);
        inorder(tree^.kanan);
        end;
end;
procedure           postorder(tree:pointer);
begin
if tree<> nil then
begin
        Postorder(tree^.kiri);
        postorder(tree^.kanan);
        gotoXY(x,y);write(tree^.isi);   inc(x,3);
        end;
end;
procedure insert;
var
        isi, level :byte;
        ketemu : boolean;
        begin
                repeat
                clrscr;
                        writeln('Please Insert Binary');
                        writeln('*+*+*++*+*+*+');
                        if root<> nil then show (root,40,5,20);
                        repeat
                                gotoXY(3,4); clreol; write ('Insert Binary (Max 6 Tree) =');
                                readln(isi);
                        until isi in [0..200];
                        if isi=0 then exit;
                        level:=1;
                        checklevel(root, level, isi);
                        find(ketemu,root,isi);
                        if (not ketemu) and (level<=6) then
                                push(root,isi)
                        else
                        begin
                                textcolor(12);
                                GotoXY(3,5); write('Level Maksimum/Bilangan Sudah Ada');
                                delay(750);
                                textcolor(15);
                        end;
                until isi=0;
        end;
procedure hapus(var tree:pointer; bil:byte);
var temp:pointer;
begin
        if tree=nil then
        begin
                textcolor(12); gotoXY(2,4); write(bil,'Not Found');
                textcolor(15);
        end else
                if bil< tree^.isi then
                        hapus(tree^.kiri,bil)
                else if bil> tree^.isi then
                        hapus(tree^.kanan,bil)
                else if tree^.kiri= nil then
                begin
                        temp:=tree^.kanan;
                        dispose(tree);
                        tree:=temp;
                end
                else if tree^.kanan= nil then
                begin
                        temp:=tree^.kiri;
                        dispose(tree);
                        tree:=temp;
                end  else
                        begin
                                temp:=tree^.kiri;
                                while temp^.kanan <> nil do
                                temp:=tree^.kanan;
                                tree^.isi := temp^.isi;
                                hapus (tree^.kiri,temp^.isi);
                        end
                end;
        procedure search(var tree:pointer; x,y,selisih,cari:byte);
        begin
                inc(y,2);
                if cari = tree^.isi then
                begin
                        if tree^.kiri <> nil then
                        search(tree^.kiri, x-selisih, y, selisih div 2, cari)
                end else
                if cari > tree^.isi then
                begin
                        if tree^.kanan <> nil then
                        search(tree^.kanan, x+selisih, y, selisih div 2, cari)
                end else
                if cari = tree^.isi then
                begin
                        dec(y,2);
                        gotoxy(x,y); textcolor (12); write (cari);
                        gotoxy(2,4); write (cari,'Found'); readkey;
                        gotoxy(x,y); textcolor (15); write (cari);
                        gotoxy(2,4); write (' ':20);
                end else
                if ((tree^.kiri=nil) or (tree^.kanan=nil)) and
                (cari <> tree^.isi) then
                begin
                        gotoxy(2,4); write (cari,'Not Found'); delay(750);
                        gotoxy(x,y); write (' ':20);
                end;
        end;
                procedure menu;
                var
                bil    :byte;
                sign:char;
                ketemu:boolean;
                begin
                clrscr;
                        writeln('Binary Search Tree');
                        writeln('1. Create');
                        writeln('2. Add');
                        writeln('3. Delete');
                        writeln('4. Find');
                        writeln('5. Traverse');
                        writeln('6. Clean');
                        writeln('7. Exit');
                        repeat
                        write ('Select 1 - 7 :');
                        readln (pil);
                        until pil in [1..7];
                        case pil of
                        1: create;
                        2: insert;
                        3: begin
                         repeat
                         clrscr;
                         write ('Delete Binary Tree');

                         if root <> nil then show  (root, 40,5,20);
                         gotoXY (2,3); write ('Delete [0--> Exit] = ');
                         readln ( bil);
                         hapus(root,bil);
                         until bil=0;
                         end;
                         4: begin
                                repeat
                                        clrscr;
                                        gotoxy(30,1); writeln('Find Binary Tree');
                                        gotoxy(27,2); writeln('------');
                                        if root <>nil then show(root,40,5,20);
                                        gotoxy(2,3); write('Find [0--> Exit]= ');
                                        readln(bil);
                                        if bil <> 0 then search(root,40,5,20,bil);
                                        until bil=0;
                            end;
                         5: begin
                                clrscr;
                                gotoxy(25,1); writeln('Traverse');
                                if root<>nil then show(root,40,5,20);
                                gotoxy(36,15); writeln ('Pre Order :');
                                gotoxy(25,16);

writeln ('_______________________');
                                x:=1;y:=17;preorder(root);
                                gotoxy(36,18); writeln ('In Order :');
                                gotoxy(25,19);
writeln ('______________________');
                                x:=1;y:=20;inorder(root);
                                gotoxy(36,21); writeln ('Post Order :');
                                gotoxy(25,22);
           writeln ('_____________________');
                                x:=1;y:=23;preorder(root);    readkey;
                         end;
                         6: begin
                                clear;
                                create;
                             end;
                         7: Exit;
                         end;
                         end;

        begin
        textcolor(15);
        repeat
        menu;
        until pil=7;
        clear;
        end.
