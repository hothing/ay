with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;
with Ay.IntBlocks; use Ay.IntBlocks;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   type T_BlocksArray is array (0 .. 100000) of P_Block;
   type T_MemX is array (0 .. 10) of T_XValue;
   --j, m : Integer;
   --res : Boolean;
   ----
   vb : T_Value(DT_Bool);
   vi : T_Value(DT_Int);
   vf : T_Value(DT_Float);

   xb : T_XValue(DT_Bool);
   xi : T_XValue(DT_Int);
   xf : T_XValue(DT_Float);
   xx : T_XValue;
   ax : T_MemX;
   yb : T_FlatValue;

   zx : T_ZValue;
begin

   vb.m := True;
   vi.di := 1234_5678;
   vf.fp := 3.14159;
   Put("T_Value/Bool size: "); Put_Line(Integer'Image(vb'Size));
   Put("T_Value/Int size: "); Put_Line(Integer'Image(vi'Size));
   Put("T_Value/Float size: "); Put_Line(Integer'Image(vf'Size));

   xb.m := True;
   xf.fp := vf.fp;
   xx := xf;
   ax(0) := xb;
   ax(1) := xf;
   Put("T_XValue/Bool size: "); Put_Line(Integer'Image(xb'Size));
   Put("T_XValue/Int size: "); Put_Line(Integer'Image(xi'Size));
   Put("T_XValue/Float size: "); Put_Line(Integer'Image(xf'Size));

   Put("T_FlatValue size: "); Put_Line(Integer'Image(yb'Size));

   Put_Line(Boolean'Image(xb.m));
   --Put_Line(Boolean'Image(ax(1).m));

   zx.des := DT_Bool;
   zx.val.m := True;
   zx.val.di := 1111;

   Put("T_ZValue casting test; Bool value: "); Put_Line(Boolean'Image(zx.val.m));
   Put("T_ZValue casting test; Int value: "); Put_Line(Integer'Image(zx.val.di));
   Put("T_ZValue casting test; Float value: "); Put_Line(Float'Image(zx.val.fp));

   Put("T_ZValue size: "); Put_Line(Integer'Image(zx'Size));
   Put("T_ZValue.des size: "); Put_Line(Integer'Image(zx.des'Size));
   Put("T_ZValue.value size: "); Put_Line(Integer'Image(zx.val'Size));

end Main;
