with Ay.Memory; use Ay.Memory;

package Ay.Block.IntegerOp is

   type T_IntGlobal is new T_Block(1) with null record;


   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_IntGlobal; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_IntGlobal; res : out Boolean);

   type T_IntAdd is new T_Block(3) with null record;

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_IntAdd; res : out Boolean);

   -- The method 'Calc[ulate]' implements the addition of the integers
   procedure doCalc (b : in out T_IntAdd; res : out Boolean);

   type T_IntSub is new T_IntAdd with null record;

   -- The method 'Calc[ulate]' implements the substraction of the integers
   procedure doCalc (b : in out T_IntSub; res : out Boolean);

   type T_IntMult is new T_IntAdd with null record;

   -- The method 'Calc[ulate]' implements the multiplication of the integers
   procedure doCalc (b : in out T_IntMult; res : out Boolean);

   type T_IntDiv is new T_IntAdd with null record;

   -- The method 'Calc[ulate]' implements the division of the integers
   procedure doCalc (b : in out T_IntDiv; res : out Boolean);


end Ay.Block.IntegerOp;
