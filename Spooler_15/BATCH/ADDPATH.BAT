echo off
rem 
rem Esta batch file adiciona ao path um parametro
rem 
echo.
rem Para verificar se foi entrado um parametro ve-se se o parametro (%1) mais 
rem o ponto de exclamacao e igual ao ponto de exclamacao. Se for igual e que  
rem nao foi entrado um parametro. 
if not %1!==! set PATH=%PATH%;%1
echo O PATH tem o valor %PATH%
echo. 
