with Interfaces; use Interfaces;
with Unchecked_Deallocation ;

package Ay.Memory is


   type T_DataType is (DT_Bool, DT_Int, DT_Float, DT_LongFloat);

   type T_Value (DataType: T_DataType) is record
      --meta : integer;
      case DataType is
         when DT_Bool => m : Boolean; m_init : Boolean;
         when DT_Int => di : Integer; di_init : Integer;
         when DT_Float => fp : Float; fp_init : Float;
         when DT_LongFloat => lfp : Long_Float; lfp_init : Long_Float;
            --when others => null;
      end case;
   end record;

   type P_Value is access all T_Value;

   type T_ReferenceMemory is array (Positive range <>) of P_Value;
   type P_ReferenceMemory is access all T_ReferenceMemory;

   procedure destroyVar is new Unchecked_Deallocation ( T_Value , P_Value ) ;

   ---

   function get(v : in P_Value) return Boolean;

   function get(v : in P_Value) return Integer;

   function get(v : in P_Value) return Float;

   function get(v : in P_Value) return Long_Float;

   procedure set(v : in out P_Value; val : Boolean);

   procedure set(v : in out P_Value; val : Integer);

   procedure set(v : in out P_Value; val : Float);

   procedure set(v : in out P_Value; val : Long_Float);

end Ay.Memory;
