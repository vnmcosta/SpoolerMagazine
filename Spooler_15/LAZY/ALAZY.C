/*---------------------------------------------------------------------------
	ANTIlazy - Procura e elimina o "lazy" (720)
	Escrito por Jos‚ Orlando R. N. Pereira
	para SPOOLER MAGAZINE.
	20/3/91 .. 4/4/91
---------------------------------------------------------------------------*/

#ifndef __COMPACT__
#error E necessario o modelo de memoria COMPACT.
#endif

#include <stdio.h>	 /* Importa‡„o de fun‡”es da biblioteca */
#include <stdlib.h>
#include <dir.h>
#include <dos.h>
#include <string.h>
#include <ctype.h>
#include <io.h>
#include <fcntl.h>
#include <conio.h>

/*--- Constantes: ---------------------------------------------------------*/

#define TAB 4		/* Indenta‡„o do relatorio */ 
#define LazySEG 0x7000  /* Endere‡o do virus quando residente */
#define LazyOFF 0xa350
#define Buf 0xffff

typedef enum		/* Constantes usadas para gerar o relatorio */
{
	INFEC,		/* Ficheiro infectado, limpeza possivel */
	DIR,		/* Entrar em directoria */
	FIMDIR,		/* Sair da directoria */
	DIRERR,		/* Erro ao entrar na directoria */
	LIMPO,		/* Ficheiro examinado */
	DESINF,		/* Ficheiro desinfectado */
	ERR_ESC,	/* Erro de escrita */
	ERR_LEI,	/* Erro de leitura */
	NAODESINF,	/* Ficheiro continua infectado */
	MEM,		/* Virus activo em memoria */
	ASSIN,		/* Assinatura encontrada fora do sitio */
	DESTR		/* Ficheiro destruido */
} MSGS;

const char cabecalho[]="\nANTIlazy - Mar‡o de 91"
		       "\nEscrito por Jos‚ Orlando Pereira"
		       "\npara SPOOLER MAGAZINE."
		       "\n\n/H ou /? para ajuda.\n";

const char LIXO[]="ANTIlazy (C)JOP "; /* Lixo para preencher ficheiros */

/*--- Defini‡”es de tipos: -----------------------------------------------*/

typedef struct		/* Estrutura para processar os parametros */
{
	char drive[MAXDRIVE];
	char dir[MAXDIR];
	char file[MAXFILE];
	char ext[MAXEXT];
} PATH;

/*--- Variaveis globais: -------------------------------------------------*/

/* Assinatura do virus disfar‡ada para n„o causar falsos alarmes. */

char lazy[]={0x8a,0x1f,0x2d,1,0xb9,1,0x71,0x8f,0xc1,0x27};

char specs[]="????????.COM";	/* M scara por defeito */

int imp=0,fich=0,recursao=1;	/* Flags globais */
int desinf=0,limpo=0,infec=0,exam=0;	/* Contadores globais */

FILE *fich_r;		/* Ficheiro do relat¢rio */
char *buffer;		/* Buffer para processar os ficheiros */

/*--- Fun‡”es: -----------------------------------------------------------*/

void bip(void)		/* Gera um apito de alarme */
{
	sound(1000);
	delay(500);
	nosound();
}

