with Unchecked_Deallocation ;

package Ay is

   type T_AtomicType is (DT_Unknown,
                         DT_Void,
                         DT_Bool,
                         DT_Int,
                         DT_Float,
                         DT_LongFloat);

   type T_DataType(atype : T_AtomicType;
                   isArray : Boolean;
                   dim1 : Natural;
                   dim2 : Natural) is null record;

   type P_DataType is access T_DataType;

   type T_AnyValue is abstract tagged null record;

   type P_Value is access all T_AnyValue'Class;

   procedure copy(vt : in out T_AnyValue; vs : in P_Value) is abstract;

   type T_Boolean is new T_AnyValue with
      record
         v : Boolean;
      end record;

   type P_Boolean is access all T_Boolean;

   procedure copy(vt : in out T_Boolean; vs : in P_Value);

   type T_Integer is new T_AnyValue with
      record
         v : Integer;
      end record;
   type P_Integer is access all T_Integer;

   procedure copy(vt : in out T_Integer; vs : in P_Value);

   type T_Float is new T_AnyValue with
      record
         v : Float;
      end record;
   type P_Float is access T_Float;

   procedure copy(vt : in out T_Float; vs : in P_Value);

   type T_AnyArray is abstract new T_AnyValue with null record;

   type P_AnyArray is access T_AnyArray'Class;


   type Type_Array_Boolean is array (Positive range <>) of Boolean;

   type T_ArrayBoolean(Size : Positive) is new T_AnyArray with
      record
         a : Type_Array_Boolean (1 .. Size);
      end record;

   type P_ArrayBoolean is access T_ArrayBoolean;

   procedure copy(vt : in out T_ArrayBoolean; vs : in P_Value);

   type Type_Array_Integer is array (Positive range <>) of Integer;

   type T_ArrayInteger(Size : Positive) is new T_AnyArray with
      record
         a : Type_Array_Integer (1 .. Size);
      end record;
   type P_ArrayInteger is access T_ArrayInteger;

   procedure copy(vt : in out T_ArrayInteger; vs : in P_Value);

   type Type_Array_Float is array (Positive range <>) of Float;

   type T_ArrayFloat(Size : Positive) is new T_AnyArray with
      record
         a : Type_Array_Float (1 .. Size);
      end record;
   type P_ArrayFloat is access T_ArrayFloat;

   procedure copy(vt : in out T_ArrayFloat; vs : in P_Value);

   function newValue(d : T_DataType) return P_Value;

   procedure destroyValue is new Unchecked_Deallocation ( T_Boolean , P_Boolean ) ;
   procedure destroyValue is new Unchecked_Deallocation ( T_Integer , P_Integer ) ;
   procedure destroyValue is new Unchecked_Deallocation ( T_Float , P_Float ) ;

   procedure destroyValue is new Unchecked_Deallocation ( T_ArrayBoolean , P_ArrayBoolean ) ;
   procedure destroyValue is new Unchecked_Deallocation ( T_ArrayInteger , P_ArrayInteger ) ;
   procedure destroyValue is new Unchecked_Deallocation ( T_ArrayFloat , P_ArrayFloat ) ;

end Ay;
