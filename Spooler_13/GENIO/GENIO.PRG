***   GENIO.PRG
***
***   (C) 1990, VITOR MANUEL MONTEIRO
***
***   Passatempo  ® O Melhor Jogo ¯   -  Revista Spooler
***
***



setcancel(.f.)
public logotipo
set color to bg/n
clear
set cursor off
cor1="b/b"
cor2="+w/n"
a1 = space(16)+"ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿"+space(16)
a2 = space(16)+"ÜÜÚÄÄÄÄÙ  ÜÜÚÄÄÄÄÙ  ÜÜÚÄÄÜÜ³  ÀÄÜÜÜÚÄÙ  ÜÜÚÄÄÜÜ³"+space(16)
a3 = space(16)+"ÜÜ³ ÜÜÜ¿  ÜÜÜÜ¿     ÜÜ³  ÜÜ³    ÜÜÜ³    ÜÜ³  ÜÜ³"+space(16)
a4 = space(16)+"ÜÜ³ ÀÜÜ³  ÜÜÚÄÙ     ÜÜ³  ÜÜ³    ÜÜÜ³    ÜÜ³  ÜÜ³"+space(16)
a5 = space(16)+"ÜÜÜÜÜÜÜ³  ÜÜÜÜÜÜÜ¿  ÜÜ³  ÜÜ³  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ³"+space(16)
a6 = space(16)+"ÀÄÄÄÄÄÄÙ  ÀÄÄÄÄÄÄÙ  ÀÄÙ  ÀÄÙ  ÀÄÄÄÄÄÄÙ  ÀÄÄÄÄÄÄÙ"+space(16)

a=0
do while a<len(a1)+2
   set color to &cor1
   @ 01,00 say left(a1,a)
   set color to &cor2
   @ 02,00 say right(a2,a)
   set color to &cor1
   @ 03,00 say left(a3,a)
   set color to &cor2
   @ 04,00 say right(a4,a)
   set color to &cor1
   @ 05,00 say left(a5,a)
   set color to &cor2
   @ 06,00 say right(a6,a)
   a=a+2
enddo
save screen to logotipo

set color to gr/n
st1="Ú"+replicate('Ä',56)+"¿"
st2="À"+replicate('Ä',56)+"Ù"
a=0
c=1
@ 12,68 say "³"
do while a<len(st1)+2
   @ 12,11 say right(st1,a)
   if c<7
      @ 12+c,68 say "³"
      @ 19-c,11 say "³"
      c=c+.125
   endif
   @ 18,len(st2)+11-a say left(st2,a)
   a=a+2
enddo
@ 12,11 to 18,68
set color to bg/n
@ 14,23 SAY "(c) 1990, Vitor Manuel Monteiro"
@ 16,20 SAY "Passatempo: 'O Melhor Jogo' - Spooler"

********************************************
arquivo=""
b=0
if .not. file ('GENIO.(1)')
    arquivo=arquivo+" GENIO.(1) Û"
    b=1
endif
if .not. file ('GENIO.(2)')
    arquivo=arquivo+" GENIO.(2) Û"
    b=1
endif
if .not. file ('GENIO.(3)')
    arquivo=arquivo+" GENIO.(3) Û"
    b=1
endif
if .not. file ('GENIO.(4)')
    arquivo=arquivo+" GENIO.(4) Û"
    b=1
endif
if .not. file ('GENIO.(5)')
    arquivo=arquivo+" GENIO.(5) Û"
    b=1
endif

if file('GENIO.(1)')
   use genio.(1)
   do while .not. eof()
      fich=ficheiro
      if .not. file('&fich')
         arquivo=arquivo+" GENIO.?? "
         b=1
         exit
      endif
      skip
   enddo
endif

if b=1
   a=0
   do while a<15
      inkey(.02)
      scroll(12,11,24,68,-1)
      a=a+1
   enddo
   a=1
   do while a<11
      scroll(00,00,17,79,-1)
      inkey(.1)
      a=a+1
   enddo
   c=(79-len(arquivo))/2+1
   set color to n/w
   @ 18,02 clear to 21,77
   @ 18,13 say "N„o consigo encontrar os seguintes Ficheiros do Jogo:"
   set color to w/b
   @ 20,c say arquivo
   @ 23,00 say ""
   ?? chr(7)
   set cursor on
   quit
endif

sele 1    && perguntas
use genio.01
go top
sele 2    && temas
use genio.(1)   &&livros
go top
sele 3    && nome dos jogadores
use genio.(2)   &&jogador
go top
sele 4    && top records
use genio.(3)  &&records
go top
sele 5    && control
use genio.(4) alias control
go top
if beep="Sim"
   som="S"
else
   som="N"
endif
temp_max=tempo
pont_max=pontuacao
chr_fundo=fundo
sele 6
use genio.(5) alias cores
go top
do while .not. eof()
   c=ffff
   &c=bbbb
   skip
enddo
sele 2

*************************************************
inkey(1)
a=0
do while a<15
   inkey(.02)
   scroll(12,11,24,68,-1)
   a=a+1
enddo

a=0
do while a<len(a1)+2
   set color to &cor2
   @ 01,00 say left(a1,a)
   @ 03,00 say left(a3,a)
   @ 05,00 say left(a5,a)
   a=a+2
enddo

a=0
do while a<6
   scroll(0,00,15,79,-1)
   inkey(.1)
   a=a+1
enddo
a=0
do while a<3
   inkey(.1)
   scroll(0,00,17,79,-1)
   inkey(.1)
   scroll(0,00,17,79,1)
   a=a+1
enddo
a=0
do while a<20
   inkey(.1)
   scroll(00,06,23,79,-1)
   a=a+1
enddo

do menu



