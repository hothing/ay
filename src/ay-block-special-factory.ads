package Ay.Block.Special.Factory is

   type T_GetInputFactory(idx : Positive) is new Ay.Block.Factory.T_BlockFactory with null record;   
      
   procedure doNewBlock(bc : in out T_GetInputFactory; b : out P_Block);

   
   type T_SetOutputFactory(idx : Positive) is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_SetOutputFactory; b : out P_Block); 

end Ay.Block.Special.Factory;
