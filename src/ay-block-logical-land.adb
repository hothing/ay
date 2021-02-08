package body Ay.Block.Logical.LAnd is

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_AndBlock; res : out Boolean) is
   begin
      b.out1.v := b.in1.v and b.in2.v;
      res := True;
   end calc;

   -----------------
   -- newInstance --
   -----------------

   procedure newInstance (mb : in T_AndMetaBlock; b : out P_InstantingBlock)
   is
   begin
      b := new T_AndBlock'(meta => null,
                           in1 => null,
                           in2 => null,
                           out1 => new T_Boolean'(v => False));
   end newInstance;

end Ay.Block.Logical.LAnd;
