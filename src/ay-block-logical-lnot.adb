package body Ay.Block.Logical.LNot is

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_NotBlock; res : out Boolean) is
   begin
      b.out1.v := not b.in1.v;
      res := True;
   end calc;

   -----------------
   -- newInstance --
   -----------------

   procedure newInstance (mb : in T_NotMetaBlock; b : out P_InstantingBlock)
   is
   begin
      b := new T_NotBlock'(meta => null,
                           in1 => null,
                           out1 => new T_Boolean'(v => False));
   end newInstance;

end Ay.Block.Logical.LNot;
