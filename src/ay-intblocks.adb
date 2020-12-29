package body Ay.IntBlocks is

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_IntGlobal; res : out Boolean) is
   begin
      res := False;
      Ay.Block.Boot.NewInt(b, 1, Var_Static);
      res := True;
   end;

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_IntGlobal; res : out Boolean) is
   begin
      res := True;
   end;

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_IntAdd; res : out Boolean) is
   begin
      res := False;
      Boot.NewInt(b, 1, Var_Input);
      Boot.NewInt(b, 2, Var_Input);
      Boot.NewInt(b, 3, Var_Output);
      res := True;
   end;


   -- The method 'Calc[ulate]' implements the addition of the integers
   procedure doCalc (b : in out T_IntAdd; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1) + GetInt(b, 2);
      SetInt(b, 3, x);
      res := True;
   end;

   procedure doCalc (b : in out T_IntSub; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1) - GetInt(b, 2);
      SetInt(b, 3, x);
      res := True;
   end;

   procedure doCalc (b : in out T_IntMult; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1) * GetInt(b, 2);
      SetInt(b, 3, x);
      res := True;
   end;

   procedure doCalc (b : in out T_IntDiv; res : out Boolean) is
      x, y, z : Integer := 0;
   begin
      res := False;
      x := GetInt(b, 1);
      y := GetInt(b, 2);
      if y /= 0 then
         z := x / y;
      else
         z := Integer'Last;
      end if;
      SetInt(b, 3, z);
      res := True;
   end;

end Ay.IntBlocks;
