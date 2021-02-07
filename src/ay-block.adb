package body Ay.Block is

   ----------
   -- init --
   ----------

   procedure init (b : in out T_CBlock; res : out Boolean) is
      rc : Boolean;
   begin
      res := False;
      if b.bcode /= null then
         BlockChain.Rewind(b.bcode.bchain);
         res := True;
         while BlockChain.hasSucc(b.bcode.bchain) loop
            BlockChain.Value(b.bcode.bchain).init(rc);
            res := res and rc;
            b.bcode.bchain := BlockChain.Succ(b.bcode.bchain);
         end loop;
      end if;
   end init;

   procedure reset (b : in out T_CBlock) is
   begin
      if b.bcode /= null then
         BlockChain.Rewind(b.bcode.bchain);
         while BlockChain.hasSucc(b.bcode.bchain) loop
            BlockChain.Value(b.bcode.bchain).reset;
            b.bcode.bchain := BlockChain.Succ(b.bcode.bchain);
         end loop;
      end if;
      -- TODO: reset the instance variables
   end reset;

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_CBlock; res : out Boolean) is
   begin
      res := False;
      if b.bcode /= null then
         --read inputs
         for i in 1 .. b.bcode.In_Size loop
            copy(b.bcode.inp.elem(i).v.all, b.inp.elem(i).v);
         end loop;

         -- read static instances
         for i in 1 .. b.bcode.Static_Size loop
            copy(b.bcode.stat.elem(i).v.all, b.stat.elem(i).v);
         end loop;

         calc(b.bcode.all, res);

         -- write static instances
         for i in 1 .. b.bcode.Static_Size loop
            copy(b.stat.elem(i).v.all, b.bcode.stat.elem(i).v);
         end loop;

         --write outputs
         for i in 1 .. b.bcode.Out_Size loop
            copy(b.outp.elem(i).v.all, b.bcode.outp.elem(i).v);
         end loop;
      end if;
   end calc;

   -----------
   -- final --
   -----------

   procedure final (b : in out T_CBlock) is
   begin
      if b.bcode /= null then
         BlockChain.Rewind(b.bcode.bchain);
         while BlockChain.hasSucc(b.bcode.bchain) loop
            BlockChain.Value(b.bcode.bchain).final;
            b.bcode.bchain := BlockChain.Succ(b.bcode.bchain);
         end loop;
      end if;
   end final;

   procedure connect(b : in out T_CBlock; idx : in T_PinIndex; p : in P_Value) is
   begin
      if b.bcode /= null then
         if idx < b.bcode.inp.Size then
            -- NB:I'm not sure the condition is correct
            -- Normally a BlockCode instance has all instantiated variables (P_Value)
            if b.bcode.inp.elem(idx).v /= null then
               if p'Tag in b.bcode.inp.elem(idx).v'Tag then
                  b.bcode.inp.elem(idx).v := p;
               else
                  raise Program_Error with "wrong type of connection";
               end if;
            else
               raise Program_Error with "code block is uninitialized";
            end if;
         else
            raise Program_Error with "wrong pin index";
         end if;
      else
         raise Program_Error with "block is uninitialized";
      end if;
   end connect;


   procedure pull(b : in out T_CBlock; idx : in T_PinIndex; p : out P_Value) is
   begin
      if b.bcode /= null then
         if idx < b.bcode.outp.Size then
            p := b.bcode.outp.elem(idx).v;
         else
            raise Program_Error with "wrong pin index";
         end if;
      else
         raise Program_Error with "block is uninitialized";
      end if;
   end pull;
   ------------

   procedure init (b : in out T_CBlockCode; res : out Boolean) is
   begin
      null;
   end init;

   procedure reset (b : in out T_CBlockCode) is
   begin
      null;
   end reset;

   procedure calc (b : in out T_CBlockCode; res : out Boolean) is
      rc : Boolean;
   begin
      -- main calculation
         BlockChain.Rewind(b.bchain);
         res := True;
         while BlockChain.hasSucc(b.bchain) loop
            BlockChain.Value(b.bchain).calc(rc);
            res := res and rc;
            b.bchain := BlockChain.Succ(b.bchain);
         end loop;
   end calc;

   procedure final (b : in out T_CBlockCode) is
   begin
      null;
   end final;

   procedure connect(b : in out T_CBlockCode; idx : in T_PinIndex; p : in P_Value) is
   begin
      null;
   end connect;

   procedure pull(b : in out T_CBlockCode; idx : in T_PinIndex; p : out P_Value) is
   begin
      null;
   end pull;

   ------------------
   -- makeInstance --
   ------------------

   procedure makeInstance (mb : in P_MetaBlock; b : out P_InstantingBlock) is
   begin
      newInstance(mb.all, b);
      b.meta := mb;
   end makeInstance;

   ----------
   -- Boot --
   ----------

   package body Boot is

      ----------
      -- bind --
      ----------

      procedure bind
        (bsrc : in out T_InstantingBlock'Class;
         idxs: T_PinIndex;
         btgt : in out T_InstantingBlock'Class;
         idxt: T_PinIndex;
         res : out Boolean)
      is
         p : P_Value;
      begin
         res := False;
         pull(bsrc, idxs, p);
         connect(btgt, idxt, p);
         res := True;
      end bind;

      -------------
      -- fixupIO --
      -------------

      procedure fixupInputs (b : in out T_CBlock'Class) is
      begin
         for i in 1 .. b.In_Size loop
            if (b.inp.elem(i).v = null) then
               b.inp.elem(i).v := newValue(b.meta.getInputType(i));
               b.inp.elem(i).cid := 0;
            end if;
         end loop;
      end fixupInputs;

      procedure fixupOutputs (b : in out T_CBlock'Class) is
      begin
         for i in 1 .. b.Out_Size loop
            if (b.outp.elem(i).v = null) then
               b.outp.elem(i).v := newValue(b.meta.getOutputType(i));
               --b.outp.elem(i).cid := 0;
            end if;
         end loop;
      end fixupOutputs;

      procedure fixupStatic (b : in out T_CBlock'Class) is
      begin
         for i in 1 .. b.Static_Size loop
            if (b.stat.elem(i).v = null) then
               b.stat.elem(i).v := newValue(b.meta.getStaticType(i));
               b.stat.elem(i).cid := 0;
            end if;
         end loop;
      end fixupStatic;

   end Boot;

end Ay.Block;
