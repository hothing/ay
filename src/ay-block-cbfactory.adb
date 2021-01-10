package body Ay.Block.CBFactory is

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_CBLockFactory; b : out P_Block) is
   begin
      b := new T_CBlock(bc.In_Size, bc.Out_SIze, bc.Static_Size);
      -- TODO : rest of work
   end doNewBlock;

   procedure addInput(bc : in out T_CBlockFactory; dt : in T_DataType) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addInput unimplemented");
      raise Program_Error with "Unimplemented function addInput";
   end;

   procedure addOutput(bc : in out T_CBlockFactory; dt : in T_DataType) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addOutput unimplemented");
      raise Program_Error with "Unimplemented function addOutput";
   end;

   procedure addStatic(bc : in out T_CBlockFactory; dt : in T_DataType) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addStatic unimplemented");
      raise Program_Error with "Unimplemented function addStatic";
   end;

   function getInputSize(bc : in T_CBlockFactory) return Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "getInputSize unimplemented");
      raise Program_Error with "Unimplemented function getInputSize";
      return getInputSize (bc => bc);
   end;

   function getOutputSize(bc : in T_CBlockFactory) return Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "getOutputSize unimplemented");
      raise Program_Error with "Unimplemented function getOutputSize";
      return getOutputSize (bc => bc);
   end;

   function getStaticSize(bc : in T_CBlockFactory) return Natural is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "getStaticSize unimplemented");
      raise Program_Error with "Unimplemented function getStaticSize";
      return getStaticSize (bc => bc);
   end;

end Ay.Block.CBFactory;
