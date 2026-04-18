echo off
rem Este programa mostra o uso do FOR
rem Veremos esta batch file mostrar todos os caminhos do PATH mas emn linhas
rem diferentes.
echo.
echo Directorios incluidos no PATH:
echo.  
for %%a in (%PATH%) do echo %%a
echo. 
