package body Ay.Block is

   ----------
   -- init --
   ----------

   procedure init (b : in out T_Block'Class; res : out Boolean) is
   begin
      doInit(b, res);
   end init;

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_Block'Class; res : out Boolean) is
   begin
      doCalc(b,res);
   end calc;

   --------------
   -- finalize --
   --------------

   procedure finalize (b : in out T_Block'Class) is
   begin
     doFinal(b);
   end finalize;

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_Block; res : out Boolean) is
   begin
      res := false;
      for i in 1 .. b.In_Size
      loop
         -- initialize : b.inp.elem(i).v
         null;
      end loop;

      for i in 1 .. b.Out_Size
      loop
         -- initialize : b.outp.elem(i).v
         null;
      end loop;

      for i in 1 .. b.Static_Size
      loop
         -- initialize : b.stat.elem(i).v
         null;
      end loop;
      res := true;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_Block; res : out Boolean) is
   begin
      res := true;
   end doCalc;

   -------------
   -- doFinal --
   -------------

   procedure doFinal (b : in out T_Block) is
   begin
      null;
   end doFinal;


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
         return b.inp.elem(idx).v.m;
      end getIn;

      -----------
      -- getIn --
      -----------

      function getIn (b : in T_Block'Class; idx : Positive) return Integer is
      begin
         return b.inp.elem(idx).v.di;
      end getIn;

      -----------
      -- getIn --
      -----------

      function getIn (b : in T_Block'Class; idx : Positive) return Float is
      begin
         return b.inp.elem(idx).v.fp;
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
         return b.inp.elem(idx).v.lfp;
      end getIn;

      ------------
      -- setOut --
      ------------

      procedure setOut (b : in T_Block'Class; idx : Positive; val : Boolean)
      is
      begin
         b.outp.elem(idx).v.m := val;
      end setOut;

      ------------
      -- setOut --
      ------------

      procedure setOut (b : in T_Block'Class; idx : Positive; val : Integer)
      is
      begin
         b.outp.elem(idx).v.di := val;
      end setOut;

      ------------
      -- setOut --
      ------------

      procedure setOut (b : in T_Block'Class; idx : Positive; val : Float) is
      begin
         b.outp.elem(idx).v.fp := val;
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
         b.outp.elem(idx).v.lfp := val;
      end setOut;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Boolean is
      begin
         return b.stat.elem(idx).v.m;
      end get;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Integer is
      begin
         return b.stat.elem(idx).v.di;
      end get;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Float is
      begin
         return b.stat.elem(idx).v.fp;
      end get;

      ---------
      -- get --
      ---------

      function get (b : in T_Block'Class; idx : Positive) return Long_Float is
      begin
         return b.stat.elem(idx).v.lfp;
      end get;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Boolean) is
      begin
         b.stat.elem(idx).v.m := val;
      end set;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Integer) is
      begin
         b.stat.elem(idx).v.di := val;
      end set;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Float) is
      begin
         b.stat.elem(idx).v.fp := val;
      end set;

      ---------
      -- set --
      ---------

      procedure set (b : in T_Block'Class; idx : Positive; val : Long_Float)
      is
      begin
         b.stat.elem(idx).v.lfp := val;
      end set;

   end BuildIn;

  ----------------------------------------------------------------------------

   procedure preCalc (b : in out T_SpecialBlock'Class; instance: in out T_Block'Class) is
   begin
      pre(b, instance);
   end preCalc;


   procedure postCalc (b : in out T_SpecialBlock'Class; instance: in out T_Block'Class) is
   begin
      post(b, instance);
   end postCalc;

   procedure pre (b : in out T_SpecialBlock; instance: in out T_Block'Class) is
   begin
      null;
   end;



   procedure post (b : in out T_SpecialBlock; instance: in out T_Block'Class) is
   begin
      null;
   end;

   ----------------------------------------------------------------------------

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_CBlock; res : out Boolean) is
      r : Boolean;
   begin
      res := false;
      execute(b.prog.all, b, r);
      res := r;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure execute(ix : in out T_CBlockIterpreter;
                     instance: in out T_Block'Class;
                     res : out Boolean) is
      curr : P_BlockChain;
      r, r2 : Boolean;
   begin
      -- special block .preCalc execution
      curr := ix.schain;
      while curr /= null loop
         preCalc(T_SpecialBlock(curr.block.all), instance);
         curr := curr.next;
      end loop;

      -- user block execution
      curr := ix.bchain;
      r2 := (curr /= null);
      while curr /= null loop
         calc(curr.block.all, r);
         r2 := r2 and r;
         curr := curr.next;
      end loop;

      -- special block .postCalc execution
      curr := ix.schain;
      while curr /= null loop
         postCalc(T_SpecialBlock(curr.block.all), instance);
         curr := curr.next;
      end loop;
      -- end
      res := r2;
   end execute;

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

end Ay.Block;
