
  '---------------------------------------------------------
  '    Programa elaborado por Lu¡s Filipe / (1990)
  '               Todos os direitos do autor reservados
  '
  '   " MATRECOS "
  '---------------------------------------------------------
        screen 2
        width 40
        def seg=&hb800
        defint a-z
        randomize timer
        play"msl64t255"
        color 0,0
        cls
        key(1) on
        key(2) on
        key(3) on
        key(10) on

        dim bola(200),barra(500),golo(200),apito(200),boca(5),adv(400),barra2(400),adv22(400)
        dim adv2(500),braco(100),mud(60),spo(400),mat(400)
        dim campo(8000),apre(8000),var(8000),barra00(400),barra22(400),adv00(400)
        dim vitoria(8000),derrota(8000),pontosx(100),jatop(500),pontosd(300)
        on error goto 3000
        bload"apre2.pic"
        get(189,147)-(214,168),barra00
        get(264,113)-(291,137),adv00
        get(224,156)-(253,182),barra22
        equipa=1
        veloc=0

        get(0,0)-(310,195),apre

2       m$=inkey$
        t=t+1 :if t=9999*2 then demo=1:gosub 700:m$=" "  else demo=0
        if m$="" then 2

        cls
        circle(100,100),2,2:paint(100,100),1,2
        get (97,97)-(103,103),bola:cls
        line(0,0)-(1,0),1:get(0,0)-(1,0),boca
        bload"ce2.pic"
        get(49,151)-(83,160),mat
        get(228,151)-(262,160),spo
        put(228,151),spo,xor
        put(228,151),mat,xor
        get(267,151)-(275,161),mud
        get(138,137)-(167,158),barra
        get(180,100)-(202,125),barra2
        put(180,100),barra2,xor
        LINE(169,119)-(212,119),3:put(180,100),barra2,xor
        get(248,27)-(299,36),apito
        GET(256,49)-(261,53),braco:put(256,49),braco,xor
        get(275,44)-(306,50),golo
        get(143,0)-(169,26),adv
        get(90,45)-(120,69),adv2
        line(192,70)-(217,70),0
        get(192,70)-(217,92),adv22:put(192,70),adv22,xor:line(193,70)-(217,70),3:put(192,69),adv2,xor
        put(143,0),adv,xor
        line(126,19)-(185,19),3
        put(143,0),adv,xor
        put(248,27),apito,xor:put(275,44),golo ,xor
        b=1:op=1
        put(252,171),mud ,xor
        gosub 5000
        get(0,0)-(310,195),campo:goto 7



        goto 6
3       cls
        golos=0
        pontos1=0:pontos2=0
        pontost=0
        veloc=0
        b=1:op=1
        bola=0
        nivel=0
        equipa=1
        pont=0
        adv=0

        key(12) off
        key(13) off
        key(11) off
        key(14) off

        put(0,0),apre,xor
5       key(12) off
        key(13) off
        key(11) off
        key(14) off
        m$=inkey$
        t=t+1 :if t=9999*2 then gosub 700:goto 6 ELSE demo=0
        if m$="" then 5
        if m$=chr$(27) then 6000
        gosub 710

6
        key(12) off
        key(13) off
        key(11) off
        key(14) off
        cls
        put(0,0),campo,xor
7       somay=-2
        x=138:y=137:k=37:j=37
        xx=143:yy=0
        x2=180:y2=100
        x3=108:y3=70
        x4=181:y4=31
        xx2=90:yy2=45
        xx3=192:yy3=69
        xx1=150:yy1=24
        put(xx1,yy1),adv2,xor:line(124,36)-(170,36):put(xx1,yy1),adv2,xor
        if flag=0 then gosub 5000
        b=1
        OP=1
        estado1=0:estado2=0:estado3=0:estado4=0
        estada1=0:estada2=0:estada3=0:estada4=0
        golo=0:pontos1=0:pontos2=0:bola=0



10'   color 1,1
      for i=1 to 20000:next

      put(256,49),braco,xor

      for t=1 to 24:  play"o5f64a64": put(248,27),apito,xor:put(262,49),boca,xor:for h=1 to 1100:next h:put(248,27),apito,xor:put(262,49),boca,xor:next
      put(256,49),braco,xor
      if demo=1 then 11

      key(12) on
      key(13) on
      key(14) on
      key(11) on
