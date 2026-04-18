***    MENU PRINCIPAL
***

do inicio
do ecran
save screen to mem
* do temas
restore screen from mem
do records with " "

SET COLOR TO w/n
do escreve with 11,09,"    Jogar   "
do escreve with 11,25," Utilit쟲ios"
do escreve with 11,41,"    Sair    "

public level,level1,level2,level3
store 1 to level,level1,level2,level3
set key -9 to bye
set key 17 to stop
keyboard chr(13)
do while .t.
   set key 28 to help
   set key 27 to bye
   set color to &quad_sele
   @ 00,00 TO 24,62 double
   tot="w/n,"+menu_opc
   set color to &tot
   number=1
   @ 11,09 PROMPT "    Jogar    "
   @ 11,25 PROMPT " Utilit쟲ios "
   @ 11,41 PROMPT "    Sair     "
   menu to level
   save screen to scr_menu
   set key 19 to esquerda
   set key 04 to direita
   do sub_menu
   set key 19 to
   set key 04 to
   if number<>0
      keyboard chr(13)
   endif
   restore screen from scr_menu
enddo

proc sub_menu
   tot=menu_texto+","+menu_opc
   set color to &tot
   if level=1
      set color to &menu_quad
      @ 12,09 to 15,21
      do sombras with 11,09,15,21,chr_fundo
      set color to &menu_texto
      @ 13,10 clear to 14,20
      @ 13,10 prompt " Continuar "
      @ 14,10 prompt " Novo Jogo "
      menu to level1
      if level1=0 .or. number=0
         return
      endif
      set key 28 to
      set key 27 to
      if level1=1 .and. number<>0
         set key 19 to
         set key 04 to
         sele 3
         n=recno()
         go top
         if jogador=space(9)
            do novo
            go n
         else
            go n
            do livros
         endif
      endif
      if level1=2 .and. number<>0
         do novo
         level1=1
      endif
      restore screen from scr_menu
      set color to w/n
      @ 02,64 clear to 07,78
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
      do records with " "
      save screen to scr_menu
   endif
   if level=2
      sele 5
      truc=beep
      tot=menu_quad+","+menu_opc
      set color to &tot
      @ 12,25 to 18,45
      do sombras with 12,25,18,45,chr_fundo
      set color to &menu_texto
      @ 13,26 clear to 17,44
      @ 13,26 prompt " Inserir Perguntas "
      @ 14,26 prompt " Inserir Temas     "
      @ 15,26 prompt " Som ("+truc+")         "
      @ 16,26 prompt " Selecionar Cores  "
      @ 17,26 prompt " Estat죛tica       "
      menu to level2
      if level2=0 .or. number=0
         return
      endif
      set key 28 to
      set key 27 to
      if level2=1 .or. level2=2
         do utilitar with level2
         sele 2
         go escolha
         fich=ficheiro
         reg=registos
         sele 1
         use &fich
      endif
      if level2=3
         do utilitar with 3
      endif
      if level2=4
         do cores
         do ecran
         do records with " "
         save screen to scr_menu
         keyboard chr(13)
      endif
      if level2=5
         do temas
      endif
   endif
   if level=3
      level3=1
      do sombras with 11,41,18,53,chr_fundo
      set color to &menu_quad
      @ 12,41 to 18,53
      set color to "+"+&menu_texto
      @ 13,42 clear to 17,52
      @ 13,42 say "Deseja sair"
      @ 14,42 say "deste jogo?"
      tot=menu_texto+","+menu_opc
      set color to &tot
      @ 16,42 prompt "    N꼘    "
      @ 17,42 prompt "    Sim    "
      menu to level3
      if level3=0 .or. number=0
         return
      endif
      set key 28 to
      set key 27 to
      if level3=2 .and. number<>0
         do fim
      endif
   endif
return
***************************************
PROCEDURE esquerda
number=0
KEYBOARD chr(13) + chr(5) + chr(13)
RETURN
***************************************
PROCEDURE direita
number=0
KEYBOARD chr(13) + chr(4) + chr(13)
RETURN
****************************************
proc bye

private mem,cor,row,col
cor=setcolor()
save screen to mem
row=row()
col=col()

SET COLOR TO +&erro
@ 20,15 TO 23,58
@ 20,17 SAY " Sair "
SET COLOR TO &erro
@ 21,16 CLEAR TO 22,57
@ 21,25 SAY "Prima <Escape> para sair ou"
@ 22,25 SAY "outra tecla para continuar."
set color to *&erro
@ 21,32 SAY "Escape"
@ 22,52 say ""

do while .t.
   key=inkey()
   if key=27
      restore screen from mem
      do fim
   endif
   if key<>0
      exit
   endif
enddo

restore screen from mem
set color to &cor
@ row,col say ""
return
***************
proc stop
set color to w/n
clear
set color to +&texto
@ 00,00 CLEAR TO 03,79
@ 00,01 SAY "컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴  GENIO  컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴컴�"
@ 02,24 SAY "(c) 1990, "+autor
?
quit
return
***************
