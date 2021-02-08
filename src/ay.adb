package body Ay is

   --------------
   -- newValue --
   --------------

   function newValue (d : T_DataType) return P_Value is
      pv : P_Value;
   begin
      if d.isArray then
         if d.dim1 = 0 then
            raise Program_Error with "Wrong dimension #1";
         end if;
         if d.dim2 > 0 then
            raise Program_Error with "Wrong dimension #2";
         end if;
         case d.atype is
            when DT_Bool =>
               pv := new T_ArrayBoolean(d.dim1);
            when DT_Int =>
               pv := new T_ArrayInteger(d.dim1);
            when DT_Float =>
               pv := new T_ArrayFloat(d.dim1);
            when others =>
               raise Program_Error with "Unsupported data type";
         end case;
      else
         case d.atype is
            when DT_Bool =>
               pv := new T_Boolean;
            when DT_Int =>
               pv := new T_Integer;
            when DT_Float =>
               pv := new T_Float;
            when others =>
               raise Program_Error with "Unsupported data type";
         end case;
      end if;

      return pv;
   end newValue;


   ----------
   -- copy --
   ----------

   -- the explicit type check is not implementing

   procedure copy(vt : in out T_Boolean; vs : in P_Value) is
   begin
      vt.v := T_Boolean(vs.all).v;
   end copy;

   procedure copy(vt : in out T_Integer; vs : in P_Value) is
   begin
      vt.v := T_Integer(vs.all).v;
   end copy;

   procedure copy(vt : in out T_Float; vs : in P_Value) is
   begin
      vt.v := T_Float(vs.all).v;
   end copy;

   procedure copy(vt : in out T_ArrayBoolean; vs : in P_Value) is
   begin
      vt.a := T_ArrayBoolean(vs.all).a;
   end copy;

   procedure copy(vt : in out T_ArrayInteger; vs : in P_Value) is
   begin
      vt.a := T_ArrayInteger(vs.all).a;
   end copy;

   procedure copy(vt : in out T_ArrayFloat; vs : in P_Value) is
   begin
      vt.a := T_ArrayFloat(vs.all).a;
   end copy;

end Ay;