11
       j=230:k=70
       put(j,k),bola,xor
       play"o1"
       somax=1
       somay=0
       locate 23,7:print b
       locate 2,36:print equipa
       locate 6,3:print pontos1
       locate 8,3:print pontos2
       locate 12,35:print pontost
50
        m$=inkey$
        cont=cont+1
        if cont>=((4-veloc))  then gosub 60
        if contt>=((120-nivel)) then gosub 70 else contt=contt+1
        d=d+1

        if b1cont>=(400) then gosub 71 else b1cont=b1cont+1
        if b2cont>=101 then gosub 80 else  b2cont=b2cont+1
        if b3cont>=102 then gosub 81 else  b3cont=b3cont+1
        if b4cont>=103 then gosub 91 else  b4cont=b4cont+1

        if a1cont>=(114-40*veloc)  then gosub 82 else a1cont=a1cont+1
        if a2cont>=(105-30*veloc)  then gosub 85 else a2cont=a2cont+1
        if a3cont>=(100-30*veloc) then gosub 90 else a3cont=a3cont+1
        pub=pub+1
        if pub>=1000 and mpub=0 then put(49,151),mat,xor:put(228,151),mat,xor:put(49,151),spo,xor:put(228,151),spo,xor:mpub=1:pub=0
        if pub>=1000 and mpub=1 then put(49,151),spo,xor:put(228,151),spo,xor:put(49,151),mat,xor:put(228,151),mat,xor:mpub=0:pub=0

        if d=40 and  demo=1   then gosub 53
        if m$=" " then flag=1: gosub 55
        on key(11) gosub 55
        on key(14) gosub 56
        on key(12)  gosub 51
        on key(13)  gosub 52
        on key (1) gosub 602
        on key (2) gosub 600
        on key (3) gosub 601
        on key(10) gosub 1000
        if m$=chr$(27) then 3
        if m$="1" then flag=1:gosub 55
        if m$="2" then flag=2:gosub 55
        if m$="3" then flag=3:gosub 55
        if m$="4" then flag=4:gosub 55
        if m$="p" then gosub 800

   goto 50

51 ' ----- tecla esquerda ----------------

        key(13) off
        if op=1 and estada1=0 then put(x,y),barra,xor:x=x-8:if x<=60 then x=60:put(x,y),barra,xor else put(x,y),barra,xor
        if op=2 and estada2=0 then put(x2,y2),barra2,xor:x2=x2-8:if x2<=60 then x2=60:put(x2,y2),barra2,xor else put(x2,y2),barra2,xor
        if op=3 and estada3=0 then put(x3,y3),barra2,xor:x3=x3-8:if x3<=60 then x3=60:put(x3,y3),barra2,xor else put(x3,y3),barra2,xor
        if op=4 and estada4=0 then put(x4,y4),barra2,xor:x4=x4-8:if x4<=60 then x4=60:put(x4,y4),barra2,xor else put(x4,y4),barra2,xor
        cont=3
        if op=1 and estada1=1 then put(x,y),barra00,xor:x=x-8:if x<=60 then x=60:put(x,y),barra00,xor else put(x,y),barra00,xor
        if op=2 and estada2=1 then put(x2,y2),barra22,xor:x2=x2-8:if x2<=60 then x2=60:put(x2,y2),barra22,xor else put(x2,y2),barra22,xor
        if op=3 and estada3=1 then put(x3,y3),barra22,xor:x3=x3-8:if x3<=60 then x3=60:put(x3,y3),barra22,xor else put(x3,y3),barra22,xor
        if op=4 and estada4=1 then put(x4,y4),barra22,xor:x4=x4-8:if x4<=60 then x4=60:put(x4,y4),barra22,xor else put(x4,y4),barra22,xor



        key(13) on
   return

