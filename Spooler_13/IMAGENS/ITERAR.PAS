

    {   ESTE PROGRAMA TEM O OBJECTIVO DE INICIAR O UTILIZADOR DE      }
    {   COMPATIVEIS PC  NA TEORIA DA ITERACAO, DE UMA MANEIRA SIMPLES }
    {   E SUGESTIVA, ATRAVES DA OBSERVACAO DO ECRAN DA SEU COMPUTADOR }

    { O PROGRAMA EXECUTA VARIAS FUNCOES:                              }
    {   1 - DESENHA IMAGENS DE SUBCONJUNTOS DO PLANO NO ECRAN         }
    {   2 - GRAVA E RECUPERA AS IMAGENS SE O UTILIZADOR DESEJAR       }
    {   3 - DEFINE A PALETE DE CORES AO GOSTO DO UTILIZADOR           }


program ITERAR;
uses crt, graph;
type st7=string[7];
var gd, gm, codcor, indcor,ci,sinal:integer;
    umax, vmax, it_max:integer;
    dummy, tecla,escolha, opcao, tipo_img: char;
    fim,gc,guarda_cor: boolean;
    pa,s,erro:real;
    dh, dv, xmin, xmax, ymin, ymax: real;
    pal: array[0..15] of byte;  {     vector da palete               }


procedure on;
begin
  highvideo;
end;

procedure off;
begin
  lowvideo;
end;

procedure config_grafica; { escolhe a configuracao grafica  }
var resp, pal:char;       {   e as dimensoes do ecran       }

begin                     {     inicio do procedimento config_grafica }
   repeat
      clrscr;
      gotoxy(13,5); write('Qual a sua placa grafica?');
      gotoxy(25,10); write('1 - CGA      (320*200   4 cores)');
      gotoxy(25,12); write('2 - EGA      (640*350  16 cores)');
      gotoxy(25,14); write('3 - VGA      (640*480  16 cores)');
      gotoxy(25,16); write('4 - HERCULES (720*348   2 cores)');
      gotoxy(13,23); write('>> '); readln(resp);
   until (resp='1') or (resp='2') or (resp='3') or (resp='4');
   case resp of
      '1': begin
              gd:=1; gm:=1;sinal:=2; umax:=319; vmax:=199;erro:=0.2;
           end;
      '2': begin
              gd:=3; gm:=1;sinal:=8; umax:=639; vmax:=349;erro:=0.05;
           end;
      '3': begin
              gd:=9; gm:=2;sinal:=8; umax:=639; vmax:=479;erro:=0.01;
           end;
      '4': begin
              gd:=7; gm:=0;sinal:=1; umax:=719; vmax:=347;erro:=0.2;
           end;
   end;
end;              { fim do procedimento config_grafica }



