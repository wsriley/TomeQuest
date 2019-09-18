Program TOMEQUEST{!!!!!!!!!!};

Uses Crt,SSU;

Const
       qz='                ';
       riveron:boolean =true; Hermiton:boolean=true;
       Cane : Array [1..4] of byte = (1,1,1,1);
       SPath = ''; Flie:Cell=(Ch:#7;Att:14);
       dmess1 = '‹ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹';
       dmess2 = 'ﬁ  You are dead.  Really.  Press any key...  ›';
       dmess3 = 'ﬂ‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹‹ﬂ';
       SpChars : array[0..2] of char = (#171,#172,#253);
       blobon:boolean =true; baton:boolean =true;
       gdragon:boolean =true; gsnakes:boolean =true;
       rsnakeon:boolean = true; fsnakeon:boolean = true;
       spiderson:boolean =true; ringon:boolean = true;
       dripon:boolean =true;
       cryptup : array['A'..'Z'] of char ='BOIHGKNQVTWYURXZAJEMSLDFPC';
       cryptdown: array['a'..'z'] of char ='yntsrpmjdgechkbaxovlfquwiz';
       hexset:array[0..$f] of char = '0123456789ABCDEF';
       Max = 42; W2 = [#205,#219,#193,#194,#220,#223,#221,#222,#171,#172,#253];
       Man : Cell = (Ch:#219;att:9); Blob : Cell = (Ch:#219;Att:85);
       Blank : Cell = (Ch:#32;att:0);
       oldm:cell =(ch:#176;att:124);
       Block = #254; Key = #29; Hole = #233; Potion = #127; Warp = #234;
       Sword = #26; Door = #177; Tome = #240; Wings = #15;
       Items = [Block,Key,Hole,Potion,Warp,Sword,Tome,wings];
       dropscrs=[1,5,2,6,39,7,10,12,28,29,38];
       Cats:set of byte = [21,22,23,24,25,26];
       pottm :Array[0..15] of integer
                 =(10,2000,3000,10,2000,10,10,10,10,2000,2000,10,10,10,10,4000);
       Up : Cell = (Ch:#223;Att:8); Dn : Cell = (Ch:#220;Att:8);
       Mid : Cell = (Ch:#220;Att:8);
       Gbody : Cell = (Ch:#219;Att:2);
       Ghead : Cell = (Ch:#219;Att:10);
       snlng = 16;
       RBody : Cell = (Ch:#32;Att:64);
       RHead : Cell = (Ch:#219;Att:12);
       RSize = 44;
       deadman : cell =(ch:#176;att:72);
       soundoff : boolean =false;
       comon    :boolean = false;
       grab    :boolean = false;

       tester   :boolean =false;
       tcount   :integer = 2000;
       resnum = 21;
       later :boolean = false;
       touch : boolean =false;
       start : boolean =true;
       xt:boolean=false;
       picky:boolean=false;
       LEVEL:WORD=1;
Type   Riv1type = array [1..240] of cell;
       Riv2type = array [1..36] of cell;
       Riv3type = array [1..74] of cell;
       Riv4type = array [1..37] of cell;
       FNType = String[35];
       Barray = Array [1..400] of cell;
       Batype = array [False..True,0..4] of Cell;
       Coords = record
                  Up,Down,Left,Right,Gin,
                  OutX,OutY              : integer;
                end;
       Scrptr = ^scrtype;
       DType  = array [0..7,0..7] of cell;
       SnakePart = record
         X,Y : integer;
       end;
       SType = Array [1..snlng] of SnakePart;
       Ringtype  = array [1..10,1..16] of cell;
       FSnake = record
         X,Y : integer;
         Bod : Cell;
       end;
Const  starts : array[0..6] of snakepart = ((X:58;Y:8),(X:62;Y:8),
                                           (X:73;Y:8),(X:76;Y:8),
                                           (X:39;Y:13),(X:70;Y:8),
                                           (X:45;Y:14));
       redrip : boolean = true;
Var    levy:char;
       WhereTo    : Array [0..max] of Coords;
       col        : array [0..max] of integer;
       Screens,store: array [0..max] of Scrptr;
       Active     : ScrType absolute $B800:$0000;
       Spiders : Array [0..14] of SnakePart;
       SFile      : File of Scrtype;
       BrFile     : File of Barray;
       CaneCode : byte;
       Bridge     : Barray;
       Back,Item,BItem:Cell;
       BC,current,Rn: integer;
       ox,oy,x,y,dy: real;
       FName,FNum : FNType;
       titled,bridgeit,flap,dead,Holding : Boolean;
       rin,min,rx
       ,ry,mx,my  : integer;
       drag       : array[1..3] of DType;
       DFile : File of DType;
       bl,gt,d,dx,dc,
       i,j,k,f,r,l: integer;
       B : array[0..63] of record x,y:integer; end;
       ccount,cool,snd:integer;
       potcol,potcntr,blsound:integer;
       drx,dry,stx,sty,dpoints:integer;
       bat:batype;
       bx,by,obx,oby,bgx,bgy:REAL;
       BGC:integer;
       Snake : Array [1..3] of Stype;
       river: riv1type absolute $b878:0000;
       riv2 : riv1type absolute $b878:0002;
       riv3 : riv2type absolute $b878:0000;
       riv4 : riv2type absolute $b878:0002;
       riv5 : riv3type absolute $b878:0084;
       riv6 : riv3type absolute $b878:0086;
       riv7 : riv3type absolute $b882:0084;
       riv8 : riv3type absolute $b882:0086;
       riv9 : riv4type absolute $b88c:0084;
       riv10: riv4type absolute $b88c:0086;
       Wall: set of char;
       Ring       : Array [1..4] of Ringtype;
       RFile      : File of RingType;
       RSnake    : Array [1..RSize] of SnakePart;
       RSX,RSY   : integer;
       Orsx,Orsy : integer;
       Moved     : Boolean;
       Moves     : Array [1..4] of SnakePart;
       MD,FSChar : integer;
       FS : Array [1..16] of FSnake;
       CC,sp:integer;
       z,tc,v,h,omx,omy:integer;
       chest:array[1..25] of string;
       clist:array[1..26,1..3] of string[15];
       CFile:Text;
       olddead,fulltest:boolean;
       deadcount : integer;
       endit : char;
       ttext: array[1..6*19] of string[40];


Procedure dlay(l:word);
begin
     delay(l)
end;


Procedure writestr(x,y:integer;is:string);
begin
     for i:=1 to length(is)-1 do screen[x,y+i-1].ch:=is[i];
end;


Procedure SetScreen;
Var ib,ie,jb,je:integer;
begin
  If not(current in cats) or (potcol = 15) or ((item.ch=tome) and holding) Then active := screens[current]^
    Else begin
       Textbackground(0);ClrScr;
       If holding then begin
        If x<5 Then jb:=1 else jb:=Trunc(x)-5;
        If x>75 Then je:=80 else je:=Trunc(x)+5;
        If y<2 Then ib:=1 else ib:=trunc(y)-2;
        If y>23 Then ie:=25 else ie:=trunc(y)+2;
        for i := ib to ie do for j := jb to je do active[i,j]:=screens[current]^[i,j];
       end;
    end
end;

Procedure DeCrypt(Var ins:string);
Var i:integer;
begin
  for i := 1 to length(ins) do
    if ins[i] in ['A'..'Z'] then ins[i]:=CryptUp[ins[i]] else
      if ins[i] in ['a'..'z'] then ins[i]:=CryptDown[ins[i]];
end;

{$I Win.Inc}

Procedure Flashme;
Var ux,uy,lx,ly:integer;
begin
  if random(3)=2 then begin
  lx:=random(11)+5;ly:=random(3)+3;
  ux:=random(80-lx)+1; uy:=random(25-ly)+1;
  setattr(random(128),ux,uy,ux+lx,uy+ly);
  dlay(30);
  for i:= uy to uy+ly do for j := ux to ux+lx do active[i,j] := screens[current]^[i,j];
 end;
end;

Procedure Tripme;
Var ux,uy:integer;
begin
  ux:=random(80)+1; uy:=random(25)+1;
  active[uy,ux].ch:=Chr(random(256)); active[uy,ux].att:=random(128);
  ux:=random(80)+1; uy:=random(25)+1;
  for i := 1 to 50 do active[uy,ux] := screens[current]^[uy,ux];
end;

Procedure dripme;
Var SNum:integer;
Begin
    if redrip then begin
       SNum:=random(7); drx := starts[snum].x; dry := starts[snum].y;
       redrip := false; screen[dry,drx].att := 74; end else
    if (screen[dry,drx].ch <> ' ') and (screen[dry,drx].ch<>#248) then begin
      if screen[dry+1,drx].ch in w2 then
       case screen[dry,drx].ch of
         #192: begin STX:=1; STY:=0; end;
         #217: begin stx:=-1;sty :=0; end;
       end
       else begin sty :=1; stx :=0; end;
       screen[dry,drx].att := screens[current]^[dry,drx].att;
       inc(dry,sty); inc(drx,stx);
       if (screen[dry,drx].ch <> ' ') or (screen[dry,drx].ch=#248) then screen[dry,drx].att := 74;
    end else begin  if screen[dry-1,drx].ch = #248 then screen[dry-1,drx].ch := ' ';
                    screen[dry,drx].ch := #248;
                    screen[dry,drx].att:=10;inc(dry);
                    if (screen[dry,drx].ch in w2) or (dry > 24) then begin
                     redrip := true;
                     screens[current]^[dry-1,drx]:=active[dry-1,drx];
                     end;
             end;
End;

Procedure killbuf;
Var x:char;
begin
    while keypressed do x:=readkey;
end;

Procedure alloff;
begin
       riveron:=false; spiderson:=false;
       blobon:=false; baton:=false; ringon := false;
       gdragon:=false; gsnakes:=false;
       rsnakeon:=false;  fsnakeon:=false;
       dripon:=false; HERMITON:=false;
end;

Procedure allon;
begin
       riveron:=true; spiderson:=true;
       blobon:=true; baton:=true; ringon := true;
       gdragon:=true; gsnakes:=true;
       rsnakeon:=true;  fsnakeon:=true;
       dripon:=true; HERMITON:=true;
end;

Procedure Victory{!};
begin
  if not(soundoff) then begin
  Sound(880); dlay(300);
  Sound(740); dlay(100);
  Sound(880); dlay(200);
  Sound(1174);dlay(400);
 end;
end;

Procedure statme;
VAr ins:string;
begin;
  if gdragon and (d<3) Then setattr(14,14,19,19,19) else setattr(112,14,19,19,19);
  if baton then setattr(14,23,19,25,19) else setattr(112,23,19,25,19);
  if gsnakes then screen[19,36].att:=14 else screen[19,36].att := 112;
  if rsnakeon then screen[19,38].att:=14 else screen[19,38].att := 112;
  if fsnakeon then screen[19,40].att:=14 else screen[19,40].att := 112;
  if spiderson then setattr(14,45,19,51,19) else setattr(112,45,19,51,19);
  if blobon then setattr(14,55,19,58,19) else setattr(112,55,19,58,19);
  if dripon then setattr(14,62,19,65,19) else setattr(112,62,19,65,19);
  if ringon then setattr(14,28,20,36,20) else setattr(112,28,20,36,20);
  if riveron then setattr(14,38,20,42,20) else setattr(112,38,20,42,20);
  if HERMITON and not(olddead)
    then setattr(14,44,20,49,20) else setattr(112,44,20,49,20);
  if soundoff then setattr(112,51,20,55,20) else setattr(14,51,20,55,20);
  Str(dc,ins); if dc<10 then ins:=ins+' '; writestr(20,25,ins);
  Str(bc,ins); if bc<10 then ins:=ins+' '; writestr(20,70,ins);
end;

{$i comman18.inc}

Procedure oldmanme;
begin
    if (holding and (item.ch=tome)) then begin v:=0;h:=0;
       if trunc(x)>omx then h:=1;
       if trunc(x)<omx then h:=-1;
       if trunc(y)<omy then v:=-1;
       if trunc(y)>omy then v:=1
     end else
     if random(5) =3 then begin v := random(3)-1; h := random(3)-1;end;

    if not(screens[current]^[omy+v,omx+h].ch in w2) then
      begin active[omy,omx] := screens[current]^[omy,omx];
            inc(omx,h); inc(omy,v);
            if omx > 80 then omx := 80; if omy > 25 then omy := 25;
      end;
    active[omy,omx] := oldm;
    if (omx=trunc(x)) and (omy=trunc(y)) then if tc > 5 then if (item.ch = tome)
        and holding then begin talktame;winme end else
         if level <> 1 then talktame;
    inc(tc);
end;

Procedure Die;
Var FX,FY :integer;
    Queen : Char;
begin
  killbuf;
  For FX := 1 to 1000 do BEGIN dlay(1);if not(soundoff) then Sound((1000-FX) div 2); end;
  border(black); NoSound;
  Active[Trunc(y),Trunc(x)].att := Man.att+128;
  Active[Trunc(y),Trunc(x)].ch  := Man.ch;
  if not(soundoff) then begin
  Sound(262); dlay(400); NoSound; dlay(200);
  Sound(262); dlay(400); NoSound; dlay(100);
  Sound(262); dlay(500); NoSound; dlay(200);
  Sound(311); dlay(400); NoSound; dlay(100);
  Sound(294); dlay(500); NoSound; dlay(100);
  Sound(262); dlay(500); NoSound; dlay(100);
  Sound(247); dlay(200);
  Sound(262); dlay(400);
  NoSound; end;
  Center(12,DMess1); Center(13,DMess2); Center(14,DMess3);
  SetAttr(72,19,12,60,14); SetAttr(78,20,13,59,13);
  Screen[12,18].att := 8; Screen[12,61].att := 8; Screen[13,17].att :=8;
  Screen[13,62].att:=8; Screen[13,18].att:=72; Screen[13,61].att:=72;
  Screen[14,18].att:=8; Screen[14,61].att:=8;
  Queen := Readkey;
  if holding then begin
    man.att:=9;
    holding :=false;
    repeat;
      FX := Random(80)+1; FY := Random(25)+1;
    Until (Screens[10]^[FY,FX].ch = ' ') and (Screens[10]^[FY,FX].att div 16 = 0);
    Screens[10]^[FY,FX] := Item;
    screens[10]^[fy,fx].att := screens[10]^[fy,fx].att and 15;
    if item.ch = warp then if (item.att and 15) = 12 then begin
      ry:=fy; rx:=fx; rin:=10; end
      else begin
        my:=fy; mx:=fx; min:=10; end;
  end;
end;

Procedure SetUp;
Var bogst:string;
begin
   textcolor(cyan);
   textbackground(blue);

   textbox(9,22,15,59);
   textcolor(yellow);
   writeln('   1. Novice Level (20 screens)');
   writeln('   2. Expert Level (40 Screens)');
   writeln('   3. Genuis Level (Insane)');
   writeln;
     write('         Hit 1,2 or 3.');
   window(1,1,80,25);
   repeat levy:=readkey; until ((levy='1') or (levy='2') or (levy='3'));
   if levy='1' then level:=1;
   if levy='2' then level:=2;
   if levy='3' then level:=3;

  if paramstr(1)='XT' then xt:=true;
  SND :=0;
  deadcount:=0;
  olddead := false; nosound; fschar:=0; wall:=w2;CaneCode := random(14)+1;
  potcol := 0;potcntr:=0; cool :=0;ccount:=0; dead:=false;
  if start then begin;
   For i := 1 to 24 do chest[i] := ''; i:=1;
   Assign(CFile,SPath+'chester.sss'); Reset(CFile);
   repeat;
     readln(cfile,bogst); decrypt(bogst);
     clist[i,1]:=bogst; if clist[i,1]<>'!END!' then begin;
       readln(cfile,bogst); decrypt(bogst); clist[i,2]:=bogst;
       readln(cfile,bogst); decrypt(bogst); clist[i,3]:=bogst;
       repeat;
         readln(cfile,bogst); decrypt(bogst);
         if bogst <>'@' then chest[i] := chest[i]+bogst+' ';
       until bogst = '@';
     end;
     inc(i);
   until clist[i-1,1] = '!END!';
   i:=1;
   repeat;
     readln(cfile,bogst); decrypt(bogst);
     ttext[i] := bogst; inc(i);
   until bogst = '!END!';
   FOR L := i TO 19 * 6 DO TTEXT[L] :='                         ';
   close(CFile);
   Assign(BrFile,SPath+'bridge.SSS'); Reset(BrFile); Read(BrFile,Bridge); Close(BrFile);
   Assign(DFile,SPath+'Dragr.Spr'); Reset(DFile); Read(DFile,Drag[1]); CLose(DFile);
   Assign(DFile,SPath+'Dragl.Spr'); Reset(DFile); Read(DFile,Drag[2]); Close(DFile);
   Assign(DFile,SPath+'DeadD.Spr'); Reset(DFile); Read(DFile,Drag[3]); Close(DFile);
       FName := spath+'Teratory.SSS';
     Assign(SFile,FName); Reset(SFile);
   For J := 0 to Max do
   begin
     new(screens[j]);
     Read(SFile,Screens[J]^);
   end;
  end else For J := 0 to Max do Screens[J]^:= store[j]^;
  For I := 1 to snlng do begin
    Snake[1,I].X := 36+I; Snake[1,I].Y := 13;
    Snake[2,I].X := 36+I; Snake[2,I].Y := 13;
    Snake[3,I].X := 36+I; Snake[3,I].Y := 15;
  end;
  Screens[16]^[11,40].ch := HexSet[CaneCode];
  screens[30]^[1,40]:=blank; screens[29]^[25,40]:=blank;
  if (paramstr(1)='NING') and (paramstr(2)='NING') then begin alloff;
     touch := true;
     min:=9;my:=8;mx:=46;
     rin:=9;ry:=8;rx:=36;
     for i:=13 to 17 do
         screens[27]^[3,i]:=blank;
     screens[5]^[7,46]:=blank; screens[5]^[8,46]:=blank;
     screens[40]^[21,40]:=blank; screens[40]^[22,40]:=blank;
     end
  else begin
       screens[5]^[24,37]:=blank;
       if (paramstr(1)='ARCHEALOGISTS')AND(PARAMSTR(2)='DIG')AND(PARAMSTR(3)='IT')
          then begin alloff;screens[5]^[24,37].ch:=key; touch := true;
                            screens[5]^[24,37].att:=2; end;
       for j := 36 to 46 do screens[9]^[8][j]:=blank;
       for j:= 10 to 12 do screens[9]^[j][32]:=blank;
       For J:= 38 to 67 do screens[9]^[16][j]:=blank;
  end;

  IF LEVEL=1 THEN
     BEGIN
        {GREY PLUG UP}
          For i:= 6 to 7 do if screens[29]^[i-1,80].ch=#$c1
              then screens[29]^[i,80].ch:=#$c2 else screens[29]^[i,80].ch:=#$c1;
          for i:= 6 to 7 do screens[29]^[i,80].att:=screens[29]^[i-1,80].att;
  
        {gold cstle}
          for j:= 1 to 2 do for i:= 34 to 46 do if screens[8]^[j,i-1].ch=#$c1
              then screens[8]^[j,i].ch:=#$c2 else screens[8]^[j,i].ch:=#$c1;
          for j:=1 to 2 do for i:= 34 to 46 do screens[8]^[j,i].att:=screens[8]^[j,i-1].att;

        {drip screen}
          for j:= 1 to 1 do for i:= 36 to 44 do if screens[12]^[j,i-1].ch=#$c1
              then screens[12]^[j,i].ch:=#$c2 else screens[12]^[j,i].ch:=#$c1;
          for j:=1 to 1 do for i:= 36 to 44 do screens[12]^[j,i].att:=screens[12]^[j,i-1].att;


        {KILL RED KEY MNETRCANCE}
          FOR I:= 4 TO 8 DO FOR J:=47 TO 54 DO
              if not(screens[4]^[i,j].ch in wall) then SCREENS[4]^[i,j]:=BLANK;

        {CUT OUT ESCHER MAZE}
          FOR I:=1 TO 25 DO FOR J:=1 TO 17 DO SCREENS[31]^[I,J]:=BLOB;
          FOR I:=1 TO 25 DO FOR J:= 63 TO 80 DO SCREENS[31]^[I,J]:=BLOB;
          for j:=18 to 36 do screens[31]^[16,j]:=blank;

        {black castle}
          for j:= 1 to 5 do for i:= 7 to 25 do if screens[27]^[i-1,j].ch=#$c1
              then screens[27]^[i,j].ch:=#$c2 else screens[27]^[i,j].ch:=#$c1;
          for j:=1 to 5 do for i:= 7 to 25 do screens[27]^[i,j].att:=screens[27]^[i-1,j].att;
          for I:=11 to 70 do screens[27]^[3,i]:=blank;
        baton:=false;
        gsnakes:=false;
        rsnakeon:=false;
        spiderson:=false; ringon:= false;
        dripon:=false;
        screens[39]^[13,66]:=BLANK;
        screens[30]^[6,40]:=BLANK;
        Screens[4]^[8,49].ch := Sword;
        SCREENS[4]^[8,49].ATT:=YELLOW;



      END else
    begin
       {this stuff is advanced}

     if level=2 then
      begin;
       screens[8]^[5,68].ch:=potion;screens[8]^[5,68].att:=white;
       screens[8]^[15,41].ch:=potion;screens[8]^[15,41].att:=green;
       screens[19]^[17,40].ch:=potion;screens[19]^[17,40].att:=lightgreen;
       screens[19]^[13,26].ch:=potion;screens[19]^[13,26].att:=white;
       screens[34]^[12,24].ch:=potion;screens[34]^[12,24].att:=white;
       screens[15]^[13,58].ch:=potion;screens[15]^[13,58].att:=9;
       screens[36]^[9,31].ch:=potion;screens[36]^[9,31].att:=red;
       Screens[28]^[10,68].ch := potion; Screens[28]^[10,68].att :=2;
       Screens[21]^[7,66].ch := potion; Screens[21]^[7,66].att :=9;
       Screens[27]^[2,32].ch := potion; Screens[27]^[2,32].att :=red;
      end;
     Screens[38]^[12,40].ch := key; Screens[38]^[12,40].att :=7;
     Screens[3]^[11,39].ch := Sword;

    end;




   IF LEVEL = 3 THEN RINGON:=FALSE;
  Screens[10]^[17,63]. ch := door; screens[10]^[17,63].att :=0;
  Screens[10]^[18,63]. ch := door; screens[10]^[18,63].att :=0;
  Screens[4]^[17,66].ch:=sword;
  Screens[7]^[15,43].ch := key; Screens[7]^[15,43].att :=6;
  Screens[8]^[5,13].ch := key; Screens[8]^[5,13].att :=8;
  screens[9]^[16,62].ch:=key;screens[9]^[16,62].att:=red;
  Screens[22]^[12,41].att:=magenta;
  Screens[3]^[2,78].ch:=door; Screens[3]^[2,78].att:=8+7*16;
  WHERETO[0].left:=1; Whereto[0].right:=1; Whereto[0].up:=1;
  For J := 0 to Max do
    begin; WhereTo[J].OutX := 0; whereto[j].left := random(2)*3+7; WhereTo[j].Gin := 0;
    whereto[j].right := random(2)*3+7; whereto[j].up:=random(2)*3+7;whereto[j].down:=random(2)*3+7;
    end;
  WhereTo[0].down  := 6; whereto[0].outx:=40;whereto[0].outy:=17;
  Whereto[1].right:=11; whereto[1].gin:=39; whereto[1].outx:=77;
  whereto[1].outy:=21;
  WhereTo[1].down  := 2; WhereTo[1].up    := 5; WhereTo[1].Left  := 3;
  WhereTo[2].up    := 1; WhereTo[2].down  := 5; WhereTo[2].Right := 12;
  WhereTo[2].Gin   := 7;
  Whereto[3].up:=6;
  WhereTo[3].Left  := 4; WhereTo[3].Right := 1; whereto[3].gin:=30;
  whereto[3].outx:=4; whereto[3].outy:=3;
  Whereto[4].down  := 28;WhereTo[4].Left  := 12; WhereTo[4].Right := 3;
  whereto[4].gin:=22; whereto[4].outx:=41; whereto[4].outy:=12;
  whereto[4].up:=39;
  WhereTo[5].up    := 2; WhereTo[5].down  := 1; whereto[5].gin := 40;
  WhereTo[5].Left  := 6; WhereTo[5].Right := 6;
  Whereto[6].up:=12; whereto[6].down:=3;
  WhereTo[6].Left  := 5; WhereTo[6].Right := 5; WhereTo[6].Gin  := 8;
  WhereTo[7].Down  := 2; WhereTo[7].OutX := 26; WhereTo[7].OutY := 11;
  WhereTo[7].Up    := 10;
  WhereTo[8].Down  := 6; WhereTo[8].OutX := 40; WhereTo[8].OutY := 13;
  WhereTo[8].Up    := 20;


     WhereTo[9].Gin := 13;
      WhereTo[9].OutX := 40; WhereTo[9].OutY := 12;


  WhereTo[10].Down := 7; Whereto[10].gin := 41; whereto[10].outx := 11;
  Whereto[10].outy := 7;
  Whereto[11].up:=13; Whereto[11].left:=1;
  WhereTo[11].Down := 12; WhereTo[11].Gin := 13;
  whereto[12].down:=6;
  WhereTo[12].Left := 2;  WhereTo[12].Right := 4; WhereTo[12].Up := 11;
  WhereTo[12].Gin:=19; WhereTo[12].outx:=5; whereto[12].outy:=21;
  WhereTo[13].Up   := 16; WhereTo[13].Down := 11;
  WhereTo[13].Left := 14; WhereTo[13].Right:= 18;
  Whereto[13].outx:=40; whereto[13].outy:=13;
  WhereTo[14].Up   := 15; WhereTo[14].Right :=13; WhereTo[14].Gin := 18;
  WhereTo[14].OutX := 4; WhereTo[14].OutY := 24;
  WhereTo[15].Down := 14; WhereTo[15].Right := 16;
  WhereTo[16].Left := 15; WhereTo[16].Right := 17; WhereTo[16].Down := 13;
  WhereTo[17].Left := 16; WhereTo[17].Down := 18;
  WhereTo[18].Up   := 17; WhereTo[18].Left := 13; WhereTo[18].Gin := 14;
  WhereTo[18].OutX := 77; WhereTo[18].OutY := 24;
  WhereTo[19].Down :=27; WhereTo[19].Gin := 12; WhereTo[19].OutX:=3;
  WhereTo[19].OutY:=2; whereto[19].right:=29;
  WhereTo[20].Down := 8; WhereTo[21].right := 22; Whereto[22].left := 21;
  WhereTo[22].OutX := 49; WhereTo[22].OutY := 8; WhereTo[22].Gin := 4;
  WhereTo[21].Up := 23; Whereto[23].Right:=24;WhereTo[23].Down:=21;
  WhereTo[24].Left:=23;WhereTo[24].Right:=25;WhereTo[25].Left:=24;
  Whereto[25].Down:=26; Whereto[26].Up:=25;WhereTo[26].Right:=27;
  WhereTo[27].Left:=26; Whereto[27].up:=19; whereto[27].right:=30;
  WhereTo[27].gin:=31;  Whereto[28].up  := 4; whereto[28].down :=29;
  whereto[29].up  := 28; whereto[29].left:=19; whereto[29].down:=30;
  whereto[29].right:=38; whereto[30].up:=29;
  WhereTo[30].Left :=27; WhereTo[30].Gin:=3;
  WhereTo[30].outx:=78; whereto[30].outy:=2; whereto[30].down :=40;
  WhereTo[31].down:=27; whereto[31].right:=36; whereto[31].left:=32;
  whereto[31].up:=37; whereto[31].outx:=40; whereto[31].outy:=13;
  whereto[32].up:=33; whereto[32].left:=35; whereto[32].down :=33;
  whereto[32].right:=31; whereto[33].up:=32; whereto[33].right:=34;
  whereto[33].down:=32; whereto[33].left:=36;
  whereto[34].left:=33; whereto[34].right:=35;
  whereto[35].up:=36; whereto[35].right:=32; whereto[35].down:=36;
  whereto[35].left:=34; whereto[36].up:=35; whereto[36].right:=33;
  whereto[36].down:=35; whereto[36].left:=31; whereto[37].down:=31;
  whereto[38].right:=39; whereto[38].left:=29; whereto[39].left:=38;
  whereto[39].down:=4; whereto[39].gin:=1; whereto[39].outx:=35;
  whereto[39].outy:=9;
  whereto[40].up := 30; whereto[40].gin :=41; whereto[40].down :=5;
  whereto[40].right:=41; whereto[40].left :=41;
  whereto[40].outy:=7; whereto[40].outx:=50;
  whereto[41].down:=40; whereto[41].outx:=40;whereto[41].outy:=13;
  whereto[41].right:=40;whereto[41].left:=40;

  col[1]:=red; col[2]:=red; col[3]:=red; col[4]:=red; col[5]:=red;
  col[6]:=brown; col[7]:=green; col[8]:=brown; col[9]:=8; col[10]:=green;
  col[11]:=7; col[12]:=red; col[13]:=7; col[14] := 7; col [15] := 7;
  col[16] := 7; col[17] := 7; col[18] := 7; col[19] := 7; col[20]:=brown;
  dx:= 11;dy := 10; dc := 2;col[21]:=5;col[23]:=5;col[24]:=5;col[25]:=5;
  col[26]:=5;col[27]:=8;col[28]:=7;col[29]:=7; for I:=31 to 37 do col[I]:=8;
  col[38]:=7;col[39]:=7;col[40]:=2;col[41]:=2;col[30] := 0;

  for j := 0 to 63 do begin; b[j].y:=j div 8 + 9; b[j].x:=j mod 8 + 37; end;
  dpoints := 0;

  Bat[False,0] := Up; Bat[False,1]:=Dn;Bat[False,2]:=Mid;Bat[False,3]:=Dn;Bat[False,4]:=up;
  Bat[True,0]:= dn; Bat[True,1]:=up;Bat[True,2]:=Mid;Bat[True,3]:=up;Bat[True,4]:=Dn;
  BLSOUND:=0;

  For I := 1 to 4 do begin
    Str(I:0,FNum); FName := SPath+'Ring'+FNum+'.SSS';
    Assign(RFile,FName); Reset(RFile); Read(RFile,Ring[I]); Close(RFile);
  end;
  For I := 1 to 16 do begin
    FS[I].bod.att := 78; FS[I].X := 40; FS[I].Y := 13;
  end;
  Screens[3]^[2,78].ch:=door; Screens[3]^[2,78].att:=8+7*16;
  WHERETO[0].left:=1; Whereto[0].right:=1; Whereto[0].up:=1;
  Moves[1].X := 0; Moves[1].Y := 1;
  Moves[2].X := -1; moves[2].y:=0;
  moves[3].x:=0;moves[3].y:=-1;
  moves[4].x:=1;moves[4].y:=0;
  if start then for i := 0 to max do begin new(store[i]); store[i]^ := screens[i]^; end;

end;

Procedure drawbridge;
begin;
  for i:= 12 to 16 do for l := 36 to 44 do screens[30]^[i,l] := bridge[(i-12)*80+l];
  screens[5]^[7,46]:=blank;
  screens[5]^[8,46]:=blank;
end;

Procedure bugme;
Var spx,spy: integer;
begin
  for i:= 1 to 2 do begin
    Sp := Random(15);
    if random(3) =2 then
    if not(soundoff) then
    sound(420-trunc(sqrt(sqr(spiders[sp].y-trunc(y))+sqr(spiders[sp].x-trunc(x))))*5);
    Active[Spiders[Sp].Y,Spiders[Sp].X]:= screens[current]^[spiders[sp].y,spiders[sp].x];
    if spiders[sp].x < trunc(x) then spx := 1;
    if spiders[sp].x = trunc(x) then spx := 0;
    if spiders[sp].x > trunc(x) then spx := -1;
    if spiders[sp].y < trunc(y) then spy := 1;
    if spiders[sp].y = trunc(y) then spy := 0;
    if spiders[sp].y > trunc(y) then spy := -1;
    If (spiders[sp].y+spy = trunc(y)) and (spiders[sp].x+spx = trunc(x)) Then dead := true;
    if not ((ACTIVE[spiders[sp].y+spy][spiders[sp].x+spx].ch in wall)
       or (ACTIVE[spiders[sp].y+spy][spiders[sp].x+spx].ch in items))
     then begin spiders[sp].y := spiders[sp].y +spy;
                spiders[sp].x := spiders[sp].x + spx;
                end;
    Active[Spiders[Sp].Y,Spiders[Sp].X].ch := SpChars[Random(3)];
    Active[Spiders[Sp].Y,Spiders[Sp].X].att := Random(5)+9;
  end;
end;

Procedure SnakeMe(Var S:SType);
Begin
  If (S[1].X<80) and (trunc(X)>S[1].X) Then if (screens[current]^[S[1].Y,S[1].X+1].ch=' ') Then Inc(S[1].X)
     Else if (S[1].X>1) and (screens[current]^[S[1].Y,S[1].X-1].ch=' ') Then Dec(S[1].X);
  if (S[1].X>1) and (trunc(X)<S[1].X) Then if (screens[current]^[S[1].Y,S[1].X-1].ch=' ') Then Dec(S[1].X)
     Else if (S[1].X<80) and (screens[current]^[S[1].Y,S[1].X+1].ch=' ') Then Inc(S[1].X);
  If (S[1].Y<25) and (trunc(Y)>S[1].Y) Then if (screens[current]^[S[1].Y+1,S[1].X].ch=' ') Then Inc(S[1].Y)
     Else if (S[1].Y>1) and (screens[current]^[S[1].Y-1,S[1].X].ch=' ') Then Dec(S[1].Y);
  If (S[1].Y>1) and (trunc(Y)<S[1].Y) Then if (screens[current]^[S[1].Y-1,S[1].X].ch=' ') Then Dec(S[1].Y)
     Else if (S[1].Y<25) and (screens[current]^[S[1].Y+1,S[1].X].ch=' ') Then Inc(S[1].Y);
  For I := SNLNG downto 2 do begin
    S[I].X := S[I-1].X; S[I].Y := S[I-1].Y;
  end;
  Active[S[SnLng].Y,S[SnLng].X] := blank; Screens[Current]^[S[SnLng].Y,S[SnLng].X] := blank;
  Active[S[1].Y,S[1].X] := Ghead; Screens[Current]^[S[1].Y,S[1].X] := Ghead;
  For I := 2 to 11 do begin
    Active[S[I].Y,S[I].X] := Gbody;
    Screens[Current]^[S[I].Y,S[I].X] := Gbody;
  end;
  if trunc(x)=s[1].x then if trunc(y)=s[1].y then dead:=true;
end;

Procedure useitem;
  Begin
  if (back.ch = Hole) then
     begin;
      if not(later) then begin
      WhereTo[9].Gin := Current; Current := 9;
      WhereTo[9].OutX := Trunc(X); WhereTo[9].OutY := Trunc(Y);
      x:=63;y:=19;setscreen;
      back.ch:=' '; end else later := false;
      end else if  back.ch = Warp  then if back.att = 12 then begin;
          x := mx; y := my; back.ch := ' ';current := min;setscreen;end
          else begin; x := rx; y := ry; back.ch := ' ';current := rin; setscreen;
               end;
  Later := false;
  IF (back.ch = potion) then
     begin
      border(back.att);
      screens[current]^[trunc(y),trunc(x)].ch :=' ';
      if not(soundoff) then sound(620);snd:=2;
      back.ch:=' ';
      potcol:=back.att;
      potcntr:=pottm[potcol];
      if (potcol=15) or ((item.ch=tome) and holding) then setscreen;
     end
 end;

Procedure rollme;
begin
  if not(bridgeit) Then begin
    river:=riv2;
    for l := 1 to 3 do begin active[12+l,80].ch:=hexset[random($10)];
                             active[12+l,80].att:=49;
                       end;
     end
     Else begin
          riv3:=riv4; riv5:=riv6; riv7:=riv8; riv9:=riv10;
          for l := 1 to 3 do begin active[12+l,80].ch:=hexset[random($10)];
                             active[12+l,80].att:=49;
                       end;
          for l := 1 to 3 do begin active[12+l,37].ch:=hexset[random($10)];
                             active[12+l,37].att:=49;
                       end;
   end
end;

Procedure timer;
Var tim:byte;
begin
  tim:=25;
  if xt then begin
     tim:=22;
     if (current in cats) and not(potcol=15) and
        not((item.ch=tome) and holding) then Dec(tim,3);
     if current=28 then if blobon then Dec(tim,18);
     if bc = current then if baton then Dec(tim,2);
     if dc = current then if gdragon then Dec(tim,4);
     If current = 37 Then begin
       if rsnakeon then Dec(tim,4); if ringon then dec(tim,11);
     end;
     If current = 39 Then if fsnakeon then Dec(tim,11);
     if current = 38 then if spiderson then dec(tim,7);
     if (tcount < 1000) and (tcount > 900) then tim := tcount-900;
   end;
  If tim>240 then tim:=0; dlay(tim);
end;

Procedure BatMe;
begin
  If BC=Current then begin
    oBx :=Bx; oBy:=By;
    If holding and (bitem.ch = ' ') and (item.ch <> wings) then begin
      If trunc(Y)>trunc(BY) then BY:=BY+1 Else If trunc(Y)<trunc(BY) Then BY:=by-1.5;
      If trunc(X)>trunc(BX) Then BX:=bx+1 Else If trunc(X)<trunc(BX) Then BX:=BX-1;
      if (trunc(y)=trunc(by)) and (trunc(x)=trunc(bx))
         and not((item.ch=tome) and holding)
          then begin;
           if not(soundoff) then for l := 4 downto 2 do sound(trunc(sin(l)*500+500));
           if not(soundoff) then for l := 0 to 2 do sound(trunc(sin(l)*500+500));
           nosound;
         holding := false; bitem := item;
         active[trunc(y),trunc(x)+2]:=screens[current]^[trunc(y),trunc(x)+2];
        end;
    end
      Else begin
        Inc(BGC); If BGC=150 Then begin
          BGX:=Random*2-1;BGY:=Random*2-1; BGC:=0;end;
        BX:=BX+BGX;BY:=BY+BGY;
      end;
    Inc(r); If r=5 Then begin
      BX := (Random(3)-1.0)/2+BX; BY := BY+(Random(3)-1.0)/2;r:=0;end;
    If Bx < 1 then begin Bx :=76;bc:=whereto[current].left; end;
    if bx > 76 then begin bx:=1;bc:=whereto[current].right; end;
    if by<1 then begin by:=24;bc:=whereto[current].up; end;
    if by> 24 then begin by:=1;bc:=whereto[current].down; end;
    Inc(F); If f>8 then begin flap:=not(Flap); f:=0;end;
    If (trunc(obx)<>trunc(bx)) or (trunc(oby)<> trunc(by)) then begin
      if tcount > 1000 then
        for i:= 0 to 4 do active[trunc(oBy),trunc(oBx)+i]:=screens[current]^[trunc(oBy),trunc(oBx)+i];
      if bitem.ch <> blank.ch then active[trunc(oby)+1,trunc(obx)+2]:=screens[current]^[trunc(oby)+1,trunc(obx)+2]; end;
      bitem.att := (bitem.att and 15) + (screens[current]^[trunc(by)+1,trunc(bx)].att and 112);
    if bc=current then begin for i := 0 to 4 do begin
       active[trunc(By),trunc(Bx)+i]:=bat[Flap,i];
       active[trunc(by),trunc(bx)+i].att:=(active[trunc(by),trunc(bx)+i].att and 15) +
            (screens[current]^[trunc(by),trunc(bx)+i].att and 112);
    end;
    if bitem.ch <> blank.ch then active[trunc(by)+1,trunc(bx)+2]:=bitem;
      end
  end;
  IF bitem.ch=warp then if (bitem.att and $07) = 5 then begin mx:=trunc(bx)+2;
                                      my:=trunc(by)+1;min:=bc;end else
                                      begin rx:=trunc(bx)+2;
                                      ry:=trunc(by)+1;rin:=bc;end;
  If bitem.ch=hole then begin whereto[9].outx :=trunc(bx)+2;
                                 whereto[9].outy :=trunc(by)+1;
                                 whereto[9].gin := bc;
                           end;
  IF (RANDOM(200) = 100) and (bc in dropscrs) THEN IF (SCREENS[BC]^[TRUNC(BY)+1,TRUNC(BX)+2].CH = ' ')
                 AND ((SCREENS[BC]^[TRUNC(BY)+1,TRUNC(BX)+2].ATT and $f0)=0) then
                 begin bitem.att := bitem.att and 15;
                       screens[bc]^[trunc(by)+1,trunc(bx)+2]:=bitem;
                       bitem := blank; end;
  if bc <> current then case random(50) of
     1:begin bc:=whereto[bc].up;if bc=current then by:=24 else bx:=random(76)+1.0; end;
     2:begin bc:=whereto[bc].down;if bc=current then by:=1 else bx:=random(76)+1.0; end;
     3:begin bc:=whereto[bc].left;if bc=current then bx:=76 else by:=random(24)+1.0; end;
     4:begin bc:=whereto[bc].right;if bc=current then bx:=1 else by:=random(24)+1.0; end;
     end;
  IF bitem.ch=warp then if (bitem.att and $07) = 5 then begin mx:=trunc(bx)+2;
                                      my:=trunc(by)+1;min:=bc;end else
                                      begin rx:=trunc(bx)+2;
                                      ry:=trunc(by)+1;rin:=bc;end;

end;

Procedure dragon;
Var tdy:integer;
begin
 if dc = current then
   begin;
    if (potcol <> green) and (potcol<>lightgreen) and
      not((item.ch=tome) and holding) then begin
    If (Y<dy+2) and (dy>1) Then begin; for i := 0 to 7 do active[trunc(dy)+7,dx+i]:=screens[current]^[trunc(dy)+7,dx+i];
        dy := dy-0.75; end
    Else If (Y>dy) and (dy<18) Then begin; for i := 0 to 7 do active[trunc(dy),dx+i]:=screens[current]^[trunc(dy),dx+i];
         dy:=dy+0.75;end;
    If (Trunc(X)<dx+5) and (dx>1) Then
       begin; d:=2; for i := 0 to 7 do active[trunc(dy)+i,dx+7]:=screens[current]^[trunc(dy)+i,dx+7];Dec(dx); end
    Else if (Trunc(X)>dx) and (dx<72) Then
         begin; d:= 1; for i := 0 to 7 do active[trunc(dy)+i,dx]:=screens[current]^[trunc(dy)+i,dx];inc(dx);end;
    end;
    tdy := trunc(dy);
    for i := 0 to 7 do for j := 0 to 7 do begin; if (drag[d,i,j].ch = ' ')
      Then begin if tcount>1000 then
        active[i+tdy,j+dx] := screens[current]^[i+tdy,j+dx] end
        else begin
          active[i+tdy,j+dx] := drag[d,i,j];
          if drag[d,i,j].att and 112 = 0 then
             active[i+tdy,j+dx].att := (drag[d,i,j].att and 15) + screens[current]^[i+tdy,j+dx].att and 112;
        end;
     end;
    If ((tdy<=trunc(y)) and (tdy+7>=trunc(y))) and ((dx<=trunc(x)) and (dx+7>=trunc(x))) then INC(DPOINTS,30);
    IF DPOINTS > 100 THEN dead := true;
   end else if random(40) = 1 then begin; if Whereto[dc]. left = current then gt := 0 else
       if whereto[dc].right = current then gt := 1 else
       if whereto[dc].up = current then gt := 2 else
       if whereto[dc].down = current then gt := 3 else
       gt := random(4);
       case gt of
            0:begin; dc := whereto[dc].left; dx := 72;  end;
            1:begin; dc := whereto[dc].right; dx := 1; end;
            2:begin; dc := whereto[dc].up;  dy := 17; end;
            3:begin; dc := whereto[dc].down; dy := 1; end;
            end;
        end;
end;

Procedure blobme;
Var bqx,bqy,randy,brx,bry,q,r,try:integer;
    placed : boolean;
begin;
  for j := -1 to 1 do for l:= -1 to 1 do if screens[current]^[trunc(y)+j,Trunc(x)+l].ch=blob.ch then
    if level<>1 then
     if screens[current]^[trunc(y)+j,Trunc(x)+l].att=blob.att then dead:=true;
  placed := false; try := 0;
  r := random(64);
  brx := b[r].x; bry := b[r].y;
  If (((active[bry,brx-1].att<>85) and
       (active[bry-1,brx-1].att<>85) and
       (active[bry-1,brx].att<>85)) or
        ((active[bry,brx+1].att<>85) and
         (active[bry-1,brx+1].att<>85) and
         (active[bry-1,brx].att<>85)) or
        ((active[bry,brx-1].att<>85) and
         (active[bry+1,brx-1].att<>85) and
         (active[bry+1,brx].att<>85)) or
        ((active[bry,brx+1].att<>85) and
         (active[bry+1,brx+1].att<>85) and
         (active[bry+1,brx].att<>85)))
        then begin; screens[current]^[bry,brx] :=blank;
            if active[bry,brx].att =85 then active[bry,brx] := blank;
            repeat;
              q := random(64); Inc(CCount); Inc(Try);
              bqx:=b[q].x; bqy:= b[q].y; randy := random(64);
              Case ccount of
              4,6,8   :If b[RANDY].y < trunc(y) then cool :=0 else cool :=2;
              5,7,9,11:if b[randy].x < trunc(x) then cool :=1 else cool :=3;
              20 :begin;Cool := random(4); ccount :=0; IF COOL =4 THEN COOL := 0;end;
              end;
              case cool of
              0:if (active[bqy+1,bqx].ch = ' ') and ((active[bqy,bqx-1].att = blob.att)
                   or (active[bqy,bqx+1].att=blob.att)) then
                   begin;
                       b[r].y := bqy+1;b[r].x:= bqx;
                       If b[r].y >25 Then b[r].y := 25;
                       screens[current]^[b[r].y,b[r].x]:= blob;
                       active[b[r].y,b[r].x]:= blob;
                       placed:= true;
                 end;
              2:if (active[bqy-1,bqx].ch = ' ')
                and ((active[bqy,bqx-1].att = blob.att) or (active[bqy,bqx+1].att=blob.att)) then begin;
                       b[r].y := bqy-1;b[r].x:= bqx;
                       if b[r].y <1 then b[r].y := 1;
                       screens[current]^[b[r].y,b[r].x]:= blob;
                       active[b[r].y,b[r].x]:= blob;
                       placed:= true;
                 end;
              1:if (active[bqy,bqx+1].ch = ' ')
                and ((active[bqy-1,bqx].att = blob.att) or (active[bqy+1,bqx].att=blob.att)) then begin;
                       b[r].y := bqy;b[r].x:= bqx+1;
                       screens[current]^[b[r].y,b[r].x]:= blob;
                       active[b[r].y,b[r].x]:= blob;
                       placed:= true;
                 end;
              3:if (active[bqy,bqx-1].ch = ' ')
                and ((active[bqy+1,bqx].att = blob.att) or (active[bqy-1,bqx].att=blob.att)) then begin;
                       b[r].y := bqy;b[r].x:= bqx-1;
                       screens[current]^[b[r].y,b[r].x]:= blob;
                       active[b[r].y,b[r].x]:= blob;
                       placed:= true;
                 end;
              end;
              If (Try>=30) Then begin
                       screens[current]^[b[r].y,b[r].x]:= blob;
                       active[b[r].y,b[r].x]:= blob;
                       placed:= true
                 end;
            until placed;
           END;
           if not(soundoff) then SOUND(blsound);
           blsound:=blsound+random(40);
           if blsound > 200 then blsound := 20;
           SND:=5;
end;

Procedure Glowme;
Var ib,ie,jb,je:integer;
begin
 If (potcol <> 15) and not((item.ch=tome) and holding) then if holding then begin
  If x<6 Then jb:=1 else jb:=Trunc(x)-5;
  If x>74 Then je:=80 else je:=Trunc(x)+5;
  If y<2 Then ib:=1 else ib:=trunc(y)-2;
  If y>23 Then ie:=25 else ie:=trunc(y)+2;
  if x > ox Then for i:=ib to ie do begin
                 active[i,je]:=screens[current]^[i,je];
                 if x>5 then active[i,jb-1]:=blank;
            end;
  if x < ox Then for i:=ib to ie do begin
                 active[i,jb]:=screens[current]^[i,jb];
                 if x<75 then active[i,je+1]:=blank;
            end;
  if y > oy Then for i:=jb to je do begin
                 active[ie,i]:=screens[current]^[ie,i];
                 if y>3 then active[ib-1,i] := blank;
                 end;
  if y < oy Then for i:=jb to je do begin
                 active[ib,i]:=screens[current]^[ib,i];
                 if y<23 then active[ie+1,i] := blank;
                 end;
  If (x<>ox) and (y<>oy) then begin
    if (x<ox) and (y<oy) Then if (x<75) and (y<23) then active[ie+1,je+1] := blank;
    if (x>ox) and (y>oy) Then if (x>5) and (y>3) then active[ib-1,jb-1] := blank;
    if (x<ox) and (y>oy) Then if (x<75) and (y>3) then active[ib-1,je+1] := blank;
    if (x>ox) and (y<oy) Then if (x>5) and (y<23) then active[ie+1,jb-1] := blank;
  end;
 end;
end;

Procedure DoMe;
begin
  If current = 19 then if (trunc(x) = omx) and (trunc(y) = omy)
     then if tc > 5 then if holding and (item.ch = tome) then begin talktame;winme end else
          if level<>1 then talktame;
  if (item.ch = wings) and holding then begin wall := [];riveron:=false;
     if not(soundoff) then sound(40); end;
     if FKey[$39] and not(picky) Then begin grab:=not(grab); picky:=true;end;
     if fkey[185] then picky:=false;
  if grab then man.att:=lightcyan else man.att:=lightblue;
  ox := x; oy := y;

  if Fkey[$4b] and (not(screens[current]^[trunc(y),Trunc(x)-1].ch in Wall) or (TRUNC(x)=1)) then
    if (POTCOL=9) or ((item.ch=tome) and holding) or
    (wall=[]) or not(screens[current]^[trunc(y),trunc(x)-1].att div 16=1) then x:=x-1;
  if FKey[$4d] and (not(screens[current]^[trunc(y),Trunc(x)+1].ch in Wall) or (TRUNC(x)=80)) then
     if (POTCOL=9) or ((item.ch=tome) and holding) or
     (wall=[]) or not(screens[current]^[trunc(y),trunc(x)+1].att div 16=1) then x:=x+1;
  if FKey[$48] and (not(screens[current]^[trunc(y)-1,Trunc(x)].ch in Wall) or (trunc(y)=1)) then
     if (POTCOL=9) or ((item.ch=tome) and holding)
         or (wall=[]) or not(screens[current]^[trunc(y)-1,trunc(x)].att div 16=1) or (trunc(y)=1)
         then y:=y-0.75;
  if FKey[$50] and (not(screens[current]^[trunc(y)+1,Trunc(x)].ch in Wall) or (TRUNC(y)=25))then
     if (POTCOL=9) or ((item.ch=tome) and holding) OR
     (wall=[]) or not(screens[current]^[trunc(y)+1,trunc(x)].att div 16=1)
     or (trunc(y)=25) then y:=y+0.75;
  if (y>25) then begin; if (whereto[current].outx<> 0) and ((whereto[current].gin=0) or (current =40))  then
            begin;x:=whereto[current].outx;y:=whereto[current].outy;oy:=y+0.01;ox:=x;end
            else begin;y:=1;oy:=y+0.01; end;
       current := whereto[current].down; SetScreen;end;
  if (x>=80) and FKey[$4d] Then begin; Current := WhereTo[current].Right;
  X:=1;ox:=x+0.01;SetScreen;end;
  if (y<1) then begin; current := whereto[current].up; y:=25;oy:=y+0.01;SetScreen;end;
  if (x<=1) and FKey[$4b] Then begin; Current := WhereTo[Current].Left;
   X:=80;ox:=x-0.01; SetScreen; end;
 If (ox<>x) or (oy<>y) Then begin
  if active[trunc(y),trunc(x)].ch in [#171,#172,#253] then dead:=true;
  If not(current in cats) or holding or (potcol=15) Then
    Active[trunc(oy),Trunc(ox)] := screens[current]^[trunc(oy),trunc(ox)]
      Else Active[trunc(oy),Trunc(ox)] := blank;
  if holding and (item .ch = Warp) then if (item.att and 15)= 12 then
     begin rin := current; rx := trunc(ox)+2; ry := trunc(oy); end
         else begin min := current; mx := trunc(ox)+2; my := trunc(oy); end;
  if (item.ch = Hole) and holding then
              begin;whereto[9].gin := current; whereto[9].outx:=trunc(ox)+2; whereto[9].outy := trunc(oy); end;
  if holding and not(grab) and (Screens[current]^[trunc(oy),trunc(ox)+2].ch =' ')
                                    and ((Screens[current]^[trunc(oy),trunc(ox)+2].att and $f0) = 0)  then
             begin; IF ITEM.ch <> Block THEN
                    begin
                    if item.ch =wings then riveron := true;
                    IF (ITEM.CH = TOME) THEN
                       item.att:=yellow;
                    active[trunc(oy),trunc(ox)+2]:=item;
                    screens[current]^[trunc(oy),trunc(ox)+2]:=item;
                    wall:=w2;
                    end else begin
               screens[current]^[trunc(oy),trunc(ox)+2].ch:=#219;
               screens[current]^[trunc(oy),trunc(ox)+2].att:=col[current];
               active[trunc(oy),trunc(ox)+2].ch:=#219;
               active[trunc(oy),trunc(ox)+2].att:=col[current];end;
             holding:=false; If current in cats then setscreen;
             if not(soundoff) then for l := 4 downto 2 do sound(trunc(sin(l)*500+500));
           nosound;
         end;
      Back := screens[current]^[trunc(y),Trunc(x)];
  if canecode <> 16 then begin;
  If back.ch = #244 Then if cane[1] +cane[2] + cane[3] +cane[4] <> 1 then
    begin Screens[current]^[trunc(y),trunc(x)].ch := #245;
    Case current of
      14 : Cc := 1;
      15 : Cc := 2;
      17 : Cc := 3;
      18 : Cc := 4;
    end;
    cane[CC] := 0;
        for i:= 42 downto 38 do begin
          screens[16]^[21+cc,i].ch := ' '; if holding then active[trunc(y),trunc(x)+2] := item;
          if not(soundoff) then sound(150); dlay(13); end; NoSound;
  end;
   If back.ch = #245 Then begin Screens[current]^[trunc(y),trunc(x)].ch := #244;
    Case current of
      14 : Cc := 1;
      15 : Cc := 2;
      17 : Cc := 3;
      18 : Cc := 4;
    end;
    cane[CC] := 1;
    for i:= 38 to 42 do begin
      screens[16]^[21+cc,i].ch := #205; if not(soundoff) then sound(450); dlay(13); end; nosound;
  end;
 if cane[1]+cane[2]*2+cane[3]*4+cane[4]*8= canecode then begin
    canecode := 16; Active[trunc(y),trunc(x)] := Man;
    for i := 38 to 42 do for j := 22 to 25 do begin
      screens[16]^[j,i] := blank; if not(soundoff) then sound(((i*(j-21))*j)-600); dlay(55);
        end; nosound;
    end;
 end;
 if not((holding) and (item.ch = wings)) then begin;
  if back.ch = #248 then if (potcol<>lightgreen) then if (potcol<> green)
     and not((item.ch=tome) and holding) then
     begin tcount := 0; screens[current]^[trunc(y),trunc(x)] := blank;
     end;


  If Back.att = 78 then if current <> 0 then
    if (potcol <> 4) and not((item.ch=tome) and holding)
     then if ringon then dead := true;
   end;
  If current = 37 then if back.att = 64 then dead := true;
  if back.ch in [#171,#172,#253] then dead := true;
  if wall <> [] then begin
      if back.ch = #$fa then screens[current]^[trunc(y),trunc(x)].ch := #$db;
     if (back.ch in items) and not holding and grab then begin;
           holding := true;
           screens[current]^[trunc(y),trunc(x)].ch:=' ';
           item:=back;back:=Screens[Current]^[trunc(y),trunc(x)];
           if not(soundoff) then for l := 0 to 2 do sound(trunc(sin(l)*500+500));
           nosound;
     if item.ch=tome then setscreen;

      end else useitem;
      if back.ch =#236 then comon:=true else comon:=false;
      If Back.ch=Door Then
       if (active[trunc(y),trunc(x)+1].ch <> #179 ) and (active[trunc(y)-1,trunc(x)].ch <> #179) then
      begin if whereto[current].outx =0 then begin;X := 40; Y := 25;
      Current := WhereTo[Current].Gin; setscreen; end
                else
                  begin; x:=whereto[current].outx; y:=whereto[current].outy; Back.ch := ' '; Back.att := 0;
                  ox:=trunc(x)+1; oy:=trunc(y); later := true;
                  Current := WhereTo[Current].Gin; setscreen; end; end
          else if holding and (item.ch = Key) and ((item.att and 15)= col[current]) then begin;
          active[trunc(y),trunc(x)-2].ch := ' ';screens[current]^[trunc(y),trunc(x)-2].ch := ' ';
          active[trunc(y),trunc(x)-1].ch := ' ';screens[current]^[trunc(y),trunc(x)-1].ch := ' ';
          active[trunc(y),trunc(x)+1].ch := ' ';screens[current]^[trunc(y),trunc(x)+1].ch := ' ';
          active[trunc(y),trunc(x)+2].ch := ' ';screens[current]^[trunc(y),trunc(x)+2].ch := ' ';
          if not(soundoff) then for l := 0 to 200 do begin sound(L); dlay(1); end; NOSOUND;
          for j := -2 to 2 do begin;
          active[trunc(y)-1,trunc(x)+j].ch := ' ';screens[current]^[trunc(y)-1,trunc(x)+j].ch := ' ';
                end;
          if not(soundoff) then for l := 200 to 400 do begin sound(L); dlay(1); end; NOSOUND;
          if current <> 4 then begin X := 40; Y := 25; end else
          begin
           x:=whereto[4].outx; y:=whereto[4].outy; end;
        ox:=trunc(x)+1; oy:=trunc(y);
      Current := WhereTo[Current].Gin; setscreen;
               end;
      end;

  if holding then if (current in cats) and (ox>78) then active[trunc(oy),trunc(ox)+2]:= blank
    else active[trunc(oy),trunc(ox)+2]:=screens[current]^[trunc(oy),trunc(ox)+2];
  if holding and(item.ch =sword) and (current =19) then if not(olddead) then if
    trunc(x)+2=omx then if trunc(y) = omy then
    begin
     Active[trunc(y),trunc(x)] := Man; tc:=0;
     olddead := true; screens[19]^[omy,omx] := deadman; Victory{!};
    end;
  if holding and (item.ch = sword) AND (d<3) and (dc=current) then if ((TRUNC(X)>=dX-2) and (trunc(X)<=dX+5))
        AND ((trunc(y)>=trunc(dy)) and (trunc(y)<=trunc(dy)+7)) then begin
            Active[trunc(y),trunc(x)] := Man; gdragon:=false;
            d:=3; For i := trunc(dy) to trunc(dy)+7 do for j := dx to dx+7 do begin
                    if drag[d,i-trunc(dy),j-dx].ch=#32 then
                    Active[i,j] := screens[current]^[i,j] else begin
                    Active[i,j] := drag[d,i-trunc(dy),j-dx]; screens[current]^[i,j] := drag[d,i-trunc(dy),j-dx]; end;end;
                    active[trunc(y),trunc(x)+2] := item;
        Victory{!}; end;
  if current in cats then glowme;
  end;
  Active[trunc(y),Trunc(x)] := Man;
  If holding then begin
    item.att := (item.att and 15) + (screens[current]^[trunc(y),trunc(x)+2].att and 112);
    active[trunc(y),trunc(x)+2]:= item; end;
  If current =30 then if y >15 then begin
     whereto[30].left := 30;
     whereto[30].right := 30;
     end else begin whereto[30].left := 27; whereto[30].right := 2; end;
  if comon then computeme;

end;

Procedure RingMe;
begin
  For I := 1 to 10 do for L := 1 to 16 do
    If Ring[Rn,I,L].att div 16 <> 0 Then begin
      Active[7+I,31+L] := Ring[Rn,I,L];
      Screens[current]^[7+I,31+L]:=Ring[Rn,I,L];
    end;
  Inc(Rn); If Rn>4 Then Rn:=1;
end;

Procedure RSnakeMe;
begin
  ORSx:=RSx;ORSy:=RSy;Moved:=False;
  If (RSx in [3..17]) and (trunc(x) in [3..17]) and (RSy < 12) and (y<12) Then begin
    If (RSy=3) and not (RSx=17) Then MD := 4;
    If (RSx=17) and not (RSy=11) Then MD := 1;
    If (RSy=11) and not (RSx=3) Then MD := 2;
    If (RSx=3) and not (RSy=3) Then MD := 3;
    If Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].ch<>' ' Then
      begin
      if Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].att = Man.att Then dead := True;
      end
    Else begin
      RSx := RSx+Moves[MD].X; RSy := RSy+Moves[MD].y;
    end;
    Moved := True;
  end;
  If (RSx in [3..17]) and (trunc(x) in [3..17]) and (RSy > 14) and (y>14) Then begin
    If (RSy=15) and not (RSx=17) Then MD := 4;
    If (RSx=17) and not (RSy=23) Then MD := 1;
    If (RSy=23) and not (RSx=3) Then MD := 2;
    If (RSx=3) and not (RSy=15) Then MD := 3;
    If Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].ch<>' ' Then
      begin if Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].att = Man.att Then dead := True end
    Else begin
      RSx := RSx+Moves[MD].X; RSy := RSy+Moves[MD].y;
    end;
    Moved := True;
  end;
  If (RSx in [63..77]) and (trunc(x) in [63..77]) and (RSy < 12) and (y<12) Then begin
    If (RSy=3) and not (RSx=77) Then MD := 4;
    If (RSx=77) and not (RSy=11) Then MD := 1;
    If (RSy=11) and not (RSx=63) Then MD := 2;
    If (RSx=63) and not (RSy=3) Then MD := 3;
    If Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].ch<>' ' Then
      begin if Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].att = Man.att Then dead := True end
    Else begin
      RSx := RSx+Moves[MD].X; RSy := RSy+Moves[MD].y;
    end;
    Moved := True;
  end;
  If (RSx in [63..77]) and (trunc(x) in [63..77]) and (RSy > 14) and (y>14) Then begin
    If (RSy=15) and not (RSx=77) Then MD := 4;
    If (RSx=77) and not (RSy=23) Then MD := 1;
    If (RSy=23) and not (RSx=63) Then MD := 2;
    If (RSx=63) and not (RSy=15) Then MD := 3;
    If Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].ch<>' ' Then
      begin if Screen[RSy+Moves[MD].Y,RSx+Moves[MD].X].att = Man.att Then dead := True end
    Else begin
      RSx := RSx+Moves[MD].X; RSy := RSy+Moves[MD].y;
    end;
    Moved := True;
  end;
  If not Moved Then begin
    If (X>RSx) Then if (Active[RSy,RSx+1].ch=' ') Then Inc(RSx)
                Else if (RSx>1) and (Active[RSy,RSx-1].ch=' ') Then Dec(RSx);
    if (X<RSx) Then if (Active[RSy,RSx-1].ch=' ') Then Dec(RSx)
                Else if (RSx<80) and (Active[RSy,RSx+1].ch=' ') Then Inc(RSx);
    If (Y>RSy) Then if (Active[RSy+1,RSx].ch=' ') Then Inc(RSy)
                Else if (RSy>1) and (Active[RSy-1,RSx].ch=' ') Then Dec(RSy);
    If (Y<RSy) Then if (Active[RSy-1,RSx].ch=' ') Then Dec(RSy)
                Else if (RSy<25) and (Active[RSy+1,RSx].ch=' ') Then Inc(RSy);
  end;
  For I := RSize downto 2 do begin
    RSnake[I].X:=RSnake[I-1].X; RSnake[I].Y:=RSnake[I-1].Y;
  end;
  RSnake[1].X:=RSx;RSnake[1].Y:=RSy;
  Active[RSnake[RSize].Y,RSnake[RSize].X]:=Blank;
  Screens[Current]^[RSnake[RSize].Y,RSnake[RSize].X]:=Blank;
  Active[RSnake[1].Y,RSnake[1].X] := RHead;
  Screens[Current]^[RSnake[1].Y,RSnake[1].X]:=Blank;
  For I := 2 to RSize-1 do begin
    Active[RSnake[I].Y,RSnake[I].X] := RBody;
    Screens[Current]^[RSnake[I].Y,RSnake[I].X] := RBody;
  end;
end;

Procedure FSnakeMe;
Begin
  If (FS[1].X<80) and (trunc(X)>FS[1].X) Then if (screens[current]^[FS[1].Y,FS[1].X+1].ch=' ') Then Inc(FS[1].X)
     Else if (FS[1].X>1) and (screens[current]^[FS[1].Y,FS[1].X-1].ch=' ') Then Dec(FS[1].X);
  if (FS[1].X>1) and (trunc(X)<FS[1].X) Then if (screens[current]^[FS[1].Y,FS[1].X-1].ch=' ') Then Dec(FS[1].X)
     Else if (FS[1].X<80) and (screens[current]^[FS[1].Y,FS[1].X+1].ch=' ') Then Inc(FS[1].X);
  If (FS[1].Y<25) and (trunc(Y)>FS[1].Y) Then if (screens[current]^[FS[1].Y+1,FS[1].X].ch=' ') Then Inc(FS[1].Y)
     Else if (FS[1].Y>1) and (screens[current]^[FS[1].Y-1,FS[1].X].ch=' ') Then Dec(FS[1].Y);
  If (FS[1].Y>1) and (trunc(Y)<FS[1].Y) Then if (screens[current]^[FS[1].Y-1,FS[1].X].ch=' ') Then Dec(FS[1].Y)
     ElSe if (FS[1].Y<25) and (screens[current]^[FS[1].Y+1,FS[1].X].ch=' ') Then Inc(FS[1].Y);
  Inc(FSChar); If FSChar > 4 Then FSChar := 1;
  Case FSChar of
    1   : FS[1].Bod.Ch := #32;
    2,4 : FS[1].Bod.Ch := #176;
    3   : FS[1].Bod.Ch := #178;
  end;
  For I := 16 downto 2 do begin
    FS[I].X := FS[I-1].X; FS[I].Y := FS[I-1].Y; FS[I].Bod := FS[I-1].Bod;
  end;
  Active[FS[16].Y,FS[16].X] := blank; Screens[Current]^[FS[16].Y,FS[16].X] := blank;
  Active[FS[1].Y,FS[1].X] := FS[1].Bod; Screens[Current]^[FS[1].Y,FS[1].X] := FS[1].Bod;
  For I := 2 to 15 do begin
    Active[FS[I].Y,FS[I].X] := FS[I].Bod;
    Screens[Current]^[FS[I].Y,FS[I].X] := FS[I].Bod;
  end;
  if trunc(x)=fs[1].x then if trunc(y) = fs[1].y then if (potcol <> 4) and not((item.ch=tome) and holding)
     then dead :=true;
end;

Procedure titleme;
type titlescr = array [1..48,1..46] of cell;
var  tsfile : file of titlescr;
     ts : titlescr;
     s : array [1..120] of integer;
     bn,Sp,i,j,tk : integer;

begin
  s[1] :=196; s[2] :=247; s[3] :=294; s[4] :=370; s[5] :=392; s[6] :=392; s[7] :=392; s[8] :=392;
  s[9] :=392; s[10]:=440; s[11]:=392; s[12]:=392; s[13]:=392; s[14]:=392; s[15]:=370; s[16]:=330;
  s[17]:=370; s[18]:=370; s[19]:=294; s[20]:=294; s[21]:=294; s[22]:=294; s[23]:=294; s[24]:=294;
  s[25]:=196; s[26]:=247; s[27]:=294; s[28]:=370; s[29]:=392; s[30]:=392; s[31]:=392; s[32]:=392;
  s[33]:=392; s[34]:=440; s[35]:=392; s[36]:=392; s[37]:=392; s[38]:=392; s[39]:=370; s[40]:=330;
  s[41]:=370; s[42]:=370; s[43]:=220; s[44]:=220; s[45]:=220; s[46]:=220; s[47]:=220; s[48]:=220;
  s[49]:=196; s[50]:=247; s[51]:=294; s[52]:=370; s[53]:=392; s[54]:=392; s[55]:=392; s[56]:=392;
  s[57]:=392; s[58]:=440; s[59]:=392; s[60]:=392; s[61]:=392; s[62]:=392; s[63]:=330; s[64]:=370;
  s[65]:=392; s[66]:=392; s[67]:=392; s[68]:=440; s[69]:=440; s[70]:=440; s[71]:=494; s[72]:=494;
  s[73]:=494; s[74]:=494; s[75]:=392; s[76]:=440; s[77]:=494; s[78]:=494; s[79]:=494; s[80]:=494;
  s[81]:=494; s[82]:=523; s[83]:=494; s[84]:=494; s[85]:=494; s[86]:=440; s[87]:=440; s[88]:=392;
  s[89]:=440; s[90]:=440; s[91]:=392; s[92]:=392; s[93]:=392; s[94]:=392; s[95]:=392; s[96]:=392;
  s[97]:=392; s[98]:=392; s[99]:=370; s[100]:=294; s[101]:=220; s[102]:=220; s[103]:=220; s[104]:=220;
  s[105]:=220; s[106]:=247; s[107]:=262; s[108]:=262; s[109]:=262; s[110]:=247; s[111]:=247; s[112]:=220;
  s[113]:=247; s[114]:=247; s[115]:=196; s[116]:=196; s[117]:=247; s[118]:=294; s[119]:=392; s[120]:=392;

  sp:=1; Titled := true;
  assign(tsfile,SPath+'title.txt'); reset(tsfile);
  read(tsfile,ts); close(tsfile); ts[40,3].ch := sword;
  tk :=0; Window(19,7,62,21); GotoXY(1,15);
  bn :=15; XLoc := 0;
  repeat
    if not(soundoff) then sound(s[sp]); inc(sp);
    if (sp mod 4) = 0 then begin
      inc(tk); if (tk>bn) then if (tk<48) then begin
        writeln; for i := 18 to 63 do active[21,i+1] := ts[tk+1,i-17];
      end;
    end;
    if tk > 60 then begin tk:=-1; bn:=-1 end;
    dlay(180); if sp>120 then sp := 1;
  until (fkey[$48] or fkey[$4d] or fkey[$4b] or fkey[$50]);
  Window(1,1,80,25); NoSound;
end;

Begin
  StartFKey; repeat;
  Y := 24; X := 40; current :=0;
  allon;
  item := blank; bitem := blank;
  RANDOMIZE; titled := false; omx :=40 ; omy := 14; v :=0; h:=0; tc :=0;
  d := 1; rin := 30; min := 39; rx := 40; ry := 6; mx := 66; my := 13;Rn:=1;
  RSx:=40;RSy:=3; For I := 1 to RSize do begin RSnake[I].X:=40;RSnake[I].Y:=3;end;
  bridgeit:=false; holding :=false; k := 1; Cursor(Off); Back:=Blank;BItem:=Blank;
  setup; start := false; man.att := 9;
  For I := 0 to 14 do begin
  Spiders[I].X := Random(58)+22; Spiders[I].Y := Random(23)+2;
  end;

  repeat
  for i:=0 to 14 do if spiders[i].x<11 then spiders[i].x:=random(58)+22;

  dead:=false;
  Border(0);f:=0;r:=0;BC:=4;
  BX:=40;BY:=12;FLAP:=False;BGX:=1;BGY:=1;BGC:=0;
  Active := Screens[current]^; Active[Trunc(y),Trunc(x)] := Man;
  If not titled then Titleme;
  Repeat
    killbuff;
    if snd <1 then nosound else dec(snd);
    if dpoints > 0 then dec(dpoints);
    if potcntr > 0 then begin dec(potcntr);
                              if potcntr = 0 then begin potcol := 0; border(0);
                                 if current in cats then setscreen;end;end;
    If ((K =3) and (d<3) and gdragon) Then dragon;
    If (k in [1,3]) and baton Then BatMe;
    if tcount = 0 then cats := cats + [13..18];
    if tcount<1010 then begin inc(tcount); if (tcount > 300) and (tcount <800)
       then border(tcount div 67); end;
    if tcount < 1000 then if tcount > 500 then begin
      active[trunc(y),trunc(x)+2].ch := tome; active[trunc(y),trunc(x)+2].att := 14;
    end;
    TIMER;
    if tcount < 1011 then begin
      if tcount < 1000 then if tcount > 500 then
        active[trunc(y),trunc(x)+2] := screens[current]^[trunc(y),trunc(x)+2];
      if tcount = 10 then border(0);
      if tcount = 1000 then nosound;
      if tcount < 900 then if not (soundoff) THEN sound(random(tcount));
      if tcount > 900 THEN IF TCOUNT < 998 then if not(soundoff) then sound(random(1000-tcount));
      if tcount > 600 then if tcount < 750 then flashme;
      if tcount > 750 then if tcount < 900 then tripme;
      if (tcount < 1000) and (tcount >200) then man.ch := #1 else man.ch := #219;
      if tcount = 900 then begin
       border(0);
       for j := 1 to 2 do begin
         for i := 0 to 40 do begin
           if not(soundoff) then sound(random(1100));
           active := screens[i]^; dlay(65);
         end;
         dlay(70);
       end;
       cats := cats - [13..18];
       setscreen;
    end;
    if tcount < 800 then if tcount > 300 then border(random(16)) else
       if tcount = 1010 then begin border(0);inc(tcount); end;
  end;
    DoMe; Inc(K); If K=9 Then K := 1;
Case current of
    31:If gsnakes then if not(k=1) Then SNakeMe(Snake[1]);
    34:If gsnakes then if not(k=1) Then SnakeMe(Snake[2]);
     4:If gsnakes then if not(k=1) Then SnakeMe(Snake[3]);
    12:if k=1 then if dripon then dripme;
    37:if ringon then begin if k in [1,3,5,7,9] Then RingMe;
            if rsnakeon then if not (k in [3,7]) Then RSnakeme;
            end;
    39:if not(k in [1,6]) then if fsnakeon then FSnakeMe;
    28:if blobon then for bl := 1 to 3 do blobme;
    38:if k in [1,3,5,7] then if spiderson then bugme;
    30:if k in [1,3,5,7,9] then if riveron then rollme;
    19:if k =5 then if (not(olddead) and HERMITON) then oldmanme;
  end;
    if item.ch =tome then if screens[5]^[7,47].ch<> ' ' then begin
        screens[5]^[7,47]:=blank; screens[5]^[8,47]:=blank;
        screens[5]^[7,51].ch:=door; screens[5]^[8,51].ch:=door;
        screens[5]^[7,51].att:=8; screens[5]^[8,51].att:=8;
        screens[5]^[7,50] := blank; screens[5]^[8,50] := blank;
       end;
    if (item.att and 15)= green then if not(bridgeit) then if holding then
      if item.ch =key then begin bridgeit := true; drawbridge; end;
    if current=40 then if y >15 then  begin whereto[40].outy:=7; whereto[40].outx:=50 end
        else begin whereto[40].outy:=25; whereto[40].outx:=40 end;
    if xkey(ilock) then soundoff:=true else soundoff:=false;
    if xkey(nlock) and touch then begin computeme; xloc:= xloc and (255-nlock); end;
    if tester then
    begin;
    {qwerty}
     textattr:=14+col[current]*16;gotoxy(1,1);write(' ',current,' ',trunc(x),' ',trunc(y),' ');
     if fulltest then begin
          window(1,1,80,43);
          textattr:=yellow;
          gotoxy(70,30);write(whereto[current].up:3);
          gotoxy(65,32);write(whereto[current].left:3);
          gotoxy(75,32);write(whereto[current].right:3);
          gotoxy(70,34);write(whereto[current].down:3);




          gotoxy(1,30);
          write('Bat:',bc:3,'| ',trunc(bx):3,',',trunc(by):3,'    Holding:');
          if bitem.ch<>' ' then
            begin
              textcolor(bitem.att and 15);writeln(bitem.ch,qz);
            end else writeln('                           ');
            textattr:=green;
           writeln;
           write('Dragon:',dc:3,' | ',trunc(dx):3,',',trunc(dy):3,'   ');
           if gdragon then writeln('ON',QZ) else writeln('OFF',qz);
           writeln;
           textcolor(red);writeln('Red Teleport:',rin:3,' | ',rx:3,',',ry:3,qz);
           textcolor(magenta);writeln('Magenta Teleport:',min:3,' | ',mx:3,',',my:3,qz);
           textcolor(lightgray);
           writeln('Portable Hole:',WhereTo[9].Gin,' | ',WhereTo[9].OutX:3,',',WhereTo[9].OutY,qz);
           if potcntr>0 then begin
              textcolor(POTCOL);
              writeln('Potcol:',potcol:3,' Potcntr:',potcntr:3,qz); END
           else writeln('                               ');
           writeln;
           textattr:=red;writeln('Deadcount:',deadcount:3);
           writeln;
           textcolor(white);writeln('Free Memory:  ',memavail,'       ');
           gotoxy(26,42);writeln('   HOLD CTRL TO ADD VARIABLE WATCH  ');
           IF XKEY(CTRL) THEN BEGIN TEXTCOLOR(RED);
              GOTOXY(26,42);WRITELN('    INVALID ID SPECIFICATION!       ');
             END;



       end;
    end;
    IF POTCOL = DARKGRaY THEN cats := cats + [8,20,27,31..37,41];
    IF POTCOL = LIGHTMAGENTA THEN cats := [];
    IF ITEM.CH=TOME THEN begin
       ITEM.ATT:=(ITEM.ATT AND 240)+RANDOM(16);
       end;
  if fkey[1] then begin window(1,1,80,25);
                  textattr :=white;
                  clrscr; endfkey; textmode(3);
                  NOSOUND;
                  halt;
                 end;





  Until XKey(SLock) or dead;
  if xkey(slock) then dead := true;
  xloc:=xloc and (255-slock);
  If DEAD Then begin Die;inc(deadcount); end;
  POTCOL:=0; Wall := W2;
  current := 6;x := whereto[0].outx;y:=whereto[0].outy;
  dc:=2;
  until xkey(SLOCK) or (deadcount > 8);
  center(13,'ﬁ     Would you like to play again? (Y/N)    ›');
  Cats:= [21,22,23,24,25,26]; xloc:=0;
  for i := 1 to 4 do cane[i] := 1;
  killbuff; endit := readkey;
  until upcase(endit)='N';
  Cursor(On); nosound; killbuff; TextAttr:=7; clrscr; EndFKey;
End.