52'------- tecla direita -----------------
        key(12) off
        if op=1  and estada1=0 then put(x,y),barra,xor:x=x+8:if x>=248-20 then x=248-20:put(x,y),barra,xor else put(x,y),barra,xor
        if op=2  and estada2=0 then put(x2,y2),barra2,xor:x2=x2+8:if x2>=248-20 then x2=248-20:put(x2,y2),barra2,xor else put(x2,y2),barra2,xor
        if op=3  and estada3=0 then put(x3,y3),barra2,xor:x3=x3+8:if x3>=248-20 then x3=248-20:put(x3,y3),barra2,xor else put(x3,y3),barra2,xor
        if op=4  and estada4=0 then put(x4,y4),barra2,xor:x4=x4+8:if x4>=248-20 then x4=248-20:put(x4,y4),barra2,xor else put(x4,y4),barra2,xor
        cont=3
        if op=1  and estada1=1 then put(x,y),barra00,xor:x=x+8:if x>=248-20 then x=248-20:put(x,y),barra00,xor else put(x,y),barra00,xor
        if op=2  and estada2=1 then put(x2,y2),barra22,xor:x2=x2+8:if x2>=248-20 then x2=248-20:put(x2,y2),barra22,xor else put(x2,y2),barra22,xor
        if op=3  and estada3=1 then put(x3,y3),barra22,xor:x3=x3+8:if x3>=248-20 then x3=248-20:put(x3,y3),barra22,xor else put(x3,y3),barra22,xor
        if op=4  and estada4=1 then put(x4,y4),barra22,xor:x4=x4+8:if x4>=248-20 then x4=248-20:put(x4,y4),barra22,xor else put(x4,y4),barra22,xor



        key (12) on
   return

53 '-------- demo ------------------------
       put(x,y),barra,xor
       x=j
       if x<=99 then x=99
       if x>=180 then x=180
       put(x,y),barra,xor
       d=0

       IF LAP=1 THEN locate 23,14:print"Demonstracao"
       IF LAP=3 THEN LOCATE 23,14:PRINT SPACE$(12)
       IF LAP=5 THEN LAP=0

      LAP=LAP+1
      lapp=lapp+1
      if lapp=400 then gosub 710:lapp=0:b=0:goto 3
return

55 '----------- Mudan‡a de jogador  --------------
      if demo=1 then return
      if op=1 then put(252,171),mud ,xor
      if op=2 then put(262,171),mud ,xor
      if op=3 then put(272,171),mud ,xor
      if op=4 then put(282,171),mud ,xor

      op=op+1:if op>=4 then op=4
      if flag=1 then op=1 :flag=0
      if flag=2 then op=2 :flag=0
      if flag=3 then op=3 :flag=0
      if flag=4 then op=4 :flag=0
      goto 57

56
      if op=1 then put(252,171),mud ,xor
      if op=2 then put(262,171),mud ,xor
      if op=3 then put(272,171),mud ,xor
      if op=4 then put(282,171),mud ,xor
      op=op-1:if op<=1 then op=1
      goto 57


57
      if op=1 then put(252,171),mud ,xor
      if op=2 then put(262,171),mud ,xor
      if op=3 then put(272,171),mud ,xor
      if op=4 then put(282,171),mud ,xor

 return

