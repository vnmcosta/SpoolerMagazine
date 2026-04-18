.AUTODEPEND

#		*Translator Definitions*
CC = bcc +PROTECT.CFG
TASM = TASM
TLIB = tlib
TLINK = tlink
LIBPATH = F:\BORLANDC\LIB
INCLUDEPATH = F:\BORLANDC\INCLUDE


#		*Implicit Rules*
.c.obj:
  $(CC) -c {$< }

.cpp.obj:
  $(CC) -c {$< }

#		*List Macros*


EXE_dependencies =  \
 protec.obj \
 protect.obj

#		*Explicit Rules*
protect.exe: protect.cfg $(EXE_dependencies)
  $(TLINK) /x/n/c/P-/L$(LIBPATH) @&&|
c0s.obj+
protec.obj+
protect.obj
protect
		# no map file
cs.lib
|


#		*Individual File Dependencies*
protec.obj: protect.cfg protec.c 

protect.obj: protect.cfg protect.asm 
	$(TASM) /MX /O PROTECT.ASM,PROTECT.OBJ

#		*Compiler Configuration File*
protect.cfg: protect.mak
  copy &&|
-3
-a
-f-
-ff-
-O
-Oe
-Ob
-Z
-k-
-vi-
-I$(INCLUDEPATH)
-L$(LIBPATH)
| protect.cfg


