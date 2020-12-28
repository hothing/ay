with Ay; use Ay;
with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;

package Ay.IntBlocks is

   type T_IntGlobal is new T_Block(1) with null record;

   type T_IntAdd is new T_Block(3) with null record;

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_IntGlobal; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_IntGlobal; res : out Boolean);

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_IntGlobal; res : out Boolean);

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_IntAdd; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_IntAdd; res : out Boolean);

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_IntAdd; res : out Boolean);

end Ay.IntBlocks;
