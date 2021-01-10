package body Ay.Block.RealOp is

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_FloatGlobal; res : out Boolean) is
   begin
      res := False;
      b.outp(1).v.fp := b.outp(1).v.fp_init;
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
      b.inp(1).v.fp := b.inp(1).v.fp_init;
      b.inp(2).v.fp := b.inp(2).v.fp_init;
      b.outp(1).v.fp := b.outp(1).v.fp_init;
      res := True;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatAdd; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      b.outp(1).v.fp := b.inp(1).v.fp + b.inp(2).v.fp;
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatSub; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      b.outp(1).v.fp := b.inp(1).v.fp - b.inp(2).v.fp;
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatMult; res : out Boolean) is
      x : Float := 0.0;
   begin
      res := False;
      b.outp(1).v.fp := b.inp(1).v.fp * b.inp(2).v.fp;
      res := True;
   end doCalc;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_FloatDiv; res : out Boolean) is
      x, y, z : Float := 0.0;
   begin
      res := False;
      x := b.inp(1).v.fp;
      y := b.inp(2).v.fp ;
      if abs(y) > Float'Model_Epsilon then
         z := x / y ;
         res := True;
      else
         z := Float'Large;
      end if;
      b.outp(1).v.fp := z;
   end doCalc;

end Ay.Block.RealOp;
