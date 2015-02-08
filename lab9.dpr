{$APPTYPE CONSOLE}
{$R+,Q+}

uses
    SysUtils;
    
var
    x,n,i,tmp,last,first:integer;

begin
    Readln(n);
    for i:=1 to n do begin
        Read(x);
        tmp:=x;
        last:=tmp mod 10;
        while tmp>0 do begin
            first:=tmp mod 10;
            tmp:=tmp div 10;
        end;
        if last=first then continue;
        if first=3 then write(x,' ');
        write(x,' ');
    end;
end.
