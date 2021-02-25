package Ay.Block.Logical.Fn is
   
   type T_Not is new T_Block with private;

  -- The method 'Init' initializes the block 
   procedure init (b : in out T_Not; res : out Boolean) ;
   
   -- The method 'Reset' resets the block variables to the initial values
   procedure reset (b : in out T_Not) ;
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_Not; res : out Boolean) ; 
   
   -- The method 'Final' releases the block resources
   procedure final (b : in out T_Not) ;
   
   -- The method 'connect' make a connection with output
   procedure connect_Output(b : in out T_Not; 
                            pin : in T_Pin_Index; 
                            cp : in T_Connector;
                            stub : in Boolean
                           ) ;
   
   -- The method 'connect' make a connection with input
   procedure connect_Input(b : in out T_Not; 
                           pin : in T_Pin_Index; 
                           cp : in T_Connector;
                           stub : in Boolean
                          ) ;
   
   -- The function indicates an connection with another block output
   function is_In_Connected (b : in T_Not;
                              pin : T_Pin_Index) return Boolean ;
   
   function is_Out_Connected (b : in T_Not;
                              pin : T_Pin_Index) return Boolean ; 
   
   type T_And is new T_Block with private;

  -- The method 'Init' initializes the block 
   procedure init (b : in out T_And; res : out Boolean) ;
   
   -- The method 'Reset' resets the block variables to the initial values
   procedure reset (b : in out T_And) ;
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_And; res : out Boolean) ; 
   
   -- The method 'Final' releases the block resources
   procedure final (b : in out T_And) ;
   
   -- The method 'connect' make a connection with output
   procedure connect_Output(b : in out T_And; 
                            pin : in T_Pin_Index; 
                            cp : in T_Connector;
                            stub : in Boolean
                           ) ;
   
   -- The method 'connect' make a connection with input
   procedure connect_Input(b : in out T_And; 
                           pin : in T_Pin_Index; 
                           cp : in T_Connector;
                           stub : in Boolean
                          ) ;
   
   -- The function indicates an connection with another block output
   function is_In_Connected (b : in T_And;
                              pin : T_Pin_Index) return Boolean ;
   
   function is_Out_Connected (b : in T_And;
                              pin : T_Pin_Index) return Boolean ; 
   
   type T_Or is new T_And with private;
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_Or; res : out Boolean) ; 
   
   type T_Xor is new T_And with private;
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_Xor; res : out Boolean) ; 
   
private
   
   type T_Bool_Plug (on : Boolean := False) is record      
      v : P_Boolean;
   end record;
   
   type T_Not is new T_Block with record
      in1 : T_Bool_Plug;
      out1 : T_Bool_Plug;
   end record;
      
   type T_And is new T_Block with record
      in1 : T_Bool_Plug;
      in2 : T_Bool_Plug;
      out1 : T_Bool_Plug;
   end record; 

   type T_Or is new T_And with null record;
   
   type T_Xor is new T_And with null record;
   
end Ay.Block.Logical.Fn;
