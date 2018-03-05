with Interfaces; use Interfaces;

package Ay.Memory is

   type T_MemoryAllocator is abstract tagged null record;

   function newInt(ma : in out T_MemoryAllocator'Class) return P_Int;
   function newReal(ma : in out T_MemoryAllocator'Class) return P_Real;
   function newBool(ma : in out T_MemoryAllocator'Class) return P_Bool;

   function allocInt(ma : in out T_MemoryAllocator) return P_Int;
   function allocReal(ma : in out T_MemoryAllocator) return P_Real;
   function allocBool(ma : in out T_MemoryAllocator) return P_Bool;

   subtype T_CellIndex is Unsigned_32;

   type T_ArrayInt is array (T_CellIndex range <>) of aliased T_Int;
   type T_ArrayReal is array (T_CellIndex range <>) of aliased T_Real;
   type T_ArrayBool is array (T_CellIndex range <>) of aliased T_Bool;

   type P_ArrayInt is access T_ArrayInt;
   type P_ArrayReal is access T_ArrayReal;
   type P_ArrayBool is access T_ArrayBool;

   type T_MemoryAllocatorS is new T_MemoryAllocator with
      record
         di : P_ArrayInt;
         dr : P_ArrayReal;
         db : P_ArrayBool;
         ipt : T_CellIndex;
         rpt : T_CellIndex;
         bpt : T_CellIndex;
      end record;

   procedure init(ma : in out T_MemoryAllocatorS; si, sr, sb: T_CellIndex);
   function allocBool(ma : in out T_MemoryAllocatorS) return P_Bool;
   function allocInt(ma : in out T_MemoryAllocatorS) return P_Int;
   function allocReal(ma : in out T_MemoryAllocatorS) return P_Real;


end Ay.Memory;
