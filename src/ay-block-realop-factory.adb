package body Ay.Block.RealOp.Factory is

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_FloatAddFactory; b : out P_Block) is
   begin
      b := new T_FloatAdd;
      b.inp.elem(1).v := new T_Value(DT_Float);
      b.inp.elem(2).v := new T_Value(DT_Float);
      b.outp.elem(1).v := new T_Value(DT_Float);
   end doNewBlock;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_FloatSubFactory; b : out P_Block) is
   begin
      b := new T_FloatSub;
      b.inp.elem(1).v := new T_Value(DT_Float);
      b.inp.elem(2).v := new T_Value(DT_Float);
      b.outp.elem(1).v := new T_Value(DT_Float);
   end doNewBlock;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_FloatMultFactory; b : out P_Block) is
   begin
      b := new T_FloatMult;
      b.inp.elem(1).v := new T_Value(DT_Float);
      b.inp.elem(2).v := new T_Value(DT_Float);
      b.outp.elem(1).v := new T_Value(DT_Float);
   end doNewBlock;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_FloatDivFactory; b : out P_Block) is
   begin
      b := new T_FloatDiv;
      b.inp.elem(1).v := new T_Value(DT_Float);
      b.inp.elem(2).v := new T_Value(DT_Float);
      b.outp.elem(1).v := new T_Value(DT_Float);
   end doNewBlock;

   ----

   procedure makeInstance(mb : in T_FloatAddMeta; b : out P_Block) is
   begin
      b := new T_FloatAdd;
      b.meta := new T_FloatAddMeta; -- BUG: memory leak
   end makeInstance;

   function getInputCount(mb : in T_FloatAddMeta) return Natural is
   begin
      return 2;
   end getInputCount;

   function getOutputCount(mb : in T_FloatAddMeta) return Natural is
   begin
      return 1;
   end getOutputCount;

   function getStaticCount(mb : in T_FloatAddMeta) return Natural is
   begin
      return 0;
   end getStaticCount;

   function getInputType(mb : in T_FloatAddMeta; idx : Positive) return T_DataType is
   begin
      return DT_Float;
   end getInputType;

   function getOutputType(mb : in T_FloatAddMeta; idx : Positive) return T_DataType is
   begin
      return DT_Float;
   end getOutputType;

   function getStaticType(mb : in T_FloatAddMeta; idx : Positive) return T_DataType is
   begin
      return DT_Float;
   end getStaticType;

end Ay.Block.RealOp.Factory;
