package body Ay.IntBlocks is

   -- The method 'Init' initializes the block
   function doInit(b : in T_IntAdd) return Boolean is
   begin
      --b.dface(1) := Var_Input;
      --b.dface(2) := Var_Input;
      --b.dface(3) := Var_Output;
      pragma Compile_Time_Warning (Standard.True, "T_FloatAdd::doInit unimplemented");
      return True;
   end;


   -- The method 'Calc[ulate]' implements the addition of the integers
   function doCalc (b : in T_IntAdd) return Boolean is
      x : Integer := 0;
   begin
      x := GetInt(b, 1) + GetInt(b, 2);
      SetInt(b, 3, x);
      return True;
   end;


end Ay.IntBlocks;
