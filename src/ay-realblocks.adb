package body Ay.RealBlocks is

   -- The method 'Init' initializes the block
   function doInit(b : in T_FloatAdd) return Boolean is
   begin
      --b.dface(1) := Var_Input;
      --b.dface(2) := Var_Input;
      --b.dface(3) := Var_Output;
      pragma Compile_Time_Warning (Standard.True, "T_FloatAdd::doInit unimplemented");
      --raise Program_Error with "Unimplemented function T_FloatAdd::doInit";
      return True;
   end;


   -- The method 'Calc[ulate]' implements the addition of the integers
   function doCalc (b : in T_FloatAdd) return Boolean is
      x : Float := 0.0;
   begin
      x := GetFloat(b, 1) + GetFloat(b, 2);
      SetFloat(b, 3, x);
      return True;
   end;

   --  Generated stub: replace with real body!
   --   pragma Compile_Time_Warning (Standard.True, "XXX unimplemented");
   --   raise Program_Error with "Unimplemented function XXX";
end Ay.RealBlocks;
