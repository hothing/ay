with Ay.Block.Special; use Ay.Block;

package body Ay.Block.CBFactory is

   Wrong_Argument : exception;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_CBlockFactory; b : out P_Block) is
      newCBlock : P_CBlock;
   begin
      newCBlock := new T_CBlock(bc.prototype.In_Size,
                                bc.prototype.Out_Size,
                                bc.prototype.Static_Size);
      newCBlock.schain := bc.prototype.schain;
      newCBlock.bchain := bc.prototype.bchain;

      -- clone the inputs
      -- the input's will be creating by CBBuilder

--        for i in 1 .. bc.prototype.In_Size
--        loop
--           newCBlock.inp.elem(i).v := clone(bc.prototype.inp.elem(i).v);
--        end loop;

      -- clone the outputs
      -- the input's will be creating by CBBuilder

--        for i in 1 .. bc.prototype.Out_Size
--        loop
--           newCBlock.outp.elem(i).v := clone(bc.prototype.outp.elem(i).v);
--        end loop;

      -- clone the statics

      for i in 1 .. bc.prototype.Static_Size
      loop
         newCBlock.stat.elem(i).v := clone(bc.prototype.stat.elem(i).v);
      end loop;

      -- done

      b := P_Block(newCBlock);
   end doNewBlock;

   ----------
   -- init --
   ----------

   procedure init (bc : in out T_CBlockFactory; b : in P_CBlock) is
   begin
      bc.prototype := b;
   end init;

   ----------
   -- init --
   ----------

   procedure init (bc : in out T_CBlockBuilder; reg : in P_BlockRegistry) is
   begin
      if reg /= null then
         bc.reg := reg;
      else
         raise Wrong_Argument with "Registry is not valid";
      end if;
   end init;

   ---------------
   -- beginVars --
   ---------------

   procedure beginVars (bc : in out T_CBlockBuilder) is
   begin
      bc.ivar := new Variables.List_Type;
      bc.ovar := new Variables.List_Type;
      bc.svar := new Variables.List_Type;
      bc.ivit := Variables.First(bc.ivar.all);
      bc.ovit := Variables.First(bc.ovar.all);
      bc.svit := Variables.First(bc.svar.all);
   end beginVars;

   --------------
   -- addInput --
   --------------

   procedure addInput (bc : in out T_CBlockBuilder; dt : in T_DataType) is
   begin
      Variables.Insert(bc.ivit, new T_Value(dt));
   end addInput;

   ---------------
   -- addOutput --
   ---------------

   procedure addOutput (bc : in out T_CBlockBuilder; dt : in T_DataType) is
   begin
      Variables.Insert(bc.ovit, new T_Value(dt));
   end addOutput;

   ---------------
   -- addStatic --
   ---------------

   procedure addStatic (bc : in out T_CBlockBuilder; dt : in T_DataType) is
   begin
      Variables.Insert(bc.svit, new T_Value(dt));
   end addStatic;

   -------------
   -- endVars --
   -------------

   procedure createVarsInCBlock(iv : in Variables.List_Type;
                               bv : in out T_XBlockSection) is
      sz : Natural;
      iter : Variables.List_Iterator;
   begin
      sz := Variables.Size(iv);
      iter := Variables.First(iv);
      for i in 1 .. sz loop
         bv.elem(i).v := Variables.Value(iter);
         bv.elem(i).bound := false;
         iter := Variables.Succ(iter);
      end loop;
   end createVarsInCBlock;

   procedure endVars (bc : in out T_CBlockBuilder) is
   begin
      null;
   end endVars;

   ---------------
   -- beginCode --
   ---------------

   procedure beginCode (bc : in out T_CBlockBuilder) is
      isz, osz, ssz : Natural;
      pbi  : P_Block;
      ib : BlockChain.List_Iterator;
   begin
      isz := Variables.Size(bc.ivar.all);
      osz := Variables.Size(bc.ovar.all);
      ssz := Variables.Size(bc.svar.all);

      bc.newBlock := new T_CBlock(isz, osz, ssz);
      bc.newBlock.schain := new BlockChain.List_Type;
      bc.newBlock.bchain := new BlockChain.List_Type;

      ib := BlockChain.First(bc.newBlock.schain.all);
      -- create all inputs
      createVarsInCBlock(bc.svar.all, bc.newBlock.inp);
      -- the input variable references will be held direct in the block I/O area
      for i in 1 .. isz loop
         Special.Constructor.newInput(i, pbi);
         pbi.outp.elem(i).v := bc.newBlock.inp.elem(i).v;
         BlockChain.Insert(ib, pbi);
      end loop;
      -- create all outputs
      createVarsInCBlock(bc.svar.all, bc.newBlock.outp);
      -- the output variable references will be held direct in the block I/O area
      for i in 1 .. osz loop
         Special.Constructor.newInput(i, pbi);
         pbi.inp.elem(i).v := bc.newBlock.outp.elem(i).v;
         BlockChain.Insert(ib, pbi);
      end loop;
      -- create all statics
      createVarsInCBlock(bc.svar.all, bc.newBlock.stat);
   end beginCode;

   --------------
   -- addBlock --
   --------------

   procedure addBlock
     (bc : in out T_CBlockBuilder;
      bcid : in Integer;
      res : out Integer)
   is
      fc : Factory.P_BlockFactory;
      use type Factory.P_BlockFactory;
   begin
      res := -1;
      if Registry.exist(bc.reg.all, bcid) then
         -- get the block factory
         -- start the factory to produce the block
         -- insert the block into chain
         null;
         fc := Registry.getBlockFactory(bc.reg.all, bcid);
         if fc /= null then
            Factory.newBlock(fc.all, bc.actBlock);
            if bc.actBlock /= null then
               declare
                  iter : BlockChain.List_Iterator := BlockChain.Last(bc.newBlock.bchain.all);
               begin
                  BlockChain.Insert(iter, bc.actBlock);
                  res := 0;
               end;
            else
               res := -4;
               -- FIXME : raise an exception
            end if;
         else
            res := -3;
            -- FIXME : raise an exception
         end if;
      else
         -- FIXME: raise Wrong_Argument;
         res := -2;
      end if;
   end addBlock;

   ---------------
   -- connectIn --
   ---------------

   procedure connectIn
     (bc : in out T_CBlockBuilder;
      pin : in Positive;
      connId : in Integer;
      res : out Integer)
   is
      sl : T_Connection;
   begin
      res := -1;
      if not bc.conn.Contains(connId) then
         sl.source := (block => null, pin => 0);
         sl.sinks := new Connectors.List_Type;
         bc.conn.Include(connId, sl);
      else
         declare
            ci : Connectors.List_Iterator;
            tc : T_Connector;
            pl : P_ConnList := bc.conn.Element(connId).sinks;
         begin
            if pl /= null then
               ci := Connectors.Last(pl.all);
               tc := (block => bc.actBlock, pin => pin);
               Connectors.Insert(ci, tc);
               res := 0;
               -- the element itself is not updating because it contains
               -- only pointer to the list (not the list itself)
            else
               null;
               -- FIXME: raise an exception
            end if;
         end;
      end if;
   end connectIn;

   ----------------
   -- connectOut --
   ----------------

   procedure connectOut
     (bc : in out T_CBlockBuilder;
      pin : in Positive;
      connId : in Integer;
      res : out Integer)
   is
      sl : T_Connection;
   begin
      res := -1;
      if not bc.conn.Contains(connId) then
         sl.source := (block => bc.actBlock, pin => pin);
         sl.sinks := new Connectors.List_Type;
         res := 0;
      else
         sl := bc.conn.Element(connId);
         if sl.source.block = null then
            sl.source := (block => bc.actBlock, pin => pin);
            res := 0;
         else
            null;
            -- FIXME: may be raise an exception
         end if;
      end if;
      bc.conn.Include(connId, sl);
   end connectOut;

   -------------
   -- endCode --
   -------------

   procedure endCode (bc : in out T_CBlockBuilder) is
      res : Integer;
   begin
      -- build the execution schema
      validate(bc, res);

      if res = 0 then
         -- take a list of the connections
         -- get an output pair (P_Block, idx)
         -- loop throu input pairs
         --    bind the output with actual input
         declare
            c : Connections.Cursor := Connections.First(bc.conn);
            iter : Connectors.List_Iterator;
            pk, ps : P_Block;
            ixk, ixs : Natural;
            res : Integer;
         begin
            while Connections.Has_Element(c) loop
               pk := Connections.Element(c).source.block;
               ixk := Connections.Element(c).source.pin;
               iter := Connectors.First(Connections.Element(c).sinks.all);
               while Connectors.hasSucc(iter) loop
                  ps := Connectors.Value(iter).block;
                  ixs := Connectors.Value(iter).pin;
                  Boot.bind(pk.all, ixk, ps.all, ixs, res);
               end loop;
            end loop;
         end;
      else
         null;
      end if;
   end endCode;

   --------------
   -- validate --
   --------------

   procedure validate (bc : in out T_CBlockBuilder; res : out Integer) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "validate unimplemented");
      raise Program_Error with "Unimplemented procedure validate";
   end validate;

   ------------
   -- finish --
   ------------

   procedure finish (bc : in out T_CBlockBuilder; b : out P_CBlock) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "finish unimplemented");
      raise Program_Error with "Unimplemented procedure finish";
   end finish;

end Ay.Block.CBFactory;

-- SOME NOTES
-- The connections bewteen block's pin will created by collecting pin's
-- which has equal 'conn_id'. This collection (list) must have only
-- one output and at least one input.
