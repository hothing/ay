with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;
with Ay.IntBlocks; use Ay.IntBlocks;
with Ay.RealBlocks; use Ay.RealBlocks;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   type T_BlocksArray is array (1 .. 100) of P_Block;
   blks : T_BlocksArray;
   fvar1 : T_FloatGlobal;
   fvar2 : T_FloatGlobal;
   fadd : T_FloatAdd;
   --pb : P_Block;
   r , r2 : Boolean;
begin
   doInit(fvar1, r);


   doInit(fvar2, r);
   SetFloat(fvar2, 1, 2.0);

   doInit(fadd, r);
   Put("T_FloadAdd initialization is done: "); Put_Line(Boolean'Image(r));

   Boot.bindInput(fadd, 1, Boot.getOutput(fvar1, 1), r);
   Boot.bindInput(fadd, 2, Boot.getOutput(fvar2, 1), r);

   doCalc(fadd, r);
   Put("T_FloadAdd calculation is done: "); Put_Line(Boolean'Image(r));
   Put("T_FloadAdd calculated value: "); Put_Line(Float'Image(GetFloat(fadd, 3)));

   doFinal(fadd);

   blks(1) := new T_FloatGlobal;
   blks(2) := new T_FloatGlobal;
   blks(3) := new T_FloatGlobal;
   blks(4) := new T_FloatAdd;

   for i in 1 .. 4 loop
      init(blks(i).all, r);
   end loop;

   SetFloat(blks(1).all, 1, 1.0);
   SetFloat(blks(2).all, 1, 1.0);
   SetFloat(blks(3).all, 1, 1.0);

   Boot.bindInput(blks(4).all, 1, Boot.getOutput(blks(1).all, 1), r);
   Boot.bindInput(blks(4).all, 2, Boot.getOutput(blks(4).all, 3), r);
   Boot.bindInput(blks(3).all, 1, Boot.getOutput(blks(4).all, 3), r);

   r2 := true;
   for k in 1 .. 10_010_000 loop
      for i in 1 .. 4 loop
         calc(blks(i).all, r);
         r2 := r2 and r;
      end loop;
   end loop;

   Put("T_FloadAdd/2 calculation is done: ");
   Put_Line(Boolean'Image(r2));
   Put("T_FloadAdd/2 calculated value: ");
   Put_Line(Float'Image(getFloat(blks(3).all, 1)));

   for i in 1 .. 4 loop
      finalize(blks(i).all);
   end loop;

end Main;
