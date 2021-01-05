with Ay.Memory; use Ay.Memory;
with Ay.Block; use Ay.Block;

package Ay.BlockFactory is

  type T_VarDescriptor is record
      vType : T_DataType; -- data type
      vAccess : T_VariableAccess; -- descriptor of variable access
   end record;
   
   type T_VarDescArray is array (Positive range <>) of T_VarDescriptor;
   type P_VarDescArray is access T_VarDescArray;
   
   type T_BlockFactory is abstract tagged null record;
   
   type P_BlockFactory is access T_BlockFactory;
      
   procedure newBlock(bc : in out T_BlockFactory'Class; b : out P_Block);
   procedure doNewBlock(bc : in out T_BlockFactory; b : out P_Block);
   
   function isBuildIn(bc : in T_BlockFactory'Class) return Boolean;
   
   procedure getVarCount(bc : in T_BlockFactory'Class; cnt : out Positive);
   
   procedure getVarDescriptor(bc : in T_BlockFactory'Class; 
                     idx: Positive; 
                     b : out T_VarDescriptor);

end Ay.BlockFactory;
