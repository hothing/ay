package body Ay.Block.Logical.TriggerRS is

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_RsBlock; res : out Boolean) is
   begin
      -- in1 =R(eset)
      -- in2 =S(et)
      if b.in1.v then
         b.out1.v := False;
      end if;
      if b.in2.v then
         b.out1.v := True;
      end if;
      res :=True;
   end calc;

   -----------------
   -- newInstance --
   -----------------

   procedure newInstance (mb : in T_RsMetaBlock; b : out P_InstantingBlock) is
   begin
      b := new T_RsBlock'(meta => null,
                           in1 => null,
                           in2 => null,
                           out1 => new T_Boolean'(v => False));
   end newInstance;


   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_SrBlock; res : out Boolean) is
   begin
      -- in1 =S(et)
      -- in2 =R(eset)
      if b.in1.v then
         b.out1.v := True;
      end if;
      if b.in2.v then
         b.out1.v := False;
      end if;
      res :=True;
   end calc;

   -----------------
   -- newInstance --
   -----------------

   procedure newInstance (mb : in T_SrMetaBlock; b : out P_InstantingBlock) is
   begin
      b := new T_SrBlock'(meta => null,
                           in1 => null,
                           in2 => null,
                           out1 => new T_Boolean'(v => False));
   end newInstance;

end Ay.Block.Logical.TriggerRS;
