package body Ay.Block.Special is

   -------------
   -- preCalc --
   -------------

   procedure pre (b : in out T_GetInput;
                      isec: in out T_XBlockSection;
                      osec: in out T_XBlockSection;
                      ssec: in out T_XBlockSection) is
   begin
      b.outp.elem(1).v.all := isec.elem(b.idx).v.all;
   end pre;

   --------------
   -- postCalc --
   --------------

   procedure post (b : in out T_SetOutput;
                       isec: in out T_XBlockSection;
                       osec: in out T_XBlockSection;
                       ssec: in out T_XBlockSection) is
   begin
      osec.elem(b.idx).v.all := b.inp.elem(1).v.all;
   end post;

end Ay.Block.Special;
