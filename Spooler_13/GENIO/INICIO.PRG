***

set status     off
set scoreboard off
set talk       off
set deci to 0

public soma,escolha,scr_menu,temp_max,pont_max,som,autor,chr_fundo
escolha=1
soma=0

public memoria
public genio
public menu_quad
public menu_texto
public menu_opc
public quadrad
public texto
public barra
public quad_sele
public acertou
public erro
public fundo
public sombra
public inserir


 AUTOR=chr(86)+chr(105)+chr(116)+chr(111)+chr(114)+chr(255)+;
       chr(77)+chr(97)+chr(110)+chr(117)+chr(101)+chr(108)+chr(255)+;
       chr(77)+chr(111)+chr(110)+chr(116)+chr(101)+chr(105)+chr(114)+chr(111)+chr(255)

clear

******************
proc escreve
parameter row,col,frase
num1=0
if len(frase)=0
   return
endif
a=len(frase)+1
do while num1<a
   @ row,col say left(frase,num1)+"_"
   num1=num1+1
   inkey(.02)
enddo
@ row,col+len(frase) say " "
return
********* SOMBRAS *********************
proc SOMBRAS
parameter lin1,col1,lin2,col2,string
set color to &sombra

linha1=lin1+1
linha2=lin2+1
do while linha1<linha2
   @ linha1,col2+1 say string+string
   linha1=linha1+1
enddo
a=col2-col1+1
@ lin2+1,col1+2 say replicate(string,a)
return
**************************************
proc RANDOM
sec1=right(str(seconds()),2)
sec=val(sec1)
do case
   case sec>=00 .and. sec<=25
      soma=1
   case sec>=26 .and. sec<=50
      soma=2
   case sec>=51 .and. sec<=75
      soma=3
   case sec>=76 .and. sec<=100
      soma=4
endcase
return
*************************
proc pontos
parameter certo

SET COLOR TO W/N
@ 00,00 TO 24,62

sele 3
if certo<>"screen"
   if certo="sim"
      replace pontos with pontos+5
   endif
   if certo="nao"
      skip
      if jogador=space(9)
         go top
      endif
   endif
   if pontos>=pont_max
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
      SET COLOR TO &texto
      @ 08,14 SAY " (c) 1990, "+autor
      a=0
      set color to w/n
      do while a<14
         scroll(9,2,23,60,-1)
         inkey(.1)
         a=a+1
      enddo
      SET COLOR TO &quadrad
      @ 09,02 CLEAR TO 19,60
      SET COLOR TO &fundo
      @ 09,02 TO 19,60
      @ 10,03 SAY "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
      @ 11,03 SAY "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
      @ 12,03 SAY "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
      @ 13,03 SAY "°°°°°°°°°°°°°°°°°°°°°°°           °°°°°°°°°°°°°°°°°°°°°°°"
      @ 14,03 SAY "°°°°°°°°°°°°°°°°°°°°°°°           °°°°°°°°°°°°°°°°°°°°°°°"
      @ 15,03 SAY "°°°°°°°°°°°°°"+space(31)+"°°°°°°°°°°°°°"
      @ 16,03 SAY "°°°°°°°°°°°°°"+space(31)+"°°°°°°°°°°°°°"
      @ 17,03 SAY "°°°°°°°°°°°°°"+space(31)+"°°°°°°°°°°°°°"
      @ 18,03 SAY "°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°°"
      SET COLOR TO &texto
      @ 13,26 CLEAR TO 14,36
      @ 15,16 CLEAR TO 17,46
      @ 13,26 SAY "ÚÄÄÄÄÄÄÄÄÄ¿"
      @ 14,26 SAY "³         ³"
      @ 15,16 SAY "ÚÄÄÄÄÄÄÄÄÄÙ    1    ÀÄÄÄÄÄÄÄÄÄ¿"
      @ 16,16 SAY "³    2                   3    ³"
      @ 17,16 SAY "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
      @ 17,04 SAY "ÄÄÄÄÄÄÄÄÄÄÄÄÁ"
      @ 17,46 SAY "ÁÄÄÄÄÄÄÄÄÄÄÄÄ"
      SET COLOR TO &menu_texto
      @ 20,02 clear to 23,60
      @ 21,07 SAY "A Pontua‡„o definida pelo utilizador foi atingida!"
      index on pontos to index.ind
      go bottom
      set filter to jogador<>space(9)
      nome=jogador
      SET COLOR TO &menu_opc
      do escreve with 12,26," "+nome
      SET COLOR TO &barra
      skip -1
      if .not. bof()
         nome=jogador
         do escreve with 14,16,nome
      endif
      skip -1
      if .not. bof()
         nome=jogador
         do escreve with 14,37,nome
      endif
      close index
      set filter to
      do records with "sim"
      sele 3
      replace all jogador with space(9),pontos with 0
      set color to b/n
      @ 23,02 to 23,60
      SET COLOR TO W/B
      @ 23,16 SAY "Prima uma tecla para continuar."
      inkey(360)
      return
   endif
