package Ay.Block.Special is

   type T_GetInput is new T_SpecialBlock(0, 1, 0) with record
      idx : Positive; -- input index
   end record;
      
 
   -- this methods are using by CBlock'Interpreter
   
   procedure pre (b : in out T_GetInput;
                  isec: in out T_XBlockSection;
                  osec: in out T_XBlockSection;
                  ssec: in out T_XBlockSection); 

   
   type T_SetOutput is new T_SpecialBlock(1, 0, 0) with record
      idx : Positive; -- output index
   end record;
      
   -- this methods are using by CBlock'Interpreter
     
   procedure post (b : in out T_SetOutput;
                   isec: in out T_XBlockSection;
                   osec: in out T_XBlockSection;
                   ssec: in out T_XBlockSection); 

   
end Ay.Block.Special;
