with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;

package Ay.IntBlocks is

   type T_IntAdd is new T_Block(3) with null record;

   -- The method 'Init' initializes the block
   function doInit(b : in T_IntAdd) return Boolean;

   -- The method 'Calc[ulate]' implements the addition of the integers
   function doCalc (b : in T_IntAdd) return Boolean;

end Ay.IntBlocks;
