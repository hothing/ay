with Interfaces; use Interfaces;
with Unchecked_Deallocation ;

package Ay.Memory is


   type T_DataType is (DT_Bool, DT_Int, DT_Float, DT_LongFloat);

   type T_Value (DataType: T_DataType) is record
      --meta : integer;
      case DataType is
         when DT_Bool => m : aliased Boolean; m_init : Boolean;
         when DT_Int => di : aliased Integer; di_init : Integer;
         when DT_Float => fp : aliased Float; fp_init : Float;
         when DT_LongFloat => lfp : aliased Long_Float; lfp_init : Long_Float;
         --when others => null;
      end case;
   end record;

   type P_Value is access all T_Value;

   type T_ReferenceMemory is array (Positive range <>) of P_Value;
   type P_ReferenceMemory is access all T_ReferenceMemory;

   procedure Init;

   procedure destroyVar is new Unchecked_Deallocation ( T_Value , P_Value ) ;

end Ay.Memory;
