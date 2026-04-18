*************************
* Programa INFLIGA.PRG  *
* Destina-se a juntar o *
* novo ficheiro INFOR2  *
* ao ficheiro INFOR.DBF *
* ja existente.         *
* R.Casquilho/Spooler   *
* Janeiro de 1991       *
*************************
set talk on
set safe off
    use INFOR
    appe from INFOR2
    index on TERMO to INFOR
set talk off
set safe on
    use
    retu
