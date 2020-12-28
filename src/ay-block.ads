with Interfaces; use Interfaces;
with Ay.Memory; use Ay.Memory;

package Ay.Block is

   type T_BlockState is (Block_Wait, Block_Run, Block_Failed);
   
   type T_VariableAccess is (Var_Static, Var_InOut, Var_Input, Var_Output);

   type T_VarAccessArray is array (Positive range <>) of T_VariableAccess;
   
   type T_Block (Size : Positive) is tagged limited private;

   type P_Block is access all T_Block'Class;
   
   type T_BlockChain;
   type P_BlockChain is access all T_BlockChain;
   type T_BlockChain is record
      next : P_BlockChain;
      block : P_Block;
   end record;
  
   -- The method 'Init' initializes the block 
   procedure Init (b : in out T_Block'Class; res : out Boolean);
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure Calc (b : in out T_Block'Class; res : out Boolean);
   
   -- The method 'Final' releases the block resources
   procedure Final(b : in out T_Block'Class);
   
   ---------------------------------------------------------------------------
   package Boot is
      procedure NewBool(b : in out T_Block'Class; idx : Positive; vacc : T_VariableAccess);
      procedure NewInt(b : in out T_Block'Class; idx : Positive; vacc : T_VariableAccess);
      procedure NewFloat(b : in out T_Block'Class; idx : Positive; vacc : T_VariableAccess);
      procedure NewLFloat(b : in out T_Block'Class; idx : Positive; vacc : T_VariableAccess); 
      
      -- A function 'bindInput' binds the input of block with output of another block 
      -- The mode of the instance variablemust be 'Var_Input' or 'Var_InOut'. 
      -- Otherwise the function do nothing and return 'False' value
      procedure bindInput(b : in out T_Block'Class; 
                            idx: Positive;
                            outVar : P_Value;                            
                          res : out Boolean);
   
      -- A function 'getOutput' returns a reference to the output in global memory
      function getOutput(b : in T_Block'Class; 
                      idx: Positive
                     ) return P_Value; 
   end Boot;
   ---------------------------------------------------------------------------
   
   -- The methods to access instance variable
   function GetBool(b : in T_Block'Class; idx : Positive) return Boolean;
   
   function GetInt(b : in T_Block'Class; idx : Positive) return Integer;
      
   function GetFloat(b : in T_Block'Class; idx : Positive) return Float;
   
   function GetLFloat(b : in T_Block'Class; idx : Positive) return Long_Float;
   
   procedure SetBool(b : in out T_Block'Class; idx : Positive; val : Boolean);
   
   procedure SetInt(b : in out T_Block'Class; idx : Positive; val : Integer);
   
   procedure SetFloat(b : in out T_Block'Class; idx : Positive; val : Float);
   
   procedure SetLFloat(b : in out T_Block'Class; idx : Positive; val : Long_Float);
   
   ---------------------------------------------------------------------------
   
   -- The method 'Init' initializes the block 
   procedure doInit (b : in out T_Block; res : out Boolean);
   
   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure doCalc (b : in out T_Block; res : out Boolean); 
   
   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_Block);
      
   
private
   
   type T_Block (Size : Positive) is tagged limited record
      vacc : T_VarAccessArray (1 .. size);
      vars : T_ReferenceMemory (1 .. size);
   end record;
     
end Ay.Block;
