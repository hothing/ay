package Ay.Block.Logical is
   
   type T_Logic1x1Block is abstract limited new T_InstantingBlock with private;
   
   procedure init (b : in out T_Logic1x1Block; res : out Boolean);   
   procedure reset (b : in out T_Logic1x1Block);
   procedure final (b : in out T_Logic1x1Block);
   procedure connect(b : in out T_Logic1x1Block; idx : T_PinIndex; p : P_Value);
   procedure pull(b : in out T_Logic1x1Block; idx : T_PinIndex; p : out P_Value);
   
   
   type T_Logic2x1Block is abstract limited new T_Logic1x1Block with private;
   
   procedure init (b : in out T_Logic2x1Block; res : out Boolean);
   procedure reset (b : in out T_Logic2x1Block);
   procedure connect(b : in out T_Logic2x1Block; idx : T_PinIndex; p : P_Value);
      
   type T_Logic1x1MetaBlock is abstract new T_MetaBlock with private;
   
   function isBuildIn(mb : in T_Logic1x1MetaBlock) return Boolean;
   
   function getInputCount(mb : in T_Logic1x1MetaBlock) return Natural;
   
   function getOutputCount(mb : in T_Logic1x1MetaBlock) return Natural;
   
   function getStaticCount(mb : in T_Logic1x1MetaBlock) return Natural;
   
   function getInputType(mb : in T_Logic1x1MetaBlock; idx : T_PinIndex) return T_DataType;
   
   function getOutputType(mb : in T_Logic1x1MetaBlock; idx : T_PinIndex) return T_DataType;
   
   function getStaticType(mb : in T_Logic1x1MetaBlock; idx : T_PinIndex) return T_DataType;
   
   procedure newInstance(mb : in T_Logic1x1MetaBlock; b : out P_InstantingBlock) is abstract;
   
   type T_Logic2x1MetaBlock is abstract new T_Logic1x1MetaBlock with private;   
   
   function getInputCount(mb : in T_Logic2x1MetaBlock) return Natural;
     
   function getInputType(mb : in T_Logic2x1MetaBlock; idx : T_PinIndex) return T_DataType;
      
   procedure newInstance(mb : in T_Logic2x1MetaBlock; b : out P_InstantingBlock) is abstract;
   
private
   
   type T_Logic1x1Block is abstract limited new T_InstantingBlock with
      record
         out1 : P_Boolean;
         in1 : P_Boolean;
      end record;
   
   type T_Logic2x1Block is abstract limited new T_Logic1x1Block with
      record
         in2 : P_Boolean;
      end record;
   
   type T_Logic1x1MetaBlock is abstract new T_MetaBlock with null record;
   
   type T_Logic2x1MetaBlock is abstract new T_Logic1x1MetaBlock with null record;
   
end Ay.Block.Logical;
