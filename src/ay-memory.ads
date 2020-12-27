with Interfaces; use Interfaces;

package Ay.Memory is


   type T_DataType is (DT_Bool, DT_Int, DT_Word, DT_Float, DT_LongFloat);
   type T_DataTypeX is (DTX_Bool,
                        DTX_Int,
                        DTX_Word,
                        DTX_Float,
                        DTX_LongFloat,
                        DTX_Array,
                        DTX_Record);


   type T_ComplexType;
   type P_ComplexType is access all T_ComplexType;
   type T_ComplexTypeArray is array (Positive range <>) of P_ComplexType;

   type T_ComplexType (dtype : T_DataTypeX; size : Positive) is record
      case dtype is
         when DTX_Record =>
            desc : T_ComplexTypeArray(1 .. size);
         when others => null;
      end case;
   end record;

   type T_Value (DataType: T_DataType) is record
      --meta : integer;
      case DataType is
         when DT_Bool => m : aliased Boolean; m_init : Boolean;
         when DT_Int => di : aliased Integer; di_init : Integer;
         when DT_Word => dw : aliased Unsigned_32;
         when DT_Float => fp : aliased Float; fp_init : Float;
         when DT_LongFloat => lfp : aliased Long_Float; lfp_init : Long_Float;
         --when others => null;
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
   type T_BlockMarks is array (Positive range <>) of Boolean;
   type T_MemoryBlock (DataType: T_DataType;
                       Size : Positive) is record
      next : P_MemoryBlock;
      used : T_BlockMarks(1 .. size);
      case DataType is
         when DT_Bool => mblk : T_BoolMemory(1 .. Size);
         when DT_Int => iblk : T_IntMemory(1 .. Size);
         when DT_Word => wblk : T_WordMemory(1 .. Size);
         when DT_Float => fblk : T_FloatMemory(1 .. Size);
         when DT_LongFloat => lfblk : T_LFloatMemory(1 .. Size);
      end case;
   end record;


   type T_MemoryManager is tagged null record;

   function CreateBoolVar(mm : T_MemoryManager) return P_Value;
   function CreateIntVar(mm : T_MemoryManager) return P_Value;
   function CreateFloatVar(mm : T_MemoryManager) return P_Value;
   function CreateLFloatVar(mm : T_MemoryManager) return P_Value;

   procedure Init;

end Ay.Memory;
