with JE.Lists; 

with Ay.Block.Registry; use Ay.Block.Registry;

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
   
   ----
   
   function getInputConnId(bc : in T_CBlockBuilder; idx : Positive ) return Integer;
   
   function getOutputConnId(bc : in T_CBlockBuilder; idx : Positive ) return Integer;
   
   function getStaticConnId(bc : in T_CBlockBuilder; idx : Positive ) return Integer;
     
private   
   
   type T_CBlockFactory is 
     new Ay.Block.Factory.T_BlockFactory with record
      prototype : P_CBlock;
   end record;   
     
   package VarRegistry is new JE.Lists(Item_Type => T_DataType);
      
   type T_CBlockBuilder is 
     new Ay.Block.Factory.T_BlockFactory with record
      reg : P_BlockRegistry;
      ivar : VarRegistry.List_Iterator;
      ovar : VarRegistry.List_Iterator;
      svar : VarRegistry.List_Iterator;
      newBlock : P_CBlock;
   end record;
   
end Ay.Block.CBFactory;
