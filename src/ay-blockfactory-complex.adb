with Ay.Block.Complex; use Ay.Block.Complex;

package body Ay.BlockFactory.Complex is

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
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "registerBlockType unimplemented");
      raise Program_Error with "Unimplemented procedure registerBlockType";
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
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "lookupBlockType unimplemented");
      raise Program_Error with "Unimplemented procedure lookupBlockType";
   end lookupBlockType;

   --------------
   -- addBlock --
   --------------

   procedure addBlock
     (r : in out T_ComplexBlockFactory;
      bid : in T_BlockTypeIdentity;
      res : out Integer)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "addBlock unimplemented");
      raise Program_Error with "Unimplemented procedure addBlock";
   end addBlock;

   --------------
   -- makeBind --
   --------------

   procedure makeBind
     (r : in out T_ComplexBlockFactory;
      id : Positive;
      bsid : Natural;
      pin : Positive;
      res : out Integer)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makeBind unimplemented");
      raise Program_Error with "Unimplemented procedure makeBind";
   end makeBind;

   ---------------
   -- transpile --
   ---------------

   procedure transpile
     (r : in out T_ComplexBlockFactory;
      res : out Integer)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "transpile unimplemented");
      raise Program_Error with "Unimplemented procedure transpile";
   end transpile;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_ComplexBlockFactory; b : out P_Block)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doNewBlock unimplemented");
      raise Program_Error with "Unimplemented procedure doNewBlock";
   end doNewBlock;

   ---------
   -- "=" --
   ---------

   function "=" (Left, Right : T_BindPoint) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, """="" unimplemented");
      raise Program_Error with "Unimplemented function ""=""";
      return "=" (Left => Left, Right => Right);
   end "=";

   ---------
   -- "<" --
   ---------

   function "<" (Left, Right : T_BindPoint) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, """<"" unimplemented");
      raise Program_Error with "Unimplemented function ""<""";
      return "<" (Left => Left, Right => Right);
   end "<";

end Ay.BlockFactory.Complex;
