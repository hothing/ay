package Ay.Block.Special is

   type T_GetInput is new T_SpecialBlock(0, 1, 0) with private;
      
 
   -- this methods are using by CBlock'Interpreter
   
   procedure pre (b : in out T_GetInput;
                  isec: in out T_XBlockSection;
                  osec: in out T_XBlockSection;
                  ssec: in out T_XBlockSection); 

   
   type T_SetOutput is new T_SpecialBlock(1, 0, 0) with private;
      
   -- this methods are using by CBlock'Interpreter
     
   procedure post (b : in out T_SetOutput;
                   isec: in out T_XBlockSection;
                   osec: in out T_XBlockSection;
                   ssec: in out T_XBlockSection); 
   
   package Constructor is
      procedure newInput (idx : Natural; b : out P_Block);
      procedure newOutput (idx : Natural; b : out P_Block);
   end Constructor;
   
private
   
   type T_GetInput is new T_SpecialBlock(0, 1, 0) with record
      idx : Positive; -- input index
   end record;
   
   type T_SetOutput is new T_SpecialBlock(1, 0, 0) with record
      idx : Positive; -- output index
   end record;
   
end Ay.Block.Special;