void rel(char * nome,MSGS oper) /* Imprime uma mensagem no relat¢rio */
{
 static int indent=0;		/* Nivel de indenta‡„o actual */
 static char mesg[50];
 int i,bip_fl=0;		/* Variaveis auxiliares */

	if (oper==FIMDIR)	/* Indenta‡„o */
		indent--;
	i=indent*TAB+1;
	if (oper==DIR)
		indent++;
	mesg[i]='\0';
	mesg[0]='\n';
	while(--i>0) mesg[i]=32;
	switch(oper)		/* Escolha da mensagem */
	{
		case DIR: 	strcat(mesg,"Entrando na directoria %s");
				break;
		case FIMDIR:    strcat(mesg,"Saindo da directoria %s");
				break;
		case INFEC:	strcat(mesg,"%s est  INFECTADO!");
				bip_fl--;
				break;
		case LIMPO:	strcat(mesg,"%s est  limpo.");
				break;
		case DESINF:	strcat(mesg,"%s desinfectado.");
				break;
		case ERR_ESC:	strcat(mesg,"Erro de escrita em %s.");
				break;
		case ERR_LEI:	strcat(mesg,"Erro de leitura em %s.");
				break;
		case DIRERR:	strcat(mesg,"Imposs¡vel examinar directoria %s");
				break;
		case MEM:	strcat(mesg,"ATEN€ŽO! \"lazy\" activo em mem¢ria!\n");
				bip_fl--;
				break;
		case NAODESINF:	strcat(mesg,"ATEN€ŽO! %s n„o foi desinfectado.");
				break;
		case ASSIN:	strcat(mesg,"Assinatura viral ENCONTRADA fora do sitio em %s.\n");
				bip_fl--;
				break;
		case DESTR:	strcat(mesg,"%s definitivamente destruido.");
				break;
	}
	printf(mesg,nome);	/* Impress„o no ecran... */
	if (bip_fl) bip();
	if (imp) fprintf(stdprn,mesg,nome);	/* impressora... */
	if (fich) fprintf(fich_r,mesg,nome);	/* ficheiro... */
}

void escdadosinic(FILE *saida,char drive,char *path) /* Introdu‡„o */
{
 struct time horas;
 struct date dia;

	gettime(&horas);
	getdate(&dia);
	fprintf(saida,"\nExame de %c:%s em %d/%d/%d …s %d:%d.",
		drive,path,dia.da_day,dia.da_mon,dia.da_year,
		horas.ti_hour,horas.ti_min);
	fprintf(saida,"\nExaminando os ficheiros %s\n",specs);
	if (!recursao)
		fprintf(saida,"\nBusca recursiva desactivada.\n");
}

void inicrel(char drive,char *path)	/* Inicializa‡„o do relat¢rio */
{
	printf(cabecalho);
	escdadosinic(stdout,drive,path);
	if (imp)
	{
		fprintf(stdprn,cabecalho);
		escdadosinic(stdprn,drive,path);
	}
	if (fich)
	{
		fich_r=fopen("ANTILAZY.REL","w");
		if (fich_r==NULL) fich=0;
	}
	if (fich)
	{
		fprintf(fich_r,cabecalho);
		escdadosinic(fich_r,drive,path);
	}
}

void escdadosfim(FILE *saida)		/* Conclus„o */
{
	fprintf(saida,"\n\nFicheiros encontrados limpos: %i"
		      "\nFicheiros encontrados INFECTADOS: %i"
                      "\nFicheiros desinfectados: %i"
		      "\n\nTotal de ficheiros examinados: %i\n",
		      limpo,infec,desinf,exam);
	if (infec-desinf)
	{
		fprintf(saida,"\nAten‡„o aos ficheiros nao desinfectados!\n");
		bip();
	}
	fprintf(saida,cabecalho);
}

void fecharel(void)		/* T‚rmino do relat¢rio */
{
	escdadosfim(stdout);
	if (imp)
	{
		escdadosfim(stdprn);
		putc('\f',stdprn);
	}
	if (fich)
	{
		escdadosfim(fich_r);
		fclose(fich_r);
	}
}

void limpa(char *nome)		/* Desinfecta um ficheiro */
{
 unsigned hosp,virus;
 int atr,handle;

	rel(nome,INFEC);
	atr=_chmod(nome,0);	/* Passa por cima do atributo READ ONLY */
	atr=_chmod(nome,1,atr & !FA_RDONLY);
	if (atr==-1)
	{
		rel(nome,ERR_ESC);	/* Disq. protegida */
		rel(nome,NAODESINF);
	}
	else
	{
		handle=_creat(nome,0);	/* Apagar o ficheiro */
		virus=*((unsigned *) (buffer+2))+4;
		hosp=virus+0x2b0;
		_write(handle,buffer+hosp,4);	/* Escrever parte 1 */
		_write(handle,buffer+4,virus-4); /* e parte 2. */
		close(handle);
		desinf++;
		rel(nome,DESINF);
	}
}

