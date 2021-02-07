with Ay.Lists; 

package Ay.Block is
   
   subtype T_PinIndex is Natural range 1 .. 255;

   ---------------------------------------------------------------------------
   
   
   type T_Block is abstract tagged limited private;

   type P_Block is access all T_Block'Class;
  
   ---------------------------------------------------------------------------
   
   -- The method 'Init' initializes the block 
   procedure init (b : in out T_Block; res : out Boolean) is abstract;
   
   -- The method 'Reset' resets the block variables to the initial values
   procedure reset (b : in out T_Block) is abstract;
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_Block; res : out Boolean) is abstract; 
   
   -- The method 'Final' releases the block resources
   procedure final (b : in out T_Block) is abstract;
   
   -- The method 'connect' make a connection with input
   procedure connect(b : in out T_Block; idx : in T_PinIndex; p : in P_Value) is abstract;
   
   -- The method 'pull' gets the reference to output
   procedure pull(b : in out T_Block; idx : in T_PinIndex; p : out P_Value) is abstract;
   
   ---------------------------------------------------------------------------
      
   type T_InstantingBlock is abstract limited new T_Block with private;
   
   -- NB: this type must be used for all calculated buil-in blocks!
   
   type P_InstantingBlock is access all T_InstantingBlock'Class;
   
   ---------------------------------------------------------------------------
  
   type T_CBlock(In_Size, Out_Size, Static_Size : Natural) is new T_Block with private;
   
   procedure init (b : in out T_CBlock; res : out Boolean);
   
   procedure reset (b : in out T_CBlock);
   
   procedure calc (b : in out T_CBlock; res : out Boolean);
   
   procedure final (b : in out T_CBlock);
   
   procedure connect(b : in out T_CBlock; idx : in T_PinIndex; p : in P_Value);
   
   procedure pull(b : in out T_CBlock; idx : in T_PinIndex; p : out P_Value);
   
   ---------------------------------------------------------------------------
   
   type T_MetaBlock is abstract tagged private;

   type P_MetaBlock is access T_MetaBlock'Class;
   
   function isBuildIn(mb : in T_MetaBlock) return Boolean is abstract;
   
   function getInputCount(mb : in T_MetaBlock) return Natural is abstract;
   
   function getOutputCount(mb : in T_MetaBlock) return Natural is abstract;
   
   function getStaticCount(mb : in T_MetaBlock) return Natural is abstract;
   
   function getInputType(mb : in T_MetaBlock; idx : T_PinIndex) return T_DataType is abstract;
   
   function getOutputType(mb : in T_MetaBlock; idx : T_PinIndex) return T_DataType is abstract;
   
   function getStaticType(mb : in T_MetaBlock; idx : T_PinIndex) return T_DataType is abstract;
   
   procedure newInstance(mb : in T_MetaBlock; b : out P_InstantingBlock) is abstract;
   
   procedure makeInstance(mb : in P_MetaBlock; b : out P_InstantingBlock);
   
   ---------------------------------------------------------------------------
   package Boot is
      
      -- A function 'bind' binds the input of block with 
      -- output of another block.
      
      procedure bind(bsrc : in out T_InstantingBlock'Class; 
                     idxs: T_PinIndex;
                     btgt : in out T_InstantingBlock'Class; 
                     idxt: T_PinIndex;                                  
                     res : out Boolean);           
      
      procedure fixupInputs (b : in out T_CBlock'Class);   
      
      procedure fixupOutputs (b : in out T_CBlock'Class);
      
      procedure fixupStatic (b : in out T_CBlock'Class);
      
   end Boot;
     
private
   
   type T_Variable is record
      v     : P_Value; -- reference to a value
      cid   : Integer; -- Connection Identity
            -- this can help to handle the connections
   end record;
     
   type T_VarArea is array (Positive range <>) of T_Variable;   
      
   type T_VarSection(Size : Natural) is record
      case Size is
         when 0 => null;
         when others => elem : T_VarArea (1 .. Size);
      end case;
   end record;  
   
   type T_Block is abstract tagged limited  null record; 
     
   type T_InstantingBlock is abstract limited new T_Block with record
         meta : P_MetaBlock;
   end record;
      
   ---------------------------------------------------------------------------
   
   package BlockChain is new Ay.Lists(Item_Type => P_InstantingBlock);
      
   type P_BlockChain is access BlockChain.List_Type;
      
   type T_CBlockCode(In_Size, Out_Size, Static_Size : Natural) is 
     new T_Block with record
      inp  : T_VarSection(In_Size); -- input's
      outp : T_VarSection(Out_Size); -- output's
      stat : T_VarSection(Static_Size); -- internal/static variables
      bchain : BlockChain.List_Iterator; -- user block execution chain
   end record;
      
   type P_CBlockCode is access T_CBlockCode;
   
   procedure init (b : in out T_CBlockCode; res : out Boolean);
   
   procedure reset (b : in out T_CBlockCode);
   
   procedure calc (b : in out T_CBlockCode; res : out Boolean);
   
   procedure final (b : in out T_CBlockCode);
   
   procedure connect(b : in out T_CBlockCode; idx : in T_PinIndex; p : in P_Value);
   
   procedure pull(b : in out T_CBlockCode; idx : in T_PinIndex; p : out P_Value);
   
   type T_CBlock(In_Size, Out_Size, Static_Size : Natural) is 
     new T_InstantingBlock with record
      inp  : T_VarSection(In_Size); -- input's
      outp : T_VarSection(Out_Size); -- output's
      stat : T_VarSection(Static_Size); -- internal/static variables
      bcode : P_CBlockCode; -- user block code
   end record;
      
   type T_MetaBlock is abstract tagged null record;
  
end Ay.Block;
