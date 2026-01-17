{ Auxiliar nß 3 do MinÇrius }
Unit Mine3;

interface

uses Crt, Graph, Mine31, Mine21, KeyTTT5, StrnTTT5;

procedure Dici;
procedure Indi;
procedure Bibl;
procedure Ajuda(ecra: byte);

implementation

const G50 : FillPatternType = ($AA, $55, $AA, $55, $AA, $55, $AA, $55);

var ch : char;

{ P†gina 1 do ecrÑ do MinÇrius  Ajuda }
procedure Pag01;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - menu principal');
  EscE(50,90,'DescriáÑo do ecrÑ: Menu de 10 barras pressionaveis');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(330,110,'Rato - Selecciona uma barra');
  EscE(50,130,'Esc'); EscE(112,130,'Vai para o MS-DOS');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'Enter'); EscE(112,160,'Escolhe a funáÑo da barra pressionada');
  EscE(50,175,'Tab'); EscE(112,175,'Selecciona uma barra (de cima para baixo)');
  EscE(50,190,'S-Tab'); EscE(112,190,'Selecciona uma barra (de baixo para cima)');
  EscE(50,205,'Home'); EscE(112,205,'Selecciona a barra do canto superior esquerdo (primeira)');
  EscE(50,220,'End'); EscE(112,220,'Selecciona a barra do canto inferior direito (£ltima)');
  EscE(50,235,'SetaE'); EscE(112,235,'Selecciona uma barra (de cima para baixo)');
  EscE(50,250,'SetaD'); EscE(112,250,'Selecciona uma barra (de baixo para cima)');
  EscE(50,265,'SetaC'); EscE(112,265,'Selecciona uma barra (de cima para baixo, da esq. para a dir.)');
  EscE(50,280,'SetaB'); EscE(112,280,'Selecciona uma barra (de baixo para cima, da dir. para a esq.)');
  EscE(50,295,'ClicE'); EscE(112,295,'Escolhe a funáÑo da barra pressionada');
  EscE(50,310,'ClicD'); EscE(112,310,'Vai para o MS-DOS');
  EscE(50,325,'Space'); EscE(112,325,'Selecciona uma barra (de cima para baixo, da esq. para a dir.)');
end;

{ P†gina 2 do ecrÑ do MinÇrius  Ajuda }
procedure Pag02;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Lista dos Minerais');
  EscE(50,90,'DescriáÑo do ecrÑ: Listagem da informaáÑo de 156 minerais');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'PgDn'); EscE(112,160,'Salta +10 p†ginas');
  EscE(50,175,'PgUp'); EscE(112,175,'Salta -10 p†ginas');
  EscE(50,190,'Home'); EscE(112,190,'Salta para a primeira p†gina');
  EscE(50,205,'End'); EscE(112,205,'Salta para a £ltima p†gina');
  EscE(50,220,'SetaC'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'SetaB'); EscE(112,235,'Salta para a p†gina seguinte');
  EscE(50,250,'ClicD'); EscE(112,250,'Volta para o menu principal');
  EscE(50,265,'F10'); EscE(112,265,'Imprime os dados da corrente p†gina');
end;

{ P†gina 3 do ecrÑ do MinÇrius  Ajuda }
procedure Pag03;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Lista dos Minerais');
  EscE(50,90,'DescriáÑo do ecrÑ: Janela de aprovaáÑo para Imprimir');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta atr†s e nÑo imprime');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'Enter'); EscE(112,160,'Imprime dados');
  EscE(50,175,'ClicE'); EscE(112,175,'Imprime dados');
  EscE(50,190,'ClicD'); EscE(112,190,'Volta atr†s e nÑo imprime');
end;

{ P†gina 4 do ecrÑ do MinÇrius  Ajuda }
procedure Pag04;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - FormaáÑo dos minerais');
  EscE(50,90,'DescriáÑo do ecrÑ: Desc. dos processos que podem originar um mineral');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(330,110,'Rato - Selecciona um t¢pico');
  EscE(50,130,'Esc'); EscE(112,130,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'Enter'); EscE(112,160,'Escolhe o corrente t¢pico');
  EscE(50,175,'Tab'); EscE(112,175,'Selecciona o t¢pico seguinte');
  EscE(50,190,'S-Tab'); EscE(112,190,'Selecciona o t¢pico anterior');
  EscE(50,205,'PgDn'); EscE(112,205,'Salta para a p†gina seguinte');
  EscE(50,220,'PgUp'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'Home'); EscE(112,235,'Salta para a primeira p†gina');
  EscE(50,250,'End'); EscE(112,250,'Salta para a £ltima p†gina');
  EscE(50,265,'SetaE'); EscE(112,265,'Selecciona o t¢pico anterior');
  EscE(50,280,'SetaD'); EscE(112,280,'Selecciona o t¢pico seguinte');
  EscE(50,295,'SetaC'); EscE(112,295,'Salta para a p†gina anterior');
  EscE(50,310,'SetaB'); EscE(112,310,'Salta para a p†gina seguinte');
  EscE(50,325,'ClicE'); EscE(112,325,'Escolhe o corrente t¢pico');
  EscE(50,340,'ClicD'); EscE(112,340,'Volta para o menu principal');
end;

{ P†gina 5 do ecrÑ do MinÇrius  Ajuda }
procedure Pag05;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Como reconhecer');
  EscE(50,90,'DescriáÑo do ecrÑ: Modos de reconhecimento de um mineral');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(330,110,'Rato - Selecciona um t¢pico');
  EscE(50,130,'Esc'); EscE(112,130,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'Enter'); EscE(112,160,'Escolhe o corrente t¢pico');
  EscE(50,175,'Tab'); EscE(112,175,'Selecciona o t¢pico seguinte');
  EscE(50,190,'S-Tab'); EscE(112,190,'Selecciona o t¢pico anterior');
  EscE(50,205,'PgDn'); EscE(112,205,'Salta para a p†gina seguinte');
  EscE(50,220,'PgUp'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'Home'); EscE(112,235,'Salta para a primeira p†gina');
  EscE(50,250,'End'); EscE(112,250,'Salta para a £ltima p†gina');
  EscE(50,265,'SetaE'); EscE(112,265,'Selecciona o t¢pico seguinte');
  EscE(50,280,'SetaD'); EscE(112,280,'Selecciona o t¢pico anterior');
  EscE(50,295,'SetaC'); EscE(112,295,'Salta para a p†gina anterior');
  EscE(50,310,'SetaB'); EscE(112,310,'Salta para a p†gina seguinte');
  EscE(50,325,'ClicE'); EscE(112,325,'Escolhe o tema do t¢pico pressionado');
  EscE(50,340,'ClicD'); EscE(112,340,'Vai para o MS-DOS');
  EscE(50,355,'F10'); EscE(112,355,'Vai para o ecrÑ do Quadro dos Sistemas Cristalinos');
end;

{ P†gina 6 do ecrÑ do MinÇrius  Ajuda }
procedure Pag06;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Como reconhecer');
  EscE(50,90,'DescriáÑo do ecrÑ: Quadro dos Sistemas Cristalinos');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta atr†s');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'A a Z'); EscE(112,160,'Zoom e informaáÑo sobre um cristal');
end;

{ P†gina 7 do ecrÑ do MinÇrius  Ajuda }
procedure Pag07;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Como reconhecer');
  EscE(50,90,'DescriáÑo do ecrÑ: Zoom e informaáÑo sobre um cristal');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta atr†s');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'A a Z'); EscE(112,160,'Zoom e informaáÑo sobre outro cristal');
