with Interfaces; use Interfaces;

package Ay.Memory is

   type T_DataType is (DT_Bool, DT_Int, DT_Word, DT_Float, DT_LongFloat);

   type T_Value (DataType: T_DataType) is record
      meta : integer;
      case DataType is
         when DT_Bool => m : Boolean;
         when DT_Int => di : Integer;
         when DT_Word => dw : Unsigned_32;
         when DT_Float => fp : Float;
         when DT_LongFloat => lfp : Long_Float;
      end case;
   end record;

   type P_Value is access all T_Value;

   type T_ReferenceMemory is array (Positive range <>) of P_Value;
   type P_ReferenceMemory is access all T_ReferenceMemory;

   type T_BoolMemory is array (Positive range <>) of aliased T_Value(DT_Bool);
   type T_IntMemory is array (Positive range <>) of aliased T_Value(DT_Int);
   type T_WordMemory is array (Positive range <>) of aliased T_Value(DT_Word);
   type T_FloatMemory is array (Positive range <>) of aliased T_Value(DT_Float);
   type T_LFloatMemory is array (Positive range <>) of aliased T_Value(DT_LongFloat);
--
--     type T_BoolMemoryBlock;
--
--     type P_BoolMemoryBlock is access all T_BoolMemoryBlock;
--
--     type T_BoolMemoryBlock ( Size : Positive := 128) is record
--        blk  : T_BoolMemory (1 .. Size);
--        next : P_BoolMemoryBlock;
--     end record;

   type T_MemoryBlock;
   type P_MemoryBlock is access all T_MemoryBlock;
   type T_MemoryBlock (DataType: T_DataType := DT_Int;
                       Size : Positive := 128) is record
      next : P_MemoryBlock;
      case DataType is
         when DT_Bool => mblk : T_BoolMemory(1 .. Size);
         when DT_Int => iblk : T_IntMemory(1 .. Size);
         when DT_Word => wblk : T_WordMemory(1 .. Size);
         when DT_Float => fblk : T_FloatMemory(1 .. Size);
         when DT_LongFloat => lfblk : T_LFloatMemory(1 .. Size);
      end case;
   end record;

   procedure Init;

end Ay.Memory;
