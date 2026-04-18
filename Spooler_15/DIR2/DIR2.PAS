Program dir2;

{  *************************************************************************
   *                                                                       *
   *                 autor : NELSON PIRES                                  *
   *                 data  : 4 / 06 /91                                    *
   *                                                                       *
   *************************************************************************    }

uses Dos;

        type st25=string[25];

var              dirinfo: searchrec;
                 regista: longint;
                    nome: string[50];
 numero,paragem,contagem: word;
                 n,n1,n3: byte;
                   name2: namestr;
                     dir: dirstr;
                     ext: extstr;
                drive,t3: byte;
                atributo: string[4];
                    data: datetime;
                 h,m,s,d: string[2];
                       a: string[4];
                       p: pathstr;
                 escreve: st25;




procedure espera;

var r : registers;

begin
    r.ah := 8;
    MsDos(r);
end;



procedure datas;

begin
             unpacktime(dirinfo.time,data);
             str(data.day,s);
             if length(s)=1 then s:='0'+s;
             str(data.month,d);
             if length(d)=1 then d:='0'+d;
             str(data.hour,h);
             if length(h)=1 then h:=' '+h;
             str(data.min,m);
             if length(m)=1 then m:='0'+m;
             str(data.year,a);
             delete(a,1,2);
end;

procedure determ_atributos;

begin
             atributo:='';
             if dirinfo.attr and hidden<>0  then atributo:=atributo+'H'
             else atributo:=atributo+'.';
             if dirinfo.attr and readonly<>0  then atributo:=atributo+'R'
             else atributo:=atributo+'.';
             if dirinfo.attr and sysfile<>0  then atributo:=atributo+'S'
             else atributo:=atributo+'.';
             if dirinfo.attr and archive<>0  then atributo:=atributo+'A'
             else atributo:=atributo+'.';

end;


procedure converte(entrada:longint; var sai:st25);

var n4:byte;

begin
      str(entrada,sai);
      n3:=length(sai)-2;
      if (length(sai) mod 3 =0) then
         n4:= ((length(sai) div 3)-1)
      else n4:= (length(sai) div 3);

      for n:=1 to n4 do
       begin
        insert('.',sai,n3);
        dec(n3,3);
       end;
end;


label passar;

            {  ***********  PRINCIPAL ****************  }

  begin
    contagem:=1;
    nome:='';
    regista:=0;
    numero:=1;
    paragem:=1000;
    n:=paramcount;
    if paramcount<1 then nome:='*.*'
    else
      begin
        for n1:=1 to n do
           nome:=nome+paramstr(n1);
        if ( nome[length(nome)-1]='/' )
           and ( upcase(nome[length(nome)]) = 'P' )  then
           begin
             paragem:=23;
             delete(nome,length(nome)-1,2);
           end;
      end;

      if nome[2]=':' then drive := (ord(nome[1]) - 96)
      else drive:=0;

      if nome='' then nome:='*.*';
      t3:=length(nome);
      if nome[t3]=':' then
      begin
        nome:=nome+'\*.*';
        goto passar;
      end;




        findfirst(nome,directory,dirinfo);
        if (DosError=0) and (pos('*.*',nome)=0 ) then
         begin
           if dirinfo.attr and directory<>0 then
               nome:=nome+'\*.*';
         end;

    passar:

    writeln('Direct¢rio de ',fexpand(nome));
    writeln;

    FindFirst(nome, Anyfile, DirInfo);

    while DosError = 0 do
    begin
     fsplit(dirinfo.name,dir,name2,ext);
     if dirinfo.attr and volumeid = 0 then
     begin
       write(name2,' ':10-length(name2),ext,' ':5-length(ext));
       inc(contagem);
       datas;
       determ_atributos;
     end;
      if dirinfo.attr and directory<>0 then
          writeln('<DIR>         ',atributo,'    ',s,'/',d,'/',a,'    ',h,':',m)
      else
         begin
             if dirinfo.attr and volumeid=0 then
             begin
             writeln(dirinfo.size:8,'      ',atributo,
                     '    ',s,'/',d,
                     '/',a,' ':4,
                     h,':',m);
             regista:=regista+dirinfo.size;
             numero:=numero+1;
             end;
           end;
        if contagem mod paragem = 0 then espera;
      FindNext(DirInfo);
    end;

      writeln;
      converte(regista,escreve);
      writeln(' ':20-length(escreve),escreve,' bytes em ',numero-1 ,' ficheiros');

      converte(diskfree(drive),escreve); if escreve='-1' then
                                            begin
                                                 writeln;
                                                 writeln('Falha geral lendo ',upcase(chr(drive+96)),':');
                                                 exit;
                                            end;
      writeln(' ':20-length(escreve),escreve,' bytes livres');
      converte(disksize(drive),escreve);
      writeln(' ':20-length(escreve),escreve,' bytes de  espa‡o total ');
end.