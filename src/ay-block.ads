with Ay.Memory; use Ay.Memory;

package Ay.Block is
   
   type T_BlockState is (Block_Wait, Block_Run, Block_Failed);
   
   type T_Block (In_Size, Out_Size, Static_Size : Positive) is 
     tagged limited private;

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
   
   --function hasBind(b : in T_Block'Class; idx : Positive) return Boolean;
   
   package Factory is
      
      type T_BlockFactory is abstract tagged null record;

      type P_BlockFactory is access T_BlockFactory;

      procedure newBlock(bc : in out T_BlockFactory'Class; b : out P_Block);
      procedure doNewBlock(bc : in out T_BlockFactory; b : out P_Block);

      function isBuildIn(bc : in T_BlockFactory'Class) return Boolean;

      
   end Factory;
   
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
   
   type T_BlockChain;
   type P_BlockChain is access all T_BlockChain;
   type T_BlockChain is record
      next : P_BlockChain;
      block : P_Block;
   end record;
   
   type T_ComplexBlock is new T_Block with private;
   
private
   
   type T_VarBind is record
      v     : P_Value;
      bound : Boolean;
   end record;
     
   type T_VarArea is array (Positive range <>) of T_VarBind;
   
   type T_Block (In_Size, Out_Size, Static_Size : Positive) is tagged limited 
   record
      inp  : T_VarArea (1 .. In_Size);
      outp : T_VarArea (1 .. Out_Size);
      stat : T_VarArea (1 .. Static_Size);
   end record;
       
   type T_CBlockIterpreter (In_Size, Out_Size, Static_Size : Positive) is 
   tagged record
      -- the shadow I/O is using to statically bind the block in the chain
      shadow_inp  : T_VarArea (1 .. In_Size);
      shadow_out : T_VarArea (1 .. Out_Size);
      shadow_stat : T_VarArea (1 .. Static_Size);
      -- the user program as block chain
      bchain : P_BlockChain; -- user block execution chain
   end record;
   type P_CBlockIterpreter is access T_CBlockIterpreter;
   
   procedure execute(ix : in out T_CBlockIterpreter; res : out Boolean);
   
   type T_ComplexBlock is new T_Block with record
      prog : P_CBlockIterpreter; -- user block interpreter
   end record;
   procedure doCalc (b : in out T_ComplexBlock; res : out Boolean);
   
   
end Ay.Block;
