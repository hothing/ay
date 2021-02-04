with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;
with Ay.Block.IntegerOp; use Ay.Block.IntegerOp;
with Ay.Block.RealOp; use Ay.Block.RealOp;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   type T_BlocksArray is array (1 .. 100) of P_Block;
   blks : T_BlocksArray;
   pb : P_Block;
   r , r2 : Boolean;
   n : Integer := 10_000;
   m : Integer := 5;
   ec : Integer;
begin
   null;
end Main;
