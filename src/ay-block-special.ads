package Ay.Block.Special is

   type T_GetInput is new T_SpecialBlock(0, 1, 0) with record
      idx : Positive; -- input index
   end record;
      
   -- The method 'Init' initializes the block
   procedure doInit (b : in out T_GetInput; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_GetInput; res : out Boolean); 
   
   -- this methods are using by CBlockInterpreter
   
   procedure preCalc (b : in out T_GetInput; instance: in out P_Block); 
   
   procedure postCalc (b : in out T_GetInput; instance: in out P_Block); 
   
   type T_SetOutput is new T_SpecialBlock(1, 0, 0) with record
      idx : Positive; -- output index
   end record;
      
   -- The method 'Init' initializes the block
   procedure doInit (b : in out T_SetOutput; res : out Boolean);

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_SetOutput; res : out Boolean); 
   
   -- this methods are using by CBlockInterpreter
   
   procedure preCalc (b : in out T_SetOutput; instance: in out P_Block); 
   
   procedure postCalc (b : in out T_SetOutput; instance: in out P_Block); 
   
end Ay.Block.Special;
