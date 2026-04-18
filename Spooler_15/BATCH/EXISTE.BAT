echo off
rem Esta batch file procura no directorio corrente um ficheiro entrado 
rem como parametro.
echo.
if exist %1 goto SIM
echo O Ficheiro %1 nao existe no directorio
cd
goto FIM
:SIM
echo O Ficheiro %1 existe no directorio
cd
:FIM
echo. 
