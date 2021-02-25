with Ay.Lists; 
with Ay.Connector; use Ay.Connector;

package Ay.Block is
   
   subtype T_Pin_Count is Natural range 0 .. 255;
   subtype T_Pin_Index is T_Pin_Count range 1 .. 255;
   
   ---------------------------------------------------------------------------
   
   type T_Meta_Info;

   type P_Meta_Info is access T_Meta_Info'Class;  
   
   ---------------------------------------------------------------------------
      
   type T_Block is abstract tagged limited private;

   type P_Block is access all T_Block'Class;
  
   -- The method gets an meta information descriptor
   function get_Meta(b : in T_Block) return P_Meta_Info;
   
   
   -- The method 'Init' initializes the block 
   procedure init (b : in out T_Block; res : out Boolean) is abstract;
   
   -- The method 'Reset' resets the block variables to the initial values
   procedure reset (b : in out T_Block) is abstract;
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_Block; res : out Boolean) is abstract; 
   
   -- The method 'Final' releases the block resources
   procedure final (b : in out T_Block) is abstract;
   
   -- The method 'connect' make a connection with output
   procedure connect_Output(b : in out T_Block; 
                            pin : in T_Pin_Index; -- block pin                         
                            cp : in T_Connector; -- connection point
                            stub : in Boolean -- do not mark as connected
                           ) is abstract;
   
   -- The method 'connect' make a connection with input
   procedure connect_Input(b : in out T_Block; 
                           pin : in T_Pin_Index; -- block pin 
                           cp : in T_Connector; -- connection point
                           stub : in Boolean -- do not mark as connected
                          ) is abstract;
   
   
   -- The function indicates an connection with another block output
   function is_In_Connected (b : in T_Block;
                              pin : T_Pin_Index) return Boolean is abstract;
   
   function is_Out_Connected (b : in T_Block;
                               pin : T_Pin_Index) return Boolean is abstract;
   
   ---------------------------------------------------------------------------
   
   type T_Meta_Info is abstract tagged null record;  
   
   -- The function indicates the block has the internal variables/state
   function is_Static(mb : in T_Meta_Info) return Boolean is abstract;
      
   function get_Input_Count(mb : in T_Meta_Info) return T_Pin_Count is abstract;
   
   function get_Output_Count(mb : in T_Meta_Info) return T_Pin_Count is abstract;
      
   function get_Input_Type(mb : in T_Meta_Info; pin : T_Pin_Index) return T_Signal_Type is abstract;
   
   function get_Output_Type(mb : in T_Meta_Info; pin : T_Pin_Index) return T_Signal_Type is abstract;
      
   procedure new_Instance(mb : in T_Meta_Info; b : out P_Block) is abstract;
   
   procedure make_Instance(mb : in P_Meta_Info; b : out P_Block);
   
private
    
   type T_Block is abstract tagged limited record
      meta : P_Meta_Info;
   end record;  
     
end Ay.Block;