procedure def_palete;
 var gmc:char;
 procedure standard;
  begin             {  inicio do procedimento standard }
    guarda_cor:=true;
    pal[ 0]:=  0  ;pal[ 1]:=  1  ;pal[ 2]:=  2  ;pal[ 3]:=  3  ;
    pal[ 4]:=  4  ;pal[ 5]:=  5  ;pal[ 6]:= 20  ;pal[ 7]:=  7  ;
    pal[ 8]:= 56  ;pal[ 9]:= 57  ;pal[10]:= 58  ;pal[11]:= 59  ;
    pal[12]:= 60  ;pal[13]:= 61  ;pal[14]:= 62  ;pal[15]:= 63  ;
  end;              {  fim do procedimento standard    }

 procedure escolhe_paleta;
   var i:word;
  begin             {  inicio do procedimento escolhe_paleta }
    guarda_cor:=true;
    repeat
      clrscr;
        writeln; writeln; writeln;
        writeln('    Qual a Paleta que escolhe ( a,b,c,d ) ?');
           gotoxy(20,8); write('a  -  Paleta a (aleatoria)');
           gotoxy(20,11); write('b  -  Paleta b');
           gotoxy(20,14); write('c  -  Paleta c ');
           gotoxy(20,17); write('d  -  Paleta d ');
           gotoxy(22,22); write('>> '); readln(gmc);

      until gmc in ['a','A','b','B','c','C','d','D'];
    case gmc of
    'a','A':begin
         randomize;
         pal[ 0]:=  0  ;for i:=1 to 15 do pal[i]:=random(63)  ;
       end;
     'b','B':begin
         pal[ 0]:=  0  ;pal[ 4]:= 14  ;pal[ 8]:= 38  ;pal[12]:= 54  ;
         pal[ 1]:= 30  ;pal[ 5]:= 23  ;pal[ 9]:=  2  ;pal[13]:= 18  ;
         pal[ 2]:= 12  ;pal[ 6]:= 60  ;pal[10]:=  4  ;pal[14]:= 36  ;
         pal[ 3]:= 15  ;pal[ 7]:= 41  ;pal[11]:= 27  ;pal[15]:=  9  ;
       end;
      'c','C':begin
         pal[ 0]:=  0  ;pal[ 1]:=  1  ;pal[ 2]:= 42  ;pal[ 3]:=  5  ;
         pal[ 4]:= 14  ;pal[ 5]:= 43  ;pal[ 6]:=  7  ;pal[ 7]:= 28  ;
         pal[ 8]:= 52  ;pal[ 9]:=  3  ;pal[10]:=  2  ;pal[11]:= 37  ;
         pal[12]:= 54  ;pal[13]:=  9  ;pal[14]:= 18  ;pal[15]:= 36  ;
       end;
       'd','D':begin
         pal[ 0]:=  0  ;pal[ 1]:=  8  ;pal[ 2]:= 16  ;pal[ 3]:=  3  ;
         pal[ 4]:=  4  ;pal[ 5]:= 42  ;pal[ 6]:=  6  ;pal[ 7]:= 14  ;
         pal[ 8]:= 56  ;pal[ 9]:= 57  ;pal[10]:=  2  ;pal[11]:= 51  ;
         pal[12]:= 38  ;pal[13]:= 26  ;pal[14]:= 54  ;pal[15]:= 45  ;
       end;
       end;
  end;              {  fim do procedimento escolhe_paleta  }

procedure escolhe_cor;
 begin              {  inicio do procedimento escolhe_cor }
        standard;
        repeat
            guarda_cor:=true;
            clrscr;

            gotoxy(15,15); write('Qual o indice da paleta a mudar ( entre 0 e 15, -1 para sair)? ');
            gotoxy(18,20); write('>> '); readln(indcor);
            if (indcor>=0) and (indcor <=15) then
                begin
                 repeat
                   gotoxy(15,22); write('Qual o codigo da cor (entre 0 e 63) ?             ');
                   gotoxy(61,22);
                   readln(codcor);
                 until (codcor >=0) and (codcor <=63);
                 pal[indcor]:=codcor;
               end
        until indcor = -1;
 end ;            {  fim do procedimento escolhe_cor    }

