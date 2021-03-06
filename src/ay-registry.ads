with Ay.Lists; 
with Ay.Block; use Ay.Block;

package Ay.Registry is

   type T_BlockRegistry is limited private;
   type P_BlockRegistry is access T_BlockRegistry;
      
   procedure reset(r: in out T_BlockRegistry);
   
   procedure newRecord(r: in out T_BlockRegistry; 
                       uid : Integer;
                       m : Ay.Block.P_Meta_Info;
                       res : out Boolean);
   
   function exist(r : in T_BlockRegistry; uid : Integer) return Boolean;
   
   function getBlockFactory(r : in T_BlockRegistry; uid : Integer) 
                            return Ay.Block.P_Meta_Info;
   
   -- TODO: add newBlockInstance(r : in T_BlockRegistry; uid : Integer; b : out P_InstantingBlock)
   -- and each instancing block will be initiated with meta field 
   procedure newBlockInstance(r : in T_BlockRegistry; uid : Integer; b : out P_Block);
   
private
   
   type T_BlockRegistryRecord is record
      uid : Integer;
      bfactory : Ay.Block.P_Meta_Info;      
   end record;
   
   package BList is new Ay.Lists(Item_Type => T_BlockRegistryRecord);
      
   type T_BlockRegistry is record
      reg : BList.List_Type;
   end record;
   

end Ay.Registry;
