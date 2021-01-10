package Ay.Block.CBFactory is

   type T_CBlockFactory is 
     new Ay.Block.Factory.T_BlockFactory with private;
      
   procedure doNewBlock(bc : in out T_CBlockFactory; b : out P_Block);
   
   procedure addInput(bc : in out T_CBlockFactory; dt : in T_DataType);
   
   procedure addOutput(bc : in out T_CBlockFactory; dt : in T_DataType);
   
   procedure addStatic(bc : in out T_CBlockFactory; dt : in T_DataType);
   
   function getInputSize(bc : in T_CBlockFactory) return Natural;
   
   function getOutputSize(bc : in T_CBlockFactory) return Natural;
   
   function getStaticSize(bc : in T_CBlockFactory) return Natural;
   
     
private
   
   type T_CBlockFactory is 
     new Ay.Block.Factory.T_BlockFactory with record
      In_Size, Out_SIze, Static_Size : Natural;
   end record;

end Ay.Block.CBFactory;
