with Ay; use Ay;
with Ay.Block; use Ay.Block;
with Ay.Block.Logical; use Ay.Block.Logical;
with Ay.Block.Logical.LAnd; use Ay.Block.Logical.LAnd;
with Ay.Block.Logical.LOr; use Ay.Block.Logical.LOr;
with Ay.Block.Logical.LXOr; use Ay.Block.Logical.LXOr;
with Ay.Block.Logical.LNot; use Ay.Block.Logical.LNot;
with Ay.Block.Registry; use Ay.Block.Registry;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is

   procedure set(p : P_Value; v : Boolean) is
   begin
      if p /= null and then p'Tag in T_Boolean'Tag then
         P_Boolean(p).v := v;
      end if;
   end set;

   function get(p : P_Value) return Boolean is
   begin
      if p /= null and then p'Tag in T_Boolean'Tag then
         return P_Boolean(p).v;
      else
         return False;
      end if;
   end get;

   procedure set(p : P_Value; v : Integer) is
   begin
      if p /= null and then p'Tag in T_Integer'Tag then
         P_Integer(p).v := v;
      end if;
   end set;

   type ArrayOfBlock is array(1 .. 100) of P_InstantingBlock;

   pxa, pxb, pxc : P_Value;
   greg : T_BlockRegistry;
   r : Boolean;
   blks : ArrayOfBlock;
begin
   -- prepare
   pxa := new T_Boolean'(v => False);
   pxb := new T_Boolean'(v => True);

   -- registry testing
   newRecord(greg, 1, new T_NotMetaBlock, r);
   newRecord(greg, 2, new T_AndMetaBlock, r);
   newRecord(greg, 3, new T_OrMetaBlock, r);
   newRecord(greg, 4, new T_XorMetaBlock, r);

   newBlockInstance(greg, 1, blks(1));
   newBlockInstance(greg, 2, blks(2));
   newBlockInstance(greg, 3, blks(3));
   newBlockInstance(greg, 4, blks(4));

   -- make a connection diagram
   -- the diagram represents the formula: (not a and b) or False
   blks(1).connect(1, pxa);
   blks(1).pull(1, pxc);
   blks(2).connect(1, pxc);
   blks(2).connect(2, pxb);
   blks(2).pull(1, pxc);
   blks(3).connect(1, pxc);
   blks(3).pull(1, pxc);

   -- NB: a procedure for the initiating of the missing inputs is not implemented
   -- and the exception will happen during call of 'calc'
   ---
   for i in 1 .. blks'Last loop
      if blks(i) /= null then
         blks(i).init(r);
      end if;
   end loop;

   for i in 1 .. blks'Last loop
      if blks(i) /= null then
         blks(i).reset;
      end if;
   end loop;

   set(pxa, False);
   set(pxb, True);

   for i in 1 .. blks'Last loop
      if blks(i) /= null then
         blks(i).calc(r);
      end if;
   end loop;

   Put_Line(Boolean'Image(get(pxc)));
end Main;
