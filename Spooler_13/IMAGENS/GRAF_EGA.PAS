program graf_ega;
uses graph,crt;
var gd, gm: integer;
    i, j: longint;
begin
   gd:=3; gm:=1;
   randomize;
   initgraph(gd,gm,'');
   for i:=1 to 15 do setpalette(i,random(64));
   for i:=10 to 270 do
     for j:=10 to 210 do
        putpixel(i,j,((i*j) div 17) mod 16);
   setcolor(5);
   line(360,195,600,195);
   line(600,195,480,165);
   line(480,165,360,195);
   setcolor(7);
   line(400,195,400,270);
   line(400,270,560,270);
   line(560,270,560,195);
   setcolor(9);
   line(460,270,460,225);
   line(460,225,500,225);
   line(500,225,500,270);
   repeat until keypressed;
   closegraph
end.