end;

{ P†gina 8 do ecrÑ do MinÇrius  Ajuda }
procedure Pag08;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - ClassificaáÑo dos minerais');
  EscE(50,90,'DescriáÑo do ecrÑ: As 9 classes de minerais');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'PgDn'); EscE(112,160,'Salta para a p†gina seguinte');
  EscE(50,175,'PgUp'); EscE(112,175,'Salta para a p†gina anterior');
  EscE(50,190,'Home'); EscE(112,190,'Salta para a primeira p†gina');
  EscE(50,205,'End'); EscE(112,205,'Salta para a £ltima p†gina');
  EscE(50,220,'SetaC'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'SetaB'); EscE(112,235,'Salta para a p†gina seguinte');
  EscE(50,250,'ClicD'); EscE(112,250,'Volta para o menu principal');
end;

{ P†gina 9 do ecrÑ do MinÇrius  Ajuda }
procedure Pag09;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Litosfera');
  EscE(50,90,'DescriáÑo do ecrÑ: Percentagens dos elementos presentes na litosfera');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'PgDn'); EscE(112,160,'Salta para a p†gina seguinte');
  EscE(50,175,'PgUp'); EscE(112,175,'Salta para a p†gina anterior');
  EscE(50,190,'Home'); EscE(112,190,'Salta para a primeira p†gina');
  EscE(50,205,'End'); EscE(112,205,'Salta para a £ltima p†gina');
  EscE(50,220,'SetaC'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'SetaB'); EscE(112,235,'Salta para a p†gina seguinte');
  EscE(50,250,'ClicD'); EscE(112,250,'Volta para o menu principal');
end;

{ P†gina 10 do ecrÑ do MinÇrius  Ajuda }
procedure Pag10;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Dicion†rio MinÇrius');
  EscE(50,90,'DescriáÑo do ecrÑ: Gloss†rio Minerol¢gico');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(330,110,'Rato - Selecciona um t¢pico');
  EscE(50,130,'Esc'); EscE(112,130,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'Enter'); EscE(112,160,'Escolhe o corrente t¢pico');
  EscE(50,175,'Tab'); EscE(112,175,'Selecciona o t¢pico seguinte');
  EscE(50,190,'S-Tab'); EscE(112,190,'Selecciona o t¢pico anterior');
  EscE(50,205,'PgDn'); EscE(112,205,'Salta para a p†gina seguinte');
  EscE(50,220,'PgUp'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'Home'); EscE(112,235,'Salta para a primeira p†gina');
  EscE(50,250,'End'); EscE(112,250,'Salta para a £ltima p†gina');
  EscE(50,265,'SetaE'); EscE(112,265,'Selecciona o t¢pico anterior');
  EscE(50,280,'SetaD'); EscE(112,280,'Selecciona o t¢pico seguinte');
  EscE(50,295,'SetaC'); EscE(112,295,'Salta para a p†gina anterior');
  EscE(50,310,'SetaB'); EscE(112,310,'Salta para a p†gina seguinte');
  EscE(50,325,'ClicE'); EscE(112,325,'Escolhe o corrente t¢pico');
  EscE(50,340,'ClicD'); EscE(112,340,'Volta para o menu principal');
end;

{ P†gina 11 do ecrÑ do MinÇrius  Ajuda }
procedure Pag11;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Indice dos sistemas');
  EscE(50,90,'DescriáÑo do ecrÑ: Indice dos minerais segundo o sistema a que pertencem');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'PgDn'); EscE(112,160,'Salta para a p†gina seguinte');
  EscE(50,175,'PgUp'); EscE(112,175,'Salta para a p†gina anterior');
  EscE(50,190,'Home'); EscE(112,190,'Salta para a primeira p†gina');
  EscE(50,205,'End'); EscE(112,205,'Salta para a £ltima p†gina');
  EscE(50,220,'SetaC'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'SetaB'); EscE(112,235,'Salta para a p†gina seguinte');
  EscE(50,250,'ClicD'); EscE(112,250,'Volta para o menu principal');
end;

{ P†gina 12 do ecrÑ do MinÇrius  Ajuda }
procedure Pag12;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Biblioteca');
  EscE(50,90,'DescriáÑo do ecrÑ: Livros que o utilizador pode consultar');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,135,'Volta para o menu principal');
  EscE(50,145,'F1'); EscE(112,150,'Chama este ecrÑ');
  EscE(50,160,'Enter'); EscE(112,165,'Volta para o menu principal');
  EscE(50,175,'ClicE'); EscE(112,180,'Volta para o menu principal');
  EscE(50,190,'ClicD'); EscE(112,195,'Volta para o menu principal');
end;

{ P†gina 13 do ecrÑ do MinÇrius  Ajuda }
procedure Pag13;
begin
  setfillstyle(1,3);
  bar(45,65,595,357);
  settextstyle(2,0,5);
  settextjustify(0,0);
  EscE(50,75,'Nome do ecrÑ:      MinÇrius - Ajuda');
  EscE(50,90,'DescriáÑo do ecrÑ: EcrÑ de ajuda para todo o programa');
  setcolor(2);
  line(45,96,595,96);
  setcolor(15);
  line(44,95,593,95);
  EscE(50,110,'Tecla - FunáÑo da tecla');
  EscE(50,130,'Esc'); EscE(112,130,'Volta atr†s');
  EscE(50,145,'F1'); EscE(112,145,'Chama este ecrÑ');
  EscE(50,160,'PgDn'); EscE(112,160,'Salta para a p†gina seguinte');
  EscE(50,175,'PgUp'); EscE(112,175,'Salta para a p†gina anterior');
  EscE(50,190,'Home'); EscE(112,190,'Salta para a primeira p†gina');
  EscE(50,205,'End'); EscE(112,205,'Salta para a £ltima p†gina');
  EscE(50,220,'SetaC'); EscE(112,220,'Salta para a p†gina anterior');
  EscE(50,235,'SetaB'); EscE(112,235,'Salta para a p†gina seguinte');
  EscE(50,250,'ClicD'); EscE(112,250,'Volta para o menu principal');
  EscE(50,265,'F10'); EscE(112,265,'Acerca do MinÇrius');
end;

{ Controlador do teclado do ecrÑ Ajuda }
procedure Ajuda(ecra: byte);
Label 1,2,3,4,5,6;
var pagA : byte;
begin
  Setlinestyle(0,0,0);
  if (ecra = 31) or (ecra = 32) or (ecra = 0) then goto 3
  else goto 5;
3:Ec('Ajuda','F1 - Ajuda  Esc - Vai para o Menu principal  F10 - Acerca do MinÇrius');
  goto 6;
5:Ec2('Ajuda','F1 - Ajuda  Esc - Vai para o Menu principal  F10 - Acerca do MinÇrius');
6:outtextxy(45,385,'Esc   F1');
  outtextxy(45,395,'PgDn  PgUp  Home  End');
  outtextxy(45,405,'            SetaC SetaB');
  outtextxy(45,415,'      ClicD        F10');
  settextstyle(1,0,0);
  settextjustify(1,1);
  case ecra of
        0: pagA:=  1;
        1: pagA:=  2;
       11: pagA:=  3;
        2: pagA:=  4;
        3: pagA:=  5;
       31: pagA:=  6;
       32: pagA:=  7;
        4: pagA:=  8;
        5: pagA:=  9;
        6: pagA:= 10;
        7: pagA:= 11;
        8: pagA:= 12;
  end;
