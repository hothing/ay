package body Ay.Block.IntegerOp is

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_IntGlobal; res : out Boolean) is
   begin
      res := False;
      Ay.Block.Boot.NewInt(b, 1, Var_Static);
      res := True;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntGlobal; res : out Boolean) is
   begin
      res := True;
   end doCalc;

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_IntAdd; res : out Boolean) is
   begin
      res := False;
      Boot.NewInt(b, 1, Var_Input);
      Boot.NewInt(b, 2, Var_Input);
      Boot.NewInt(b, 3, Var_Output);
      res := True;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntAdd; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1) + GetInt(b, 2);
      SetInt(b, 3, x);
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntSub; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1) - GetInt(b, 2);
      SetInt(b, 3, x);
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntMult; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1) * GetInt(b, 2);
      SetInt(b, 3, x);
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntDiv; res : out Boolean) is
      x, y, z : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1);
      y := GetInt(b, 2);
      if y /= 0 then
         z := x / y;
         res := True;
      else
         z := Integer'Last;
      end if;
      SetInt(b, 3, z);
   end doCalc;

end Ay.Block.IntegerOp;
