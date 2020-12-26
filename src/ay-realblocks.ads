with Ay.Block; use Ay.Block;
with Ay.Memory; use Ay.Memory;

package Ay.RealBlocks is

    type T_FloatAdd is new T_Block with null record;

   -- The method 'Init' initializes the block
   function doInit(b : in T_FloatAdd) return Boolean;

   -- The method 'Calc[ulate]' implements the addition of the integers
   function doCalc (b : in T_FloatAdd) return Boolean;

end Ay.RealBlocks;
