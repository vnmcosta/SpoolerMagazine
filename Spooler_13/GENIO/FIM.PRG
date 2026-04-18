***
**
*

SET COLOR TO +W/N
@ 08,02 CLEAR TO 23,60
@ 08,02 SAY REPLICATE('Í',59)
SET COLOR TO &fundo
a=9
do while a<24
   @ a,02 SAY replicate(chr_fundo,59)
   a=a+1
enddo

set color to w/n
@ 09,63 clear to 24,79

set color to &quadrad
@ 11,07 to 21,55
do sombras with 11,07,21,55,chr_fundo

set color to &texto
@ 12,08 clear to 20,54
@ 13,17 say "Enviar sugest”es para:"
set color to "+"+&texto
do escreve with 15,20,autor
do escreve with 16,20,"Urb. Portela, lote 44 7§C"
do escreve with 17,20,"2685 Sacav‚m"
set color to &texto
@ 19,38 say "Obrigado"

set color to "+"+&quad_sele
inkey(10)
x=lastkey()
if x=27
   return
endif

a=0
set color to w/n
do while a<15
   scroll(09,02,23,60,-1)
   scroll(01,64,07,78,1)
   a=a+1
   inkey(.1)
enddo
inkey(.2)

store space(56) to a
num1=0
DO WHILE num1<len(a)+1
   @ 01,03 say right(a,num1)
   @ 03,03 say right(a,num1)
   @ 05,03 say right(a,num1)
   @ 02,59-num1 say left(a,num1)
   @ 04,59-num1 say left(a,num1)
   @ 06,59-num1 say left(a,num1)
   num1=num1+1
enddo

set color to w/n

a=0
do while a<24
   scroll(00,00,24,79,-1)
   a=a+1
   inkey(.01)
enddo

set color to w/n
clear
restore screen from logotipo

a=0
do while a<10
   scroll(01,15,24,24,-1)
   scroll(01,35,24,44,-1)
   scroll(01,55,24,64,-1)
   inkey(.1)
   a=a+1
enddo
a=0
do while a<10
   scroll(01,25,24,34,-1)
   scroll(01,45,24,54,-1)
   inkey(.1)
   a=a+1
enddo
a=0
set color to +w/n
@ 11,15 say " ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ¿ "
@ 12,15 say " ÜÜÚÄÄÄÄÙ  ÜÜÚÄÄÄÄÙ  ÜÜÚÄÄÜÜ³  ÀÄÜÜÜÚÄÙ  ÜÜÚÄÄÜÜ³ "
@ 13,15 say " ÜÜ³ ÜÜÜ¿  ÜÜÜÜ¿     ÜÜ³  ÜÜ³    ÜÜÜ³    ÜÜ³  ÜÜ³ "
@ 14,15 say " ÜÜ³ ÀÜÜ³  ÜÜÚÄÙ     ÜÜ³  ÜÜ³    ÜÜÜ³    ÜÜ³  ÜÜ³ "
@ 15,15 say " ÜÜÜÜÜÜÜ³  ÜÜÜÜÜÜÜ¿  ÜÜ³  ÜÜ³  ÜÜÜÜÜÜÜ¿  ÜÜÜÜÜÜÜ³ "
@ 16,15 say " ÀÄÄÄÄÄÄÙ  ÀÄÄÄÄÄÄÙ  ÀÄÙ  ÀÄÙ  ÀÄÄÄÄÄÄÙ  ÀÄÄÄÄÄÄÙ "


a=0
do while a<10
   scroll(00,00,06,79,1)
   a=a+1
enddo

a=0
do while a<10
   scroll(01,25,24,34,1)
   scroll(01,45,24,54,1)
   inkey(.1)
   a=a+1
enddo
a=0
do while a<10
   scroll(01,15,24,24,1)
   scroll(01,35,24,44,1)
   scroll(01,55,24,64,1)
   inkey(.1)
   a=a+1
enddo

for x=1 to 50
    cor=ltrim(str(x))
    set color to &cor/1
    @ 08,00 say space(24)+"(c) 1990, "+autor+space(24)
    inkey(.01)
next

@ 10,00 say ""
set color to r/n
text
   ÜÜÜÜÜ ÜÜ                           ÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜÜ
ÜÛÛÛÛßßÛÛÛÛ                                  ßßßßßßÛÛÛÛÛÝ
ÛÛÛÜ    ßÛÛ ÜÜÜÜÜÜ ÜÜÜÜÜ       ÜÜÜÜ         ÜÜÜÜ     ÛÛÛÝ     ÜÜÜÜ    ÜÜÜÜÜ ÜÜÜ
ÛÛÛÛÛÛÛÜÜÜ  ßßÛÛÛÛÛßßÛÛÛÛ   ÜÛÛÛßßÛÛÛÜ   ÜÛÛÛßßÛÛÛÜ  ÛÛÛÝ  ÜÛÛÛßßÛÛÛÜ ßßÛÛÛÛßÛÛ
  ßßÛÛÛÛÛÛÛÜ  ÛÛÛÛ    ÛÛÛÛ ÛÛÛÛ    ÛÛÛÛ ÛÛÛÛ    ÛÛÛÛ ÛÛÛÝ ÛÛÛÛ    ÛÛÛÛ  ÛÛÛ   ß
       ßÛÛÛÛ  ÛÛÛÛ    ÛÛÛÛ ÛÛÛÛ    ÛÛÛÛ ÛÛÛÛ    ÛÛÛÛ ÛÛÛÝ ÛÛÛÛßßßßßßßß  ÛÛÛ
ÛÛÜ     ÛÛÛÛ  ÛÛÛÛÛ  ÛÛÛÛ  ßÛÛÛÜ  ÜÛÛÛß ßÛÛÛÜ  ÜÛÛÛß ÛÛÛÝ ßÛÛÛÜ  ÜÛÛÛÝ  ÛÛÛ
ÛÛÛÛÜÜÜÛÛÛß   ÛÛÛÛßÛÛÛßß     ßßÛÛÛÛßß     ßßÛÛÛÛßß  ÛÛÛÛÛÝ  ßßÛÛÛÛÛß  ÞÛÛÛÛÛÝ
ÛÛ ßßßßß      ÛÛÛÛ
Û           ÛÛÛÛÛÛÛÛ
Ý

endtext
set color to g/n
do escreve with 20,23,"Passatempo:  ® O Melhor Jogo ¯"

set color to &texto
@ 23,00 clear to 23,79
@ 22,00 say ""
close all
erase index.ind
set cursor on
quit



