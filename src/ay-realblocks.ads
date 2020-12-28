with Ay.Block; use Ay.Block;
with Ay.Memory; use Ay.Memory;

package Ay.RealBlocks is

   type T_FloatGlobal is new T_Block(1) with null record;

   type T_FloatAdd is new T_Block(3) with null record;

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_FloatGlobal; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_FloatGlobal; res : out Boolean);

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_FloatGlobal; res : out Boolean);

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_FloatAdd; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_FloatAdd; res : out Boolean);

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_FloatAdd; res : out Boolean);
end Ay.RealBlocks;
