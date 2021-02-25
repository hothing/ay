package body Ay.Registry is

   use type BList.List_Iterator;

   -----------
   -- Reset --
   -----------

   procedure reset (r: in out T_BlockRegistry) is
   begin
        while BList.First(r.reg) /= BList.Last(r.reg) loop
            BList.Delete (BList.First(r.reg));
        end loop;
   end reset;

   ---------------
   -- newRecord --
   ---------------

   procedure newRecord
     (r: in out T_BlockRegistry;
      uid : Integer;
      m : Ay.Block.P_MetaInfo;
      res : out Boolean)
   is
      iterator : BList.List_Iterator;
   begin
      res := False;
      if not exist(r, uid) then
         iterator := BList.First(r.reg);
         BList.Insert(iterator, (uid => uid, bfactory => m));
         res := True;
      end if;
   end newRecord;

   -----------
   -- exist --
   -----------

   function exist (r : in T_BlockRegistry; uid : Integer) return Boolean is
      found : Boolean;
      iterator : BList.List_Iterator;
   begin
      iterator := BList.First(r.reg);
      while iterator /= BList.Last(r.reg) loop
         found := BList.Value(iterator).uid = uid;
         exit when found;
         iterator := BList.Succ(iterator);
      end loop;
      return found;
   end exist;

   ---------------------
   -- getBlockFactory --
   ---------------------

   function getBlockFactory
     (r : in T_BlockRegistry;
      uid : Integer)
      return Ay.Block.P_MetaInfo
   is
      iterator : BList.List_Iterator;
   begin
      iterator := BList.First(r.reg);
      while iterator /= BList.Last(r.reg) loop
         exit when BList.Value(iterator).uid = uid;
         iterator := BList.Succ(iterator);
      end loop;
      return BList.Value(iterator).bfactory;
   end getBlockFactory;

   procedure newBlockInstance(r : in T_BlockRegistry; uid : Integer; b : out P_Block) is
      mb : Ay.Block.P_MetaInfo;
   begin
      mb := getBlockFactory(r => r, uid => uid);
      if mb /= null then
         newInstance(mb => mb.all, b => b);
         makeInstance(mb, b);
      else
         b := null;
      end if;
   end newBlockInstance;


end Ay.Registry;
