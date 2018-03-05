package body Ay.Memory is

   procedure init(ma : in out T_MemoryAllocatorS; si, sr, sb: T_CellIndex)
   is
   begin
      ma.di := new T_ArrayInt(0 .. si);
      ma.dr := new T_ArrayReal(0 .. sr);
      ma.db := new T_ArrayBool(0 .. sb);
   end init;

   ------------
   -- newInt --
   ------------

   function newInt (ma : in out T_MemoryAllocator'Class) return P_Int is
   begin
      return allocInt (ma);
   end newInt;

   -------------
   -- newReal --
   -------------

   function newReal (ma : in out T_MemoryAllocator'Class) return P_Real is
   begin
      return allocReal (ma => ma);
   end newReal;

   -------------
   -- newBool --
   -------------

   function newBool (ma : in out T_MemoryAllocator'Class) return P_Bool is
   begin
      return allocBool (ma => ma);
   end newBool;

   --------------
   -- allocInt --
   --------------

   function allocInt (ma : in out T_MemoryAllocator) return P_Int is
   begin
      raise Program_Error with "abstract function allocReal";
      return null;
   end allocInt;

   ---------------
   -- allocReal --
   ---------------

   function allocReal (ma : in out T_MemoryAllocator) return P_Real is
   begin
      raise Program_Error with "abstract function allocReal";
      return null;
   end allocReal;

   ---------------
   -- allocBool --
   ---------------

   function allocBool (ma : in out T_MemoryAllocator) return P_Bool is
   begin
      raise Program_Error with "abstract function allocReal";
      return null;
   end allocBool;

   --------------
   -- allocInt --
   --------------

   function allocInt (ma : in out T_MemoryAllocatorS) return P_Int is
      p : P_Int;
   begin
      p := null;
      if ma.di /= null and ma.ipt < ma.di'Last then
         p := ma.di(ma.ipt)'Access;
         ma.ipt := ma.ipt + 1;
      end if;
      return p;
   end allocInt;

   ---------------
   -- allocReal --
   ---------------

   function allocReal (ma : in out T_MemoryAllocatorS) return P_Real is
      p : P_Real;
   begin
      p := null;
      if ma.dr /= null and ma.rpt < ma.dr'Last then
         p := ma.dr(ma.rpt)'Access;
         ma.rpt := ma.rpt + 1;
      end if;
      return p;
   end allocReal;

   ---------------
   -- allocBool --
   ---------------

   function allocBool (ma : in out T_MemoryAllocatorS) return P_Bool is
      p : P_Bool;
   begin
      p := null;
      if ma.db /= null and ma.bpt < ma.db'Last then
         p := ma.db(ma.bpt)'Access;
         ma.bpt := ma.bpt + 1;
      end if;
      return p;
   end allocBool;

end Ay.Memory;
