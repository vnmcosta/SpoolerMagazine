****  ecran
**

SET COLOR TO W/N
CLEAR
set color to &quad_sele
@ 00,00 TO 24,62 DOUBLE
SET COLOR TO &genio

@ 01,01 CLEAR TO 23,61

A = "ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿"
B = "ÜÜÚÄÄÄÄÙ  ÜÜÚÄÄÄÄÙ  ÜÜÚÄÄÜÜ³  ÀÄÜÜÜÚÄÙ  ÜÜÚÄÄÜÜ³"
C = "ÜÜ³ ÜÜÜ¿  ÜÜÜÜ¿     ÜÜ³  ÜÜ³    ÜÜÜ³    ÜÜ³  ÜÜ³"
D = "ÜÜ³ ÀÜÜ³  ÜÜÚÄÙ     ÜÜ³  ÜÜ³    ÜÜÜ³    ÜÜ³  ÜÜ³"
E = "ÜÜÜÜÜÜÜ³  ÜÜÜÜÜÜÜ¿  ÜÜ³  ÜÜ³  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ³"
F = "ÀÄÄÄÄÄÄÙ  ÀÄÄÄÄÄÄÙ  ÀÄÙ  ÀÄÙ  ÀÄÄÄÄÄÄÙ  ÀÄÄÄÄÄÄÙ"
num1=0
DO WHILE num1<len(a)+1.5
   @ 01,08 say right(a,num1)
   @ 03,08 say right(c,num1)
   @ 05,08 say right(e,num1)
   @ 02,56-num1 say left(b,num1)
   @ 04,56-num1 say left(d,num1)
   @ 06,56-num1 say left(f,num1)
   num1=num1+1.5
enddo

set wrap on

SET COLOR TO +W/N
@ 08,02 CLEAR TO 23,60
@ 08,02 SAY "ÍÍÍÍÍÍÍÍÍÍÍÍ"+space(33)+"ÍÍÍÍÍÍÍÍÍÍÍÍÍÍ"
SET COLOR TO &texto
@ 08,14 SAY " (c) 1990, "+autor
SET COLOR TO &fundo
a=9
do while a<24
   @ a,02 SAY replicate(chr_fundo,59)
   a=a+1
enddo
SET COLOR TO N/W
@ 23,02 SAY " F1: Ajuda "

SET COLOR TO w/n
@ 00,63 TO 08,79
SET COLOR TO +w/b
@ 01,64 SAY "   PONTUA€ŽO   "

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



