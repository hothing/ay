with Ay.Block.Complex; use Ay.Block.Complex;
with Ada.Containers.Vectors;

use Ada.Containers;

package body Ay.BlockFactory.Complex is

   EC_OK : constant := 0; -- no error
   EC_ERROR : constant := -1; -- any error
   EC_ELEMENT_EXISTS  : constant := -2; -- the element is already exist in a collection
   EC_ELEMENT_NOT_FOUND  : constant := -3; -- the element is not found in a collection


   -----------------------
   -- registerBlockType --
   -----------------------

   procedure registerBlockType
     (r : in out T_ComplexBlockFactory;
      bid : in T_BlockTypeIdentity;
      desc : in P_BlockFactory;
      res : out Integer)
   is
   begin
      res := EC_ERROR;
      if desc /= null then
         if not r.registry.Contains(bid) then
            r.registry.Include(bid, desc);
            res := EC_OK;
         else
            res := EC_ELEMENT_EXISTS;
         end if;
      end if;
   end registerBlockType;

   ---------------------
   -- lookupBlockType --
   ---------------------

   procedure lookupBlockType
     (r : in out T_ComplexBlockFactory;
      bid : in T_BlockTypeIdentity;
      desc : out P_BlockFactory)
   is
   begin
      if r.registry.Contains(bid) then
          desc := r.registry.Element(bid);
      else
          desc := null;
      end if;
   end lookupBlockType;

   -----------------
   -- addVariable --
   -----------------

   procedure addVariable (r : in out T_ComplexBlockFactory;
                          dt : in T_DataType;
                          acc : in T_VariableAccess;
                          res : out Integer)
   is
      vd : T_VarDescriptor;
   begin
      res := EC_ERROR;
      vd.dt := dt;
      vd.ac := acc;
      VarDesc.Append(r.vars, vd);
      res := EC_OK;
   end addVariable;


   --------------
   -- addBlock --
   --------------

   procedure addBlock
     (r : in out T_ComplexBlockFactory;
      bid : in T_BlockTypeIdentity;
      bsid : out Natural;
      res : out Integer)
   is
   begin
      res := EC_ERROR;
      bsid := 0;
      if r.registry.Contains(bid) then
         BlockInstances.Append(r.blocks, bid);
         bsid := BlockInstances.Last_Index(r.blocks);
         res := EC_OK;
      else
         res := EC_ELEMENT_NOT_FOUND;
      end if;
   end addBlock;

   --------------
   -- makeBind --
   --------------

   procedure makeBindPoint
     (r : in out T_ComplexBlockFactory;
      id : in Positive;
      bsid : in Natural;
      pin : in Positive;
      res : out Integer)
   is
      tb : T_BindPoint;
   begin
      res := EC_ERROR;
      if (BlockInstances.First_Index(r.blocks) <= bsid)
        and (BlockInstances.Last_Index(r.blocks) >= bsid)
      then
         tb.bsid := bsid;
         tb.pin := pin; -- FIXME: might be to check a pin?
         if not BlockBinds.Contains(r.binds, id) then
            BlockBinds.Include(r.binds, id, new BindSets.Set);
         end if;
         BindSets.Include(BlockBinds.Element(r.binds, id).all, tb);
         res := EC_OK;
      else
         res := EC_ELEMENT_NOT_FOUND;
      end if;
   end makeBindPoint;

   ---------------
   -- transpile --
   ---------------

   procedure transpile
     (r : in out T_ComplexBlockFactory;
      res : out Integer)
   is
   begin
      res := EC_ERROR;
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "transpile unimplemented");
      raise Program_Error with "Unimplemented procedure transpile";
   end transpile;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_ComplexBlockFactory; b : out P_Block)
   is
      cb, cbi : P_Block;
      bch, bcc : P_BlockChain;
      vs : Positive;
      vd : T_VarDescriptor;
      bid : Natural;
      fac : P_BlockFactory;
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doNewBlock unimplemented");
      raise Program_Error with "Unimplemented procedure doNewBlock";

      getVarCount(bc, vs);
      cb := new T_ComplexBlock(vs);

      -- create the variables
      for i in VarDesc.First_Index(bc.vars) .. VarDesc.Last_Index(bc.vars)
      loop
         vd := VarDesc.Element(bc.vars, i);
         Ay.Block.Boot.newVar(cb.all, i, vd.dt, vd.ac);
      end loop;

      -- create the blocks
      bch := new T_BlockChain;
      for i in
        BlockInstances.First_Index(bc.blocks) ..
        BlockInstances.Last_Index(bc.blocks)
      loop
         bid := BlockInstances.Element(bc.blocks, i);
         if bid > 0 then
            lookupBlockType(bc, bid, fac);
            if fac /= null then
               newBlock(fac.all, cbi);
               bcc := bch;
               bcc.block := cbi;
               bch := new T_BlockChain;
               bch.next := bcc;
            else
               null; -- FIXME: should be a reaction
            end if;
         else
            null; -- FIXME: should be a reaction
         end if;
      end loop;
      b := cb;
   end doNewBlock;

   ---------
   -- "=" --
   ---------

   function "=" (Left, Right : T_BindPoint) return Boolean is
   begin
      return (Left.bsid = Right.bsid) and (Left.pin = Right.pin);
   end "=";

   ---------
   -- "<" --
   ---------

   function "<" (Left, Right : T_BindPoint) return Boolean is
   begin
      return ((Left.bsid = Right.bsid) and (Left.pin < Right.pin))
             or (Left.bsid < Right.bsid);
   end "<";

end Ay.BlockFactory.Complex;
