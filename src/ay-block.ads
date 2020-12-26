with Interfaces; use Interfaces;
with Ay.Memory; use Ay.Memory;

package Ay.Block is

   type T_BlockState is (Block_Wait, Block_Run, Block_Failed);
   
   type T_VariableAccess is (Var_Static, Var_InOut, Var_Input, Var_Output);

   type T_VarAccessArray is array (Positive range <>) of T_VariableAccess;
   
   type T_Block (Size : Positive) is tagged record
      dataref : P_ReferenceMemory(1 .. Size);
      dface : T_VarAccessArray(1 .. Size); 
   end record;

   type P_Block is access all T_Block'Class;
   
   type T_BlockChain;
   type P_BlockChain is access all T_BlockChain;
   type T_BlockChain is record
      next : P_BlockChain;
      block : P_Block;
   end record;

   -- A function 'fixupVar' checks the data type of an instance variable 
   -- and set up the access mode and binds variable to the cell in global memory
   function fixupVar(mem : P_MemoryBlock;
                     offset : Positive;
                     b : in T_Block'Class; 
                     idx: Positive;
                     dt : T_DataType;
                     acc : T_VariableAccess                     
                     ) return Boolean;

   -- A function 'bindInputVar' binds the output of another block or global variable
   -- with instance variable
   -- The mode of the instance variablemust be 'Var_Input' or 'Var_InOut'. 
   -- Otherwise the function do nothing and return 'False' value
   
   function bindInputVar(outVar : P_Value;
                         b : in T_Block'Class; 
                         idx: Positive
                        ) return Boolean;
   
   -- A function 'getOutput' returns a reference to the output in global memory
   function getOut(dummy : integer;
                   b : in T_Block'Class; 
                   idx: Positive
                  ) return P_Value;
   
   -- The method 'Init' initializes the block 
   function Init(b : in T_Block'Class) return Boolean;

   -- The method 'Calc[ulate]' implements the function (subprogram)
   function Calc (b : in T_Block'Class) return Boolean;
   
   ---------------------------------------------------------------------------
   
   -- The methods to access instance variable
   function GetBool(b : in T_Block'Class; idx : Positive) return Boolean;
   
   function GetInt(b : in T_Block'Class; idx : Positive) return Integer;
   
   --function GetWord(b : in T_Block; idx : Positive) return Unsigned_32;
   
   function GetFloat(b : in T_Block'Class; idx : Positive) return Float;
   
   function GetLFloat(b : in T_Block'Class; idx : Positive) return Long_Float;
   
   procedure SetBool(b : in T_Block'Class; idx : Positive; val : Boolean);
   
   procedure SetInt(b : in T_Block'Class; idx : Positive; val : Integer);
   
   procedure SetFloat(b : in T_Block'Class; idx : Positive; val : Float);
   
   procedure SetLFloat(b : in T_Block'Class; idx : Positive; val : Long_Float);
   
   ---------------------------------------------------------------------------
   
   -- The method 'Init' initializes the block 
   function doInit(b : in T_Block) return Boolean;
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   function doCalc (b : in T_Block) return Boolean; 
  
end Ay.Block;
