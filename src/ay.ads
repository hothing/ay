with Unchecked_Deallocation ;

package Ay is

   type T_Signal_Type is (DT_Unknown,
                         DT_Bool,
                         DT_Int,
                         DT_Float,
                         DT_LongFloat);

   -- primitive type's access
   type P_Boolean is access all Boolean;
   type P_Integer is access all Integer;
   type P_Float is access all Float;
   type P_LongFloat is access all Long_Float;


   procedure destroyValue is new Unchecked_Deallocation ( Boolean , P_Boolean ) ;
   procedure destroyValue is new Unchecked_Deallocation ( Integer , P_Integer ) ;
   procedure destroyValue is new Unchecked_Deallocation ( Float , P_Float ) ;
   procedure destroyValue is new Unchecked_Deallocation ( Long_Float , P_LongFloat ) ;

end Ay;
