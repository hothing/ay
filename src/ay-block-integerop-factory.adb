package body Ay.Block.IntegerOp.Factory is

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_IntAddFactory; b : out P_Block) is
   begin
      b := new T_IntAdd;
      b.inp.elem(1).v := new T_Value(DT_Int);
      b.inp.elem(2).v := new T_Value(DT_Int);
      b.outp.elem(1).v := new T_Value(DT_Int);
   end doNewBlock;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_IntSubFactory; b : out P_Block) is
   begin
      b := new T_IntSub;
      b.inp.elem(1).v := new T_Value(DT_Int);
      b.inp.elem(2).v := new T_Value(DT_Int);
      b.outp.elem(1).v := new T_Value(DT_Int);
   end doNewBlock;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_IntMultFactory; b : out P_Block) is
   begin
      b := new T_IntMult;
      b.inp.elem(1).v := new T_Value(DT_Int);
      b.inp.elem(2).v := new T_Value(DT_Int);
      b.outp.elem(1).v := new T_Value(DT_Int);
   end doNewBlock;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_IntDivFactory; b : out P_Block) is
   begin
      b := new T_IntDiv;
      b.inp.elem(1).v := new T_Value(DT_Int);
      b.inp.elem(2).v := new T_Value(DT_Int);
      b.outp.elem(1).v := new T_Value(DT_Int);
   end doNewBlock;

end Ay.Block.IntegerOp.Factory;
