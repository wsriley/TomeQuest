Procedure Winme;
Var tps,x1,y1:integer;
    bn,t,boc,l,r,u,d:integer;
    ccolor:integer;
    label goodbyenow;

  Procedure colors;
  Var qq:integer;
  begin
    if ccolor > 6 then ccolor := 0;
    for qq:= 16 to 29 do screen[3,qq].att := ccolor+7*16;
    for qq := 50 to 65 do screen[3,qq].att:=ccolor+7*16;
    inc(ccolor);
  end;

begin
  {song goes here, right here and I mean here, Dammit!}
  t:=1; x1:=trunc(x); y1:=trunc(y);
  if x1 >= 40 then bn := x1 else bn := 80-x1;
  r:=x1+2;l:=x1+2;u:=y1-1;d:=y1+1; boc:=0;
  repeat;
    inc(boc);
    if r > 80 then r:=80; if l < 1 then l:=1;
    if u <1 then u := 1; if d > 25 then d:=25;
    if t =2 then begin
      for i := u to d do begin screen[i,l].att := 127; screen[i,r].att := 127; end;
      for j := l to r do begin screen[u,j].att := 127;screen[d,j].att := 127; end;
    end;
    if t =3 then begin
      for i := u to d do begin Active[i,l] := screens[42]^[i,l];
        Active[i,r] := screens[42]^[i,r]; end;
      for j := l to r do begin Active[u,j] := screens[42]^[u,j];
        Active[d,j] := screens[42]^[d,j]; end;
    end;
    if t=1 then begin screen[y1,r].att:= white +7*16;
      screen[y1,l].att:= white +7*16;
      screen[u,x1+2].att:= white +7*16;
      screen[d,x1+2].att:= white +7*16; delay(10);end;
    inc(r); inc(d); dec(l); dec(u);
    IF NOT(SOUNDOFF) THEN Sound((boc mod bn) * 20);
    delay(5);
    IF NOT(SOUNDOFF) THEN sound((boc mod bn) * 10);
    if boc = bn then begin t := 2; r:=x1+3;l:=x1+1;u:=y1-1;d:=y1+1; end;
    if boc = bn*2 then begin t:=3; r:=x1+3;l:=x1+1;u:=y1-1;d:=y1+1; end;
  until (boc > bn*3) and (l<=1);
  ACTIVE:=SCREENs[42]^;
  nosound;
  tps:=0;
 repeat;
  textattr :=126; Window(8,5,39,23); clrscr; window(43,5,75,23); clrscr;
  window(8,5,39,24);
  i:=0; while (i < 19) do begin
    if (ttext[i+tps*19+1]='!END!') then goto goodbyenow;
    inc(i);
    J:=0; while J < length(ttext[i+tps*19]) do begin
          inc(j); write(ttext[i+tps*19][j]);
          delAy(20);
          active[wherey+4,wherex+6].att:=116;
          delAy(30);
          active[wherey+4,wherex+6].att:=112;
          colors;
          if fkey[1] then begin window(1,1,80,25);
                 textattr :=white;
                 clrscr; endfkey; textmode(3);
                 halt;
                end;

          end;
    writeln; end;
  if (ttext[i+tps*19+1]<>'!END!') then begin
   window(43,5,75,24);inc(tps);
    i:=0; while (i < 19) do begin
    if (ttext[i+tps*19+1]='!END!') then goto goodbyenow;
    inc(i);
    J:=0; while J < length(ttext[i+tps*19]) do begin
          inc(j); write(ttext[i+tps*19][j]);
          delAy(20);
          active[wherey+4,wherex+41].att:=116;
          delAy(30);
          active[wherey+4,wherex+41].att:=112;
          colors;
          end;
    writeln; end;
  For J := 1 to 20 do begin Colors; delAy(60); end;
  inc(tps);
  end;
  until (ttext[i+tps*19+1]='!END!') or XKey(SLock);
goodbyenow:
  delAy(2000);
  CURSOR(ON);
  TEXTATTR:=7; wINDOW(1,1,80,25); CLRSCR;
  Center(13,'* * *  World aborted  * * *');
  Center(14,'Have a nice day.');
  center(15,'Steve & Tom');
  endfkey; halt;
end;
