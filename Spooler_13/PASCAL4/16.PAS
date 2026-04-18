{
  SPOOLER - Magazine dos utilizadores PC
  =======
  Curso de Pascal - Li‡„o 4 - Exemplo 16
}  


  PROGRAM DEZASSEIS (INPUT,OUTPUT);
    VAR STR1,STR2:STRING;
    BEGIN
      STR2:='SPOOLER';
      DELETE(STR2,3,2);
      WRITELN(STR2);       { imprime 'SPLER' }
      (* ************ *)
      STR1:='->';
      STR2:='SPOOLER';
      INSERT(STR1,STR2,4);
      WRITELN(STR2);       { imprime 'SPO->OLER' }
    END.
