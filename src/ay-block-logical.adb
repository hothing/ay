with Ay.Block.Logical.FnNot;
with Ay.Block.Logical.FnAnd;

package body Ay.Block.Logical is

   ---------------
   -- is_Static --
   ---------------

   function is_Static (mb : in T_Not_Meta) return Boolean is
   begin
      return False;
   end is_Static;

   ---------------------
   -- get_Input_Count --
   ---------------------

   function get_Input_Count (mb : in T_Not_Meta) return T_Pin_Count is
   begin
      return 1;
   end get_Input_Count;

   ----------------------
   -- get_Output_Count --
   ----------------------

   function get_Output_Count (mb : in T_Not_Meta) return T_Pin_Count is
   begin
      return 1;
   end get_Output_Count;

   --------------------
   -- get_Input_Type --
   --------------------

   function get_Input_Type
     (mb : in T_Not_Meta;
      pin : T_Pin_Index)
      return T_Signal_Type
   is
   begin
      if pin = 1 then
         return DT_Bool;
      else
         return DT_Unknown;
      end if;
   end get_Input_Type;

   ---------------------
   -- get_Output_Type --
   ---------------------

   function get_Output_Type
     (mb : in T_Not_Meta;
      pin : T_Pin_Index)
      return T_Signal_Type
   is
   begin
      if pin = 1 then
         return DT_Bool;
      else
         return DT_Unknown;
      end if;
   end get_Output_Type;

   ------------------
   -- new_Instance --
   ------------------

   procedure new_Instance (mb : in T_Not_Meta; b : out P_Block) is
   begin
      b := new Ay.Block.Logical.FnNot.T_Not;
   end new_Instance;

   ---------------
   -- is_Static --
   ---------------

   function is_Static (mb : in T_And_Meta) return Boolean is
   begin
      return False;
   end is_Static;

   ---------------------
   -- get_Input_Count --
   ---------------------

   function get_Input_Count (mb : in T_And_Meta) return T_Pin_Count is
   begin
      return 2;
   end get_Input_Count;

   ----------------------
   -- get_Output_Count --
   ----------------------

   function get_Output_Count (mb : in T_And_Meta) return T_Pin_Count is
   begin
      return 1;
   end get_Output_Count;

   --------------------
   -- get_Input_Type --
   --------------------

   function get_Input_Type
     (mb : in T_And_Meta;
      pin : T_Pin_Index)
      return T_Signal_Type
   is
   begin
      if pin = 1 or pin = 2 then
         return DT_Bool;
      else
         return DT_Unknown;
      end if;
   end get_Input_Type;

   ---------------------
   -- get_Output_Type --
   ---------------------

   function get_Output_Type
     (mb : in T_And_Meta;
      pin : T_Pin_Index)
      return T_Signal_Type
   is
   begin
      if pin = 1 then
         return DT_Bool;
      else
         return DT_Unknown;
      end if;
   end get_Output_Type;

   ------------------
   -- new_Instance --
   ------------------

   procedure new_Instance (mb : in T_And_Meta; b : out P_Block) is
   begin
      b := new Ay.Block.Logical.FnAnd.T_And;
   end new_Instance;

   ------------------
   -- new_Instance --
   ------------------

   procedure new_Instance (mb : in T_Or_Meta; b : out P_Block) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "new_Instance unimplemented");
      raise Program_Error with "Unimplemented procedure new_Instance";
   end new_Instance;

   ------------------
   -- new_Instance --
   ------------------

   procedure new_Instance (mb : in T_Xor_Meta; b : out P_Block) is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "new_Instance unimplemented");
      raise Program_Error with "Unimplemented procedure new_Instance";
   end new_Instance;

end Ay.Block.Logical;
