uses dos;

var f : text;

begin
 assign(f, 'c:\fe.dat');
 rewrite(f);

  writeln(f, 'FastExecute Versao 1.0 por Tiago Santos');
  writeln(f);
  writeln(f, 'Entrada  ³ Saida    ³ Data       ³ Nome e caminho do programa');
  writeln(f, 'ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ');

 close(f);
end.