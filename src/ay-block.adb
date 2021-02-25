package body Ay.Block is

   -- The method gets an meta information descriptor
   function get_Meta(b : in T_Block) return P_Meta_Info is
   begin
      return b.meta;
   end Get_Meta;

   ------------------
   -- makeInstance --
   ------------------

   procedure make_Instance (mb : in P_Meta_Info; b : out P_Block) is
   begin
      new_Instance(mb.all, b);
      b.meta := mb;
   end Make_Instance;

end Ay.Block;
