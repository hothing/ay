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

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_IntGlobal; res : out Boolean) is
   begin
      res := False;
      pragma Compile_Time_Warning (Standard.True, "T_IntGlobal::doFinal unimplemented");
      raise Program_Error;
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

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_IntAdd; res : out Boolean) is
   begin
      res := False;
      pragma Compile_Time_Warning (Standard.True, "T_IntAdd::doFinal unimplemented");
      raise Program_Error;
   end;

end Ay.IntBlocks;
