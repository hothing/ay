package body Ay.Block.Special is

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_GetInput; res : out Boolean) is
   begin
      res := true;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_GetInput; res : out Boolean) is
   begin
      res := true;
   end doCalc;

   -------------
   -- preCalc --
   -------------

   procedure preCalc (b : in out T_GetInput; instance: in out P_Block) is
   begin
      b.outp.elem(1).v.all := instance.inp.elem(b.idx).v.all;
   end preCalc;

   --------------
   -- postCalc --
   --------------

   procedure postCalc (b : in out T_GetInput; instance: in out P_Block) is
   begin
      null;
   end postCalc;

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_SetOutput; res : out Boolean) is
   begin
      res := true;
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_SetOutput; res : out Boolean) is
   begin
      res := true;
   end doCalc;

   -------------
   -- preCalc --
   -------------

   procedure preCalc (b : in out T_SetOutput; instance: in out P_Block) is
   begin
       null;
   end preCalc;

   --------------
   -- postCalc --
   --------------

   procedure postCalc (b : in out T_SetOutput; instance: in out P_Block) is
   begin
      instance.outp.elem(b.idx).v.all := b.inp.elem(1).v.all;
   end postCalc;

end Ay.Block.Special;
