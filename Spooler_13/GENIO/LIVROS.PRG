***   LIVROS.PRG

do pontos with "screen"

set color to w/n
@ 00,00 TO 24,62
@ 09,63 clear to 24,79
SET COLOR TO &fundo
a=9
do while a<24
   @ a,02 SAY replicate(chr_fundo,59)
   a=a+1
enddo
do sombras with 11,07,20,55,chr_fundo
SET COLOR TO &quadrad
@ 11,07 TO 20,55
SET COLOR TO &texto
@ 12,08 CLEAR TO 19,54
@ 13,12 SAY "Escolha um TEMA, utilizando as teclas:"
@ 15,10 SAY ". "+chr(17)+"ÄÙ             - seleciona um Tema;"
@ 16,10 SAY ". "+chr(24)+" / "+chr(25)+"           - sobe / desce um Tema;"
@ 17,10 SAY ". PgUp / PdDn     - p gina acima / abaixo;"
@ 18,10 SAY ". Home / End      - primeiro / £ltimo Tema;"
@ 19,10 SAY ". Barra de Espa‡o - percorre todos os Temas."

do while .t.
   sele 2
   go top

   SET COLOR TO W/N
   @ 00,63 TO 08,79
   SET COLOR TO &quad_sele
   @ 09,63 TO 24,79 DOUBLE
   SET COLOR TO +W/B
   @ 10,64 SAY "     TEMAS     "
   tot=sec_texto+","+sec_opc
   SET COLOR TO &tot

   num=reccount()+1
   a=1
   declare pad[num]
   do while a<num
      pad[a]=" "+nome
      skip
      a=a+1
   enddo
   b=a
   pad[a]=" Voltar ao Menu "
   @ 11,64 clear to 23,78
   escolha1=ACHOICE(11,64,23,78,pad,"","",escolha)

   if escolha1=0 .or. escolha1=b
      set color to w/n,w/b
      @ 09,63 CLEAR TO 24,79
      set color to +w/n
      sele 3
      n=recno()
      go top
      a=2
      do while .not. eof()
         if jogador<>space(9)
            @ a,65 SAY jogador
            @ a,75 SAY pontos
            a=a+1
            skip
         else
            exit
         endif
      enddo
      go n
      sele 2
      keyboard chr(13)
      return
   endif

   go escolha1
   fich=ficheiro
   reg=registos
   sele 1
   use &fich
   t=reccount()
   if t<15
      SET COLOR TO &texto
      @ 08,14 SAY " (c) 1990, "+autor
      SET COLOR TO &erro
      @ 12,08 CLEAR TO 19,54
      @ 15,12 SAY "Este tema tem apenas "+ltrim(str(t))+" perguntas..."
      @ 17,12 SAY "Dever  ter no minimo 15, para o poder"
      @ 18,12 SAY "selecionar. Escolha outro tema."
      SET COLOR TO "+*"+&erro
      @ 13,27 SAY "ATEN€ŽO!"
      if som="S"
         ?? chr(7)
      endif
      loop
   endif
   sele 2

   reg=registos
   sele 1
   if reg>=reccount()+1
      r=right(str(seconds()),1)
      a=memory(0)    && instrucao para retardar o proximo comando
      t=right(str(seconds()),1)
      num=val(t)+val(r)
      sele 2
      replace registos with num
      reg=registos
      sele 1
   endif

   set color to "*+"+&sec_texto
   @ row(),64 say chr(16)

   sele 2
   do random
   replace registos with registos+soma
   sele 1
   go reg
   escolha=escolha1
   do jogar
   if jogador=space(9)
      return
   endif
enddo


