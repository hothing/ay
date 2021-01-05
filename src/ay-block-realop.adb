package body Ay.Block.RealOp is

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := False;
      Ay.Block.Boot.NewFloat(b, 1, Var_Global);
      res := True;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := True;
   end doCalc;

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_FloatAdd; res : out Boolean) is
   begin
      res := False;
      Ay.Block.Boot.NewFloat(b, 1, Var_Input);
      Ay.Block.Boot.NewFloat(b, 2, Var_Input);
      Ay.Block.Boot.NewFloat(b, 3, Var_Output);
      res := True;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatAdd; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1) + GetFloat(b, 2);
      SetFloat(b, 3, x);
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatSub; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1) - GetFloat(b, 2);
      SetFloat(b, 3, x);
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatMult; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1) * GetFloat(b, 2);
      SetFloat(b, 3, x);
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatDiv; res : out Boolean) is
      x, y, z : Float := 0.0;
   begin
      res := False;
      x := GetFloat(b, 1);
      y := GetFloat(b, 2);
      if abs(y) > Float'Model_Epsilon then
         z := x / y ;
         res := True;
      else
         z := Float'Large;
      end if;
      SetFloat(b, 3, z);
   end doCalc;

end Ay.Block.RealOp;
