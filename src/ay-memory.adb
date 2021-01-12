package body Ay.Memory is

   -------------
   -- getBool --
   -------------

   function get (v : in P_Value) return Boolean is
   begin
      return v.all.m;
   end get;

   ------------
   -- getInt --
   ------------

   function get (v : in P_Value) return Integer is
   begin
      return v.all.di;
   end get;

   --------------
   -- getFloat --
   --------------

   function get (v : in P_Value) return Float is
   begin
      return v.all.fp;
   end get;

   ---------------
   -- getLFloat --
   ---------------

   function get (v : in P_Value) return Long_Float is
   begin
      return v.all.lfp;
   end get;

   -------------
   -- setBool --
   -------------

   procedure set (v : in out P_Value; val : Boolean) is
   begin
      v.all.m := val;
   end set;

   ------------
   -- setInt --
   ------------

   procedure set (v : in out P_Value; val : Integer) is
   begin
      v.all.di := val;
   end set;

   --------------
   -- setFloat --
   --------------

   procedure set (v : in out P_Value; val : Float) is
   begin
      v.all.fp := val;
   end set;

   ---------------
   -- setLFloat --
   ---------------

   procedure set (v : in out P_Value; val : Long_Float) is
   begin
      v.all.lfp := val;
   end set;

   function clone(v : in P_Value) return P_Value is
      nv : P_Value;
   begin
      case v.DataType is
         when DT_Bool =>
            nv := new T_Value(DT_Bool);
            nv.m := v.m;
            nv.m_init := v.m_init;
         when DT_Int =>
            nv := new T_Value(DT_Int);
            nv.di := v.di;
            nv.di_init := v.di_init;
         when DT_Float=>
            nv := new T_Value(DT_Float);
            nv.fp := v.fp;
            nv.fp_init := v.fp_init;
         when DT_LongFloat =>
            nv := new T_Value(DT_LongFloat);
            nv.lfp := v.lfp;
            nv.lfp_init := v.lfp_init;
      end case;
      return nv;
   end clone;

end Ay.Memory;