void destroi(char *nome,unsigned comp)	/* Destruir um ficheiro */
{
 int tecla,atr,i,handle;

	rel(nome,ASSIN);
	printf("\nDeseja (D)esistir, des(T)ruir o ficheiro ou tentar (R)emover? (D/T/R) ");
	while((tecla=toupper(getchar()))!='D' && tecla!='T' && tecla!='R');
	if (tecla=='D')
	{
		rel(nome,NAODESINF);
	}
	else if (tecla=='T')
	{
		atr=_chmod(nome,0);	/* Passar por cima do READ ONLY */
		atr=_chmod(nome,1,atr & !FA_RDONLY);
		if (atr==-1)
		{
			rel(nome,ERR_ESC);  /* Disq. protegida */
			rel(nome,NAODESINF);
		}
		else	/* Destruir ficheiro (Ver ZAP! - Spooler n§ 12) */
		{
			handle=_open(nome,O_WRONLY+O_BINARY);
			for(i=comp/strlen(LIXO)+1;i>=0;i--)
				memcpy(buffer+i*strlen(LIXO),LIXO,strlen(LIXO));			
			lseek(handle,0,SEEK_SET);
			_write(handle,buffer,comp);
			close(handle);
			unlink(nome);
			desinf++;
			rel(nome,DESTR);
		}
	}
	else
		limpa(nome);
}

void examina(char *nome)	/* Examina um ficheiro */
{
 unsigned comp;
 int handle,bptr=0,lptr=0;

	handle=_open(nome,O_RDONLY);
	if (handle==-1)
		rel(nome,ERR_LEI);
	else
	{       
		exam++;
		comp=_read(handle,buffer,Buf);
		close(handle);
		while ((lptr<10) && (bptr<comp)) /* Procurar assinatura */
		{
			if (buffer[bptr]==lazy[lptr])
			{
				bptr++;
				lptr++;
			}
			else
			{
				bptr-=lptr-1;
				lptr=0;
			};
		}
		if (lptr==10)		/* Se encontrou... */
		{
			infec++;
			if (bptr==comp-588)
				limpa(nome); /* no sitio certo */
			else
				destroi(nome,comp); /* fora do sitio */
		}
		else
		{
			limpo++;
			rel(nome,LIMPO);
		}
	}
}

void limpadir(char *dir)	/* Pesquisa de uma directoria */
{
 char velho[MAXPATH]="\\";
 int erro;
 struct ffblk dta;

	getcurdir(0,velho+1);	/* Directoria actual */
	erro=chdir(dir);
	if (erro)
		rel(dir,DIRERR);
	else
	{
		rel(dir,DIR);
		erro=findfirst(specs,&dta,FA_HIDDEN+FA_SYSTEM);
		while(!erro)	/* Enquanto houver ficheiros... */
		{
			examina(dta.ff_name);
			erro=findnext(&dta);
		}
		if (recursao)	/* Procura recursiva */
		{
			erro=findfirst("*.*",&dta,FA_DIREC+FA_HIDDEN+FA_SYSTEM);
			while(!erro && (!strcmp(dta.ff_name,".") || !strcmp(dta.ff_name,"..") || !(dta.ff_attrib & FA_DIREC)))
			{
				erro=findnext(&dta);
			}
			while(!erro)
			{       
				if (dta.ff_attrib & FA_DIREC)
					limpadir(dta.ff_name);
				erro=findnext(&dta);
			}
		}
	}
	rel(dir,FIMDIR);
	erro=chdir(velho);	/* Sair da directoria */
	if (erro)	/* Erro para captar qualquer imprevisto */
	{
		printf("\nERRO GRAVE: Saindo para o DOS.\n");
		exit(2);
	}
}

