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
         res := -1;
         if not btgt.inp.elem(idxt).bound then
            btgt.inp.elem(idxt).v := bsrc.outp.elem(idxs).v;
            btgt.inp.elem(idxt).bound := true;
            res := 0;
         else
            null; -- FIXME: may be to raise an exception
         end if;
      end bind;

      -------------
      -- boundIn --
      -------------

      function boundIn (b : in T_Block'Class; idx : Positive) return Boolean
      is
      begin
         return b.inp.elem(idx).bound;
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
         return b.outp.elem(idx).bound;
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

   procedure preCalc (b : in out T_SpecialBlock'Class;
                      isec: in out T_XBlockSection;
                      osec: in out T_XBlockSection;
                      ssec: in out T_XBlockSection ) is
   begin
      pre(b, isec, osec, ssec);
   end preCalc;


   procedure postCalc (b : in out T_SpecialBlock'Class;
                       isec: in out T_XBlockSection;
                       osec: in out T_XBlockSection;
                       ssec: in out T_XBlockSection) is
   begin
      post(b, isec, osec, ssec);
   end postCalc;

   procedure pre (b : in out T_SpecialBlock;
                  isec: in out T_XBlockSection;
                  osec: in out T_XBlockSection;
                  ssec: in out T_XBlockSection) is
   begin
      null;
   end;



   procedure post (b : in out T_SpecialBlock;
                   isec: in out T_XBlockSection;
                   osec: in out T_XBlockSection;
                   ssec: in out T_XBlockSection) is
   begin
      null;
   end;

   ----------------------------------------------------------------------------

   procedure doCalc (b : in out T_CBlock; res : out Boolean) is
      iter : BlockChain.List_Iterator;
      r, r2 : Boolean;
   begin
      res := false;
      -- special block .preCalc execution
      iter := BlockChain.First(b.schain.all);
      while BlockChain.hasSucc(iter) loop
         preCalc(T_SpecialBlock(BlockChain.Value(iter).all), b.inp, b.outp, b.stat);
         iter := BlockChain.Succ(iter);
      end loop;

      -- user block execution
      iter := BlockChain.First(b.bchain.all);
      r2 := BlockChain.hasSucc(iter);
      while BlockChain.hasSucc(iter) loop
         calc(BlockChain.Value(iter).all, r);
         r2 := r2 and r;
         iter := BlockChain.Succ(iter);
      end loop;

      -- special block .postCalc execution
      iter := BlockChain.First(b.schain.all);
      while BlockChain.hasSucc(iter) loop
         postCalc(T_SpecialBlock(BlockChain.Value(iter).all), b.inp, b.outp, b.stat);
         iter := BlockChain.Succ(iter);
      end loop;
      -- end
      res := r2;
   end doCalc;

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
         raise Program_Error with "Unimplemented procedure newBlock";
      end newBlock;

      ----------------
      -- doNewBlock --
      ----------------

      procedure doNewBlock (bc : in out T_BlockFactory; b : out P_Block) is
      begin
         raise Program_Error with "Unimplemented procedure doNewBlock";
      end doNewBlock;

      ---------------
      -- isBuildIn --
      ---------------

      function isBuildIn (bc : in T_BlockFactory'Class) return Boolean is
      begin
         return True;
      end isBuildIn;

   end Factory;

end Ay.Block;
