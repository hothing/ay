with JE.Lists; 

package Ay.Block.Registry is

   type T_BlockRegistry is limited private;
   type P_BlockRegistry is access T_BlockRegistry;
      
   procedure reset(r: in out T_BlockRegistry);
   
   procedure newRecord(r: in out T_BlockRegistry; 
                       uid : Integer;
                       bf : Ay.Block.Factory.P_BlockFactory;
                       res : out Boolean);
   
   function exist(r : in T_BlockRegistry; uid : Integer) return Boolean;
   
   function getBlockFactory(r : in T_BlockRegistry; uid : Integer) 
                            return Ay.Block.Factory.P_BlockFactory;
   
private
   
   type T_BlockRegistryRecord is record
      uid : Integer;
      bfactory : Ay.Block.Factory.P_BlockFactory;      
   end record;
   
   package BList is new JE.Lists(Item_Type => T_BlockRegistryRecord);
      
   type T_BlockRegistry is record
      reg : BList.List_Type;
   end record;
   

end Ay.Block.Registry;
