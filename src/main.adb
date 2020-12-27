with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;
with Ay.IntBlocks; use Ay.IntBlocks;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   type T_BlocksArray is array (0 .. 100000) of P_Block;
   --j, m : Integer;
   --res : Boolean;
   ----
   vb : T_Value(DT_Bool);
   vi : T_Value(DT_Int);
   vf : T_Value(DT_Float);
begin

   vb.m := True;
   vi.di := 1234_5678;
   vf.fp := 3.14159;
   Put("T_Value/Bool size: "); Put_Line(Integer'Image(vb'Size));
   Put("T_Value/Int size: "); Put_Line(Integer'Image(vi'Size));
   Put("T_Value/Float size: "); Put_Line(Integer'Image(vf'Size));


end Main;