60  '--------------- bola --------
        play"o1"
        if k>=70 and  k<=90  and j>=248 then somax=-2 ':play"d64"
        if k>=70 and  k<=90  and j<=60 then somax=2 ':play"d64"

        if k>90 and   k<=120 and j>=258 then somax=-2 ':play"d64"
        if k>90 and   k<=120 and j<=50 then somax=2 ':play"d64"

        if k>120 and j>=265 then somax=-2 ':play"d64"
        if k>120 and j<=45 then somax=2 ':play"d64"

        if k< 70 and  j>=225 then somax=-2 ':play"d64"
        if k< 70 and  j<=75 then somax=2 ':play"d64"

        if k<=15 then  200
        if k<=20 and j<=126 then somay=2
        if k<=20 and j>=185 then somay=2



        if (int(rnd*4))=3 then pont=1

        if j>=xx and j<=xx+20 and k>=21 and k<=30 then pontos=pontos+1:somay=2+pont:somax=somax+(int(rnd*6)):play"c64":if somax>3 then somax=somax*(-1)
        if j>=xx1 and j<=xx1+20 and k>=43 and k<=49 then pontos=pontos+1:somay=2+pont:somax=somax+(int(rnd*6)) :play"c64":if somax>3 then somax=somax*(-1)
        if j>=xx3 and j<=xx3+20 and k>=86 and k<=95 then pontos=pontos+1:somay=2+pont:somax=somax+(int(rnd*6)):play"c64" :if somax>=3 then somax=somax*(-1)
        if j>=xx2 and j<=xx2+20 and k>=62 and k<=70 then pontos=pontos+1:somay=2+pont:somax=somax+(int(rnd*6)):play"c64": if somax>3 then somax=somax*(-1)
        pont=0

        if j>=x3 and j<=x3+20 and k>=90 and k<=96 then pontos=pontos+1:somay=-2:somax=somax+(int(rnd*6)):play"a64":  if somax=3 then somax=somax*(-1)
        if j>=x2 and j<=x2+20 and k>=116 and k<=124 then pontos=pontos+1:somay=-2:somax=somax+(int(rnd*6)):play"a64":if somax>=3 then somax=somax*(-1)
        if j>=x4 and j<=x4+20  and k>=51 and k<=57 then pontos=pontos+1:somay=-3:somax=somax+(int(rnd*6)):play"a64":if somax>=3 then somax=somax*(-1)


        if k>=153 and j>=x and j<=x+3 then somax=-2:somay=-2   :play"c64":goto 61
        if k>=153 and j>=x+17 and j<=x+20 then somax=2:somay=-2 :play"c64":goto 61
        if k>=153 and j>=x+4 and j<=x+7 then somax=-1:somay=-2  :play"c64":goto 61
        if k>=153 and j>=x+13 and j<=x+16 then somax=1:somay=-2 :play"c64":goto 61
        if k>=153  and j=>x+3 and j<=x+17 then somay=-2 :somax=0:play"c64":goto 61

        if sorte=1 then if k>=173  and j<=205 and j>=100 then somay=-2:play"c64":goto 61

        if k>=153  and j>=205 then  somay=-2
        if k>=153  and j<=95 then  somay=-2
        if k>=170  then  100
61
        put(j,k),bola,xor :j=j+somax:k=k+somay:put(j,k),bola,xor
        cont=0
        return
'--------------------------------------------------------------
70
       if estado4=1 then put(xx,yy),adv00,xor:estado4=0:goto 709
       if estado4=0 then put(xx,yy),adv,xor :estado4=1
709
       xx=j-6
       if xx>=165 then xx=165
       if xx<=123 then xx=123
       if estado4=1 then put(xx,yy),adv00,xor
       if estado4=0 then put(xx,yy),adv,xor
       contt=0

71
       if op=1 then b1cont=0:return
       if estada1=1 then put(x,y),barra00,xor:estada1=0:goto 719
       if estada1=0 then put(x,y),barra,xor :estada1=1
719
       if j>=x+3 then x=x+4
       if j<=x+3 then x=x-4
       if x<=99 then x=99
       if x>=220 then x=220

       if estada1=1 then put(x,y),barra00,xor
       if estada1=0 then put(x,y),barra,xor
       b1cont=0




  return
80
       if op=2 then b2cont=0:return
       if estada2=0 then put(x2,y2),barra2,xor:estada2=1:goto 809
       if estada2=1 then put(x2,y2),barra22,xor:estada2=0
809
       if j>=x2 then x2=x2+4 else x2=x2-4
       if x2>=200 then x2=200
       if x2<=100 then x2=100
       if estada2=1 then put(x2,y2),barra22,xor
       if estada2=0 then put(x2,y2),barra2,xor
       b2cont=0

 return

81

       if op=3 then b3cont=0:return
       if estada3=0 then put(x3,y3),barra2,xor:estada3=1:goto 819
       if estada3=1 then put(x3,y3),barra22,xor:estada3=0
819
      if j>=148 then x3=x3+4 else x3=x3-4
      if x3>=180 then x3=180
      if x3<=90 then x3=90
      if estada3=1 then put(x3,y3),barra22,xor
      if estada3=0 then put(x3,y3),barra2,xor
      b3cont=0

 return

