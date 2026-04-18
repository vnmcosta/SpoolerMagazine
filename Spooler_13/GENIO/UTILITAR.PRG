***  utilitar.prg
**

parameter n_sub_menu
set key 19 to
set key 04 to

if n_sub_menu=1     && inserir novas perguntas
   restore screen from scr_menu
   set color to &fundo
   @ 23,02 say replicate(chr_fundo,59)
   sele 2
   go top

   SET COLOR TO W/N
   @ 00,00 TO 24,62
   @ 00,63 clear to 24,79
   set color to &quad_sele
   @ 00,63 TO 24,79 DOUBLE
   @ 24,68 say " Esc: sair "
   SET COLOR TO +W/B
   @ 01,64 SAY "     TEMAS     "
   set color to &sec_texto
   @ 02,64 clear to 23,78
   num=reccount()+1
   a=1
   declare pad[num]
   do while a<num
      pad[a]=" "+nome
      @ a+1,65 say nome
      skip
      a=a+1
   enddo

   do sombras with 15,15,17,46,chr_fundo
   set color to &menu_texto
   @ 15,15 clear to 17,46
   do escreve with 16,16,"Selecione um Tema e prima "+chr(17)+"ÄÙ."

   tot=sec_texto+","+sec_opc
   SET COLOR TO &tot

   esc=ACHOICE(02,64,23,78,pad,"","",1)
   if esc=0
      return
      restore screen from scr_menu
   endif
   set color to "*+"+&sec_texto
   @ row(),64 say chr(16)
   go esc
   fich=ficheiro
   sele 1
   use &fich

   SET COLOR TO W/N
   @ 00,63 TO 24,79
   SET COLOR TO &quad_sele
   @ 00,00 TO 24,62 double

   mPERG1=space(43)
   mPERG2=space(45)
   mPERG3=space(45)
   store space(20) to mOP1,mOP2,mOP3
   mresposta=" "
   do sombras with 13,07,21,55,chr_fundo
   tot=menu_texto+",+"+inserir+",n,n,"+inserir
   set color to &tot
   @ 13,07 clear to 21,55
   set color to "+"+&menu_texto
   @ 19,38 say "Ctrl W: gravar"
   @ 20,38 say "Escape: sair"
   set color to &menu_texto
   @ 14,11 get mPERG1 picture "!XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
   @ 15,09 get mPERG2 picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
   @ 16,09 get mPERG3 picture "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
   @ 18,11 say "a) " get mOP1 picture "!XXXXXXXXXXXXXXXXXXX"
   @ 19,11 say "b) " get mOP2 picture "!XXXXXXXXXXXXXXXXXXX"
   @ 20,11 say "c) " get mOP3 picture "!XXXXXXXXXXXXXXXXXXX"
   set color to "*+"+&inserir
   @ 14,09 say  chr(16)+"  "

   set color to &tot
   set cursor on
   read
   set cursor off
   x=lastkey()
   if x=27
      restore screen from scr_menu
      return
   endif
   if mPERG1=space(43).and.mPERG2=space(45).and.mPERG3=space(45)
      restore screen from scr_menu
      return
   endif
   set color to &inserir
   @ 14,09 say " "
   set color to &menu_texto
   nivel=1
   do escreve with 19,38,"Qual a resposta?"
   @ 20,38 say "  (teclas: "+chr(24)+chr(25)+")  "
   tot=menu_texto+","+menu_opc
   set color to &tot
   @ 18,10 prompt " a)  "+mOP1+" "
   @ 19,10 prompt " b)  "+mOP2+" "
   @ 20,10 prompt " c)  "+mOP3+" "
   menu to nivel
   if nivel=0
      restore screen from scr_menu
      return
   endif
   set color to "*"+&menu_texto
   do case
      case nivel=1
        mRESPOSTA="A"
        @ 18,09 say chr(16)
        @ 18,36 say chr(17)
      case nivel=2
        mRESPOSTA="B"
        @ 19,09 say chr(16)
        @ 19,36 say chr(17)
      case nivel=3
        mRESPOSTA="C"
        @ 20,09 say chr(16)
        @ 20,36 say chr(17)
   endcase
   set color to &menu_texto
   @ 19,38 say "                "
   set color to &menu_opc
   do escreve with 20,37," Confirma (S/N)?"
   do while .t.
      key=inkey()
      if key=83 .or. key=115 .or. key=110 .or. key=78
         exit
      else
         if key<>0 .and. som="S"
            tone(100,1)
         endif
      endif
   enddo
   if key=83 .or. key=115
      sele 1
      append blank
      replace perg1 with mPERG1,perg2 with mPERG2,perg3 with mPERG3
      replace op1 with mOP1,op2 with mOP2,op3 with mOP3
      replace resposta with mRESPOSTA
   endif
   restore screen from scr_menu