1:case pagA of
        1: Pag01;
        2: Pag02;
        3: Pag03;
        4: Pag04;
        5: Pag05;
        6: Pag06;
        7: Pag07;
        8: Pag08;
        9: Pag09;
       10: Pag10;
       11: Pag11;
       12: Pag12;
       13: Pag13;
  end;
  SetFillStyle(1,7);
  settextjustify(2,0);
  settextstyle(3,0,0);
  bar(201,376,269,419);
  setcolor(15);
  outtextxy(272,407,Int_to_Str(PagA));
  outtextxy(352,407,'13');
2:ch:= getkey;
  case Ord(ch) of
       200,201:
               begin
                 pagA := pagA - 1;
                 if pagA = 0 then pagA := 13;
                 goto 1;
               end;
       208,209:
               begin
                 pagA := pagA + 1;
                 if pagA = 14 then pagA := 1;
                 goto 1;
               end;
       199:    begin
                 if pagA = 1 then goto 2;
                 pagA := 1;
                 goto 1;
               end;
       207:    begin
                 if pagA = 13 then goto 2;
                 pagA := 13;
                 goto 1;
               end;
       27,132: goto 4;
       187:    begin
                 if pagA = 13 then goto 2;
                 pagA := 13;
                 goto 1;
               end;
       196:    begin
                 Acerca(ecra);
                 goto 3;
               end;
       else
               goto 2;

  end;
4:if (ecra = 31) or (ecra = 32) or (ecra = 0) then begin setfillpattern(G50,6); bar(1,30,638,450); end;
end;

{ Procedure utilizada pelo Gloss†rio para fazer o nome e definiáÑo }
procedure Esc(y: integer; t2,t1: string);
begin
  settextjustify(0,0);
  settextstyle(2,0,5);
  EscE(50,y,t1);
  EscE(220,y,t2);
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP1;
begin
  Esc(120,'mineral de  importÉncia  secund†ria  numa rocha,','Acess¢rio:');
  Esc(135,'nÑo sendo necess†rio a definiáÑo desta.','');
  Esc(150,'cristal fino e alongado semelhante a uma agulha.','Acicular:');
  Esc(165,'mineral  encontrado  ocasionalmente  numa rocha,','Acidental:');
  Esc(180,'como as pedras preciosas.','');
  Esc(195,'exposiáÑo directamente observ†vel de uma rocha.','Afloramento:');
  Esc(210,'aglomerado de  cristais  de uma ou mais espÇcies','Agregado:');
  Esc(225,'minerais.','');
  Esc(240,'mineral que aparece em v†rias cores, dependendo','Alocrom†tico:');
  Esc(255,'das impurezas que contÇm.','');
  Esc(270,'mineral que se formou num local diferente de on-','Alotigeno:');
  Esc(285,'de foi achado.','');
  Esc(300,'dep¢sito sedimentar de origem fluvial.','Aluvial:');
  Esc(315,'estado s¢lido em que a ordem na  distribuiáÑo de','Amorfo:');
  Esc(330,'†tomos, iîes ou molÇculas nÑo est† definida.','');
  Esc(345,'iÑo de carga elÇctrica negativa.','AniÑo:');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP2;
begin
  Esc(120,'fen¢meno  pelo qual as  propriedades  fisicas de','Anisotropia:');
  Esc(135,'um mineral variam conforme a direcáÑo.','');
  Esc(150,'a menor part°cula de uma  substÉncia simples que','Atomo:');
  Esc(165,'entra na sua composiáÑo e na dos seus compostos.','');
  Esc(180,'mineral que se formou no local onde foi achado.','Autigeno:');
  Esc(195,'cristal fino e muito alongado','Bacilar');
  Esc(210,'refracáÑo  da  luz  em  dois  raios  polarizados','Birrefrigància:');
  Esc(225,'ortogonais entre si.','');
  Esc(240,'s¢lido expelido violentamente por um vulcÑo.','Bomba VulcÉnica:');
  Esc(255,'um agregado globular (como cachos de uva).','Botrioidal:');
  Esc(270,'aparància  da   superficie   de  um   mineral  Ö','Brilho:');
  Esc(285,'luz reflectida.','');
  Esc(300,'forma  de   lapidaáÑo   que  produz  superficies','CabochÑo:');
  Esc(315,'convexas.','');
  Esc(330,'iÑo de carga elÇctrica positiva.','CatiÑo:');
  Esc(345,'sedimento    formado  de  fragmentos  de  rochas','Cl†stico:');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP3;
begin
  Esc(120,'prÇexistentes.','');
  Esc(135,'fracturaáÑo de certos minerais ao longo dos pla-','Clivagem:');
  Esc(150,'nos de menor coesÑo do ret°culo cristalino.','');
  Esc(165,'cristal alongado mas nÑo muito fino.','Colunar:');
  Esc(180,'fractura em superficies curvas.','Conchoidal:');
  Esc(195,'m¢dulo  de  dimensÑo  vari†vel  e  de composiáÑo','ConcreáÑo:');
  Esc(210,'diferente da rocha circundante.','');
  Esc(225,'corpo s¢lido  homogÇnico, constitu°do  por †tomos','Cristal:');
  Esc(240,'e iîes  ordenados  regularmente, que  apresenta','');
  Esc(255,'externamente superf°cies planas e lisas.','');
  Esc(270,'unidade de medida de radioactividade.','Curie:');
  Esc(285,'precipitaáÑo de ¢xidos sobre fracturas de rochas','Dendrito:');
  Esc(300,'com a forma de uma ramificaáÑo de arvore.','');
  Esc(315,'concentraáÑo econ¢micamente £til de um minÇrio.','Dep¢sito mineral:');
  Esc(330,'material que Ç repelido levemente por um magneto.','DiamagnÇtico:');
  Esc(345,'tipo de algas com uma r°gida carapaáa silicosa.','Diatom†ceas:');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP4;
begin
  Esc(120,'cavidade   achatada  coberta   internamente  por','Drusa:');
  Esc(135,'cristais.','');
  Esc(150,'resistància dos minerais aos arranhîes.','Dureza:');
  Esc(165,'dep¢sito de material originado por intempÇries.','Eluvial:');
  Esc(180,'conjunto dos  fen¢menos  na  superf°cie da Terra','ErosÑo:');
  Esc(195,'que actuam na degradaáÑo das rochas.','');
  Esc(210,'quantidade f°sica que nÑo varia com a direcáÑo.','Escalar:');
  Esc(225,'nome comum aos minerais de boa clivagem.','Espacto:');
  Esc(240,'mineral que constitui e classifica uma rocha.','Essencial:');
  Esc(255,'precipitado  alongado  de  calcita que  pende do','Estalactite:');
  Esc(270,'tecto de uma gruta, crescendo para baixo.','');
  Esc(285,'precipitado alongado de calcita depositado sobre','Estalagmite:');
  Esc(300,'o piso de uma gruta, crescendo para cima.','');
  Esc(315,'rocha  sedimentar  formada pela  precipitaáÑo de','Evaporito:');
  Esc(330,'sais quando se d† a evaporaáÑo de †guas salinas.','');
  Esc(345,'(consulte M†fico).','FÇmica:');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP5;
