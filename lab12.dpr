{В текстовом файле input.txt записан русский текст.
Найти в тексте слова с нечетной длиной (не менее 3),
в которых первая, последняя и средняя буквы - согласные,
записать их заглавными буквами и указать после каждого
такого слова в скобках найденные буквы.
Полученный текст записать в файл output.txt.
Весь текст, кроме найденных слов, должен
остаться неизменным, включая и знаки препинания.}

{$APPTYPE CONSOLE}
{$R+,Q+}

uses
  SysUtils;

const
  sogl = ['б','в','г','д','ж','з','й','к','л','м','н','п','р','с','т','ф','х','ц','ч','щ','ш',
        'Б','В','Г','Д','Ж','З','Й','К','Л','М','Н','П','Р','С','Т','Ф','Х','Ц','Ч','Щ','Ш'];

var
  s,w:string;
  i:integer;

begin
  Reset(input,'input.txt');
  Rewrite(output,'output.txt');

  while not SeekEOF do begin
      Readln(s);
      //s:=s+'.';
      i:=1;
      while i<=length(s) do begin
          if s[i] in ['а'..'я','А'..'Я','ё','Ё'] then begin
              w:='';
              while s[i] in ['а'..'я','А'..'Я','ё','Ё'] do begin
                  w:=w+s[i];
                  inc(i);
              end;
              if (length(w)>2) and (length(w) mod 2 = 1)
                  and (w[1] in sogl) and (w[length(w) div 2 + 1] in sogl) then begin
                    write(ansiuppercase(w),'(',w[1],' ',w[length(w) div 2 + 1],')');
              end
              else write(w);
          end
          else begin
              write(s[i]);
              inc(i);
          end;
      end;
      writeln;
  end;
end.
 
