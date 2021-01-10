package body Ay.Block.Complex is

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_ComplexBlock; res : out Boolean) is
   begin
      -- TODO: initialize variables (copy initial values)
      res := (b.bchain /= null);
   end doInit;

   ------------
   -- doCalc --
   ------------

   procedure doCalc (b : in out T_ComplexBlock; res : out Boolean) is
      head, curr : P_BlockChain;
      r, r2 : Boolean;
   begin
      -- copy values of input
      for i in 1 .. b.In_Size
      loop
         b.shadow_inp(i).v.all := b.inp(i).v.all;
      end loop;

      -- copy values of static vars
      for i in 1 .. b.Static_Size
      loop
         b.shadow_stat(i).v.all := b.stat(i).v.all;
      end loop;

      head := b.bchain;
      curr := head;
      r2 := (head /= null);
      while curr /= null loop
         calc(curr.block.all, r);
         r2 := r2 and r;
         curr := curr.next;
      end loop;
      res := r2;

      -- after execution do copeing in other direction
      for i in 1 .. b.Out_Size
      loop
         b.outp(i).v.all := b.shadow_out(i).v.all;
      end loop;

      -- copy values of static vars
      for i in 1 .. b.Static_Size
      loop
         b.stat(i).v.all := b.shadow_stat(i).v.all;
      end loop;
   end doCalc;

   ----------
   -- Boot --
   ----------

   package body Boot is

      -----------------
      -- linkProgram --
      -----------------

      procedure linkProgram
        (b : in out T_ComplexBlock;
         p : in P_BlockChain;
         res : out Boolean)
      is
      begin
         res :=false;
         if p /= null then
            b.bchain := p;
            res := true;
         end if;
      end linkProgram;

   end Boot;

end Ay.Block.Complex;
