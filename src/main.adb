with Ay; use Ay;
with Ay.Block; use Ay.Block;
with Ay.Block.Logical; use Ay.Block.Logical;
with Ay.Block.Logical.LAnd;
with Ay.Block.Logical.LOr;
with Ay.Block.Logical.LNot;

with Ay.Connector; use Ay.Connector;
with Ay.Registry; use Ay.Registry;

with Ada.Text_IO; use Ada.Text_IO;


procedure Main is
   type T_BlockArray is array (Positive range <>) of P_Block;
   type T_CbArray is array (Positive range <>) of T_Connector(DT_Bool);
   blks : T_BlockArray (1 .. 20);
   greg : Ay.Registry.T_BlockRegistry;
   pi : P_BlockInterface;
   r : Boolean;
   cp : T_CbArray (1 .. 5);
begin
   -- prepare

   -- registry testing
   newRecord(greg, 1, new LNot.T_NotMeta, r);
   newRecord(greg, 2, new LAnd.T_AndMeta, r);
   newRecord(greg, 3, new LOr.T_OrMeta, r);

   newBlockInstance(greg, 1, blks(1));
   newBlockInstance(greg, 2, blks(2));
   newBlockInstance(greg, 3, blks(3));
   newBlockInstance(greg, 3, blks(4));

   for c of cp loop
      init(c);
   end loop;

   blks(1).connectOutput(1, cp(1));
   blks(2).connectInput(1, cp(1));
   blks(2).connectOutput(1, cp(2));
   blks(3).connectInput(1, cp(2));
   blks(3).connectOutput(1,cp(3));
   blks(4).connectInput(1, cp(3));

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

   pi := blks(2).getInterface;
   pi.setValue(True, 2, True);

   for i in 1 .. 100_000 loop
   for blk of blks loop
      if blk /= null then
         blk.calc(r);
      end if;
      end loop;
   end loop;

   pi := blks(4).getInterface;
   if pi /=null then
      Put_Line(Boolean'Image(pi.getValue(false, 1)));
   else
      Put_Line("Result is not available");
   end if;
end Main;
