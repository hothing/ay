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

end Ay.Block.RealOp.Factory;