endif

if n_sub_menu=2       && inserir novos temas
   restore screen from scr_menu
   set color to &fundo
   @ 23,02 say replicate(chr_fundo,59)
   do while .t.
      sele 2
      go top
      SET COLOR TO W/N
      @ 00,63 clear to 24,79
      @ 00,63 TO 24,79
      SET COLOR TO +W/B
      @ 01,64 SAY "     TEMAS     "
      a=1
      do while .not. eof() .and. a<23
         set color to w/n
         @ a+1,65 say nome
         skip
         a=a+1
      enddo

      mTEMA=space(13)
      do sombras with 15,15,20,44,chr_fundo
      tot=menu_texto+",+"+inserir+",n,n,"+inserir
      set color to &tot
      @ 15,15 clear to 20,44
      do escreve with 16,16,"Digite o nome do Novo Tema e"
      do escreve with 17,16,"prima "+chr(17)+"ÄÙ."
      @ 19,23 get mTEMA picture "!AAAAAAAAAAAA"
      set conf on
      set cursor on
      read
      set cursor off
      set conf off
      if mTEMA=space(13)
         restore screen from scr_menu
         return
      endif

      go top
      do while .not. eof()
         if mTEMA=nome
            do ajuda with "J  existe o tema "+trim(mTEMA)+"!... Digite outro."
            mTEMA=space(13)
            if som="S"
               ?? chr(7)
            endif
            exit
         endif
         skip
      enddo
      if mTEMA=space(13)
         loop
      endif

      set color to &fundo
      @ 23,02 say replicate(chr_fundo,59)
      set color to "+"+&menu_texto
      do escreve with 20,29,"Confirma (S/N)?"
      do while .t.
         key=inkey()
         if key=83 .or. key=115 .or. key=110 .or. key=78
            exit
         else
            if key<>0 .and. som="S"
               tone(100,1)
            endif
         endif
      enddo
      if key=83 .or. key=115
         set color to &menu_texto
         @ 15,15 clear to 20,44
         do escreve with 17,19,"Aguarde, por favor..."
         sele 5
         ext=extensao
         replace extensao with extensao+1
         sele 2
         fich="Genio."+ltrim(str(ext))
         append blank
         replace nome with mTEMA
         replace registos with 1
         replace ficheiro with fich
         sele 1
         copy structure fields perg1,perg2,perg3,op1,op2,op3,resposta to &fich
         sele 2
         sort on nome to t.vmm
         use
         erase genio.(1)
         rename t.vmm to genio.(1)
         use genio.(1)
         scroll(2,65,23,78,-1)
         set color to +w/n
         @ 02,65 say mTEMA+" "
         set color to &menu_texto
         do escreve with 17,18,"Deseja inserir perguntas"
         do escreve with 18,18,"neste novo Tema (S/N)?"
         do while .t.
            key=inkey()
            if key=83 .or. key=115 .or. key=110 .or. key=78 .or. key=27
               exit
            else
               if key<>0 .and. som="S"
                  tone(100,1)
               endif
            endif
         enddo
         if key=83 .or. key=115
            do utilitar with 1
         endif
      endif
      restore screen from scr_menu
      exit
   enddo
endif

if n_sub_menu=3       && som on/off
   sele 5
   if som="S"
      truc="N„o"
   else
      truc="Sim"
   endif
   replace beep with truc
   som=left(truc,1)
endif

set key 19 to esquerda
set key 04 to direita

