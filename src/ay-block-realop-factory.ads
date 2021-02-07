package Ay.Block.RealOp.Factory is

  type T_FloatAddFactory is new Ay.Block.Factory.T_BlockFactory with null record;   
      
   procedure doNewBlock(bc : in out T_FloatAddFactory; b : out P_Block);
   
   type T_FloatSubFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_FloatSubFactory; b : out P_Block);  
   
   type T_FloatMultFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_FloatMultFactory; b : out P_Block); 
   
   type T_FloatDivFactory is new Ay.Block.Factory.T_BlockFactory with null record;
   
   procedure doNewBlock(bc : in out T_FloatDivFactory; b : out P_Block); 
   
   ---
   
   type T_FloatAddMeta is new Ay.Block.T_MetaBlock with null record;   
      
   procedure makeInstance(mb : in T_FloatAddMeta; b : out P_Block);
   
   function getInputCount(mb : in T_FloatAddMeta) return Natural;
   
   function getOutputCount(mb : in T_FloatAddMeta) return Natural;
   
   function getStaticCount(mb : in T_FloatAddMeta) return Natural;
   
   function getInputType(mb : in T_FloatAddMeta; idx : Positive) return T_DataType;
   
   function getOutputType(mb : in T_FloatAddMeta; idx : Positive) return T_DataType;
   
   function getStaticType(mb : in T_FloatAddMeta; idx : Positive) return T_DataType;

end Ay.Block.RealOp.Factory;
