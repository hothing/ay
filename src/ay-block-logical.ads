package Ay.Block.Logical is
   
   type T_Not_Meta is new T_Meta_Info with private;  
   
   -- The function indicates the block has the internal variables/state
   function is_Static(mb : in T_Not_Meta) return Boolean ;
      
   function get_Input_Count(mb : in T_Not_Meta) return T_Pin_Count;
   
   function get_Output_Count(mb : in T_Not_Meta) return T_Pin_Count;
      
   function get_Input_Type(mb : in T_Not_Meta; pin : T_Pin_Index) return T_Signal_Type ;
   
   function get_Output_Type(mb : in T_Not_Meta; pin : T_Pin_Index) return T_Signal_Type ;
      
   procedure new_Instance(mb : in T_Not_Meta; b : out P_Block) ;
   
   
   type T_And_Meta is new T_Meta_Info with private;  
   
   -- The function indicates the block has the internal variables/state
   function is_Static(mb : in T_And_Meta) return Boolean ;
      
   function get_Input_Count(mb : in T_And_Meta) return T_Pin_Count;
   
   function get_Output_Count(mb : in T_And_Meta) return T_Pin_Count;
      
   function get_Input_Type(mb : in T_And_Meta; pin : T_Pin_Index) return T_Signal_Type ;
   
   function get_Output_Type(mb : in T_And_Meta; pin : T_Pin_Index) return T_Signal_Type ;
      
   procedure new_Instance(mb : in T_And_Meta; b : out P_Block) ;
   
   
   type T_Or_Meta is new T_And_Meta with private;
   
   procedure new_Instance(mb : in T_Or_Meta; b : out P_Block) ;
   
   
   type T_Xor_Meta is new T_Or_Meta with private;
   
   procedure new_Instance(mb : in T_Xor_Meta; b : out P_Block) ;
   
private
   
   type T_Not_Meta is new T_Meta_Info with null record; 
   
   type T_And_Meta is new T_Meta_Info with null record; 
   
   type T_Or_Meta is new T_And_Meta with null record;
   
   type T_Xor_Meta is new T_Or_Meta with null record;
   
end Ay.Block.Logical;
