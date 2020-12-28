with Ay.Block; use Ay.Block;

package body Ay.RealBlocks is

--     type T_FloadBlock3 is record
--        in1 : aliased T_Value(DT_Float);
--        in2 : aliased T_Value(DT_Float);
--        out1 : aliased T_Value(DT_Float);
--     end record;

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := False;
      Ay.Block.Boot.NewFloat(b, 1, Var_Static);
      res := True;
   end;

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := True;
   end;

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := False;
      pragma Compile_Time_Warning (Standard.True, "T_FloatGlobal::doFinal unimplemented");
      raise Program_Error;
   end;

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_FloatAdd; res : out Boolean) is
   begin
      res := False;
      Ay.Block.Boot.NewFloat(b, 1, Var_Input);
      Ay.Block.Boot.NewFloat(b, 2, Var_Input);
      Ay.Block.Boot.NewFloat(b, 3, Var_Output);
      res := True;
   end;


   -- The method 'Calc[ulate]' implements the addition of the integers
   procedure doCalc (b : in out T_FloatAdd; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1) + GetFloat(b, 2);
      SetFloat(b, 3, x);
      res := True;
   end;

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_FloatAdd; res : out Boolean) is
   begin
      res := False;
      pragma Compile_Time_Warning (Standard.True, "T_FloatAdd::doFinal unimplemented");
      raise Program_Error;
   end;


   --  Generated stub: replace with real body!
   --   pragma Compile_Time_Warning (Standard.True, "XXX unimplemented");
   --   raise Program_Error with "Unimplemented function XXX";
end Ay.RealBlocks;