82     if estado1=1 then put(xx1,yy1),adv22,xor:estado1=0:goto 829
       if estado1=0 then put(xx1,yy1),adv2,xor :estado1=1
829
       if j>148 then xx1=xx1+3
       if j<148 then xx1=xx1-3
       if xx1>=220 then xx1=220
       if xx1<=130 then xx1=130

       if estado1=1 then put(xx1,yy1),adv22,xor
       if estado1=0 then put(xx1,yy1),adv2,xor
       a1cont=0

 return

85
       if estado2=1 then put(xx2,yy2),adv22,xor:estado2=0:goto 859
       if estado2=0 then put(xx2,yy2),adv2,xor :estado2=1
859
       if j>=130  then xx2=xx2+3
       if j<130  then xx2=xx2-3
       if xx2>=130 then xx2=130
       if xx2<=70 then xx2=70
       a2cont=0
       if estado2=1 then put(xx2,yy2),adv22,xor
       if estado2=0 then put(xx2,yy2),adv2,xor
       a2cont=0
       return

90


       if estado3=1 then put(xx3,yy3),adv22,xor:estado3=0:goto 999
       if estado3=0 then put(xx3,yy3),adv2,xor :estado3=1
999
       if j>180 then xx3=xx3+3
       if j<180 then xx3=xx3-3
       if xx3>=195 then xx3=195
       if xx3<=135 then xx3=135
       if estado3=1 then put(xx3,yy3),adv22,xor
       if estado3=0 then put(xx3,yy3),adv2,xor
       a3cont=0

 return

91
       if op=4 then b4cont=0:return
       if estada4=0 then put(x4,y4),barra2,xor:estada4=1:goto 910
       if estada4=1 then put(x4,y4),barra22,xor:estada4=0
910
       if j>=170 then x4=x4+4 else x4=x4-4
       if x4>=220 then x4=220
       if x4<=160 then x4=160
       if estada4=1 then put(x4,y4),barra22,xor
       if estada4=0 then put(x4,y4),barra2,xor
       b4cont=0

 return



100 ' ------------ Golo do vizitante ---------

      put(256,49),braco,xor
      for t=1 to 4:play"o5f64a64": put(248,27),apito,xor:put(262,49),boca,xor:for h=1 to 1000:next h:put(248,27),apito,xor:put(262,49),boca,xor:next
      pontos2=pontos2+1:bola=bola+1
      locate 8,3:print pontos2 :if bola=7 then  put(256,49),braco,xor:goto 300	
      play"o1"
      cont=0
      put(j,k),bola,xor
      somay=-2
      for i=1 to 20
      put(275,44),golo ,xor:for i=1 to 1500:next:put(275,44),golo,xor:next
      put(256,49),braco,xor
      b=b+1
      goto 10
200 '----------- Golo do matrecos ----------------
     pontost=pontost+1
     locate 12,35:print pontost
     put(256,49),braco,xor
     for t=1 to 4:play"o5f64a64": put(248,27),apito,xor:put(262,49),boca,xor:for h=1 to 1000:next h:put(248,27),apito,xor:put(262,49),boca,xor:next
     pontos1=pontos1+1 :bola=bola+1
     locate 6,3:print pontos1:if bola=7 then  put(256,49),braco,xor:goto 300	
     play"o1"
     cont=0
     put(j,k),bola,xor
     somay=2
     for t=1 to 20
     put(275,44),golo ,xor:for i=1 to 1500:next:put(275,44),golo ,xor:next
     put(256,49),braco,xor
     b=b+1
     goto 10
