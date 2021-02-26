package Ay.Connector is

   type T_Connector(stype : T_Signal_Type := DT_Unknown) is private;
   
   type P_Connector is access all T_Connector;
   
   --the procedure initializes the connection
   procedure init (c : in out T_Connector);
      
   -- the function gets the boolean variable for connection
   -- the function can be used only after using the 'init' procedure 
   function get (c : in T_Connector) return P_Boolean;
   
   function get (c : in T_Connector) return P_Integer;
   
   function get (c : in T_Connector) return P_Float;   
   
   function get (c : in T_Connector) return P_LongFloat;   
      
private
     
   type T_Connector(stype : T_Signal_Type := DT_Unknown) is record
      case stype is
         when DT_Bool => pb : P_Boolean;
         when DT_Int => pi : P_Integer;
         when DT_Float => pf : P_Float;
         when DT_LongFloat => plf : P_LongFloat;
         when others => null;
      end case;      
   end record;
   
end Ay.Connector;
