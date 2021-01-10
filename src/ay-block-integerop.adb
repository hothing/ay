package body Ay.Block.IntegerOp is

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_IntGlobal; res : out Boolean) is
   begin
      b.outp.elem(1).v.di := b.outp.elem(1).v.di_init;
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
      b.inp.elem(1).v.di := b.inp.elem(1).v.di_init;
      b.inp.elem(2).v.di := b.inp.elem(2).v.di_init;
      b.outp.elem(1).v.di := b.outp.elem(1).v.di_init;
      res := True;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntAdd; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      b.outp.elem(1).v.di := b.inp.elem(1).v.di + b.inp.elem(2).v.di;
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntSub; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      b.outp.elem(1).v.di := b.inp.elem(1).v.di - b.inp.elem(2).v.di;
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntMult; res : out Boolean) is
      x : Integer := 0;
   begin
      res := False;
      b.outp.elem(1).v.di := b.inp.elem(1).v.di * b.inp.elem(2).v.di;
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_IntDiv; res : out Boolean) is
      x, y, z : Integer := 0;
   begin
      res := False;
      x := b.inp.elem(1).v.di;
      y := b.inp.elem(2).v.di;
      if y /= 0 then
         z := x / y;
         res := True;
      else
         z := Integer'Last;
      end if;
      b.outp.elem(1).v.di := z;
   end doCalc;

end Ay.Block.IntegerOp;
