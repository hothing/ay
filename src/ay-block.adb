package body Ay.Block is


   -- A function 'fixupVar' checks the data type of an instance variable
   -- and set up the access mode and binds variable to the cell in global memory
   function fixupVar(mem : P_MemoryBlock;
                     offset : Positive;
                     b : in T_Block'Class;
                     idx: Positive;
                     dt : T_DataType;
                     acc : T_VariableAccess
                    ) return Boolean is
   begin
      return False;
   end;


   -- A function 'bindInputVar' binds the output of another block or global variable
   -- with instance variable
   -- The mode of the instance variablemust be 'Var_Input' or 'Var_InOut'.
   -- Otherwise the function do nothing and return 'False' value

   function bindInputVar(outVar : P_Value;
                         b : in T_Block'Class;
                         idx: Positive
                        ) return Boolean is
   begin
      return False;
   end;

   -- A function 'getOutput' returns a reference to the output in global memory
   function getOut(dummy : integer;
                   b : in T_Block'Class;
                   idx: Positive
                  ) return P_Value is
   begin
      return null;
   end;

   -- The method 'Init' initializes the block
   function Init(b : in T_Block'Class) return Boolean is
   begin
      return doInit(b);
   end;

   -- The method 'Calc[ulate]' implements the function (subprogram)
   function Calc (b : in T_Block'Class) return Boolean is
   begin
      return doCalc(b);
   end;

   ---------------------------------------------------------------------------

   -- The methods to access instance variable
   function GetBool(b : in T_Block'Class; idx : Positive) return Boolean is
   begin
      return b.dataref(idx).m;
   end;

   function GetInt(b : in T_Block'Class; idx : Positive) return Integer is
   begin
      return b.dataref(idx).di;
   end;

   --function GetWord(b : in T_Block; idx : Positive) return Unsigned_32;

   function GetFloat(b : in T_Block'Class; idx : Positive) return Float is
   begin
      return b.dataref(idx).fp;
   end;

   function GetLFloat(b : in T_Block'Class; idx : Positive) return Long_Float is
   begin
      return b.dataref(idx).lfp;
   end;

   procedure SetBool(b : in T_Block'Class; idx : Positive; val : Boolean) is
   begin
      if b.dface(idx) /= Var_Input then
         b.dataref(idx).m := val;
      end if;
   end;

   procedure SetInt(b : in T_Block'Class; idx : Positive; val : Integer) is
   begin
      if b.dface(idx) /= Var_Input then
         b.dataref(idx).di := val;
      end if;
   end;

   procedure SetFloat(b : in T_Block'Class; idx : Positive; val : Float) is
   begin
      if b.dface(idx) /= Var_Input then
         b.dataref(idx).fp := val;
      end if;
   end;

   procedure SetLFloat(b : in T_Block'Class; idx : Positive; val : Long_Float) is
   begin
      if b.dface(idx) /= Var_Input then
         b.dataref(idx).lfp := val;
      end if;
   end;

   ---------------------------------------------------------------------------

   -- The method 'Init' initializes the block
   function doInit(b : in T_Block) return Boolean is
   begin
      return False;
   end;


   -- The method 'Calc[ulate]' implements the function (subprogram)
   function doCalc (b : in T_Block) return Boolean is
   begin
      return False;
   end;

end Ay.Block;