void testamem(void)	/* Verifica se o lazy est  residente em mem¢ria */
{
 char far *aux;
 int i=0;

	aux=MK_FP(LazySEG,0xa3ca);
	while(aux[i]==lazy[i] && ++i<10);
	if (i==10) rel(NULL,MEM);
}

void ajuda(char *path)	/* Fun‡„o que suporta a ajuda em linha */
{
 FILE *ficheiro;
 char nome[MAXPATH],linha[80],*erro;

	strcpy(nome,path);
	*strrchr(nome,'.')='\0';
	strcat(nome,".HLP");
	ficheiro=fopen(nome,"rt");
	if (ficheiro==NULL)	/* Para o caso de se perder o ALAZY.HLP */
	{
		printf(cabecalho);
		printf("\nFicheiro ALAZY.HLP n„o encontrado\n"
		       "\nSintaxe:"
		       "\nALAZY <directoria> [/A] [/R] [/F] [/P] [/N:<ficheiro>]\n");
		exit(2);
	}
	else			/* Leitura do ficheiro ALAZY.HLP */
	{
		erro=fgets(linha,80,ficheiro);
		while(erro!=NULL)
		{
			printf(linha);
			erro=fgets(linha,80,ficheiro);
			if (linha[0]=='#')
			{	
				printf("\n*** Prima uma tecla para continuar... ***\n\n");
				while(!kbhit());
				getch();
				erro=fgets(linha,80,ficheiro);
			}
		}
		fclose(ficheiro);
		exit(0);
	}
}

/*--- Fun‡„o principal: ---------------------------------------------------*/

int main(int argc,char *argv[])
{
 int i,nparam=0,drive;
 PATH param={"","","",""};
 char aux[MAXPATH];

	for(i=0;i<10;(lazy[i++])--);	/* Restaurar a assinatura */
	buffer=(char *) malloc(Buf);	/* Reservar mem¢ria */
	if (buffer==NULL)
	{
		printf("\nMem¢ria insuficiente para correr o ANTIlazy\n");
		exit(2);
	}
	for(i=1;i<argc;i++)		/* Processar a linha de comando */
	{
		if (*argv[i]=='/')
		{
			switch(toupper(argv[i][1]))
			{
				case 'H':
				case '?':  ajuda(argv[0]);
					   break;
				case 'A':  strcpy(specs,"*.*");
					   break;
				case 'R':  recursao=0;
					   break;
				case 'F':  fich=1;
					   break;
				case 'P':  imp=1;
					   break;
				case 'N':  if (argv[i][2]==':')
						   strcpy(specs,argv[i]+3);
					   else
					   {
						   printf("\n/N:<ficheiro> invalido.\n");
						   exit(2);
					   }
					   break;
				default:   printf("\nSelector inv lido - %s\n",argv[i]);
					   exit(2);
					   break;
			}
		}
		else
		{
			strcpy(aux,argv[i]);
			if (aux[strlen(aux)-1]!='\\')
				strcat(aux,"\\");
			strupr(aux);
			fnsplit(aux,param.drive,param.dir,
				param.file,param.ext);
			nparam++;
                        if (strlen(param.dir)>1)
				param.dir[strlen(param.dir)-1]='\0';
		}
	}
	if (nparam>1)
	{
		printf("\nLinha de comando invalida.\n");
		exit(2);
	}
	if (param.drive[0]=='\0')
	{
		param.drive[0]=getdisk()+'A';
	}
	if (param.dir[0]=='\0')
		getcurdir(0,param.dir+1);
	if (param.dir[0]=='\0')
		strcpy(param.dir,"\\");
	inicrel(toupper(param.drive[0]),param.dir);
	testamem();
        drive=getdisk();
	setdisk(toupper(param.drive[0])-'A');
	limpadir(param.dir);
	setdisk(drive);
	fecharel();
	return infec==0?0:1;
}
