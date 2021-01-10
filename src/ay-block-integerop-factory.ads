package Ay.Block.IntegerOp.Factory is

   type T_IntAddFactory is new Ay.Block.Factory.T_BlockFactory with null record;   
      
   procedure doNewBlock(bc : in out T_IntAddFactory; b : out P_Block);
   
   type T_IntSubFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_IntSubFactory; b : out P_Block);  
   
   type T_IntMultFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_IntMultFactory; b : out P_Block); 
   
   type T_IntDivFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_IntDivFactory; b : out P_Block); 

end Ay.Block.IntegerOp.Factory;
