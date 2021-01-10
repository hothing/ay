package Ay.Block.RealOp.Factory is

  type T_FloatAddFactory is new Ay.Block.Factory.T_BlockFactory with null record;   
      
   procedure doNewBlock(bc : in out T_FloatAddFactory; b : out P_Block);
   
   type T_FloatSubFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_FloatSubFactory; b : out P_Block);  
   
   type T_FloatMultFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_FloatMultFactory; b : out P_Block); 
   
   type T_FloatDivFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_FloatDivFactory; b : out P_Block); 

end Ay.Block.RealOp.Factory;
