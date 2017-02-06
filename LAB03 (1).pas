{Дано натуральное число N (1<=N<=100), целочисленный линейный массив a0, a1,
a2,..., an-1. Элементы массива заполняются случайными целыми числами из
диапозона [0,N]. Требуется отсортировать массив. Метод сортировки - шейкерная
сортировка (оптимизированная). После сортировки произвести поиск в массиве
введеного значения. Алгоритм поиска - последовательный поиск с барьером с
конца массива.
Автор: Матросова М.А., гр. 39-11
Дата: 20.03.2012}
Program zadacha;
Uses crt;
Const nmax=100;
Type Vector= array[-1..nmax-1] of integer;
Var c: Vector;
    i: integer;
    p: integer;
    n: integer;

{Заполняет массив}
Procedure Randomiz(var z: Vector);
var i: integer;
Begin
  randomize;
  for i:=0 to n-1 do
  z[i]:=random(n);
End;

{Выводит массив на экран}
Procedure Print(var z: Vector);
Var i: integer;
Begin{Massiv}
  for i:=0 to n-1 do
    write(z[i]:4);
  writeln;
End;{Massiv}

{Шейкерная сортировка массива}
Procedure Sort(L,R: integer; var a: Vector);
Var i: integer;
    t: integer;

{Обмен значениями}
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

{Последовательный поиск c бареером с конца массива}
Procedure Faint (L,R: integer; z: Vector; k: integer);
Var i: integer;

Begin{PosledPoisk}
  i:=R;
  z[L-1]:=k; {барьер}
  while z[i]<>k do
    i:=i-1;
  if i>=L then
    writeln('Найден элемент с индексом ', i)
  else
    writeln('Элемент не найден');
End;{PosledPoisk}

Begin
  ClrScr;

  Repeat
    writeln('Введите n');
    readln(n);
  Until (n>=1) and (n<=100);

  Randomiz(c);

  writeln('Исходный массив');
  Print(c);

  writeln('Отсортированный массив');
  Sort(0,n-1,c);
  Print(c);

  writeln('введите элемент поиска');
  readln(p);
  Faint(0,n-1,c,p);

  ReadKey;
End.
