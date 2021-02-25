package body Ay.Block.Logical.Fn is

   ----------
   -- init --
   ----------

   procedure init (b : in out T_Not; res : out Boolean) is
   begin
      res := b.in1.v /= null and b.out1.v /= null;
   end init;

   -----------
   -- reset --
   -----------

   procedure reset (b : in out T_Not) is
   begin
      null;
   end reset;

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_Not; res : out Boolean) is
   begin
      b.out1.v.all := not b.in1.v.all;
      res := true;
   end calc;

   -----------
   -- final --
   -----------

   procedure final (b : in out T_Not) is
   begin
      null;
   end final;

   --------------------
   -- connect_Output --
   --------------------

   procedure connect_Output
     (b : in out T_Not;
      pin : in T_Pin_Index;
      cp : in T_Connector;
      stub : in Boolean)
   is
   begin
      if pin = 1 then
         b.in1 := T_Bool_Plug'(on => stub, v => get(cp));
      end if;
   end connect_Output;

   -------------------
   -- connect_Input --
   -------------------

   procedure connect_Input
     (b : in out T_Not;
      pin : in T_Pin_Index;
      cp : in T_Connector;
      stub : in Boolean)
   is
   begin
      if pin = 1 then
         b.out1 := T_Bool_Plug'(on => stub, v => get(cp));
      end if;
   end connect_Input;

   ---------------------
   -- is_In_Connected --
   ---------------------

   function is_In_Connected
     (b : in T_Not;
      pin : T_Pin_Index)
      return Boolean
   is
   begin
      if pin = 1 then
         return b.in1.on;
      else
         return False;
      end if;
   end is_In_Connected;

   ----------------------
   -- is_Out_Connected --
   ----------------------

   function is_Out_Connected
     (b : in T_Not;
      pin : T_Pin_Index)
      return Boolean
   is
   begin
      if pin = 1 then
         return b.out1.on;
      else
         return False;
      end if;
   end is_Out_Connected;

   ---- T_And ----------------------------------------------------------------

   ----------
   -- init --
   ----------

   procedure init (b : in out T_And; res : out Boolean) is
   begin
      res := b.in1.v /= null and b.in2.v /= null and b.out1.v /= null;
   end init;

   -----------
   -- reset --
   -----------

   procedure reset (b : in out T_And) is
   begin
      null;
   end reset;

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_And; res : out Boolean) is
   begin
      b.out1.v.all := b.in1.v.all and b.in2.v.all;
      res := true;
   end calc;

   -----------
   -- final --
   -----------

   procedure final (b : in out T_And) is
   begin
      null;
   end final;

   --------------------
   -- connect_Output --
   --------------------

   procedure connect_Output
     (b : in out T_And;
      pin : in T_Pin_Index;
      cp : in T_Connector;
      stub : in Boolean)
   is
   begin
      if pin = 1 then
         b.in1 := T_Bool_Plug'(on => stub, v => get(cp));
      elsif pin = 2 then
         b.in2 := T_Bool_Plug'(on => stub, v => get(cp));
      end if;
   end connect_Output;

   -------------------
   -- connect_Input --
   -------------------

   procedure connect_Input
     (b : in out T_And;
      pin : in T_Pin_Index;
      cp : in T_Connector;
      stub : in Boolean)
   is
   begin
      if pin = 1 then
         b.out1 := T_Bool_Plug'(on => stub, v => get(cp));
      end if;
   end connect_Input;

   ---------------------
   -- is_In_Connected --
   ---------------------

   function is_In_Connected
     (b : in T_And;
      pin : T_Pin_Index)
      return Boolean
   is
   begin
      if pin = 1 then
         return b.in1.on;
      elsif pin = 2 then
         return b.in2.on;
      else
         return False;
      end if;
   end is_In_Connected;

   ----------------------
   -- is_Out_Connected --
   ----------------------

   function is_Out_Connected
     (b : in T_And;
      pin : T_Pin_Index)
      return Boolean
   is
   begin
      if pin = 1 then
         return b.out1.on;
      else
         return False;
      end if;
   end is_Out_Connected;

   ---- T_Or ----------------------------------------------------------------

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_Or; res : out Boolean) is
   begin
      b.out1.v.all := b.in1.v.all or b.in2.v.all;
      res := true;
   end calc;

   ---- T_Xor ----------------------------------------------------------------

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_Xor; res : out Boolean) is
   begin
      b.out1.v.all := b.in1.v.all xor b.in2.v.all;
      res := true;
   end calc;

end Ay.Block.Logical.Fn;
