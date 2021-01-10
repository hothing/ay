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

end Ay.Memory;
