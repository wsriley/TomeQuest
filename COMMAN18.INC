Procedure computeme;
Var ins:string;
    bchar:char;
    Scr,hold : integer;
    label HERE;
begin;
  nosound; ins := ''; textattr :=113;
  Window(10,4,70,18); clrscr; setattr(120,10,4,70,18);
here:  tb(4,10,18,70);
  setattr(120,9,18,71,21); for i:=10 to 70 do begin screen[18,i].ch := #205;
    screen[21,i].ch := #205; end;
  for i:=19 to 20 do begin screen[i,9].ch:=#179; screen[i,71].ch:=#179; end;
  screen[18,9].ch:=#213; screen[18,10].ch:=#202; screen[18,70].ch:=#202; screen[18,71].ch:=#184;
  screen[21,9].ch:=#212; screen[21,71].ch:=#190;
  setattr(113,10,20,70,20); setattr(112,29,19,34,19);
  writestr(19,10,'    DRAGON   BAT   SNAKES(G/R/F)   SPIDERS   BLOB   DRIP     ');
  writestr(20,10,'DRAGON SCREEN:00  RINGOFIRE RIVER HERMIT SOUND  BAT SCREEN:00');
  statme;
  window(12,5,68,17); cursor(on);clrscr;
  writeln('     SS Software Developement Environment 1990');
  writeln('             Created by Steve & Tom');
  writeln('           Type HELP for Level 0 commands.');
  writeln;
  repeat; ins := '                                                    ';
  write('SS> '); killbuf;
  ginput(ins,52,113);
  writeln; ins := caps(ins);
  if copy(ins,1,4) = 'LOAD' then begin delete(ins,1,5); writeln (' Procedure ',ins,' ID error.'); ins :=''; end else
  if ins = 'EDIT' then begin writeln('PROCEDURE VICTORY CURRENTLY IN EDITOR:');
      writeln('   Procedure Victory{!};');
      writeln('    begin');
      writeln('     if not(soundoff) then begin');
      writeln('      Sound(880); Delay(300);');
      writeln('      Sound(740); Delay(100);');
      writeln('      Sound(880); Delay(200);');
      writeln('      Sound(1174);Delay(400);');
      writeln('     end;');
      writeln('    end;');
      hold := textattr; textattr:=red+blink+LIGHTGRAY*16;
     writeln(' MUST ENTER USER ID TO CONTINUE EDIT.');
     write(' WHAT ID WILL YOU USE, STEVE OR TOM?');
     textattr := hold; writeln;
     end else
  if copy(ins,1,2) ='ID' then begin
         hold := textattr; writeln;
         textattr:=red+blink+LIGHTGRAY*16;
         write('      INVALID ID SPECIFICATION !');
         textattr:=hold; writeln;
         writeln('     * * * SECURITY LEVEL -- 0 * * *');
         writeln;
         end else
       if ins='RIVER' then begin riveron:=not(riveron);
         if riveron then setattr(14,38,20,42,20) else setattr(112,38,20,42,20);
       end else
       IF INS= 'SPIDERS' THEN begin spiderson:=not(spiderson); if spiderson then
         setattr(14,45,19,51,19) else setattr(112,45,19,51,19);end else
       IF INS='BLOB' THEN begin blobon:=not(blobon); if blobon then
         setattr(14,55,19,58,19) else setattr(112,55,19,58,19);end else
       IF INS='BAT' THEN begin baton:=not(baton); if baton then
         setattr(14,23,19,25,19) else setattr(112,23,19,25,19);end else
       IF INS='RING' THEN begin ringon:=not(ringon); if ringon then
         setattr(14,28,20,36,20) else setattr(112,28,20,36,20);end else
       IF INS='DRAGON' THEN begin gdragon:=not(gdragon); if gdragon and (d<3) Then
         setattr(14,14,19,19,19) else setattr(112,14,19,19,19);end else
       IF INS ='GSNAKE' THEN begin gsnakes:=not(gsnakes);
         if gsnakes then screen[19,36].att:=14 else screen[19,36].att := 112; end else
       IF INS ='RSNAKE' THEN begin rsnakeon:=not(rsnakeon);
         if rsnakeon then screen[19,38].att:=14 else screen[19,38].att := 112;end else
       IF INS='FSNAKE' THEN begin fsnakeon:=not(fsnakeon);
         if fsnakeon then screen[19,40].att:=14 else screen[19,40].att := 112; end else
       IF INS ='SOUND' THEN begin SOUNDOFF :=not(soundoff); if soundoff then
         setattr(112,51,20,55,20) else setattr(14,51,20,55,20);end else
       IF INS='HERMIT' THEN begin HERMITON:=not(hermiton); if HERMITON and not(olddead)
         then setattr(14,44,20,49,20) else setattr(112,44,20,49,20);end else
       IF INS ='DRIP' Then begin dripon:=not(dripon); if dripon then
         setattr(14,62,19,65,19) else setattr(112,62,19,65,19);end else
       IF INS ='HELP' then begin
       writeln(' LEVEL 0 BASIC COMMAND OPTIONS:');
       WRITELN;
       writeln('  ALLON/OFF - Turn all monsters On/Off.');
       writeln('  DIR       - List all procedures for current reality.');;
       writeln('  DONE      - Logoff computer.');
       writeln('  EDIT      - View text in editor-No compile on level 0.');
       writeln('  ID        - Change ID & Security level.');
       writeln('  ITEM      - Get specific magic item($0-$E).');
       writeln('  LOAD      - Load new procedure into editor.');
       WRITELN('  Monster toggles: (turn monster ON/OFF) BLOB RING BAT');
       writeln('   HERMIT SPIDERS G/R/FSNAKE DRAGON SOUND RIVER DRIP');
       WRITELN(' Type HELP2 for extended help commands.');
       END else
       if ins='DIR' then begin
        writeln('0000:0040       DECRYPT');
        writeln('0000:00F0       WINME');
        writeln('0000:0125       FLASHME');
        writeln('0000:0241       TRIPME');
        writeln('0000:034B       DRIPME');
        writeln('0000:0616       KILLBUF');
        writeln('0000:063B       ALLOFF');
        writeln('0000:0680       ALLON');
        writeln('0000:06C5       VICTORY');
        PAUSE('HIT A KEY TO CONTINUE.');
        writeln;
        writeln('0000:0724       STATME');
        writeln('0000:1444       COMPUTEME');
        writeln('0000:2976       TALKTAME');
        writeln('0000:2D7B       OLDMANME');
        writeln('0000:2F5E       DIE');
        writeln('0000:33D2       SETUP');
        writeln('0000:4449       SETSCREEN');
        writeln('0000:4613       DRAWBRIDGE');
        writeln('0000:46B2       BUGME');
        PAUSE('HIT A KEY TO CONTINUE.');
        writeln;
        writeln('0000:4A9C       SNAKEME');
        writeln('0000:4F32       USEITEM');
        writeln('0000:50C3       ROLLME');
        writeln('0000:5259       TIMER');
        writeln('0000:5353       BATME');
        writeln('0000:6078       DRAGON');
        writeln('0000:6753       BLOBME');
        writeln('0000:707D       GLOWME');
        writeln('0000:77A4       DOME');
        PAUSE('HIT A KEY TO CONTINUE.');
        writeln;
        writeln('0000:947E       RINGME');
        writeln('0000:95CB       RSNAKEME');
        writeln('0000:9E49       FSNAKEME');
        writeln('0000:A2D6       TITLEME');
       end else
       if (copy(ins,1,4) ='ITEM') and (ins[6] in ['0'..'9','A'..'F','/']) then
         if holding then writeln('MUST DROP CURRENT ITEM TO CALL NEW ONE!')
         else begin;
        GRAB:=TRUE;
        PICKY:=FALSE;
        holding :=true;
        case ins[6] of
             '1': begin item.ch := sword; item.att := random(15)+1; end;
             '2': begin item.ch := key; item.att := 6; end;
             '3': begin item.ch := key; item.att := 8; end;
             '4': begin item.ch := key; item.att := 7; end;
             '5': begin item.ch := key; item.att := red;  end;
             '6': begin item.ch := potion; item.att := white; end;
             '7': begin item.ch := potion; item.att := green; end;
             '8': begin item.ch := potion; item.att := red; end;
             '9': begin item.ch := potion; item.att := 9; end;
             '0': begin item.ch := block; item.att := random(15)+1; end;
             'A': begin item.ch := warp; item.att := 12;
                        screens[rin]^[ry,rx] := blank;
                     end;
             'B': begin item.ch := warp; item.att := 13;
                        screens[min]^[my,mx] := blank;
                     end;
             'C': begin item.ch := hole; item.att := random(15)+1; end;
             'D': begin item.ch := key; item.att := green; end;
             'E': begin inc(textattr,128);
                  writeln('GUTENBERGS NUMEROLOGICAL PRESS IN ACTION!');
                  write('REPRINTING TOME BIT BY BIT');
                  for i := 1 to 6 do begin write(' .'); delay(600); end;
                  writeln; item.ch:=tome;item.att:=14;
                  Dec(textattr,128);
                  end;
             'F':begin item.ch := potion; item.att :=lightgreen; end;
             '/':begin item.ch:=wings; item.att := 15; end;

            end; end else
       if ins = 'ITEM' then begin
          writeln;
          writeln('COMMAND NEEDS PARAMETER ($0 - $E)');
          writeln;
          writeln('-1- Sword       -6- White Potion    -A- Red Teleport');
          writeln('-2- Gold Key    -7- Green Potion    -B- Magenta Teleport');
          writeln('-3- Black Key   -8- Red Potion      -C- Portable Hole');
          writeln('-4- Grey Key    -9- Blue Potion     -D- Green Key');
          writeln('-5- Red Key     -0- Magic Block     -E- HolyTome');
          writeln;
          end else
       if ins = 'ALLOFF' then begin alloff; statme; end else
       if ins = 'RESTORE' then Writeln('COMMAND NEEDS 2-DIGIT SCREEN# (00-42)!') else
       if (copy(ins,1,7)='RESTORE') then begin
         val(copy(ins,9,2),scr,hold);
         if not scr in [0..42] then writeln('NUMBER MUST BE BETWEEN 00-42!')
           else Screens[Scr]^:=Store[Scr]^
       end else
       if ins = 'ALLON' then begin allon; statme; end else
       if ins = 'TEST' then begin tester := not(tester);
                       if tester then begin
                       TextMode(Lo(LastMode)+Font8x8);
                         if hi(windmax)>30 then fulltest:=true else
                            fulltest:=false;
                         nosound; ins := ''; textattr :=113;
                         Window(10,4,70,18); setattr(120,10,4,70,18);
                     goto here; end
                     else begin textmode(3);
                       nosound; ins := ''; textattr :=113;
                       Window(10,4,70,18); setattr(120,10,4,70,18);
                     goto here; end
                     end



         else
       if ins = 'FREE' then writeln(memavail,' bytes free.') else
       if ins = 'CLS' then clrscr else
       if (ins = 'DESTROY') or (ins ='DEL') or (ins='DELETE')  then
          begin;
            writeln('* * * Destroying Known Universe * * *');
            writeln('Feeling a little mean today aren''t we?');
            for z:= 0 to 39 do for i := 2 to 24 do for j := 2 to 79 do
              screens[z]^[i,j] := blank;
            writeln;
            writeln('* * * Universe Destroyed * * *');
            victory;
            writeln('Are you happy now?');
            nosound;
          end else
       if ins = 'EXIT'then begin writeln('RETURNING TO DAHZ . . . ');
              delay(500); window(1,1,80,25);
              textattr :=white; clrscr; endfkey; textmode(3);
              halt; end else
       if ins = 'TOUCH' then touch :=not(touch) else
       IF INS ='HELP2' then begin
       writeln(' SPECIAL COMMAND OPTIONS:');
       writeln('  RESTORE   - Reload/Remake a screen #(00-42).');
       writeln('  BLINK     - Toggle Citadel Beacons of Holy Light.');
       writeln('  CLS       - Clear computer screen.');
       writeln('  DEAD      - Change Total Death Count #(0-7).');
       writeln('  EXIT      - Return to Dahz.');
       writeln('  FREE      - Show amount of free heap memory.');
       writeln('  ESTAT     - Show status of extended command states.');
       writeln('  TEST      - Enter testing mode.');
       writeln('  TOUCH     - Makes NUMLOCK turn computer on-Anywhere.');
       writeln;
       END else
       if ins ='ESTAT' then begin
          writeln;
          i:=textattr;textcolor(black); if tester then
              begin textcolor(yellow); textbackground(black); end;
              write('TEST');
          textattr:=i;write('    ');;textcolor(black); if touch then
              begin textcolor(yellow); textbackground(black); end;
              write('TOUCH');
          textattr:=i;write('    ');textcolor(black); if (SCREENS[40]^[8,32].ATT AND 128) > 0 then
              begin textcolor(yellow); textbackground(black); end;
              write('BLINK');
          textattr:=i;write('    ');textcolor(black); writeln('DEAD :',deadcount);
          textattr:=i;
          writeln;
          writeln;
       end else
       if (copy(ins,1,4) ='DEAD') and (ins[6] in ['0'..'8'])
                        then deadcount := ord(ins[6])-48 else
       IF INS = 'BLINK' THEN BEGIN
                 SCREENS[40]^[8,32].ATT:=SCREENS[40]^[8,32].ATT XOR $80;
                 SCREENS[40]^[8,34].ATT:=SCREENS[40]^[8,34].ATT XOR $80;
                 SCREENS[40]^[8,46].ATT:=SCREENS[40]^[8,46].ATT XOR $80;
                 SCREENS[40]^[8,48].ATT:=SCREENS[40]^[8,48].ATT XOR $80;
               END ELSE
       if (ins ='VER') or (ins='VERSION') then writeln('BETA') else
       if ins = 'DONE' then begin end else
       if ins <> copy(caps('                                                    '),1,length(ins))
         then  begin writeln(' ILLEGAL DIRECT !'); writeln(' TYPE HELP FOR COMMAND OPTIONS !'); end;
  until ins = 'DONE';
  cursor(off); COMON := FALSE; window(1,1,80,25); setscreen;