endif
rec=recno()

SET COLOR TO &quad_sele
@ 00,63 TO 08,79 DOUBLE
SET COLOR TO +W/B
@ 01,64 SAY "   PONTUA€ŽO   "
set color to w/n
@ 02,64 clear to 07,78

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

go rec
SET COLOR TO +W/N
@ 01+recno(),65 SAY jogador
@ 01+recno(),75 SAY pontos

set color to *+w/n
@ 01+recno(),64 say chr(16)
@ 01+recno(),78 say chr(17)
if certo<>"screen"
   INKEY(.2)
endif
return
*********************
proc records
parameter tipo

if tipo="sim"
   sele 3
   go top
   a=1
   do while a<7
      sele 4
      go bottom
      max=pontuacao
      sele 3
      mPONTOS=pontos
      joga=jogador
      if mPONTOS>max
         sele 4
         replace pontuacao with mPONTOS,jogador with joga
         sort on pontuacao /d to t.vmm
         use
         erase genio.(3)
         rename t.vmm to genio.(3)
         use genio.(3)
      endif
      a=a+1
      sele 3
      skip
    enddo
    sele 3
    go top
endif

sele 4
SET COLOR TO W/N
@ 09,63 clear to 24,79
@ 09,63 TO 24,79
SET COLOR TO +w/b
@ 10,64 SAY "    RECORDS    "

SET COLOR TO BG/N
go top
a=11
do while .not. eof()
   @ a,65 SAY jogador
   @ a,75 SAY pontuacao
   a=a+1
   skip
enddo

go top
SET COLOR TO +W/N
@ 11,65 SAY jogador
@ 11,75 SAY pontuacao
return
*********************
proc ajuda
parameter string
set color to &erro
@ 23,02 clear to 23,60
a=(63-len(string))/2
@ 23,a say string
return
*********************
proc novo
set key 19 to
set key 04 to

sele 3
set color to &menu_quad
@ 14,20 to 18,42
do sombras with 14,20,18,42,chr_fundo
set color to &menu_texto
@ 15,21 clear to 17,41
@ 15,22 say "Jogadores"
@ 16,22 say "Limitar Tempo "+chr(16)+"  "+ltrim(str(temp_max))
@ 17,22 say "Pontua‡„o    "+chr(16)+"  "+right(str(pont_max),3)
do ajuda with "Digite o nome do Jogador. "+chr(17)+"ÄÙ para terminar."
tot=menu_texto+",+"+inserir+",n,n,"+inserir
set color to &tot

r=recno()
go top
n=0
do while n<6
   mJOGADOR=space(9)
   n=n+1
   @ 15,32 get mJOGADOR picture "!AAAAAAAA"
   set conf on
   set cursor on
   read
   set cursor off
   set conf off
   if mJOGADOR<>space(9) .and. recno()=1
      set color to *&menu_texto
      @ 15,32 say " Aguarde!"
      do records with "sim"
      sele 3
      replace all jogador with space(9),pontos with 0
      go top
   endif
   if mJOGADOR=space(9) .and. recno()=1
      go r
      return
   endif
   if mJOGADOR<>space(9)
      replace jogador with mJOGADOR
      do pontos with "screen"
      skip
   else
      exit
   endif
enddo
set color to &menu_texto
@ 15,32 say space(9)

SET COLOR TO W/N
@ 00,63 TO 08,79
set color to +w/n
@ 02,64 clear to 07,78
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
go top
rec=recno()
go rec

do ajuda with "Definir tempo de resposta. PgUp/PgDn: alterar. "+chr(17)+"ÄÙ: sair."

set color to &menu_opc
@ 16,38 say "    "
sele 5
time=temp_max
do while .t.
   key=inkey()
   if key=18 &&PgUp
      time=time+5
      if time>=65
         time=5
      endif
   endif
   if key=3
      time=time-5
      if time<=0
         time=60
      endif
   endif
   if key=13
      exit
   endif
   if key=27
      return
   endif
   @ 16,38 say "    "
   @ 16,39 say right(str(time),2)
