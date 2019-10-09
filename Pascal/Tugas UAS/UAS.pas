uses crt;
Type
Tree = ^Simpul;
Simpul = Record
Info : char;
Kiri : Tree;
Kanan : Tree;
End;

Function BARU(Hrf : Char) : Tree;
Var Temp : Tree;
Begin
New(Temp);
Temp^.Info := Hrf;
Temp^.Kiri := NIL; Temp^.Kanan := NIL;
BARU := Temp;
End;

Procedure MASUK(Var Pohon : Tree; Hrf : Char);
Begin
If Pohon = NIL Then
Pohon := BARU(Hrf)
Else
Begin
If Pohon^.Info > Hrf then
MASUK(Pohon^.Kiri,Hrf)
Else If Pohon^.Info < Hrf then
MASUK(Pohon^.Kanan,Hrf)
Else
Writeln('Karakter', Hrf, 'Sudah ada di Tree');
End;
End;

Procedure PREORDER(Temp : Tree);
Begin
If Temp <> NIL Then
Begin
Write(Temp^.Info,' ');
PREORDER(Temp^.Kiri);
PREORDER(Temp^.Kanan);
End;
End;

Procedure INORDER(Temp : Tree);
Begin
If Temp <> NIL Then
Begin
INORDER(Temp^.Kiri);
Write(Temp^.Info,' ');
INORDER(Temp^.Kanan);
End;
End;

Procedure POSTORDER(Temp : Tree);
Begin
If Temp <> NIL Then
Begin
POSTORDER(Temp^.Kiri); {Kunjungi cabang kiri}
POSTORDER(Temp^.Kanan); {Kunjungi cabang kanan}
Write(Temp^.Info,' '); {Cetak isi simpul}
End;
End;

var
poon:tree;
Begin
clrscr;

MASUK(poon,'b');
MASUK(poon,'c');
MASUK(poon,'u');
MASUK(poon,'e');
MASUK(poon,'a');
writeln('PERORDER:');
PREORDER(poon);
writeln;
writeln('INORDER:');
INORDER(poon);
writeln;
writeln('POSTORDER:');
POSTORDER(poon);
readln;
end.
