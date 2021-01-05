package Ay.Block.Complex is

   type T_BlockChain;
   type P_BlockChain is access all T_BlockChain;
   type T_BlockChain is record
      next : P_BlockChain;
      block : P_Block;
   end record;
   
   type T_ComplexBlock is new T_Block with private;
   
      -- The method 'Init' initializes the block
   procedure doInit (b : in out T_ComplexBlock; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_ComplexBlock; res : out Boolean); 
   
   package Boot is
      procedure linkProgram (b : in out T_ComplexBlock; 
                             p : in P_BlockChain; 
                             res : out Boolean);
   end Boot;  

private
   
   type T_ComplexBlock is new T_Block with record
      bchain : P_BlockChain; -- user block execution chain
   end record;

end Ay.Block.Complex;
