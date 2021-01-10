with Ay.Memory; use Ay.Memory;

package Ay.Block is
   
   type T_BlockState is (Block_Wait, Block_Run, Block_Failed);
   
   type T_Block (In_Size, Out_Size, Static_Size : Natural) is 
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
  
   type T_CBlock is new T_Block with private;
   
   -- this kind of block is using by interpreter internally
   
   type T_XBlockSection(Size : Natural) is private;
   
   type T_SpecialBlock is new T_Block with private; 
   
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
      
      type T_BlockFactory is abstract tagged null record;

      type P_BlockFactory is access T_BlockFactory;

      procedure newBlock(bc : in out T_BlockFactory'Class; b : out P_Block);
      procedure doNewBlock(bc : in out T_BlockFactory; b : out P_Block);

      function isBuildIn(bc : in T_BlockFactory'Class) return Boolean;
   
   end Factory;
   
private
   
   type T_VarBind is record
      v     : P_Value;
      bound : Boolean;
   end record;
     
   type T_VarArea is array (Positive range <>) of T_VarBind;   
      
   type T_XBlockSection(Size : Natural) is record
      case Size is
         when 0 => null;
         when others => elem : T_VarArea (1 .. Size);
      end case;
   end record;  
   
   type T_Block (In_Size, Out_Size, Static_Size : Natural) is tagged limited 
      record
         inp : T_XBlockSection(In_Size);
         outp : T_XBlockSection(Out_Size);
         stat : T_XBlockSection(Static_Size);         
      end record; 
   
   type T_BlockChain;
   type P_BlockChain is access all T_BlockChain;
   type T_BlockChain is record
      next : P_BlockChain;
      block : P_Block;
   end record;
   
   type T_SpecialBlock is new T_Block with null record; 
   type P_SpecialBlock is access all T_SpecialBlock;   
   
   type T_SBlockChain;
   type P_SBlockChain is access all T_SBlockChain;
   type T_SBlockChain is record
      next : P_SBlockChain;
      block : P_SpecialBlock;
   end record;
      
   type T_CBlock is new T_Block with record
      schain : P_SBlockChain; -- special block chain
      bchain : P_BlockChain; -- user block execution chain
   end record;
   procedure doCalc (b : in out T_CBlock; res : out Boolean);

   
   type T_CBlockIterpreter is 
     tagged record
      schain : P_BlockChain; -- special block chain
      bchain : P_BlockChain; -- user block execution chain
   end record;
   
end Ay.Block;
