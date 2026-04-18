*** cores.prg   :  Selecao de Cores
***

sele 6
go top
num=reccount()+3
declare tipo[num]

a=1
do while .not. eof()
   maaaa=aaaa
   tipo[a]=space(5)+mAAAA
   skip
   a=a+1
enddo
tipo[a]=space(5)+"Caracter que desenha o Fundo ("+chr_fundo+")"
tipo[a+1]=space(5)+"Repor as Cores Originais"
tipo[a+2]=" ÄÍ"+chr(16)+" Terminar a Selec‡„o de Cores"

set color to w/n
@ 09,63 clear to 24,79
SET COLOR TO +W/N
@ 08,02 SAY REPLICATE('Í',59)
set color to &fundo
A=9
DO WHILE A<24
   @ A,02 SAY REPLICATE(chr_fundo,59)
   A=A+1
ENDDO
set color to &quad_sele
do escreve with 11,64,"Ä Teclas ÄÄÄÄÄÄ"
@ 13,64 clear to 20,79
@ 13,64 say chr(24)+chr(25)+chr(27)+chr(26)+"¿"
@ 14,64 say "PgDn³selecionar"
@ 15,64 say "Pgup³   uma"
@ 16,64 say "Home³  op‡„o"
@ 17,64 say "End Ù"
@ 19,64 say chr(17)+"ÄÙ : confirmar"
@ 20,64 say "Esc : sair"
@ 22,64 say "ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ "

SET COLOR TO &texto
@ 07,17 CLEAR TO 09,46
@ 08,23 SAY "Selec‡„o de Cores"
DO SOMBRAS WITH 07,17,09,46,chr_fundo
@ 08,47 SAY "ÍÍ"
save screen to memoria

