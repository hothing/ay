with Ay.Memory; use Ay.Memory;
with Ay.Lists; 

package Ay.Block is
    
   ---------------------------------------------------------------------------
   
   type T_BlockState is (Block_Wait, Block_Run, Block_Failed);
   
   type T_Block (In_Size, Out_Size, Static_Size : Natural) is 
     abstract tagged limited private;

   type P_Block is access all T_Block'Class;
  
  
   -- The method 'Init' initializes the block 
   procedure init (b : in out T_Block'Class; res : out Boolean);
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_Block'Class; res : out Boolean);
   
   -- The method 'Final' releases the block resources
   procedure finalize(b : in out T_Block'Class);
   
   
   ---------------------------------------------------------------------------
   
   -- The method 'Init' initializes the block 
   procedure doInit (b : in out T_Block; res : out Boolean);
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_Block; res : out Boolean); 
   
   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_Block);
      
   ---------------------------------------------------------------------------
  
   type T_CBlock is new T_Block with private;
   
   -- this kind of block is using by interpreter internally
     
   type T_SpecialBlock is abstract new T_Block with private; 
   
   type T_XBlockSection(Size : Natural) is private;
   
   procedure preCalc (b : in out T_SpecialBlock'Class; 
                      isec: in out T_XBlockSection;
                      osec: in out T_XBlockSection;
                      ssec: in out T_XBlockSection
                     );
   
   procedure postCalc (b : in out T_SpecialBlock'Class; 
                       isec: in out T_XBlockSection;
                       osec: in out T_XBlockSection;
                       ssec: in out T_XBlockSection
                      );
   
   procedure pre (b : in out T_SpecialBlock; 
                  isec: in out T_XBlockSection;
                  osec: in out T_XBlockSection;
                  ssec: in out T_XBlockSection
                 );
   
   procedure post (b : in out T_SpecialBlock; 
                   isec: in out T_XBlockSection;
                   osec: in out T_XBlockSection;
                   ssec: in out T_XBlockSection
                  );
   
   ---------------------------------------------------------------------------
   
   type T_MetaBlock is abstract tagged private;

   type P_MetaBlock is access all T_MetaBlock'Class;
   
   function getInputCount(mb : in T_MetaBlock) return Natural;
   
   function getOutputCount(mb : in T_MetaBlock) return Natural;
   
   function getStaticCount(mb : in T_MetaBlock) return Natural;
   
   function getInputType(mb : in T_MetaBlock; idx : Positive) return T_DataType;
   
   function getOutputType(mb : in T_MetaBlock; idx : Positive) return T_DataType;
   
   function getStaticType(mb : in T_MetaBlock; idx : Positive) return T_DataType;
   
   procedure makeInstance(mb : in T_MetaBlock; b : out P_Block);
     
   ---------------------------------------------------------------------------
   
   package BuildIn is
      -- The methods to access the instance variables internally
     
      -- Input access
      
      function getIn(b : in T_Block'Class; idx : Positive) return Boolean;
   
      function getIn(b : in T_Block'Class; idx : Positive) return Integer;
   
      function getIn(b : in T_Block'Class; idx : Positive) return Float;
   
      function getIn(b : in T_Block'Class; idx : Positive) return Long_Float;
      
      -- Output access
   
      procedure setOut(b : in T_Block'Class; idx : Positive; val : Boolean);
   
      procedure setOut(b : in T_Block'Class; idx : Positive; val : Integer);
   
      procedure setOut(b : in T_Block'Class; idx : Positive; val : Float);
   
      procedure setOut(b : in T_Block'Class; idx : Positive; val : Long_Float);
      
      --  Static access
      
      function get(b : in T_Block'Class; idx : Positive) return Boolean;
   
      function get(b : in T_Block'Class; idx : Positive) return Integer;
   
      function get(b : in T_Block'Class; idx : Positive) return Float;
   
      function get(b : in T_Block'Class; idx : Positive) return Long_Float;
      
      procedure set(b : in T_Block'Class; idx : Positive; val : Boolean);
   
      procedure set(b : in T_Block'Class; idx : Positive; val : Integer);
   
      procedure set(b : in T_Block'Class; idx : Positive; val : Float);
   
      procedure set(b : in T_Block'Class; idx : Positive; val : Long_Float);
      
   end BuildIn;     
   
   ---------------------------------------------------------------------------
   package Boot is
      
      -- A function 'bindInput' binds the input of block with 
      -- output of another block.
      -- The mode of the instance variable must be 'Var_Input' or 'Var_InOut'. 
      -- Otherwise the function do nothing and return 'False' value.
      procedure bind(bsrc : in out T_Block'Class; 
                     idxs: Positive;
                     btgt : in out T_Block'Class; 
                     idxt: Positive;                                  
                     res : out Integer);  
            
      function boundIn(b : in T_Block'Class; idx : Positive) return Boolean;
      
      function boundOut(b : in T_Block'Class; idx : Positive) return Boolean;
      
   end Boot;
   
   ---------------------------------------------------------------------------
      
   package Factory is
      
      type T_BlockFactory is abstract tagged limited null record;

      type P_BlockFactory is access T_BlockFactory'Class;

      procedure newBlock(bc : in out T_BlockFactory'Class; b : out P_Block);
      procedure doNewBlock(bc : in out T_BlockFactory; b : out P_Block);

      function isBuildIn(bc : in T_BlockFactory'Class) return Boolean;
   
   end Factory;
   
private
   
   type T_VarBind is record
      v     : P_Value;
      bound : Boolean;
      -- FIXME: bound must be replaced by CID : Integer;
      -- this can help to handle the connections
   end record;
     
   type T_VarArea is array (Positive range <>) of T_VarBind;   
      
   type T_XBlockSection(Size : Natural) is record
      case Size is
         when 0 => null;
         when others => elem : T_VarArea (1 .. Size);
      end case;
   end record;  
   
   type T_Block (In_Size, Out_Size, Static_Size : Natural) is 
     abstract tagged limited 
      record
         inp  : T_XBlockSection(In_Size); -- input's
         outp : T_XBlockSection(Out_Size); -- output's
         stat : T_XBlockSection(Static_Size); -- internal/static variables
         meta : P_MetaBlock;
      end record; 
     
   type T_SpecialBlock is abstract new T_Block with null record; 
   -- T_SpecialBlock is block type which is using internally by interpreter
   -- for access the IN/OUT/STAT variables
   
   package BlockChain is new Ay.Lists(Item_Type => P_Block);
      
   type P_BlockChain is access BlockChain.List_Type;
   
   type T_CBlock is new T_Block with record
      schain : P_BlockChain; -- special block chain
      bchain : P_BlockChain; -- user block execution chain
   end record;
   procedure doCalc (b : in out T_CBlock; res : out Boolean);
   
   type T_MetaBlock is abstract tagged null record;
  
end Ay.Block;
