package Ay.Block.RealOp is

   type T_FloatGlobal is new T_Block(0, 1, 0) with null record;

   type T_FloatAdd is new T_Block(2, 1, 0) with null record;


   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_FloatGlobal; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_FloatGlobal; res : out Boolean);

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_FloatAdd; res : out Boolean);

   -- The method 'Calc[ulate]' implements the 'add' function
   procedure doCalc (b : in out T_FloatAdd; res : out Boolean);

   -- The method 'Final' releases the block resources
   --procedure doFinal (b : in out T_FloatAdd; res : out Boolean);

   type T_FloatSub is new T_FloatAdd with null record;

   -- The method 'Calc[ulate]' implements the 'substract' function
   procedure doCalc (b : in out T_FloatSub; res : out Boolean);

   type T_FloatMult is new T_FloatAdd with null record;

   -- The method 'Calc[ulate]' implements the 'multiply' function
   procedure doCalc (b : in out T_FloatMult; res : out Boolean);

   type T_FloatDiv is new T_FloatAdd with null record;

   -- The method 'Calc[ulate]' implements the 'divide' function
   procedure doCalc (b : in out T_FloatDiv; res : out Boolean); 

end Ay.Block.RealOp;