300  '---------------------------------------
    key(11) off
    key(12) off
    key(13) off
    key(14) off
    get(280,88)-(294,94),pontosx
    put(j,k),bola,xor
    if equipa=9 then 500
    if pontos1>pontos2 then vitoria=vitoria+1:adv=adv+1:nivel=nivel+6:equipa=equipa+1:goto 400

    '----------------------- derrota ------------
    pontos1=0:pontos2=0
    bola=0
    b=0
    cont=0
    nivel=0
    equipe=1
    veloc=0

    for i=0 to 199 step 4
    line(0,0+i)-(319,0+i),1: for t=1 to 15:next
    line(0,199-i)-(319,199-i),1: for t=1 to 15:next
    next
    for i=1 to 199 step 3
    line(0,0+i)-(319,0+i),3:for t=1 to 15:next
    line(0,199-i)-(319,199-i),3 :for t=1 to 15:next
    next

     for i=0 to 199 step 2
     line(0,0+i)-(319,0+i),1: :for t=1 to 15:next
     line(0,199-i)-(319,199-i),1: :for t=1 to 15:next
     next
     for i= 0 to 159 step 2
     line(159-i,0)-(159-i,199),0
     line(159+i,0)-(159+i,199),0
     next i
     cls
     if flagd=0 then bload"derr.pic":get(0,0)-(310,170),derrota:flagd=1 else put(0,0),derrota,xor

     put(237,29),pontosx,xor
     get(232,21)-(280,37),pontosd:put(232,21),pontosd,xor
     get(210,13)-(290,37),jatop
     put(232,21),pontosd,xor
     pt=0:pd=0:flagp=0
     for x=220 to 20 step -2

     put(x,13),jatop,pset
     tt=tt+1
     if tt=8 then line(x+60,17)-(x+85,17),1,,111
     for t=1 to 3000:next t
     if tt=8 then line(x+60,17)-(x+85,17),0,,111
     if tt=10 then circle(x+83,17),3,1,,,1/3
     if tt=10 then circle(x+83,17),3,1,,,3/1
     if tt=8 then circle(x+73,17),2,1,,,1/3
     if tt=8 then circle(x+73,17),2,1,,,3/1
     for i=1 to 3000:next
     if tt=8 then circle(x+73,17),2,0,,,1/3
     if tt=8 then circle(x+73,17),2,0,,,3/1
     if tt=10 then circle(x+83,17),3,0,,,1/3
     if tt=10 then circle(x+83,17),3,0,,,3/1:tt=0
     ttt=ttt+1
     if ttt=1 then circle(187+fx,86+fy),2+fc,1,,,1/4
     if ttt=3 then circle(187+fx,86+fy),2+fc,0,,,1/4:fx=fx+1:fy=fy-1:fc=fc+1:ttt=0
     if fx=10 then fy=0:fx=0:fc=0
     if flagp=0 then pt=pt+1
     if pt=2 then put(232,21+pd),pontosd,xor:pd=pd+4:put(232,21+pd),pontosd,xor:pt=0
     if pd+21>=88 then  flagp=1

next x
301  for i=1 to  900:next i:goto 3

400  '----------- Vitoria num jogo -------------

     get(280,88)-(294,94),pontosx

     if nivel>=50 then nivel=50:veloc=1
     if vitoria=7 then veloc=2

     for i=0 to 199 step 4
     line(0,0+i)-(319,0+i),1:for t=1 to 15:next
     line(0,199-i)-(319,199-i),1:for t=1 to 15:next
     next
     for i=1 to 199 step 3
     line(0,0+i)-(319,0+i),3   :for t=1 to 15:next
     line(0,199-i)-(319,199-i),3  :for t=1 to 15:next
     next
     for i=0 to 199 step 2
     line(0,0+i)-(319,0+i),1: :for t=1 to 15:next
     line(0,199-i)-(319,199-i),1: :for t=1 to 15:next
     next
     for i=0 to 159 step 3
     line(159-i,0)-(159-i,199),0
     line(159+i,0)-(159+i,199),0
     next i
     cls
     if flagv=0 then bload"vit.pic":get(0,0)-(310,170),vitoria:flagv=1 else put(0,0),vitoria,xor

     put(237,29),pontosx,xor
     get(210,13)-(290,37),jatop

     for x=220 to 20 step -2

     put(x,13),jatop,pset
     tt=tt+1
     if tt=8 then line(x+60,17)-(x+85,17),1,,111
     for t=1 to 3000:next t
     if tt=8 then line(x+60,17)-(x+85,17),0,,111
     if tt=10 then circle(x+83,17),3,1,,,1/3
     if tt=10 then circle(x+83,17),3,1,,,3/1
     if tt=8 then circle(x+73,17),2,1,,,1/3
     if tt=8 then circle(x+73,17),2,1,,,3/1
     for i=1 to 3000:next
     if tt=8 then circle(x+73,17),2,0,,,1/3
     if tt=8 then circle(x+73,17),2,0,,,3/1
     if tt=10 then circle(x+83,17),3,0,,,1/3
     if tt=10 then circle(x+83,17),3,0,,,3/1:tt=0
     ttt=ttt+1
     if ttt=1 then circle(187+fx,86+fy),2+fc,1,,,1/4
     if ttt=3 then circle(187+fx,86+fy),2+fc,0,,,1/4:fx=fx+1:fy=fy-1:fc=fc+1:ttt=0
     if fx=10 then fy=0:fx=0:fc=0

    next x

     for i=1 to 900:next i