selecao=1
do while .t.
   set color to &sec_quad
   @ 12,04 to 21,56
   do sombras with 12,04,21,56,chr_fundo
   tot=sec_texto+","+sec_opc
   set color to &tot
   @ 13,05 clear to 20,55
   inkey(.01)
   set key 19 to teste1
   set key 04 to teste2
   selecao=ACHOICE(13,05,20,55,tipo,"","",selecao)
   save screen to mem
   set key 19 to
   set key 04 to
   inkey(.01)
   if selecao=0
      return
   endif
   num=reccount()
   if selecao=num+1
      restore screen from memoria
      caracter=1
      SET COLOR TO &quadrad
      @ 12,07 TO 21,34
      do sombras with 12,07,21,34,chr_fundo
      SET COLOR TO &texto
      @ 13,08 CLEAR TO 20,33
      SET COLOR TO +W/B,B/W
      declare caract[25]
      caract[01]= " "+chr(7)+" "
      caract[02]= " "+chr(9)+" "
      caract[03]= " "+chr(15)+" "
      caract[04]= " ° "
      caract[05]= " ± "
      caract[06]= " ² "
      caract[07]= " ³ "
      caract[08]= " º "
      caract[09]= " Å "
      caract[10]= " Î "
      caract[11]= " Û "
      caract[12]= " ÷ "
      caract[13]= " ù "
      caract[14]= " þ "
      caract[15]= " Ä "
      caract[16]= " Í "
      caract[17]= " ð "
      caract[18]= " ñ "
      caract[19]= " "+chr(5)+" "
      caract[20]= " "+chr(4)+" "
      caract[21]= " "+chr(3)+" "
      caract[22]= " "+chr(18)+" "
      caract[23]= " "+chr(11)+" "
      caract[24]= " "+chr(12)+" "
      caract[25]= "Outro Caracter :"
      @ 14,09 PROMPT caract[01]
      @ 14,12 PROMPT caract[02]
      @ 14,15 PROMPT caract[03]
      @ 14,18 PROMPT caract[04]
      @ 14,21 PROMPT caract[05]
      @ 14,24 PROMPT caract[06]
      @ 14,27 PROMPT caract[07]
      @ 14,30 PROMPT caract[08]
      @ 16,09 PROMPT caract[09]
      @ 16,12 PROMPT caract[10]
      @ 16,15 PROMPT caract[11]
      @ 16,18 PROMPT caract[12]
      @ 16,21 PROMPT caract[13]
      @ 16,24 PROMPT caract[14]
      @ 16,27 PROMPT caract[15]
      @ 16,30 PROMPT caract[16]
      @ 18,09 PROMPT caract[17]
      @ 18,12 PROMPT caract[18]
      @ 18,15 PROMPT caract[19]
      @ 18,18 PROMPT caract[20]
      @ 18,21 PROMPT caract[21]
      @ 18,24 PROMPT caract[22]
      @ 18,27 PROMPT caract[23]
      @ 18,30 PROMPT caract[24]
      @ 20,10 PROMPT caract[25]
      menu to caracter
      if caracter=0
         loop
      endif
      if caracter=25
         a=" "
         set color to +w/b,g/n
         @ 20,29 get a
         set conf on
         set cursor on
         read
         set cursor off
         set conf off
         x=lastkey()
         if x=27
            loop
         endif
         caract[25]=a
      endif
      select 5
      car1=left(caract[caracter],2)
      car2=right(car1,1)
      replace fundo with car2
      chr_fundo=car2
      tipo[selecao]=space(5)+"Caracter que desenha o Fundo ("+chr_fundo+")"
      select 6
      loop
   endif
   if selecao=num+2
      save screen to mem
      tot=sec_texto+","+sec_opc
      set color to &tot
      @ 13,05 clear to 20,55
      do escreve with 14,17,"Para que tipo de monitor?"
      op=1
      @ 16,20 prompt "  Policrom tico  "
      @ 17,20 prompt "  Monocrom tico  "
      @ 19,20 prompt " N„o repor cores "
      menu to op
      if op=0 .or. op=3
         loop
      endif
      select cores
      declare trans[16]
      if op=1
         trans[01]=" BG/N "
         trans[02]=" N/W  "
         trans[03]=" N/W  "
         trans[04]=" W/B  "
         trans[05]=" RB/N "
         trans[06]="+W/N  "
         trans[07]=" BG/B "
         trans[08]=" BG/N "
         trans[09]=" W/B  "
         trans[10]=" R/W  "
         trans[11]=" BG/N "
         trans[12]=" BG/N "
         trans[13]=" W/R  "
         trans[14]="+W/N  "
         trans[15]=" W/N  "
         trans[16]=" BG/N "
      endif
      if op=2
         trans[01]=" GR/N "
         trans[02]=" N/B  "
         trans[03]="+B/B  "
         trans[04]=" G/N  "
         trans[05]=" GR/N "
         trans[06]=" G/N  "
         trans[07]=" N/W  "
         trans[08]=" BG/N "
         trans[09]="+RB/RB"
         trans[10]=" G/N  "
         trans[11]="+BG/N "
         trans[12]="+G/B  "
         trans[13]="+RB/B "
         trans[14]="+W/N  "
         trans[15]=" W/N  "
         trans[16]=" BG/N "
      endif
      select control
      replace fundo with "Å"
      chr_fundo="Å"
      select cores
      go top
      a=1
      do while .not. eof()
         replace bbbb with trans[a],dddd with "  "
         c=ffff
         &c=bbbb
         skip
         a=a+1
      enddo
      return
   endif
   if selecao=num+3
      return
   endif
   go selecao
   restore screen from memoria
   set color to &erro
   @ 24,05 say space(52)
   @ 24,06 say tipo[selecao]
   set color to w/n
   @ 09,63 clear to 24,79
   do submenu1
   restore screen from mem
enddo
*********************************
*
*          SUBMENU1
*
*********************************

proc submenu1

SET COLOR TO w/b
@ 12,45 TO 21,51
@ 13,46 CLEAR TO 20,50

SET COLOR TO +W/N
@ 20,47 SAY "   "
SET COLOR TO +N/B
@ 19,47 SAY "   "
SET COLOR TO +N/G
@ 18,47 SAY "   "
SET COLOR TO +N/BG
@ 17,47 SAY "   "
SET COLOR TO +N/R
@ 16,47 SAY "   "
SET COLOR TO +N/BR
@ 15,47 SAY "   "
SET COLOR TO +N/GR
@ 14,47 SAY "   "
SET COLOR TO +N/W
@ 13,47 SAY "   "
SET COLOR TO &texto
@ 12,07 TO 21,34

SET COLOR TO W/N
@ 13,08 CLEAR TO 20,33
DO SOMBRAS WITH 12,07,21,34,chr_fundo
DO SOMBRAS WITH 12,45,21,51,chr_fundo
SET COLOR TO &texto
@ 13,08 SAY "   AJUDA E TESTE DE COR   "

