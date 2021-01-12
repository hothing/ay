package body Ay.Block.CBFactory is

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

      for i in 1 .. bc.prototype.In_Size
      loop
         newCBlock.inp.elem(i).v := clone(bc.prototype.inp.elem(i).v);
      end loop;

      -- clone the outputs

      for i in 1 .. bc.prototype.Out_Size
      loop
         newCBlock.outp.elem(i).v := clone(bc.prototype.outp.elem(i).v);
      end loop;

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
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "init unimplemented");
      raise Program_Error with "Unimplemented procedure init";
   end init;

   ---------------
   -- beginVars --
   ---------------

   procedure beginVars (bc : in out T_CBlockBuilder) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "beginVars unimplemented");
      raise Program_Error with "Unimplemented procedure beginVars";
   end beginVars;

   --------------
   -- addInput --
   --------------

   procedure addInput (bc : in out T_CBlockBuilder; dt : in T_DataType) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addInput unimplemented");
      raise Program_Error with "Unimplemented procedure addInput";
   end addInput;

   ---------------
   -- addOutput --
   ---------------

   procedure addOutput (bc : in out T_CBlockBuilder; dt : in T_DataType) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addOutput unimplemented");
      raise Program_Error with "Unimplemented procedure addOutput";
   end addOutput;

   ---------------
   -- addStatic --
   ---------------

   procedure addStatic (bc : in out T_CBlockBuilder; dt : in T_DataType) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addStatic unimplemented");
      raise Program_Error with "Unimplemented procedure addStatic";
   end addStatic;

   -------------
   -- endVars --
   -------------

   procedure endVars (bc : in out T_CBlockBuilder) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "endVars unimplemented");
      raise Program_Error with "Unimplemented procedure endVars";
   end endVars;

   ---------------
   -- beginCode --
   ---------------

   procedure beginCode (bc : in out T_CBlockBuilder) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "beginCode unimplemented");
      raise Program_Error with "Unimplemented procedure beginCode";
   end beginCode;

   --------------
   -- addBlock --
   --------------

   procedure addBlock
     (bc : in out T_CBlockBuilder;
      bcid : in Integer;
      res : out Integer)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addBlock unimplemented");
      raise Program_Error with "Unimplemented procedure addBlock";
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
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "connectIn unimplemented");
      raise Program_Error with "Unimplemented procedure connectIn";
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
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "connectOut unimplemented");
      raise Program_Error with "Unimplemented procedure connectOut";
   end connectOut;

   -------------
   -- endCode --
   -------------

   procedure endCode (bc : in out T_CBlockBuilder) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "endCode unimplemented");
      raise Program_Error with "Unimplemented procedure endCode";
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

   --------------------
   -- getInputConnId --
   --------------------

   function getInputConnId
     (bc : in T_CBlockBuilder;
      idx : Positive)
      return Integer
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "getInputConnId unimplemented");
      raise Program_Error with "Unimplemented function getInputConnId";
      return getInputConnId (bc => bc, idx => idx);
   end getInputConnId;

   ---------------------
   -- getOutputConnId --
   ---------------------

   function getOutputConnId
     (bc : in T_CBlockBuilder;
      idx : Positive)
      return Integer
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "getOutputConnId unimplemented");
      raise Program_Error with "Unimplemented function getOutputConnId";
      return getOutputConnId (bc => bc, idx => idx);
   end getOutputConnId;

   ---------------------
   -- getStaticConnId --
   ---------------------

   function getStaticConnId
     (bc : in T_CBlockBuilder;
      idx : Positive)
      return Integer
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "getStaticConnId unimplemented");
      raise Program_Error with "Unimplemented function getStaticConnId";
      return getStaticConnId (bc => bc, idx => idx);
   end getStaticConnId;

end Ay.Block.CBFactory;
