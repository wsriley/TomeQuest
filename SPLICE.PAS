Var f,t:file of byte;
    i:word;
    z:byte;

begin
assign(f,'title2.txt');
assign(t,'title.txt');
reset(f);
reset(t);
for i:= 0 to 3940 do
   begin
    read(f,z);
    write(t,z);
   end;
close(f);close(t);
end.