PISCA=left(dddd,1)
CLARO=right(dddd,1)
CORES=bbbb
tot=at("/",bbbb)
COR1=left(bbbb,tot-1)
COR2=right(bbbb,20-tot)

opt_keys = " "
nu_opt = 8
oldch = 0
newch = cccc
key =0

op_keys = " "
n_opt = 8
old_ch = 0
new_ch = eeee

key =0
up = 5
down = 24
right = 4
left = 19
car_ret = 13

set color to w/b
@ new_ch+12,50 say chr(17)

set color to &CORES
@ 14,08 CLEAR TO 20,33
@ 14,09 SAY ""+chr(24)+""+chr(25)+"    - Mudar de Cor"
@ 15,09 SAY "B     - Brilhante"
@ 16,09 SAY "I     - Intermitente"
@ 17,09 SAY ""+chr(27)+""+chr(26)+"    - Texto/Fundo"
@ 19,09 SAY "ENTER - Confirmar Cor"
@ 20,09 SAY "Esc   - Sair sem Alterar"

  do while .t.
    if oldch<>newch
      do case
        case newch =1
          SET COLOR TO *+W/B
          @ 13,46 SAY ""+chr(16)+""
          cor1="w"
        case newch =2
          SET COLOR TO *+W/B
          @ 14,46 SAY ""+chr(16)+""
          cor1="gr"
        case newch =3
          SET COLOR TO *+W/B
          @ 15,46 SAY ""+chr(16)+""
          cor1="rb"
        case newch =4
          SET COLOR TO *+W/B
          @ 16,46 SAY ""+chr(16)+""
          cor1="r"
        case newch =5
          SET COLOR TO *+W/B
          @ 17,46 SAY ""+chr(16)+""
          cor1="bg"
        case newch =6
          SET COLOR TO *+W/B
          @ 18,46 SAY ""+chr(16)+""
          cor1="g"
        case newch =7
          SET COLOR TO *+W/B
          @ 19,46 SAY ""+chr(16)+""
          cor1="b"
        case newch =8
          SET COLOR TO *+W/B
          @ 20,46 SAY ""+chr(16)+""
          cor1="n"
      endcase

      oldch =newch
    endif

    cores=pisca+claro+cor1+"/"+cor2
    set color to &cores
    @ 14,08 CLEAR TO 20,33
    @ 14,09 SAY ""+chr(24)+""+chr(25)+"    - Mudar de Cor"
    @ 15,09 SAY "B     - Brilhante"
    @ 16,09 SAY "I     - Intermitente"
    @ 17,09 SAY ""+chr(27)+""+chr(26)+"    - Texto/Fundo"
    @ 19,09 SAY "ENTER - Confirmar Cor"
    @ 20,09 SAY "Esc   - Sair sem Alterar"
    save screen to sub1

    if key=car_ret
       exit
    endif

    key =inkey()
    do while key =0
      key =inkey()
      if key=98 .or. key=66
         if claro="+"
            claro=" "
         else
            claro="+"
         endif
      endif
      if key=73 .or. key=105
         if pisca="*"
            pisca=" "
         else
            pisca="*"
         endif
      endif
      if key=27
         return
      endif
    enddo

    do case
      case key =down
        newch = iif(oldch=nu_opt,1,oldch+1)
      case key = up
        newch = iif(oldch=1,nu_opt,oldch-1)
      case at(upper(chr(key)), opt_keys) > 0
        newch = at(upper(chr(key)), opt_keys)
      case key=right .or. key=left
        sair=0
        set color to w/b
        @ newch+12,46 say chr(16)
        do submenu2
        if sair=1
           exit
        endif
        if sair=2
           return
        endif
        set color to *+w/b
        @ newch+12,46 say chr(16)
    endcase

    if oldch<>newch
      do case
        case oldch =1
          SET COLOR TO W/B
          @ 13,46 SAY " "
        case oldch =2
          SET COLOR TO W/B
          @ 14,46 SAY " "
        case oldch =3
          SET COLOR TO W/B
          @ 15,46 SAY " "
        case oldch =4
          SET COLOR TO W/B
          @ 16,46 SAY " "
        case oldch =5
          SET COLOR TO W/B
          @ 17,46 SAY " "
        case oldch =6
          SET COLOR TO W/B
          @ 18,46 SAY " "
        case oldch =7
          SET COLOR TO W/B
          @ 19,46 SAY " "
        case oldch =8
          SET COLOR TO W/B
          @ 20,46 SAY " "
      endcase
    endif
  enddo
  colar=pisca+claro
  REPLACE BBBB WITH CORES,cccc with newch,eeee with new_ch,dddd with colar
  qwert=ffff
  &qwert=cores
  oldch =0
  key =0
  save screen to memoria2
