program graf_cga;
uses graph,crt;
var gd, gm, i, j: integer;
begin
   gd:=1; gm:=0;
   initgraph(gd,gm,'');
   for i:=10 to 135 do
     for j:=10 to 120 do
        putpixel(i,j,((i*j) div 17) mod 4);
   setcolor(2);
   line(180,130,300,130);
   line(300,130,240,110);
   line(240,110,180,130);
   setcolor(3);
   line(200,130,200,180);
   line(200,180,280,180);
   line(280,180,280,130);
   setcolor(1);
   line(230,180,230,150);
   line(230,150,250,150);
   line(250,150,250,180);
   repeat until keypressed;
   closegraph
end.