end;

Procedure talktame;
Var bogbuf : Scrtype;
    wol,wt,wt2,wx,wy,sv,sv2,cf : integer;
    mestr : string;
    bchar : char;
begin
  KILLBUF;
  nosound;
  tc :=0; bogbuf := active;
  if (holding and (item.ch = tome)) then mestr := 'WINITGINGABELL'
  else begin
    window(1,22,80,25);clrscr;
    setattr(25,1,22,80,25); tb(22,1,25,80);
    Window(3,23,78,24);
    mestr := '                                                                                          ';
    cursor(on); textattr := 30;
    ginput(mestr,75,30);
    if mestr ='' then mestr :='*!*!*@*!*';
    mestr:=caps(mestr);
  end;
  if mestr = 'DIG IT LINDSAY!' then computeme else begin
  cf :=0; Cursor(Off);
  for sv := resnum downto 1 do for sv2 := 1 to 3 do if pos(clist[sv,sv2],mestr) > 0 then cf := sv;
  if tcount < 1000 then cf := random(resnum)+1;
   if not (cf in [1..21]) then cf := random(4) +22;
   wt:=random(40)+30; wx:=random(79-wt)+1; Wt2 := length(chest[cf]) div (wt-4) +3;
   wy := random(20 - wt2)+2;
  textattr :=113;
  Window(wx,wy,wx+wt,wy+wt2); clrscr;
  setattr(120,wx,wy,wx+wt,wy+wt2);
  tb(wy,wx,wy+wt2,wx+wt);
  window(wx+2,wy+1,wx+wt-2,wy+wt2-1);
  wol := 1; mestr := ''; i :=1;
     repeat;
        mestr:=mestr+chest[cf][i];
        inc(i); inc(wol);
        if wol = wt-3 then begin wol :=1;
          while mestr[length(mestr)] <> ' ' do begin
            dec(i); delete(mestr,Length(mestr),1);
          end;
          Writeln(mestr); Mestr:='';
       end;
     until i =length(chest[cf]);
  Write(Mestr); bchar:=readkey;
  end;
  Active := bogbuf; window(1,1,80,25);
end;
