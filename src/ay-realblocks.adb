with Ay.Block; use Ay.Block;

package body Ay.RealBlocks is

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := False;
      Ay.Block.Boot.NewFloat(b, 1, Var_Global);
      res := True;
   end;

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := True;
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


   -- The method 'Calc[ulate]' implements the addition of the floats
   procedure doCalc (b : in out T_FloatAdd; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1) + GetFloat(b, 2);
      SetFloat(b, 3, x);
      res := True;
   end;


   -- The method 'Calc[ulate]' implements the substraction of the floats
   procedure doCalc (b : in out T_FloatSub; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1) - GetFloat(b, 2);
      SetFloat(b, 3, x);
      res := True;
   end;

   -- The method 'Calc[ulate]' implements the multiplication of the floats
   procedure doCalc (b : in out T_FloatMult; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1) * GetFloat(b, 2);
      SetFloat(b, 3, x);
      res := True;
   end;

   -- The method 'Calc[ulate]' implements the division of the floats
   procedure doCalc (b : in out T_FloatDiv; res : out Boolean) is
      x, y, z : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1);
      y := GetFloat(b, 2);
      if abs(y) > Float'Model_Epsilon then
         z := x / y ;
      else
         z := Float'Large;
      end if;
      SetFloat(b, 3, z);
      res := True;
   end;

   --  Generated stub: replace with real body!
   --   pragma Compile_Time_Warning (Standard.True, "XXX unimplemented");
   --   raise Program_Error with "Unimplemented function XXX";
end Ay.RealBlocks;