return

*********************************
*
*          SUBMENU2
*
*********************************

proc submenu2
set color to *+w/b
@ new_ch+12,50 say chr(17)

do while .t.
  do while .t.
    if old_ch<>new_ch
      do case
        case new_ch =1
          SET COLOR TO *+W/B
          @ 13,50 SAY ""+chr(17)+""
          cor2="w"
        case new_ch =2
          SET COLOR TO *+W/B
          @ 14,50 SAY ""+chr(17)+""
          cor2="gr"
        case new_ch =3
          SET COLOR TO *+W/B
          @ 15,50 SAY ""+chr(17)+""
          cor2="rb"
        case new_ch =4
          SET COLOR TO *+W/B
          @ 16,50 SAY ""+chr(17)+""
          cor2="r"
        case new_ch =5
          SET COLOR TO *+W/B
          @ 17,50 SAY ""+chr(17)+""
          cor2="bg"
        case new_ch =6
          SET COLOR TO *+W/B
          @ 18,50 SAY ""+chr(17)+""
          cor2="g"
        case new_ch =7
          SET COLOR TO *+W/B
          @ 19,50 SAY ""+chr(17)+""
          cor2="b"
        case new_ch =8
          SET COLOR TO *+W/B
          @ 20,50 SAY ""+chr(17)+""
          cor2="n"
      endcase

      old_ch =new_ch
    endif
    cores=pisca+claro+cor1+"/"+cor2
    set color to &CORES
    @ 14,08 CLEAR TO 20,33
    @ 14,09 SAY ""+chr(24)+""+chr(25)+"    - Mudar de Cor"
    @ 15,09 SAY "B     - Brilhante"
    @ 16,09 SAY "I     - Intermitente"
    @ 17,09 SAY ""+chr(27)+""+chr(26)+"    - Texto/Fundo"
    @ 19,09 SAY "ENTER - Confirmar Cor"
    @ 20,09 SAY "Esc   - Sair sem Alterar"

    if key=car_ret
       sair =1
       return
    endif

    key =inkey()
    do while key =0
      key =inkey()
      if key=98 .or. key=66
         if claro="+"
            claro=" "
         else
            claro="+"
         endif
      endif
      if key=73 .or. key=105
         if pisca="*"
            pisca=" "
         else
            pisca="*"
         endif
      endif
      if key=27
         sair=2
         return
      endif
    enddo

    do case
      case key =down
        new_ch = iif(old_ch=n_opt,1,old_ch+1)
      case key = up
        new_ch = iif(old_ch=1,n_opt,old_ch-1)
      case at(upper(chr(key)), op_keys) > 0
        new_ch = at(upper(chr(key)), op_keys)
      case key=right .or. key=left
        set color to w/b
        @ new_ch+12,50 say chr(17)
        return
    endcase

    if old_ch<>new_ch
      do case
        case old_ch =1
          SET COLOR TO W/B
          @ 13,50 SAY " "
        case old_ch =2
          SET COLOR TO W/B
          @ 14,50 SAY " "
        case old_ch =3
          SET COLOR TO W/B
          @ 15,50 SAY " "
        case old_ch =4
          SET COLOR TO W/B
          @ 16,50 SAY " "
        case old_ch =5
          SET COLOR TO W/B
          @ 17,50 SAY " "
        case old_ch =6
          SET COLOR TO W/B
          @ 18,50 SAY " "
        case old_ch =7
          SET COLOR TO W/B
          @ 19,50 SAY " "
        case old_ch =8
          SET COLOR TO W/B
          @ 20,50 SAY " "
      endcase
    endif
  enddo
  old_ch =0
  key =0
enddo
return
**********************************************************************
proc teste1
keyboard chr(5)
return
proc teste2
keyboard chr(24)
return