begin
  Esc(120,'material que Ç fortemente atra°do por um magneto.','FerromagnÇtico:');
  Esc(135,'luminescància   que   acaba   com  o cessar  de','Fluorescància:');
  Esc(150,'radiaáîes excitantes.','');
  Esc(165,'grupo de  faces  de  um  cristal  simÇtricamente','Forma cristalina:');
  Esc(180,'equivalentes.','');
  Esc(195,'composiáÑo  qu°mica de uma  substÉncia  expressa','F¢rmula:');
  Esc(210,'por s°mbolos.','');
  Esc(225,'luminescància  que  nÑo  acaba  com o cessar de','Fosforescància:');
  Esc(240,'radiaáîes excitantes.','');
  Esc(255,'emissÑo vulcÉnica de gases e vapores.','Fumarola:');
  Esc(270,'parte nÑo aproveitada dos dep¢sitos de minerais.','Ganga:');
  Esc(285,'associaáÑo (de acordo com certas leis), de um ou','Geminado:');
  Esc(300,'mais cristais da mesma espÇcie.','');
  Esc(315,'cavidade  arredondada  coberta  internamente por','Geodo:');
  Esc(330,'cristais.','');
  Esc(345,'forma   externa  normalmente  assumida  por  uma','H†bito:');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP6;
