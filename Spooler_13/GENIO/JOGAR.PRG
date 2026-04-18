**  JOGAR.PRG
*
sele 1

SET COLOR TO &texto
@ 08,14 SAY " (c) 1990, "+autor
SET COLOR TO W/N
@ 09,63 TO 24,79
SET COLOR TO &quad_sele
@ 00,00 TO 24,62 DOUBLE
SET COLOR TO &texto
@ 12,08 CLEAR TO 19,54
pergunta1=trim(perg1)
pergunta2=trim(perg2)
pergunta3=trim(perg3)
opcao1=trim(op1)
opc1  =op1
opcao2=trim(op2)
opc2  =op2
opcao3=trim(op3)
opc3  =op3
do escreve with 12,11,pergunta1
do escreve with 13,09,pergunta2
do escreve with 14,09,pergunta3
inkey(.2)
do escreve with 16,15,"a) "+opcao1
do escreve with 17,15,"b) "+opcao2
do escreve with 18,15,"c) "+opcao3
save screen to memoria

tot=at("/",erro)
COR1=left(erro,tot-1)
COR2=right(erro,20-tot)
erro_2=cor2+"/"+cor1

start=seconds()
elapsed=0
SET COLOR TO &erro_2
@ 08,14 SAY space(33)
@ 08,38 say "Max.: "+ltrim(str(temp_max))

* menu initialization
optkeys = "ABC"
numopts = 3
oldchoice = 0
newchoice = 1
key =0
* inkey aliases
up = 5
down = 24
right = 4
left = 19
car_ret = 13
certo="nao"

do while .t.
   if oldchoice<>newchoice
      do case
         case newchoice =1
           SET COLOR TO &barra
           @ 16,13 SAY "  a) "+opc1+"  "
           if som="S"
              tone(100,1)
           endif
         case newchoice =2
           SET COLOR TO &barra
           @ 17,13 SAY "  b) "+opc2+"  "
           if som="S"
              tone(120,1)
           endif
         case newchoice =3
           SET COLOR TO &barra
           @ 18,13 SAY "  c) "+opc3+"  "
           if som="S"
              tone(140,1)
           endif
     endcase
     oldchoice =newchoice
   endif
   if key=car_ret .or. at(upper(chr(key)), optkeys) >0
      set color to W/N
      exit
   endif

   key =inkey()
   do while key =0
      key =inkey()
      elapsed=seconds()-start
      SET COLOR TO &erro_2
      @ 08,14 SAY "     Tempo: "+ltrim(str(elapsed))
      if elapsed>temp_max
         certo="nao"
         @ 08,14 say " Acabou o tempo. Lamento muito..."
         if som="S"
            ?? chr(7)
         endif
         inkey(3)
         exit
      endif
   enddo

   do case
      case key =down .or. key =right
        newchoice = iif(oldchoice=numopts,1,oldchoice+1)
      case key = up .or. key = left
        newchoice = iif(oldchoice=1,numopts,oldchoice-1)
      case at(upper(chr(key)), optkeys) > 0
        newchoice = at(upper(chr(key)), optkeys)
   endcase

   if oldchoice<>newchoice
      SET COLOR TO &texto
      do case
         case oldchoice =1
           @ 16,13 SAY "  a) "+opc1+"  "
         case oldchoice =2
           @ 17,13 SAY "  b) "+opc2+"  "
         case oldchoice =3
           @ 18,13 SAY "  c) "+opc3+"  "
      endcase
   endif
   if elapsed>temp_max
      exit
   endif
enddo
restore screen from memoria
SET COLOR TO &erro_2
@ 08,14 say space(33)
@ 08,14 SAY "     Tempo: "+ltrim(str(elapsed))
resp=resposta
set color to &erro
do case
   case newchoice =1 .and. resposta<>"A" .and. elapsed<temp_max
     do escreve with 08,14,"  ERROU!    A resposta era a "+resp+") "
     certo="nao"
   case newchoice =2 .and. resposta<>"B" .and. elapsed<temp_max
     do escreve with 08,14,"  ERROU!    A resposta era a "+resp+") "
     certo="nao"
   case newchoice =3 .and. resposta<>"C" .and. elapsed<temp_max
     do escreve with 08,14,"  ERROU!    A resposta era a "+resp+") "
     certo="nao"
   otherwise
     if elapsed<temp_max
        certo="sim"
        set color to &acertou
        save screen to mem
        a=0
        do while a<10
           inkey(.1)
           scroll(01,01,07,61,-1)
           a=a+1
        enddo
        A="°°°°°°°»°°°°°°°»°°°°°°°»°°°°°°°»°°°°°°°»°°°°°°°»°°»  °°»"
        B="°°ÉÍÍ°°º°°ÉÍÍÍÍ¼°°ÉÍÍÍÍ¼°°ÉÍÍ°°ºÈÍ°°°ÉÍ¼°°ÉÍÍ°°º°°º  °°º"
        C="°°°°°°°º°°º     °°°°»   °°°°°°°º  °°°º  °°º  °°º°°º  °°º"
        D="°°ÉÍÍ°°º°°º     °°ÉÍ¼   °°ÉÍ°°É¼  °°°º  °°º  °°º°°º  °°º"
        E="°°º  °°º°°°°°°°»°°°°°°°»°°º °°º   °°°º  °°°°°°°º°°°°°°°º"
        F="ÈÍ¼  ÈÍ¼ÈÍÍÍÍÍÍ¼ÈÍÍÍÍÍÍ¼ÈÍ¼ ÈÍ¼   ÈÍÍ¼  ÈÍÍÍÍÍÍ¼ÈÍÍÍÍÍÍ¼"
        num1=0
        DO WHILE num1<len(a)+2
           @ 01,03 say left(a,num1)
           @ 02,03 say right(b,num1)
           @ 03,03 say left(c,num1)
           @ 04,03 say right(d,num1)
           @ 05,03 say left(e,num1)
           @ 06,03 say right(f,num1)
           num1=num1+2
        enddo
        a=0
        do while a<10
           scroll(01,01,07,61,-1)
           inkey(.1)
           scroll(01,01,07,61,1)
           inkey(.1)
           a=a+1
        enddo
        store space(56) to a
        num1=0
        DO WHILE num1<len(a)+2
           @ 01,03 say right(a,num1)
           @ 03,03 say right(a,num1)
           @ 05,03 say right(a,num1)
           @ 02,59-num1 say left(a,num1)
           @ 04,59-num1 say left(a,num1)
           @ 06,59-num1 say left(a,num1)
           num1=num1+2
        enddo
        restore screen from mem
     endif
endcase

if elapsed>temp_max
   SET COLOR TO +&erro
   do escreve with 08,14,"    A resposta era a alinea "+resp+")  "
endif

set color to "*"+&texto
do case
   case resposta="A"
     @ 16,13 SAY "  a) "+opc1
   case resposta="B"
     @ 17,13 SAY "  b) "+opc2
   case resposta="C"
     @ 18,13 SAY "  c) "+opc3
endcase

do pontos with certo
if jogador=space(9)
   return
endif



