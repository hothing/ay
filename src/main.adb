with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;
with Ay.IntBlocks; use Ay.IntBlocks;
with Ay.RealBlocks; use Ay.RealBlocks;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   type T_BlocksArray is array (0 .. 100) of P_Block;
   blks : T_BlocksArray;
   fvar1 : T_FloatGlobal;
   fvar2 : T_FloatGlobal;
   fadd : T_FloatAdd;
   --pb : P_Block;
   r : Boolean;
begin
   doInit(fvar1, r);
   SetFloat(fvar1, 1, 1.0);

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

   --Put("T_ZValue casting test; Bool value: "); Put_Line(Boolean'Image(zx.val.m));
   --Put("T_ZValue casting test; Int value: "); Put_Line(Integer'Image(zx.val.di));
   --Put("T_ZValue casting test; Float value: "); Put_Line(Float'Image(zx.val.fp));

end Main;