401
     GOTO 6

500'--------------- graficos do final do jogo ------------------
    key(11) off
    key(12) off
    key(13) off
    key(14) off
    get(280,88)-(294,94),pontosx
    put(j,k),bola,xor
    pontos1=0:pontos2=0
    bola=0
    b=0
    cont=0
    nivel=0
    equipe=1
    veloc=0

    for i=0 to 199 step 4
    line(0,0+i)-(319,0+i),1: for t=1 to 15:next
    line(0,199-i)-(319,199-i),1: for t=1 to 15:next
    next
    for i=1 to 199 step 3
    line(0,0+i)-(319,0+i),3:for t=1 to 15:next
    line(0,199-i)-(319,199-i),3 :for t=1 to 15:next
    next

    for i=0 to 199 step 2
    line(0,0+i)-(319,0+i),1: :for t=1 to 15:next
    line(0,199-i)-(319,199-i),1: :for t=1 to 15:next
    next
    for i= 0 to 159 step 2
    line(159-i,0)-(159-i,199),0
    line(159+i,0)-(159+i,199),0
    next i
    cls
    bload"vitt.pic"
    put(237,29),pontosx,xor
     get(232,21)-(280,37),pontosd:put(232,21),pontosd,xor
     get(210,13)-(290,37),jatop
     put(232,21),pontosd,xor
     pt=0:pd=0:flagp=0

     for x=220 to 2 step -2
     put(x,13),jatop,pset
     tt=tt+1
     if tt=8 then line(x+60,17)-(x+85,17),1,,111
     for t=1 to 2500:next t
     if tt=8 then line(x+60,17)-(x+85,17),0,,111
     if tt=10 then circle(x+83,17),3,1,,,1/3
     if tt=10 then circle(x+83,17),3,1,,,3/1
     if tt=8 then circle(x+73,17),2,1,,,1/3
     if tt=8 then circle(x+73,17),2,1,,,3/1
     for i=1 to 2500:next
     if tt=8 then circle(x+73,17),2,0,,,1/3
     if tt=8 then circle(x+73,17),2,0,,,3/1
     if tt=10 then circle(x+83,17),3,0,,,1/3
     if tt=10 then circle(x+83,17),3,0,,,3/1:tt=0

     if fx=10 then fy=0:fx=0:fc=0
     if flagp=0 then pt=pt+1
     if pt>1 then put(232,21+pd),pontosd,xor:pd=pd+4:put(232,21+pd),pontosd,xor:pt=0
     if pd+21>=110 then  flagp=1
     next
     line(20,13)-(290,37),0,bf

510  m$=inkey$
     cont=cont+1
     if cont=30000 then 3
     if m$="" then 510
     goto 3

600  '---op‡„o palete ---------
     color 0,0:opc=0
     return
601  '--- op‡„o palete ---------
     color 1,opc
     return
602   '--- op‡a” palete ---------
     color 0,1:opc=1
     return
700
    d=0
    key(13) off
    key(12) off
    key(11) off
    key(14) off

    demo=1
    return

710
    key(13) on
    key(12) on
    key(11) on
    key(14) on
    demo=0
    return
