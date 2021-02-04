with Ay.Lists; 
with Ay.Block.Registry; use Ay.Block.Registry;

with Ada.Containers.Vectors;
with Ada.Containers.Ordered_Maps;
use Ada.Containers;

package Ay.Block.CBFactory is

   type P_CBlock is access all T_CBlock;
   
   type T_CBlockFactory is 
     new Ay.Block.Factory.T_BlockFactory with private;
         
   procedure doNewBlock(bc : in out T_CBlockFactory; b : out P_Block);
   
   procedure init(bc : in out T_CBlockFactory; b : in P_CBlock);
   
   ---------------------------------------------------------------------------
   
   type T_CBlockBuilder is private;
   
   procedure init(bc : in out T_CBlockBuilder; reg : in P_BlockRegistry);
   
   ----
   
   procedure beginVars(bc : in out T_CBlockBuilder);
      
   procedure addInput(bc : in out T_CBlockBuilder; dt : in T_DataType);
   
   procedure addOutput(bc : in out T_CBlockBuilder; dt : in T_DataType);
   
   procedure addStatic(bc : in out T_CBlockBuilder; dt : in T_DataType);
   
   procedure endVars(bc : in out T_CBlockBuilder);
   
   ----
   
   procedure beginCode(bc : in out T_CBlockBuilder);
   
   procedure addBlock(bc : in out T_CBlockBuilder; 
                      bcid : in Integer; 
                      res : out Integer);
   
   
   procedure connectIn(bc : in out T_CBlockBuilder; 
                       pin : in Positive;
                       connId : in Integer;
                       res : out Integer);
   
   procedure connectOut(bc : in out T_CBlockBuilder; 
                        pin : in Positive;
                        connId : in Integer;
                        res : out Integer);
   
   procedure endCode(bc : in out T_CBlockBuilder); 
   
   ----
   
   procedure validate(bc : in out T_CBlockBuilder; res : out Integer);
   
   procedure finish(bc : in out T_CBlockBuilder; b : out P_CBlock);
  
     
private   
   
   type T_CBlockFactory is 
     new Ay.Block.Factory.T_BlockFactory with record
      prototype : P_CBlock;
   end record;   
     
   package Variables is new Ay.Lists(Item_Type => P_Value);   
   
   type P_Variables is access all Variables.List_Type;   
   
   type T_Connector is record
      block : P_Block;
      pin : Natural;
   end record;
   
   package Connectors is new Ay.Lists(Item_Type => T_Connector);
   
   type P_ConnList is access all Connectors.List_Type;  
   
   type T_Connection is record
      source : T_Connector;
      sinks : P_ConnList;
   end record;

   package Connections is 
     new Ada.Containers.Ordered_Maps(Key_Type => Integer,
                                     Element_Type => T_Connection);
   
   type T_CBlockBuilder is tagged record
      ivar : P_Variables; -- list of input variables
      ovar : P_Variables; -- list of output variables
      svar : P_Variables; -- list of static varibales
      ivit : Variables.List_Iterator; 
      ovit : Variables.List_Iterator;
      svit : Variables.List_Iterator;
      conn : Connections.Map;
      reg : P_BlockRegistry; -- block's registry     
      newBlock : P_CBlock; -- creating block
      actBlock : P_Block; -- an actual inserted block
      state : Integer;
   end record;
   
end Ay.Block.CBFactory;
