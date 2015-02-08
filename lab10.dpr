{Дана целочисленная матрица Aij i=1...n;j=1..n , n<=100. 
Если в матрице нет еще одного элемента, равного ее максимальному 
элементу, упорядочить элементы строк матрицы, в которых есть 
простые числа, по невозрастанию абсолютных величин. Использовать процедуры и функции!}

{$APPTYPE CONSOLE}
{$R+,Q+}

uses
    SysUtils;
    
type
    T_array = array[1..100,1..100] of integer;
    
procedure Vvod(var n:integer; var a:T_array);
var
    i,j:integer;
begin
    Readln(n);
    //считываем матрицу
    for i:=1 to n do
        for j:=1 to n do
            Read(a[i,j]);
end;

function FindMax(var k1,k2:integer;n:integer;a:T_array):integer;
var
    i,j,max:integer;
begin
    //пусть максимумальный элемент a[1,1], запомним также его индексы
    max:=a[1,1];
    k1:=1;
    k2:=1;
    for i:=1 to n do 
        for j:=1 to n do 
            //если нашли новый максимальный элемент
            if max<a[i,j] then begin
                max:=a[i,j];
                k1:=i;
                k2:=j;
            end;
    result:=max;
end;

function FindAnotherMax(max,k1,k2,n:integer;a:T_array):boolean;
var
    i,j:integer;
begin
    for i:=1 to n do
        for j:=1 to n do
            //если есть еще 1 элемент, равный максимальному 
            if (max=a[i,j]) and not((i=k1) and (j=k2)) then begin
                result:=true;
                exit;
            end;
    result:=false;
end;

function Prime(x:integer):boolean;
var
    d:integer;
begin
    if x<=2 then begin
        result:=true;
        exit;
    end;
    //если среди чисел от 2 до корня из х есть делитель х,
    //то число непростое
    for d:=2 to trunc(sqrt(x)) do
        if x mod d = 0 then begin
            result:=false;
            exit;
        end; 
    result:=true;   
end;

function isPrime(i,n:integer;a:T_array):boolean;
var
    j:integer;
begin
    result:=false;
    for j:=1 to n do begin
        if Prime(a[i,j]) then begin
            result:=true;
            exit;
        end;
    end;
end;

procedure Sort(n:integer;var a:T_array);
var
    i,j,k,t:integer;
begin
    for i:=1 to n do begin
        //если в строке есть 1 простое число
        if isPrime(i,n,a) then begin
            //сортируем строку
            for j:=1 to n-1 do
                for k:=j+1 to n do
                    if abs(a[i,j])<abs(a[i,k]) then begin
                        t:=a[i,j];
                        a[i,j]:=a[i,k];
                        a[i,k]:=t;
                    end;
        end;
    end;
end;

procedure Vyvod(n:integer;a:T_array);
var
    i,j:integer;
begin
    for i:=1 to n do begin
        for j:=1 to n do
            write(a[i,j],' ');
        writeln;
    end;
end;
    
var
    a:T_array;
    n,k1,k2,max:integer;
    
begin
    //добавить файлы
    //вводим
    Vvod(n,a);
    //ищем максимум
    max:=FindMax(k1,k2,n,a);
    //проверяем, есть ли еще максимум
    //и если есть, то сортируем
    if FindAnotherMax(max,k1,k2,n,a) then
        Sort(n,a);
    //выводим матрицу
    Vyvod(n,a);
end.
