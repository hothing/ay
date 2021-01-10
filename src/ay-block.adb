package body Ay.Block is

   ----------
   -- init --
   ----------

   procedure init (b : in out T_Block'Class; res : out Boolean) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "init unimplemented");
      raise Program_Error with "Unimplemented procedure init";
   end init;

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_Block'Class; res : out Boolean) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "calc unimplemented");
      raise Program_Error with "Unimplemented procedure calc";
   end calc;

   --------------
   -- finalize --
   --------------

   procedure finalize (b : in out T_Block'Class) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "finalize unimplemented");
      raise Program_Error with "Unimplemented procedure finalize";
   end finalize;

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_Block; res : out Boolean) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_Block; res : out Boolean) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented procedure doCalc";
   end doCalc;

   -------------
   -- doFinal --
   -------------

   procedure doFinal (b : in out T_Block) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doFinal unimplemented");
      raise Program_Error with "Unimplemented procedure doFinal";
   end doFinal;

   -------------
   -- Factory --
   -------------

   package body Factory is

      --------------
      -- newBlock --
      --------------

      procedure newBlock (bc : in out T_BlockFactory'Class; b : out P_Block)
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "newBlock unimplemented");
         raise Program_Error with "Unimplemented procedure newBlock";
      end newBlock;

      ----------------
      -- doNewBlock --
      ----------------

      procedure doNewBlock (bc : in out T_BlockFactory; b : out P_Block) is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "doNewBlock unimplemented");
         raise Program_Error with "Unimplemented procedure doNewBlock";
      end doNewBlock;

      ---------------
      -- isBuildIn --
      ---------------

      function isBuildIn (bc : in T_BlockFactory'Class) return Boolean is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "isBuildIn unimplemented");
         raise Program_Error with "Unimplemented function isBuildIn";
         return isBuildIn (bc => bc);
      end isBuildIn;

   end Factory;

   ----------
   -- Boot --
   ----------

   package body Boot is

      ----------
      -- bind --
      ----------

      procedure bind
        (bsrc : in out T_Block'Class;
         idxs: Positive;
         btgt : in out T_Block'Class;
         idxt: Positive;
         res : out Integer)
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "bind unimplemented");
         raise Program_Error with "Unimplemented procedure bind";
      end bind;

      -------------
      -- boundIn --
      -------------

      function boundIn (b : in T_Block'Class; idx : Positive) return Boolean
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "boundIn unimplemented");
         raise Program_Error with "Unimplemented function boundIn";
         return boundIn (b => b, idx => idx);
      end boundIn;

      --------------
      -- boundOut --
      --------------

      function boundOut
        (b : in T_Block'Class;
         idx : Positive)
         return Boolean
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "boundOut unimplemented");
         raise Program_Error with "Unimplemented function boundOut";
         return boundOut (b => b, idx => idx);
      end boundOut;

   end Boot;

   -------------
   -- BuildIn --
   -------------

   package body BuildIn is

      -----------
      -- getIn --
      -----------

      function getIn (b : in T_Block'Class; idx : Positive) return Boolean is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "getIn unimplemented");
         raise Program_Error with "Unimplemented function getIn";
         return getIn (b => b, idx => idx);
      end getIn;

      -----------
      -- getIn --
      -----------

      function getIn (b : in T_Block'Class; idx : Positive) return Integer is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "getIn unimplemented");
         raise Program_Error with "Unimplemented function getIn";
         return getIn (b => b, idx => idx);
      end getIn;

      -----------
      -- getIn --
      -----------

      function getIn (b : in T_Block'Class; idx : Positive) return Float is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "getIn unimplemented");
         raise Program_Error with "Unimplemented function getIn";
         return getIn (b => b, idx => idx);
      end getIn;

      -----------
      -- getIn --
      -----------

      function getIn
        (b : in T_Block'Class;
         idx : Positive)
         return Long_Float
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "getIn unimplemented");
         raise Program_Error with "Unimplemented function getIn";
         return getIn (b => b, idx => idx);
      end getIn;

      ------------
      -- setOut --
      ------------

      procedure setOut (b : in T_Block'Class; idx : Positive; val : Boolean)
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "setOut unimplemented");
         raise Program_Error with "Unimplemented procedure setOut";
      end setOut;

      ------------
      -- setOut --
      ------------

      procedure setOut (b : in T_Block'Class; idx : Positive; val : Integer)
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "setOut unimplemented");
         raise Program_Error with "Unimplemented procedure setOut";
      end setOut;

      ------------
      -- setOut --
      ------------

      procedure setOut (b : in T_Block'Class; idx : Positive; val : Float) is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "setOut unimplemented");
         raise Program_Error with "Unimplemented procedure setOut";
      end setOut;

      ------------
      -- setOut --
      ------------

      procedure setOut
        (b : in T_Block'Class;
         idx : Positive;
         val : Long_Float)
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "setOut unimplemented");
         raise Program_Error with "Unimplemented procedure setOut";
      end setOut;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Boolean is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "get unimplemented");
         raise Program_Error with "Unimplemented function get";
         return get (b => b, idx => idx);
      end get;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Integer is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "get unimplemented");
         raise Program_Error with "Unimplemented function get";
         return get (b => b, idx => idx);
      end get;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Float is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "get unimplemented");
         raise Program_Error with "Unimplemented function get";
         return get (b => b, idx => idx);
      end get;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Long_Float is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "get unimplemented");
         raise Program_Error with "Unimplemented function get";
         return get (b => b, idx => idx);
      end get;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Boolean) is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "set unimplemented");
         raise Program_Error with "Unimplemented procedure set";
      end set;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Integer) is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "set unimplemented");
         raise Program_Error with "Unimplemented procedure set";
      end set;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Float) is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "set unimplemented");
         raise Program_Error with "Unimplemented procedure set";
      end set;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Long_Float)
      is
      begin
         --  Generated stub: replace with real body!
         pragma Compile_Time_Warning (Standard.True, "set unimplemented");
         raise Program_Error with "Unimplemented procedure set";
      end set;

   end BuildIn;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_ComplexBlock; res : out Boolean) is
      r : Boolean;
   begin
      res := false;
      -- copy values of input
      for i in 1 .. b.In_Size
      loop
         b.prog.shadow_inp(i).v.all := b.inp(i).v.all;
      end loop;

      -- copy values of static vars
      for i in 1 .. b.Static_Size
      loop
         b.prog.shadow_stat(i).v.all := b.stat(i).v.all;
      end loop;

      execute(b.prog.all, r);

      -- after execution do copeing in other direction
      for i in 1 .. b.Out_Size
      loop
         b.outp(i).v.all := b.prog.shadow_out(i).v.all;
      end loop;

      -- copy values of static vars
      for i in 1 .. b.Static_Size
      loop
         b.stat(i).v.all := b.prog.shadow_stat(i).v.all;
      end loop;

      res := r;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure execute(ix : in out T_CBlockIterpreter; res : out Boolean) is
      head, curr : P_BlockChain;
      r, r2 : Boolean;
   begin
      head := ix.bchain;
      curr := head;
      r2 := (head /= null);
      while curr /= null loop
         calc(curr.block.all, r);
         r2 := r2 and r;
         curr := curr.next;
      end loop;
      res := r2;
   end execute;

end Ay.Block;