enddo
replace tempo with time
temp_max=tempo

do ajuda with "Definir a Pontua‡„o a obter. PgUp/PgDn: alterar. "+chr(17)+"ÄÙ: sair."

set color to &menu_opc
@ 17,37 say "     "
pont=pont_max
do while .t.
   key=inkey()
   if key=18 &&PgUp
      pont=pont+5
      if pont>=995
         pont=5
      endif
   endif
   if key=3
      pont=pont-5
      if pont<=0
         pont=995
      endif
   endif
   if key=13
      exit
   endif
   if key=27
      return
   endif
   @ 17,37 say "     "
   @ 17,38 say right(str(pont),3)
enddo
replace pontuacao with pont
pont_max=pontuacao
do livros

set key 19 to esquerda
set key 04 to direita
return

**********
proc help
save screen to mem
cor=setcolor()
set color to w/n
a=0
do while a<15
   scroll(09,02,23,60,-1)
   inkey(.09)
   a=a+1
enddo
set color to +&texto
@ 08,06 to 08,56
do escreve with 08,07," Ajuda"

set color to &menu_texto
for x=10 to 21
    @ x,06 say space(5)
    @ 31-x,11 say space(5)
    @ x,16 say space(5)
    @ 31-x,21 say space(5)
    @ x,26 say space(5)
    @ 31-x,31 say space(5)
    @ x,36 say space(5)
    @ 31-x,41 say space(5)
    @ x,46 say space(5)
    @ 31-x,51 say space(6)
    inkey(.03)
next

@ 10,07 say "   Este jogo permite-lhe avaliar o n¡vel dos seus"
@ 11,07 say "conhecimentos em diversos assuntos (Temas)."
@ 13,07 say "   Para iniciar o jogo, indique  os nomes dos jo-"
@ 14,07 say "gadores em competi‡„o,  assim como o tempo em que"
@ 15,07 say "dever  ser dada a resposta e a  pontua‡„o a obter"
@ 16,07 say "para vencer a partida. O jogador continua a jogar"
@ 17,07 say "at‚ errar  uma  quest„o.  Quando isto  acontecer,"
@ 18,07 say "passa o jogo para o jogador seguinte."
@ 20,07 say "   Pode ainda, inserir mais Temas e Perguntas que"
@ 21,07 say "aumentar„o o interesse deste jogo."
do sombras with 10,06,21,56,"±"
set color to +&quad_sele
inkey(1)
do escreve with 24,45," Prima uma tecla"
inkey(120)
restore screen from mem
set color to &cor
return
******************
proc temas

save screen to mem
sele 2
go top
set color to w/n
@ 09,63 clear to 24,79
set color to &fundo
@ 23,02 say replicate(chr_fundo,11)
set color to &quad_sele
do escreve with 13,65," Estatistica"
do escreve with 15,69," da"
do escreve with 17,64," Base de Dados"

set color to &quadrad
@ 11,07 to 21,55
do sombras with 11,07,21,55,chr_fundo
set color to &texto
@ 12,08 clear to 20,54
@ 12,17 say "Tema                N§ de Perguntas"
@ 13,00 say ""
contador=0
do while .not. eof()
   do while .not. eof() .and. row()<20
      sele 2
      @ row()+1,17 say nome
      fich=ficheiro
      sele 1
      use &fich
      contador=contador+reccount()
      @ row(),34 say "-"
      tot=reccount()
      @ row(),42 say tot picture "####"
      sele 2
      skip
   enddo
   if .not. eof()
      set color to "+"+&quad_sele
      do escreve with 24,44," Prima uma tecla"
      inkey(120)
      set color to &quad_sele
      @ 24,44 say replicate('Í',17)
      set color to &texto
      @ 13,08 clear to 20,54
      @ 13,00 say ""
   else
      exit
   endif
enddo

if row()>18
   set color to "+"+&quad_sele
   do escreve with 24,44," Prima uma tecla"
   inkey(120)
   set color to &quad_sele
   @ 24,44 say replicate('Í',17)
   set color to &texto
   @ 13,08 clear to 20,54
   @ 13,00 say ""
endif

do escreve with row()+2,17,"Este Jogo tem "+ltrim(str(contador))+" perguntas."
set color to "+"+&quad_sele
do escreve with 24,44," Prima uma tecla"
inkey(120)
set color to &quad_sele
@ 24,44 say replicate('Í',17)

return