procedure CGA_paleta;
  begin       {  inicio do procedimento CGA_paleta   }
      guarda_cor:=false;
      repeat

           clrscr;
           writeln; writeln; writeln;
           writeln('          Placa CGA - Qual a paleta que escolhe?');
           gotoxy(17,8); write('1 - Encarnado, Verde, Amarelo e Preto');
           gotoxy(17,11); write('2 - Preto, Magenta, Cyan e Branco');
           gotoxy(17,14); write('3 - Encarnado, Verde, Castanho e Preto ');
           gotoxy(17,17); write('4 - Preto, Magenta, Cyan e Branco ');
           gotoxy(19,23); write('>> '); readln(gmc);
      until (gmc='1') or (gmc='2') or (gmc='3') or (gmc='4');
      gm:=ord(gmc)-ord('1');
   end;           {  fim do procedimento CGA_paleta    }

 procedure EGA_paleta;
   begin            {  inicio do procedimento EGA_paleta    }
        repeat
          clrscr;
          writeln; writeln; writeln; writeln;
          writeln('     Placa EGA - Qual e'' a opcao que escolhe?');
          gotoxy(15,10); write('       1 - Seleccionar paleta predefinida ');
          gotoxy(15,13); write('       2 - Criar paleta');
          gotoxy(15,16); write('       3 - Usar paleta original');
          gotoxy(18,21); write('       >> '); readln(gmc);
          until (gmc='1') or (gmc='2') or (gmc='3') ;
          case gmc of
            '1':escolhe_paleta;
            '2':escolhe_cor;
            '3':standard;
            end
  end;             {  fim do procedimento EGA_paleta    }

 procedure VGA_paleta;

  begin       {  inicio do procedimento VGA_paleta    }
        repeat
          clrscr;
          writeln; writeln; writeln;
          writeln('     Placa VGA - Qual e'' a opcao que escolhe?');
          gotoxy(15,10); write('       1 - Seleccionar paleta predefinida ');
          gotoxy(15,13); write('       2 - Criar paleta');
          gotoxy(15,16); write('       3 - Usar paleta original');
          gotoxy(18,21); write('       >> '); readln(gmc);        until (gmc='1') or (gmc='2') or (gmc='3') ;
          case gmc of
            '1':escolhe_paleta;
            '2':escolhe_cor;
            '3':standard;
            end
   end;       {  fim do procedimento VGA_paleta    }

begin         {  inicio do procedimento def_paleta    }
   case gd of
      1:CGA_paleta;
      3:EGA_paleta;
      9:VGA_paleta;
      end {case}
end;         {  fim do procedimento def_paleta    }


procedure copyright;
var coluna, linha: integer;

begin           {     inicio do procedimento copyright }
   coluna:=wherex; linha:=wherey;
   gotoxy(1,22);
   writeln('  ITERAR  -  um programa feito por CARLOS ALBUQUERQUE e MARIO SARREIRA');
   gotoxy(coluna,linha)
end;


procedure def_conjunto;  { pede a informacao necessaria para definir a imagem }
var  lmax:real;
     sis:char;

begin              {     inicio do procedimento def_conjunto }
   clrscr;
   writeln('Parametro da funcao ( numero positivo )' );
   writeln; writeln;
   on;
   write('parametro');
   off;
   write(' = ');
   readln(pa);
   pa:=abs(pa);if ( pa<0.00000001) then pa:=0.1;     { evita erros }
   writeln;
   write('interaccao entre as funcoes (');
   on;
   write('s');
   off;
   write(' varia de 0 a 1)= '); readln(s);

   if s<>1 then s:=abs(s-int(s));
   writeln; writeln;
   if escolha='p'
          then
           begin
            writeln('Coordenada horizontal: ');
            on;
            write('xmin');
            off;
            write(' = '); readln(xmin);
            on;
            write('xmax');
            off;
            write(' = '); readln(xmax);
            writeln;
            writeln('Coordenada vertical: ');
            on;
            write('ymin');
            off;
            write(' = '); readln(ymin);
            on;
            write('ymax');
            off;
            write(' = '); readln(ymax);
            writeln; writeln;


           end
          else
           begin
             writeln(' Comprimento do "lado" do quadrante  ');
             on;
             write('lmax');
             off;
             write(' = '); readln(lmax);
             xmax:=0;ymin:=0;ymax:=lmax;xmin:=-lmax;
             writeln;
             writeln;
             writeln(' Qual o sistema de cor que deseja(bicolor ou normal)? ');
             repeat
                sis:=' ';
                gotoxy(15,20);
                write('sistema('); on; write('B ou N'); off; write(')=                ');
                gotoxy(33,20);
                readln(sis);

             until sis in ['b','n','B','N'];
             if (sis='B') or (sis='b') then gc:=true
                                 else gc:=false;
           end;
   dh:=(xmax-xmin)/umax;    {  fazem-se ja alguns calculos necessarios para  }
   dv:=(ymax-ymin)/vmax;    {  escolher a zona do plano onde vamos desenhar  }


   writeln;
   write('Qual o numero maximo de iteracoes? (');
   on;
   write('maxit');
   off;
   write(')  >> '); readln(it_max);
   writeln; writeln;
