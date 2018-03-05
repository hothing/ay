with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;
with Ay.IntBlocks; use Ay.IntBlocks;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   type T_BlocksArray is array (0 .. 100000) of P_BlockRoot;
   ma : T_MemoryAllocatorS;
   fa : T_BlocksArray;
   j, m : Integer;
   res : Boolean;
begin

   fa(0) := new T_Block;
   fa(1) := new T_IntRead;
   fa(2) := new T_IntRead;
   fa(3) := new T_AddInt;
   fa(4) := new T_IntWrite;

   -- makes block only as load
   for i in 5 .. fa'Last loop
      j := i mod 5;
      case j is
         when 0 => fa(i) := new T_AddInt;
         when 1 => fa(i) := new T_SubInt;
         when 2 => fa(i) := new T_MulInt;
         when 3 => fa(i) := new T_DivInt;
         when 4 => fa(i) := new T_ModInt;
         when others => null;
      end case;
   end loop;

   init(ma, 200000, 100, 100);

   for j in 0 .. fa'Last loop
      init(fa(j).all, ma);
   end loop;

   Put("acclocated T_Real: "); Put_Line(T_CellIndex'Image(ma.ipt));

   res := makeLink(fa(1).all, fa(3).all, 0, 0);
   res := makeLink(fa(2).all, fa(3).all, 0, 1);

   m := 1000;
   for i in 0 .. m loop
      for j in 0 .. fa'Last loop
         res := calculate(fa(j).all);
      end loop;
   end loop;

   Put("Cycles amount is "); Put_Line(Integer'Image(m));
   Put("Blocks amount is "); Put_Line(Integer'Image(fa'Last));
   Put("Blocks executed is "); Put_Line(Integer'Image(m * fa'Last));

end Main;