800 '----------- Pausa ---------
     key(12) stop
     key(13) stop
     key(11) stop
     key(14) stop
     locate 23,14:print"    Pausa   "
801  m$=inkey$
     if m$="" then 801
     locate 23,14:print"            "
     key(13) on
     key(12) on
     key(11) on
     key(14) on
     return

1000 '------------- Escape sem sair para o systema ------------
     key(12) off
     key(13) off
     key(11) off
     key(14) off

     get (0,0)-(310,195),var
     put(0,0),var,xor
     screen 0,0,0:width 80
     locate 25,1:print"F1-Help F2-Save F3-New F5-Zoom F6-Next F7-Beg Blk F8-End Blk SCROLL-size/move   "

     locate  1,1:print"     A:TESTE12.PAS Line 13  Col 9  Insert Indent Tab                          "
     color 7,0
     print
     PRINT
     PRINT "     PROGRAM SOMA(INPUT,OUTPUT);"
     PRINT "     VAR SOMA,I:INTERGER;       "
     PRINT "     BEGIN                      "
     PRINT "         SOMA:=0 ;              "
     PRINT "         I:=0 ;                 "
     PRINT "         WHILE I<=100 DO        "
     PRINT "         BEGIN                  "
     PRINT "             SOMA:=SOMA+1;      "
     PRINT "             I:=I+1;            "
     PRINT "         END                    "
     PRINT "         WRITELN(SOMA)          "
     PRINT "     END.                       "
     locate ,,1
     locate 15,10
1001
     m$=inkey$
     if m$="c" then goto 1002
     if m$="" then 1001
     play"o5c34"
     goto 1001
1002 cls
     screen 1,0:width 40
     color 0,0
     put(0,0),var,xor
     if demo=0 then key(12) on
     if demo=0 then key(13) on
     if demo=0 then key(11) on
     if demo=0 then key(14) on


     play"o1"

     return

3000 '---------------- erro de leitura ----------------
     screen 0,0,0
     width 80



     locate 9,20 :print"ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿ "
     locate 10,20:print"³  Erro na leitura  !                  ³ "
     locate 11,20:print"³                                      ³ "
     locate 12,20:print"³       Prime ( ENTER ) para continuar ³ "
     locate 13,20:print"³       ou  ( ESC ) para abandonar     ³ "
     locate 14,20:print"ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ "
     locate 10,23:color 30:print "ERRO"
     LOCATE 12,35:COLOR 10,0:PRINT " ENTER "
     LOCATE 13,33:PRINT" ESC "
3005 m$=inkey$
     if m$=CHR$(13)  THEN 3006
     IF M$=CHR$(27) THEN 6000
     GOTO 3005
3006 screen 1
     color 0,0
     resume
5000    '-------------- Encher o campo com cor --------------------
        x=138:y=137 :put(x,y),barra,xor
        k=37:j=37   :put(k,j),bola,xor
        xx=143:yy=0 :put(xx,yy),adv,xor
        x2=180:y2=100:put(x2,y2),barra2,xor
        x3=108:y3=70  :put(x3,y3),barra2,xor
        x4=181:y4=31 :put(x4,y4),barra2,xor
        xx2=90:yy2=45 :put(xx2,yy2),adv2,xor
        xx3=192:yy3=69 :put(xx3,yy3),adv2,xor
        xx1=150:yy1=24 :put(xx1,yy1),adv2,xor
        paint(100,100),1
        paint(x,y),1:paint(143,25),1:paint(130,60),1

        x=138:y=137 :put(x,y),barra,xor
        k=37:j=37   :put(k,j),bola,xor
        xx=143:yy=0 :put(xx,yy),adv,xor
        x2=180:y2=100:put(x2,y2),barra2,xor
        x3=108:y3=70  :put(x3,y3),barra2,xor
        x4=181:y4=31 :put(x4,y4),barra2,xor
        xx2=90:yy2=45 :put(xx2,yy2),adv2,xor
        xx3=192:yy3=69 :put(xx3,yy3),adv2,xor
        xx1=150:yy1=24 :put(xx1,yy1),adv2,xor
return

6000 '----------------------------------------------
      screen 0,0,0
      width 80
      END