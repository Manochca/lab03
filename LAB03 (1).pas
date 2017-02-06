{���� ����ࠫ쭮� �᫮ N (1<=N<=100), 楫��᫥��� ������� ���ᨢ a0, a1,
a2,..., an-1. �������� ���ᨢ� ����������� ��砩�묨 楫묨 �᫠�� ��
��������� [0,N]. �ॡ���� �����஢��� ���ᨢ. ��⮤ ���஢�� - 襩��ୠ�
���஢�� (��⨬���஢�����). ��᫥ ���஢�� �ந����� ���� � ���ᨢ�
��������� ���祭��. ������ ���᪠ - ��᫥����⥫�� ���� � ����஬ �
���� ���ᨢ�.
����: ����ᮢ� �.�., ��. 39-11
���: 20.03.2012}
Program zadacha;
Uses crt;
Const nmax=100;
Type Vector= array[-1..nmax-1] of integer;
Var c: Vector;
    i: integer;
    p: integer;
    n: integer;

{�������� ���ᨢ}
Procedure Randomiz(var z: Vector);
var i: integer;
Begin
  randomize;
  for i:=0 to n-1 do
  z[i]:=random(n);
End;

{�뢮��� ���ᨢ �� �࠭}
Procedure Print(var z: Vector);
Var i: integer;
Begin{Massiv}
  for i:=0 to n-1 do
    write(z[i]:4);
  writeln;
End;{Massiv}

{�����ୠ� ���஢�� ���ᨢ�}
Procedure Sort(L,R: integer; var a: Vector);
Var i: integer;
    t: integer;

{����� ���祭�ﬨ}
Procedure Swap(var x,y: integer);
var t: integer;
Begin{Swap}
  t:=x;
  x:=y;
  y:=t;
End;{Swap}

Begin{ShSort}
  Repeat
    for i:=L to R-1 do
    Begin
      if a[i]>a[i+1] then
        Begin
          Swap(a[i], a[i+1]);
          t:=i;
        End;
    End;
    R:=t;
    for i:=R-1 downto L do
    Begin
      if a[i]>a[i+1] then
        Begin
          Swap(a[i], a[i+1]);
          t:=i;
        End;
    End;
    L:=t+1;
  Until L>R;
End;{ShSort}

{��᫥����⥫�� ���� c ��॥஬ � ���� ���ᨢ�}
Procedure Faint (L,R: integer; z: Vector; k: integer);
Var i: integer;

Begin{PosledPoisk}
  i:=R;
  z[L-1]:=k; {�����}
  while z[i]<>k do
    i:=i-1;
  if i>=L then
    writeln('������ ����� � �����ᮬ ', i)
  else
    writeln('������� �� ������');
End;{PosledPoisk}

Begin
  ClrScr;

  Repeat
    writeln('������ n');
    readln(n);
  Until (n>=1) and (n<=100);

  Randomiz(c);

  writeln('��室�� ���ᨢ');
  Print(c);

  writeln('�����஢���� ���ᨢ');
  Sort(0,n-1,c);
  Print(c);

  writeln('������ ����� ���᪠');
  readln(p);
  Faint(0,n-1,c,p);

  ReadKey;
End.
