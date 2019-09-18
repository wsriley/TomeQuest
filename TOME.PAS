{$M 2000,0,100}
uses dos,crt,ssu;
var h,m,s,sc,s2,s3:word;
    i:longint;
begin
     textbackground(black);
     cursor(off);
     I:=0;
     exec('stfil.ssp','');
     textcolor(brown);                         
     gotoxy(40,4);writeln(' 1.0 ');
     textcolor(lightgray);
     gotoxy(20,6);writeln('Copyright 1991 - Steve Riley & Tommy Burnette');
     textcolor(yellow);
     gotoxy(28,17);
     writeln('      P.O. Box 11992         ');
     gotoxy(28,18);
     writeln('      Burke VA 22009         ');
     GetTime(H, M, S, Sc);
     settime(h,m,1,1);
     repeat;
      inc(i);
      gettime(h,m,s2,s3);
     until s2>3;
     settime(h,m,s+10,sc);
     gotoxy(30,1);
     textcolor(white+blink);
     writeln('HIT A KEY TO CONTINUE');
     repeat until keypressed;
     IF I<2200 THEN
     exec('tq.ssp','XT') ELSE
     EXEC('TQ.SSP','');
end.
