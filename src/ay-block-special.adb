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

   package body Constructor is

      procedure newInput (idx : Natural; b : out P_Block) is
      begin
         b := new T_GetInput;
         T_GetInput(b.all).idx := idx;
      end newInput;

      procedure newOutput (idx : Natural; b : out P_Block) is
      begin
         b := new T_SetOutput;
         T_SetOutput(b.all).idx := idx;
      end newOutput;

   end Constructor;

end Ay.Block.Special;