begin
  Esc(120,'espÇcie mineral.','');
  Esc(135,'originado  por  soluáîes aquecidas  ascendentes,','Hidrotermal:');
  Esc(150,'que  podem  depositar  sais ou alterar  minerais','');
  Esc(165,'prÇ-existentes.','');
  Esc(180,'cristal com todas as faces iguais.','Holoedro:');
  Esc(195,'†tomo que possui carga elÇctrica.','IÑo:');
  Esc(210,'mineral com uma s¢ cor.','Idiocrom†tico:');
  Esc(225,'rocha origin†ria da cristalizaáÑo do magma.','Ignea:');
  Esc(240,'particulas s¢lidas, liquidas ou gasosas que  es-','Inclusîes:');
  Esc(255,'tÑo contidas em um mineral.','');
  Esc(270,'conjunto de  processos que ocasionam a decompo-','Intemperismo:');
  Esc(285,'siáÑo de minerais e rochas expostos Ö atmosfera.','');
  Esc(300,'fen¢meno pelo qual minerais  qu°micamente diver-','Isomorfismo:');
  Esc(315,'sos, apresentam a mesma estrutura cristalina.','');
  Esc(330,'corpo cujas  propriedades  f°sicas sÑo iguais em','Is¢tropo:');
  Esc(345,'todas as direcáîes.','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP7;
begin
  Esc(120,'(consulte Dep¢sito mineral).','Jazida:');
  Esc(135,'per°odo geol¢gico que iniciou h† 190 Ma e findou','Jur†ssico:');
  Esc(150,'h† 136 Ma. (Ma: milhîes de anos)','');
  Esc(165,'cristal achatado (semelhante a lÉminas).','Lamelar:');
  Esc(180,'acto de  lavrar (segundo  a  sua  clivagem), uma','LapidaáÑo:');
  Esc(195,'pedra preciosa.','');
  Esc(210,'emissÑo de luz  por um  mineral  exposto a algum','Luminescància:');
  Esc(225,'tipo de radiaáÑo.','');
  Esc(240,'mineral  ferromagnesiano  de  cor  escura; rocha','M†fico:');
  Esc(255,'rica nesses minerais.','');
  Esc(270,'material em  estado de  fusÑo que se  cristaliza','Magma:');
  Esc(285,'nas rochas °gneas.','');
  Esc(300,'agregado com formas arredondadas','Mamilonar:');
  Esc(315,'tipo de rocha que sofreu transformaáîes sob con-','Metam¢rfica:');
  Esc(330,'diáîes de pressÑo e temperaturas  diferentes da-','');
  Esc(345,'quelas em que se formou.','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP8;
begin
  Esc(120,'transformaáÑo  em um mineral ou rocha por  acáÑo','Metassomatismo:');
  Esc(135,'de  solucáîes  hidrotermais ou  gases de  origem','');
  Esc(150,'magm†tica.','');
  Esc(165,'corpo  extra-terrestre  que  cai  na  superficie','Meteorito:');
  Esc(180,'da Terra.','');
  Esc(195,'mineral  ou rocha que pode ser trabalhado para a','MinÇrio:');
  Esc(210,'extraáÑo de uma ou mais substÉncias £teis.','');
  Esc(225,'a menor quantidade de uma  substÉncia que existe','MolÇcula:');
  Esc(240,'livremente.','');
  Esc(255,'local onde  certo  mineral Ç encontrado, sem que','Ocorrància:');
  Esc(270,'este tenha que ser um minÇrio.','');
  Esc(285,'massa terrosa formada por microcristais.','Ocra:');
  Esc(300,'reflexÑo  de luz por certos minerais, que a con-','Opalescància:');
  Esc(315,'centram em faixas estreitas e iridescentes.','');
  Esc(330,'transformaáÑo de um mineral em outro com a estru-','Paramorfismo:');
  Esc(345,'tura alterada mas com a composiáÑo qu°mica igual.','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP9;
begin
  Esc(120,'part°cula  constitu°da por  dois pr¢tîes e  dois','Part°cula alfa:');
  Esc(135,'neutrîes, produzida  durante a  desintegraáÑo de','');
  Esc(150,'certos n£cleus at¢micos.','');
  Esc(165,'elÇctrÑo  produzido produzido pela  desitegraáÑo','Part°cula beta:');
  Esc(180,'de certos n£cleus at¢micos.','');
  Esc(195,'massa  de metal nativo encontrada  em  dep¢sitos','Pepita:');
  Esc(210,'aluviais.','');
  Esc(225,'fen¢meno pelo qual determinados cristais, subme-','Piezo-elÇctricidade:');
  Esc(240,'tidos a pressÑo apresentam cargas elÇctricas.','');
  Esc(255,'fen¢meno pelo qual certos cristais, submetidos a','Piro-elÇctricidade:');
  Esc(270,'calor apresentam cargas elÇctricas.','');
  Esc(285,'veio formado pela acáÑo de gases magm†ticos.','Pneumatol°tico:');
  Esc(300,'fen¢meno  pelo qual um mineral se  transforma em','Polimorfismo:');
  Esc(315,'mais de um sistema  cristalino, conforme as suas','');
  Esc(330,'condiáîes de formaáÑo.','');
  Esc(345,'fen¢meno  pelo  qual a  forma de  um  mineral se','Pseudomorfismo:');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP10;
begin
  Esc(120,'mantÇm ap¢s a sua transformaáÑo em outro.','');
  Esc(135,'desintegraáÑo espontÉnea de n£cleus at¢micos com','Radioactividade:');
  Esc(150,'emissÑo de part°culas ou ondas electromagnÇticas.','');
  Esc(165,'onda  electromagnÇtica altamente penetrante emi-','Raios gama:');
  Esc(180,'tida  por certos n£cleus  radioactivos durante a','');
  Esc(195,'sua desintegraáÑo (similar ao raio X).','');
  Esc(210,'modificaáÑo da forma ou da  direcáÑo de uma onda','RefraáÑo:');
  Esc(225,'ao atravessar a interface que separa os meios.','');
  Esc(240,'agregado que tem a forma de rim.','Reniforme:');
  Esc(255,'conjunto de pontos que representam as part°culas','Ret°culo cristalino:');
  Esc(270,'(†tomos, iîes) de um  cristal, e que  constituem','');
  Esc(285,'uma rede tridimensional.','');
  Esc(300,'mineral formado pela alteraáÑo de outro.','Secund†rio:');
  Esc(315,'rocha  derivada da deposiáÑo de material rochoso','Sedimentar:');
  Esc(330,'nas condiáîes da superf°cie  terrestre; forma-se','');
  Esc(345,'em meio aÇreo ou aqu†tico','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP11;
begin
  Esc(120,'cristalizaáÑo selectiva dos minerais do magma.','SegregaáÑo magm†tica:');
  Esc(135,'mineral  de  alum°nio ou  sil°cio de cor  clara;','Si†lico:');
  Esc(150,'rocha rica nesses minerais.','');
  Esc(165,'passagem  do estado s¢lido para o estado gasoso,','SublimaáÑo:');
  Esc(180,'sem passar pelo estado liqu°do','');
  Esc(195,'mistura homogÇnica de substÉncias s¢lidas.','SoluáÑo s¢lida:');
  Esc(210,'cristal achatado com forma de t†bua ou tabela.','Tabular:');
  Esc(225,'resistància de um mineral Ö fracturaáÑo.','Tenacidade:');
  Esc(240,'transformaáÑo por reacáÑo nuclear de um elemento','TransmutaáÑo:');
  Esc(255,'qu°mico em outro.','');
  Esc(270,'tipo de calc†rio poroso de aspecto celular, for-','Travertino:');
  Esc(285,'mado por fontes ricas em bicarbonato de c†lcio.','');
  Esc(300,'ornato arquitect¢nico da Grecia antiga que cons-','Triglifo:');
  Esc(315,'ta tràs sulcos.','');
  Esc(330,'massa  mineral  tabular que  preenche  fendas de','Veio:');
  Esc(345,'rocha prÇ-existente; tem origem magm†tica.','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GP12;
begin
  Esc(120,'quantidade fis°ca que varia segundo a direcáÑo.','Vetor');
  Esc(135,'estrutura pr¢pria de rochas  metam¢rficas, cujos','Xistosidade:');
  Esc(150,'minerais   se   dispîem   em   planos  paralelos','');
  Esc(165,'ou sub-paralelos.','');
  Esc(180,'(ou de mineraáÑo) parte  superior  das  jazidas,','Zona de oxidaáÑo:');
  Esc(195,'submetidas  directamente   ao   intemperismo   e','');
  Esc(210,'delimitadas inferiormente  pelo  lenáo  de  †gua','');
  Esc(225,'subterrÉnea.','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GPR1;
begin
  Esc(120,'rocha   metam¢rfica  maciáa  e  escura, composta','Antib¢lito:');
  Esc(135,'essencialmente por anfib¢lios e feldspatos.','');
  Esc(150,'rocha   sedimentar  originada  da   consolidaáÑo','Arenito:');
  Esc(165,'da areia.','');
  Esc(180,'rocha de origem  vulcÉnica, constitu°da na maior','Basalto:');
  Esc(195,'parte de plagiocl†sio, augita e com olivina.','');
  Esc(210,'rocha °gnea e granular, constitu°da por  plagio-','Diorito:');
  Esc(225,'cl†sio, hornblenda, alguma biotita e augita.','');
  Esc(240,'rocha °gnea, de granulaáÑo  grossa e cor escura,','Gabro:');
  Esc(255,'composta quase na sua totalidade de plagiocl†sio,','');
  Esc(270,'augita e olivina.','');
  Esc(285,'rocha  metam¢rfica, bandada com camadas quartzo-','Gnaisse:');
  Esc(300,'feldsp†ticas e camadas mic†ceas.','');
  Esc(315,'rocha  metam¢rfica, constitu°da  totalmente  por','Gondito:');
  Esc(330,'espessartita, rodonita, quartzo  e  outros mine-','');
  Esc(345,'rais. Encontra-se em um ambiente oxidante.','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GPR2;
begin
  Esc(120,'rocha  °gnea  granular, composta   por  quartzo,','Granito:');
  Esc(135,'feldspato alcalino, plagiocl†sio e micas.','');
  Esc(150,'rocha °gnea, composta de olivina, bronzita, bio-','Kimberlito:');
  Esc(165,'tita, piropo e perovskita.(rocha dos diamantes).','');
  Esc(180,'rocha  °gnea, granular, geralmente associada aos','Pegmatito:');
  Esc(195,'granitos e constituida de cristais centimÇtricos','');
  Esc(210,'a mÇtricos, formada a  partir de magma  residual.','');
  Esc(225,'(bastante prop°cia para formar gemas)','');
  Esc(240,'rocha  metam¢rfica, constitu°da de  rodocrosita,','Queluzito:');
  Esc(255,'espessartita, rodonita, quartzo, e outros  mine-','');
  Esc(270,'rais, podendo ter grafita( carbono puro, sistema','');
  Esc(285,'hexagonal, e alabandita [MnS] ). Encontra-se num','');
  Esc(300,'ambiente reductor.','');
  Esc(315,'rocha  resultante da alteraáÑo hidrotermal de um','Serpentinito:');
  Esc(330,'peridotito  em que toda a olivina se transformou','');
  Esc(345,'em serpentina.','');
end;

{ P†gina do ecrÑ Gloss†rio }
procedure GPR3;
begin
  Esc(120,'designaáÑo  de um grupo de  rochas metam¢rficas,','Xisto:');
  Esc(135,'com  xistosidade n°tida. Empregado  erroneamente','');
  Esc(150,'para  designar  certas  rochas  sedimentares, os','');
  Esc(165,'folhelhos.','');
end;

{ Faz a caixa On or Off }
procedure T1(t1 : boolean);
begin
  if t1 = True then
     begin
       setfillstyle(1,3);
       bar(360,375,480,387);
       setcolor(7);
       line(360,375,479,375);
       line(360,375,360,386);
       setcolor(11);
       line(480,387,360,387);
       line(480,387,480,375);
       settextstyle(2,0,0);
       settextjustify(1,1);
       setcolor(2);
       outtextxy(421,380,'Termos minerais');
       setcolor(15);
       outtextxy(420,379,'Termos minerais');
     end
  else
     begin
       setfillstyle(1,0);
       bar(360,375,480,387);
       setcolor(15);
       line(360,375,480,375);
       line(360,375,360,387);
       setcolor(7);
       line(480,387,361,387);
       line(480,387,480,375);
       settextstyle(2,0,0);
       settextjustify(1,1);
       setcolor(1);
       outtextxy(421,380,'Termos minerais');
       setcolor(15);
       outtextxy(420,379,'Termos minerais');
     end;
end;

{ Faz a caixa On or Off }
procedure T2(t2 : boolean);
begin
  if t2 = True then
     begin
       setfillstyle(1,3);
       bar(485,375,600,387);
       setcolor(7);
       line(485,375,599,375);
       line(485,375,485,386);
       setcolor(11);
       line(485,387,600,387);
       line(600,387,600,376);
       settextstyle(2,0,0);
       settextjustify(1,1);
       setcolor(2);
       outtextxy(541,380,'Rochas');
       setcolor(15);
       outtextxy(540,379,'Rochas');
     end
  else
     begin
       setfillstyle(1,0);
       bar(485,375,600,387);
       setcolor(15);
       line(485,375,600,375);
       line(485,375,485,387);
       setcolor(7);
       line(486,387,600,387);
       line(600,387,600,376);
       settextstyle(2,0,0);
       settextjustify(1,1);
       setcolor(1);
       outtextxy(541,380,'Rochas');
       setcolor(15);
       outtextxy(540,379,'Rochas');
     end;
end;

{ Controlador do Teclado do ecrÑ Gloss†rio }
procedure Dici;
Label 1,2,3,4,5;
var Tipo : Boolean;
    pag, pag2, top : byte;
begin
  Ec('Dicion†rio MinÇrius','F1 - Ajuda  Esc - Vai para o Menu principal  Rato - Escolhe outro t¢pico');
  goto 5;
3:Ec2('Dicion†rio MinÇrius','F1 - Ajuda  Esc - Vai para o Menu principal  Rato - Escolhe outro t¢pico');
5:outtextxy(45,385,'Esc   F1    Enter TABs');
  outtextxy(45,395,'PgDn  PgUp  Home  End');
  outtextxy(45,405,'SetaE SetaD SetaC SetaB');
  outtextxy(45,415,'ClicE ClicD Rato');
  settextjustify(2,0);
  setcolor(1);
  outtextxy(600,371,'Termos minerais');
  setcolor(15);
  outtextxy(599,370,'Termos minerais');
  settextjustify(1,1);
  settextstyle(8,0,0);
  EscE(320,73,'Gloss†rio');
  setcolor(2);
  line(45,100,594,100);
  setcolor(15);
  line(44,99,593,99);
  GP1;
  T1(True);
  T2(False);
  pag := 1;
  Tipo := False;
  Top := 1;
1:SetFillStyle(1,7);
  settextjustify(2,0);
  settextstyle(3,0,0);
  bar(201,376,269,419);
  setcolor(15);
  outtextxy(272,407,Int_to_Str(Pag));
  if Tipo then Pag2 := 3
  else Pag2 := 12;
  outtextxy(352,407,Int_to_Str(Pag2));
  settextjustify(0,0);
  settextstyle(2,0,5);
2:ch := getkey;
  case Ord(ch) of
       13,133:
               begin
                 if (top = 2) and (tipo = False) then
                    begin
                      setfillstyle(1,3); bar(45,101,598,358);
                      Tipo := True;
                      setfillstyle(1,0);
                      bar(510,361,609,374);
                      settextjustify(2,0);
                      settextstyle(2,0,0);
                      setcolor(1);
                      outtextxy(600,371,'Rochas');
                      setcolor(15);
                      outtextxy(599,370,'Rochas');
                      GPR1;
                      pag := 1;
                      setfillstyle(1,7);
                      bar(281,376,349,419);
                      goto 1;
                    end;
                 if (top = 1) and (tipo = True) then
                    begin
                      setfillstyle(1,3); bar(45,101,598,358);
                      Tipo := False;
                      setfillstyle(1,0);
                      bar(510,361,609,374);
                      settextjustify(2,0);
                      settextstyle(2,0,0);
                      setcolor(1);
                      outtextxy(600,371,'Termos minerais');
                      setcolor(15);
                      outtextxy(599,370,'Termos minerais');
                      GP1;
                      pag := 1;
                      setfillstyle(1,7);
                      bar(281,376,349,419);
                      goto 1;
                    end;
                 goto 2;
               end;
       208,209:
               begin
                 setfillstyle(1,3); bar(45,101,598,358);
                 if not tipo then
                    begin
                      if pag =  1 then begin pag :=  2; GP2; goto 1; end;
                      if pag =  2 then begin pag :=  3; GP3; goto 1; end;
                      if pag =  3 then begin pag :=  4; GP4; goto 1; end;
                      if pag =  4 then begin pag :=  5; GP5; goto 1; end;
                      if pag =  5 then begin pag :=  6; GP6; goto 1; end;
                      if pag =  6 then begin pag :=  7; GP7; goto 1; end;
                      if pag =  7 then begin pag :=  8; GP8; goto 1; end;
                      if pag =  8 then begin pag :=  9; GP9; goto 1; end;
                      if pag =  9 then begin pag := 10; GP10; goto 1; end;
                      if pag = 10 then begin pag := 11; GP11; goto 1; end;
                      if pag = 11 then begin pag := 12; GP12; goto 1; end;
                      if pag = 12 then begin pag := 1; GP1; goto 1; end;
                    end
                 else
                     begin
                      if pag = 1 then begin pag := 2; GPR2; goto 1; end;
                      if pag = 2 then begin pag := 3; GPR3; goto 1; end;
                      if pag = 3 then begin pag := 1; GPR1; goto 1; end;
                     end;
               end;
       200,201:
               begin
                 setfillstyle(1,3); bar(45,101,598,358);
                 if not tipo then
                    begin
                      if pag =  1 then begin pag :=  12; GP12; goto 1; end;
                      if pag =  2 then begin pag :=  1; GP1; goto 1; end;
                      if pag =  3 then begin pag :=  2; GP2; goto 1; end;
                      if pag =  4 then begin pag :=  3; GP3; goto 1; end;
                      if pag =  5 then begin pag :=  4; GP4; goto 1; end;
                      if pag =  6 then begin pag :=  5; GP5; goto 1; end;
                      if pag =  7 then begin pag :=  6; GP6; goto 1; end;
                      if pag =  8 then begin pag :=  7; GP7; goto 1; end;
                      if pag =  9 then begin pag :=  8; GP8; goto 1; end;
                      if pag = 10 then begin pag :=  9; GP9; goto 1; end;
                      if pag = 11 then begin pag := 10; GP10; goto 1; end;
                      if pag = 12 then begin pag := 11; GP11; goto 1; end;
                    end
                 else
                     begin
                      if pag = 1 then begin pag := 3; GPR3; goto 1; end;
                      if pag = 2 then begin pag := 1; GPR1; goto 1; end;
                      if pag = 3 then begin pag := 2; GPR2; goto 1; end;
                     end;
               end;
       199:    begin
                 if (not tipo) and (pag = 1) then goto 2;
                 if (tipo) and (pag = 1) then goto 2;
                 setfillstyle(1,3); bar(45,101,598,358);
                 if not tipo then begin pag := 1; GP1; goto 1; end
                 else begin pag := 1; GPR1; goto 1; end;
               end;
       207:    begin
                 if (not tipo) and (pag = 12) then goto 2;
                 if (tipo) and (pag = 3) then goto 2;
                 setfillstyle(1,3); bar(45,101,598,358);
                 if not tipo then begin pag := 12; GP12; goto 1; end
                 else begin pag := 3; GPR3; goto 1; end;
               end;
       9,143,203,205:
               begin
                 if top = 1 then begin top := 2; T1(False); T2(True); goto 2; end
                 else begin top := 1; T1(True); T2(False); goto 2 end;
               end;
       131:    begin
                 if top = 2 then goto 2;
                 top := 2; T1(False); T2(True); goto 2;
               end;
       130:    begin
                 if top = 1 then goto 2;
                 top := 1; T1(True); T2(False); goto 2;
               end;
       27,132: begin
                 setfillpattern(G50,6);
                 bar(1,30,638,450);
                 goto 4;
               end;
       187:    begin
                 Ajuda(6);
                 goto 3;
               end;
       else
               goto 2;

  end;
4:
end;

{ Procedure utilizada pelo ecrÑ Ind°ce dos Sistemas }
procedure I(x,y: integer; v1,v2: string);
begin
  settextjustify(0,0);
  EscE(x,y,v1);
  settextjustify(2,0);
  EscE(x+175,y,v2);
end;

{ P†gina do ecrÑ Ind°ce dos Sistemas }
procedure IP1;
begin
  setfillstyle(1,3);
  bar(45,120,225,355);
  setcolor(7);
  I(50,135,'I ELEMENTOS NATIVOS','');
  I(50,150,' ArsÇnio','13');
  I(50,165,' Cobre','45');
  I(50,180,' Diamante','55');
  I(50,195,' Enxofre','61');
  I(50,210,' Ferro mete¢rico','71');
  I(50,225,' Ouro','120');
  I(50,240,' Prata','127');
  I(50,270,'II SULFETOS','');
  I(50,285,' Argentita','12');
  I(50,300,' Arsenopirita','14');
  I(50,315,' Bismutinita','24');
  I(50,330,' Bornita','27');
  I(50,345,' Bournonita','28');
  setfillstyle(1,3);
  bar(230,120,410,355);
  setcolor(7);
  I(235,135,' Calcopirita','36');
  I(235,150,' Cin†brio','42');
  I(235,165,' Enargita','60');
  I(235,180,' Esfalerita','64');
  I(235,195,' Estibinita','68');
  I(235,210,' Galena','74');
  I(235,225,' Greenockita','79');
  I(235,240,' Marcassita','104');
  I(235,255,' Meneghinita','107');
  I(235,270,' Millerita','111');
  I(235,285,' Molibdenita','112');
  I(235,300,' Ouro-pigmento','121');
  I(235,315,' Pirita','124');
  I(235,330,' Pirrotita','126');
  I(235,345,' Quermesita','132');
  setfillstyle(1,3);
  bar(415,120,596,355);
  setcolor(7);
  I(420,135,' Siegenita','140');
  I(420,150,' Tennantita','143');
  I(420,165,' Tetraedrita','144');
  I(420,195,'III HALETOS','');
  I(420,210,' Atacamita','16');
  I(420,225,' Creedita','48');
  I(420,240,' Fluorita','72');
  I(420,255,' Quiolita','133');
  I(420,270,' Sal-gema','137');
  I(420,300,'IV OXIDOS E HIDROXIDOS','');
  I(420,315,' Anat†sio','5');
  I(420,330,' Betafita','22');
  I(420,345,' Brookita','30');
end;

{ P†gina do ecrÑ Ind°ce dos Sistemas }
procedure IP2;
begin
  setfillstyle(1,3);
  bar(45,120,225,355);
  setcolor(7);
  I(50,135,' Brucita','31');
  I(50,150,' Calced¢nia','34');
  I(50,165,' Cassiterita','38');
  I(50,180,' Cor°ndon','47');
  I(50,195,' Cuprita','53');
  I(50,210,' Goethita','78');
  I(50,225,' Hematita','83');
  I(50,240,' Huebnerita','89');
  I(50,255,' Ilmerita','90');
  I(50,270,' Magnetita','101');
  I(50,285,' Manganita','103');
  I(50,300,' Opala','118');
  I(50,315,' Perovskita','123');
  I(50,330,' Quartzo geminado','129');
  I(50,345,' Quartzo hialino','130');
  setfillstyle(1,3);
  bar(230,120,410,355);
  setcolor(7);
  I(235,135,' Quartzo pr†sio','131');
  I(235,150,' Rutilo','136');
  I(235,165,' Volframita','153');
  I(235,195,'V NITRATOS, CARBONATOS','');
  I(235,210,'  E BORATOS','');
  I(235,225,' Ankerita','7');
  I(235,240,' Aragonita','11');
  I(235,255,' Artinita','15');
  I(235,270,' Auricalcita','17');
  I(235,285,' Azurita','19');
  I(235,300,' Bismutita','25');
  I(235,315,' B¢rax','26');
  I(235,330,' Calcita','35');
  I(235,345,' Cerussita','40');
  setfillstyle(1,3);
  bar(415,120,596,355);
  setcolor(7);
  I(420,135,' Cobalto-calcita','44');
  I(420,150,' Colemanita','46');
  I(420,165,' Dolomita','58');
  I(420,180,' Dolomita rosa','59');
  I(420,195,' Estroncianita','70');
  I(420,210,' Fosgenita','73');
  I(420,225,' Hidromagnesita','87');
  I(420,240,' Ludwiguita','99');
  I(420,255,' Magnesita','100');
  I(420,270,' Malaquita','102');
  I(420,285,' Rodocrosita','134');
  I(420,300,' Siderita','139');
  I(420,315,' Smithsonita','141');
  I(420,330,' Witherita','154');
end;

{ P†gina do ecrÑ Ind°ce dos Sistemas }
procedure IP3;
begin
  setfillstyle(1,3);
  bar(45,120,225,355);
  setcolor(7);
  I(50,135,'VI SULFATOS, CROMATOS,','');
  I(50,150,'   MOLIBDATOS E','');
  I(50,165,'   TUNGSTATOS','');
  I(50,180,' Anglesita','6');
  I(50,195,' Barita','20');
  I(50,210,' Celestita','39');
  I(50,225,' Croco°ta','51');
  I(50,240,' Gipsita','75');
  I(50,255,' Leonita','95');
  I(50,270,' Linarita','97');
  I(50,285,' Scheelita','138');
  I(50,300,' Wulffenita','155');
  I(50,330,'VII FOSFATOS, ARSENI-','');
  I(50,345,'    ATOS E VANADIATOS','');
  setfillstyle(1,3);
  bar(230,120,410,355);
  setcolor(7);
  I(235,135,' Adamita','2');
  I(235,150,' Apatita','9');
  I(235,165,' Autunita','18');
  I(235,180,' Brasilianita','29');
  I(235,195,' Carnotita','37');
  I(235,210,' Lazulita','94');
  I(235,225,' Ludlamita','98');
  I(235,240,' Piromorfita','125');
  I(235,255,' Torbernita','146');
  I(235,270,' Turquesa','149');
  I(235,285,' Vanadinita','150');
  I(235,300,' Vivianita','152');
  I(235,330,'VIII SILICATOS','');
  I(235,345,' NESOSSILICATOS','');
  setfillstyle(1,3);
  bar(415,120,596,355);
  setcolor(7);
  I(420,135,'  Espessartita','66');
  I(420,150,'  Grossul†ria','80');
  I(420,165,'  Olivina','117');
  I(420,180,'  ZircÑo','156');
  I(420,210,' SUBNESOSSILICATOS','');
  I(420,225,'  Cianita','41');
  I(420,240,'  EsfÇnio','65');
  I(420,255,'  Estaurolita','67');
  I(420,270,'  Top†zio','145');
  I(420,300,' SOROSSILICATOS','');
  I(420,315,'  Clinozoista','43');
  I(420,330,'  Epidoto','62');
  I(420,345,'  Hemimorfita','84');
end;

{ P†gina do ecrÑ Ind°ce dos Sistemas }
procedure IP4;
begin
  setfillstyle(1,3);
  bar(45,120,225,355);
  setcolor(7);
  I(50,135,'  Himorfita azul','85');
  I(50,150,'  Ilva°ta','91');
  I(50,165,'  Melilita','106');
  I(50,180,'  Vesuvianita','151');
  I(50,210,' CICLOSSILICATOS','');
  I(50,225,'  Berilo','21');
  I(50,240,'  Buerguerita','32');
  I(50,255,'  Diopt†sio','57');
  I(50,270,'  Milarita','110');
  I(50,285,'  Turmalina','148');
  I(50,315,' INOSSILICATOS','');
  I(50,330,'  Actinolita','1');
  I(50,345,'  Antofilita','8');
  setfillstyle(1,3);
  bar(230,120,410,355);
  setcolor(7);
  I(235,135,'  Diops°dio','56');
  I(235,150,'  Hedenberguita','82');
  I(235,165,'  Hornblenda','88');
  I(235,180,'  Inesita','92');
  I(235,195,'  Netunita','115');
  I(235,210,'  Okenita','116');
  I(235,225,'  Pargasita','122');
  I(235,240,'  Prehnita','128');
  I(235,255,'  Rodonita','135');
  I(235,270,'  Tremolita','147');
  I(235,300,' FILOSSILICATOS','');
  I(235,315,'  Apofilita','10');
  I(235,330,'  Biotita','23');
  I(235,345,'  Crisocola','49');
  setfillstyle(1,3);
  bar(415,120,596,355);
  setcolor(7);
  I(420,135,'  Crisotilo','50');
  I(420,150,'  Cronstedtita','52');
  I(420,165,'  Girolita','76');
  I(420,180,'  Kemmererita','93');
  I(420,195,'  Muscovita','113');
  I(420,210,'  Talco','142');
  I(420,240,' TECTOSSILICATOS','');
  I(420,255,'  Adul†ria','3');
  I(420,270,'  Analcima','4');
  I(420,285,'  Cabazita','33');
  I(420,300,'  Damburyta','54');
  I(420,315,'  Escolecita','63');
  I(420,330,'  Estilbita','69');
  I(420,345,'  Gmelinita','77');
end;

{ P†gina do ecrÑ Ind°ce dos Sistemas }
procedure IP5;
begin
  setfillstyle(1,3);
  bar(45,120,225,355);
  setcolor(7);
  I(50,135,'  Harmotomo','81');
  I(50,150,'  Heulandita','86');
  I(50,165,'  Leucita','96');
  I(50,180,'  Meionita','105');
  I(50,195,'  Mesolita','108');
  I(50,210,'  Microcl°nico','109');
  I(50,225,'  Natrolita','114');
  I(50,240,'  Ortocl†sio','119');
  setfillstyle(1,3);
  bar(230,120,410,355);
  bar(415,120,596,355);
end;

{ Controlador do teclado no ecrÑ Indice dos sistemas }
procedure Indi;
Label 1,2,3,4,5;
var pag : byte;
begin
  Ec('Indice dos sistemas','F1 - Ajuda  Esc - Vai para o Menu principal  Cursor - Movimenta p†ginas');
  goto 5;
3:Ec2('Indice dos sistemas','F1 - Ajuda  Esc - Vai para o Menu principal  Cursor - Movimenta p†ginas');
5:outtextxy(45,385,'Esc   F1');
  outtextxy(45,395,'PgDn  PgUp  Home  End');
  outtextxy(45,405,'            SetaC SetaB');
  outtextxy(45,415,'      ClicD');
  settextjustify(1,1);
  settextstyle(8,0,0);
  EscE(320,73,'Indice dos sistemas');
  setcolor(2);
  line(45,100,594,100);
  setcolor(15);
  line(44,99,593,99);
  settextjustify(0,0);
  settextstyle(2,0,5);
  I(50,115,'Nome','P†g.');
  I(235,115,'Nome','P†g.');
  I(420,115,'Nome','P†g.');
  setcolor(2);
  line(229,105,229,355);
  line(414,105,414,355);
  setcolor(15);
  line(228,104,228,354);
  line(413,104,413,354);
  pag := 1;
1:case pag of
       1: IP1;
       2: IP2;
       3: IP3;
       4: IP4;
       5: IP5;
  end;
  SetFillStyle(1,7);
  settextjustify(2,0);
  settextstyle(3,0,0);
  bar(201,376,269,419);
  setcolor(15);
  outtextxy(272,407,Int_to_Str(Pag));
  outtextxy(352,407,'5');
  settextjustify(0,0);
  settextstyle(2,0,5);
2:ch := getkey;
  case Ord(ch) of
       199:    begin
                 if pag = 1 then goto 2;
                 pag := 1;
                 goto 1;
               end;
       207:    begin
                 if pag = 5 then goto 2;
                 pag := 5;
                 goto 1;
               end;
       208,209:
               begin
                 if pag = 1 then begin pag := 2; goto 1; end;
                 if pag = 2 then begin pag := 3; goto 1; end;
                 if pag = 3 then begin pag := 4; goto 1; end;
                 if pag = 4 then begin pag := 5; goto 1; end;
                 if pag = 5 then begin pag := 1; goto 1; end;
               end;
       200,201:
               begin
                 if pag = 1 then begin pag := 5; goto 1; end;
                 if pag = 2 then begin pag := 1; goto 1; end;
                 if pag = 3 then begin pag := 2; goto 1; end;
                 if pag = 4 then begin pag := 3; goto 1; end;
                 if pag = 5 then begin pag := 4; goto 1; end;
               end;
       187:    begin
                 Ajuda(7);
                 goto 3;
               end;
       27,132: begin
                 setfillpattern(G50,6);
                 bar(1,30,638,450);
                 goto 4;
               end;
       else
               goto 2;
  end;
4:
end;

{ Controlador do teclado no ecrÑ Biblioteca }
procedure Bibl;
Label 1,2,3,4,5;
var pag : byte;
begin
  Ec('Biblioteca','F1 - Ajuda  Esc - Vai para o Menu principal');
  goto 5;
3:Ec2('Biblioteca','F1 - Ajuda  Esc - Vai para o Menu principal');
5:outtextxy(45,385,'Esc   F1    Enter');
  outtextxy(45,415,'ClicE ClicD');
  settextjustify(1,1);
  settextstyle(2,0,5);
  EscE(320,70,'Para um maior desenvolvimento sobre Minerologia');
  EscE(320,85,'aconselhamos os livros a seguir citados');
  setcolor(2);
  line(45,100,594,100);
  setcolor(15);
  line(44,99,593,99);
  settextjustify(0,0);
  settextstyle(2,0,5);
  EscE(50,120,'G.BROCARDO - Pedras Preciosas e Outros Minerais guia de identificaáÑo -');
  EscE(60,135,'Ed. Siciliano; SÑo Paulo, 1989');
  EscE(50,155,'CLARK, S.P. - Estrutura da Terra -');
  EscE(60,170,'Ed. Edgard BlÅcher Lda.; SÑo Paulo, 1973');
  EscE(50,190,'SINKANKAS, J. - Mineralogy for Amateurs -');
  EscE(60,205,'Ed. Van Nostrand Co.; Princeton, 1964');
  EscE(50,225,'FENOGLIO, M. - Minerali Alpini e Prealpini -');
  EscE(60,240,'Ed. Levrotto & Bella; Torino, 1954');
  EscE(50,260,'LEINZ, V. & LOENARDOS, O.H. - Gloss†rio Geol¢gico -');
  EscE(60,275,'Ed. Editora Nacional; SÑo Paulo, 1977');
  EscE(50,295,'STRUNZ, H. - Mineralogische Tabellen -');
  EscE(60,310,'Ed. Akademische Verlagsgesellscaft, Lipsia, 1970');
  EscE(50,330,'BANCO, P. M. - Dicion†rio de Mineralogia -');
  EscE(60,345,'Ed. Universidade; Porto Alegre, 1982');
  settextjustify(2,0);
  settextstyle(3,0,0);
  setcolor(15);
  outtextxy(272,407,'1');
  outtextxy(352,407,'1');
2:ch := getkey;
  case Ord(ch) of
       187:    begin
                 Ajuda(8);
                 goto 3;
               end;
       13,27,132,133:
               begin
                 setfillpattern(G50,6);
                 bar(1,30,638,450);
                 goto 4;
               end;
       else
               goto 2;
  end;
4:
end;

end.