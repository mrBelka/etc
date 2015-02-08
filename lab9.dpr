{Дана последовательность натуральных чисел Aj j=1...n 
(n<=10000). Удалить из последовательности числа, начинающиеся и 
заканчивающиеся одной и той же цифрой, а среди оставшихся 
продублировать числа, начинающиеся цифрой 3.}

{$APPTYPE CONSOLE}
{$R+,Q+}

uses
    SysUtils;
    
var
    x,n,i,tmp,last,first:integer;

begin
    Assign(input,'input.txt');
    Reset(input);
    Assign(output,'output.txt');
    Rewrite(output);
    
    Readln(n);
    //считываем все числа
    for i:=1 to n do begin
        Read(x);
        //делаем копию считанного числа
        tmp:=x;
        //запоминаем последнюю цифру
        last:=tmp mod 10;
        while tmp>0 do begin
            //каждый раз запоминаем последнюю цифру числа
            //на последнем шаге она будет первой цифрой
            first:=tmp mod 10;
            tmp:=tmp div 10;
        end;
        if last=first then continue;
        if first=3 then write(x,' ');
        write(x,' ');
    end;
end.