end;

procedure plano;  { executa o desenho do comportamento no plano }
var u, v, n: integer;
    x, y, x_aux,pa1: real;

begin                   {     inicio do procedimento plano }
   u:=0; pa1:=sqrt(pa+1);
   tecla:=' ';
   while (u<=umax) and (tecla<>#27) and (tecla<>'g') do
      begin
         for v:=0 to vmax do
            begin
               x:=xmin+dh*u;       {  calculo de x e y correspondentes ao  }
               y:=ymax-dv*v;       {  pixel (u,v)                          }
               n:=0;
               if (abs(x*y)>0.000001) and (abs(x+pa*y)>0.000001) then
               if s=1 then
               begin
                 while (n<=it_max) and ((abs(abs(x)-pa1)+abs(abs(y)-pa1))>erro) do
                  begin
                     x_aux:=y;
                     y:=pa/x+1/y; { e' este ciclo que define o conjunto }
                     x:=x_aux;
                     n:=n+1
                  end;
               end
                  else
                   while (n<=it_max) and ((abs(abs(x)-pa1)+abs(abs(y)-pa1))>erro) do
                    begin
                     x_aux:=s*y+(1-s)*(x*y+pa*(pa+1))/(x+pa*y);
                     y:=pa/x+1/y;
                     x:=x_aux;
                     n:=n+1
                  end;
               if n>it_max then
                           putpixel(u,v,0)
                           else
                           if x<0 then putpixel(u,v,n)
                                  else putpixel(u,v,sinal+n)
            end;
            u:=u+1;
            if keypressed then tecla:=readkey
      end;

end;



procedure quadrante;
var u, v, n: integer;
    x, y, x_aux: real;
begin                    {     inicio do procedimento  quadrante  }

   tecla:=' ';
   u:=0;
   while (u<=umax) and (tecla<>#27) and (tecla<>'g') do
      begin
         for v:=0 to vmax do
            begin
               x:=xmin+dh*u;
               y:=ymax-dv*v;
               n:=0;
               if s=1
               then
                 while (n<=it_max) and (x*y<-0.000000001) do
                  begin
                     x_aux:=y;
                     y:=pa/x+1/y;
                     x:=x_aux;
                     n:=n+1
                  end
               else
                 if abs(x+pa*y)>0.0000001 then
                 while (n<=it_max) and (x*y<-0.0000001) do
                  begin
                     x_aux:=s*y+(1-s)*(x*y+pa*(pa+1))/(x+pa*y);
                     y:=pa/x+1/y;
                     x:=x_aux;
                     n:=n+1
                  end;

                           if gc then
                           begin
                              if x<0 then putpixel(u,v,15)
                                   else putpixel(u,v,0)    { atribuicao de cor }
                           end
                           else
                           begin
                             if x<0 then putpixel(u,v,n div 2)
                                  else putpixel(u,v,sinal+n div 2)
                           end;

              end;
            u:=u+1;
            if keypressed then tecla:=readkey
        end;

end;

procedure carregar(nomefic:string);
var p:pointer;
    tamanho,i:integer;
    lersete,lidos:word;
    fic:file;
    pq:^st7;
begin                    {     inicio do procedimento carregar    }
   assign(fic,nomefic);
   reset(fic);
   lersete:=7; New(pq);
   blockread(fic,pq^,lersete,lidos);
   Dispose(pq);
   case gd of

      1: begin
           tamanho:=ImageSize(0,0,319,199);
           getmem(p,tamanho);
           blockread(fic,p^,tamanho,lidos);
           putimage(0,0,p^,0);
           freemem(p,tamanho)
         end;

      3: begin
           for i:=0 to 4 do
              begin
                tamanho:=ImageSize(i*128,0,i*128+128,350);
                getmem(p,tamanho);
                blockread(fic,p^,tamanho,lidos);
                putimage(i*128,0,p^,0);
                freemem(p,tamanho)
              end;
         end;

      9: begin
           for i:=0 to 4 do
              begin
                tamanho:=ImageSize(i*128,0,i*128+128,480);
                getmem(p,tamanho);
                blockread(fic,p^,tamanho,lidos);
                putimage(i*128,0,p^,0);
                freemem(p,tamanho)
              end;

         end;

      7: begin
           tamanho:=ImageSize(0,0,720,200);
           getmem(p,tamanho);
           blockread(fic,p^,tamanho,lidos);
           putimage(0,0,p^,0);
           freemem(p,tamanho);
           tamanho:=ImageSize(0,201,720,348);
           getmem(p,tamanho);
           blockread(fic,p^,tamanho,lidos);
           putimage(0,200,p^,0);
           freemem(p,tamanho)
         end;
   end;
   close(fic)
end;



procedure verimag;
var retorno:boolean;
    nomefich:string;
    ficheiro:file;
    cabecalho:st7;
    modo_grafico:string[3];
    tec,mg:char;
    aler,lidos:word;
    q: ^st7;

function ficheiro_aberto(var im:file;nome:string):boolean;
 begin
  assign(im,nome);
  {$I-}
  reset(im);
  {$I+}
  if IOresult=0 then
                ficheiro_aberto:=true
               else
                ficheiro_aberto:=false;
 end;  {fim da funcao}

procedure erro_formato;

begin                   {     inicio do procedimento erro_formato  }
  clrscr;
  writeln('O FICHEIRO ',nomefich,' NAO CONTEM UMA IMAGEM NO FORMATO ADEQUADO');
  repeat until keypressed;
  clrscr
end;    { fim do procedimento erro_formato  }

begin                    {     inicio do procedimento verimag  }

   retorno:=false;  getmem(q,7);
   aler:=7;
   repeat
     begin
       clrscr;gotoxy(10,20);
       write('ENTER para voltar ao menu principal.');
       gotoxy(10,15); write('Nome do ficheiro com a imagem:  ');
       readln(nomefich);
       if nomefich='' then retorno:=true
         else
          begin
           if ficheiro_aberto(ficheiro,nomefich) then
           begin
           assign(ficheiro,nomefich);
           Reset(ficheiro);
           blockread(ficheiro,q^,aler,lidos);
           cabecalho:=q^;
           close(ficheiro);
           if copy(cabecalho,1,3)<>'FRC' then erro_formato
              else
                begin
                  modo_grafico:=copy(cabecalho,4,3);
                  if (modo_grafico<>'CGA') and (modo_grafico<>'EGA') and (modo_grafico<>'VGA') and (modo_grafico<>'HGC')
                    then erro_formato
                      else
                        begin
                          if modo_grafico='CGA' then begin gd:=1; gm:=1 end;
                          if modo_grafico='EGA' then begin gd:=3; gm:=1 end;
                          if modo_grafico='VGA' then begin gd:=9; gm:=2 end;
                          if modo_grafico='HGC' then begin gd:=7; gm:=0 end;
                          def_palete;
                          initgraph(gd,gm,'');
                          if guarda_cor then for ci:=0 to 15 do setpalette(ci,pal[ci]);
                          carregar(nomefich);

                          repeat tec:=readkey until tec=#27;
                          closegraph;
                        end
                end
          end

          else begin
               repeat
               clrscr;
               gotoxy(10,10);
               Writeln('O nome do ficheiro esta errado');
               gotoxy(10,13);
               Writeln('Carregue na tecla ESC para voltar ao anterior' );
               until readkey=#27
               end
        end
     end
   until retorno;
   freemem(q,7)
end;

procedure gravar;
var ficheiro:file;
    nomefich,s:string;
    aler,lidos:word;

procedure captura_imagem(var fic:file);
var pp:pointer;
    i:integer;
    tam,aescrever,escritos:word;
    cabecalho:string;
begin                   {     inicio do procedimento captura_imagem  }

   aescrever:=7;
   case gd of
      1: begin
           cabecalho:='FRCCGA1';
           blockwrite(fic,cabecalho,aescrever,escritos);
           tam:=imagesize(0,0,319,199);
           getmem(pp,tam);
           getimage(0,0,319,199,pp^);
           blockwrite(fic,pp^,tam,escritos);
           freemem(pp,tam);
         end;
      3: begin
           cabecalho:='FRCEGA ';
           blockwrite(fic,cabecalho,aescrever,escritos);
           for i:=0 to 4 do
              begin
                tam:=imagesize(i*128,0,i*128+128,350);
                getmem(pp,tam);
                getimage(i*128,0,i*128+127,479,pp^);
                blockwrite(fic,pp^,tam,escritos);
                freemem(pp,tam);
              end;
         end;
      9: begin
           cabecalho:='FRCVGA ';
           blockwrite(fic,cabecalho,aescrever,escritos);
           for i:=0 to 4 do
              begin
                tam:=imagesize(i*128,0,i*128+128,480);
                getmem(pp,tam);
                getimage(i*128,0,i*128+127,479,pp^);
                blockwrite(fic,pp^,tam,escritos);
                freemem(pp,tam);
              end;
         end;
      7: begin
           cabecalho:='FRCHGC ';
           blockwrite(fic,cabecalho,aescrever,escritos);
           tam:=imagesize(0,0,720,200);
           getmem(pp,tam);
           getimage(0,0,719,199,pp^);
           blockwrite(fic,pp^,tam,escritos);
           freemem(pp,tam);

           tam:=imagesize(0,201,720,348);
           getmem(pp,tam);
           getimage(0,200,719,347,pp^);
           blockwrite(fic,pp^,tam,escritos);
           freemem(pp,tam);
         end;
   end;
end;              { fim do procedimento captura_imagem }


begin             {     inicio do procedimento gravar }

   assign(ficheiro,'IMTEMP.FRC');
   rewrite(ficheiro);
   captura_imagem(ficheiro); close(ficheiro);
   closegraph;
   clrscr;
   writeln('Nome do ficheiro para arquivar a imagem:');
   if keypressed then dummy:=readkey; readln(nomefich);
   rename(ficheiro,nomefich);

end;                 { fim do procedimento gravar }


procedure desenhar;

         begin
            config_grafica;
            def_palete;
            repeat
               clrscr;
               gotoxy(10,4);
               write('Que zona deseja ver ( todo o "plano" ou um quadrante):');
               gotoxy(28,10); write('p - todo o plano');
               gotoxy(28,13); write('q - um quadrante');
               gotoxy(20,20); write('>> ');
               readln(escolha);

            until (escolha='P') or (escolha='Q') or (escolha='p') or (escolha='q');
            def_conjunto;
            initgraph(gd,gm,'');
            if guarda_cor then for ci:=0 to 15 do setpalette(ci,pal[ci]);
            if (escolha='P') or (escolha='p') then plano else quadrante;
            if (tecla<>#27) and (tecla<>'g') and (tecla<>'G') then repeat tecla:=readkey until
                           (tecla=#27) or (tecla='g') or (tecla='G');
            if (tecla='g') or (tecla='G') then
                         gravar
                         else
                         closegraph
      end;      { fim do procedimento desenhar }







begin                {  principio do programa }
   repeat
      fim:=false;
      clrscr;
      gotoxy(30,8); write('d - desenhar');
      gotoxy(30,12);write('v - ver imagem gravada');
      gotoxy(30,16); write('t - terminar');
      gotoxy(80,25); copyright;
      repeat opcao:=upcase(readkey) until (opcao='D') or (opcao='T') or (opcao='V');
      if opcao='D' then
                   desenhar
                   else
                   if opcao='V' then
                                verimag
                                else
                                fim:=true
   until fim
end.                   { fim do programa }
