package body Ay.Block is


   package body Boot is

      procedure NewBool(b : in out T_Block'Class;
                                         idx : Positive;
                                         vacc : T_VariableAccess) is
      begin
         b.vars(idx) := new T_Value(DT_Bool);
         b.vacc(idx) := vacc;
      end;

      procedure NewInt(b : in out T_Block'Class; idx : Positive; vacc : T_VariableAccess)  is
      begin
         b.vars(idx) := new T_Value(DT_Int);
         b.vacc(idx) := vacc;
      end;

      procedure NewFloat(b : in out T_Block'Class; idx : Positive; vacc : T_VariableAccess) is
      begin
         b.vars(idx) := new T_Value(DT_Float);
         b.vacc(idx) := vacc;
      end;

      procedure NewLFloat(b : in out T_Block'Class; idx : Positive; vacc : T_VariableAccess) is
      begin
         b.vars(idx) := new T_Value(DT_LongFloat);
         b.vacc(idx) := vacc;
         b.vbnd(idx) := False;
      end;


      -- A function 'bindInput' binds the input of block with output of another block
      -- The mode of the instance variablemust be 'Var_Input' or 'Var_InOut'.
      -- Otherwise the function do nothing and return 'False' value
      procedure bindInput(b : in out T_Block'Class;
                            idx: Positive;
                            outVar : P_Value;
                          res : out Boolean) is
      begin
         res := false;
         if (b.vacc(idx) = Var_Input)
           or (b.vacc(idx) = Var_InOut)
           or (b.vacc(idx) = Var_Global)
         then
            if outVar /= null then
               if b.vars(idx).DataType = outVar.DataType then
                  b.vars(idx) := outVar;
                  b.vbnd(idx) := True;
                  res := true;
               else
                  null; -- FIXME? may be raise an exception?
               end if;
            end if;
         else
            null; -- FIXME? may be raise an exception?
         end if;
      end;

      -- A function 'getOutput' returns a reference to the output in global memory
      function getOutput(b : in T_Block'Class;
                      idx: Positive
                     ) return P_Value is
      begin
         if (b.vacc(idx) = Var_Output) then
            return b.vars(idx);
         else
            return null; -- FIXME? may be raise an exception?
         end if;
      end;

   end Boot;

   -- The method 'Init' initializes the block
   procedure init (b : in out T_Block'Class; res : out Boolean) is
   begin
      doInit(b, res);
   end;

   -- The method 'Calc[ulate]' implements the function (subprogram)
   procedure calc (b : in out T_Block'Class; res : out Boolean) is
   begin
      doCalc(b, res);
   end;

   -- The method 'Final' releases the block resources
   procedure finalize(b : in out T_Block'Class) is
   begin
      doFinal(b);
   end;

   ---------------------------------------------------------------------------

   -- The methods to access instance variable
   function GetBool(b : in T_Block'Class; idx : Positive) return Boolean is
   begin
      return b.vars(idx).m;
   end;

   function GetInt(b : in T_Block'Class; idx : Positive) return Integer is
   begin
      return b.vars(idx).di;
   end;

   --function GetWord(b : in T_Block; idx : Positive) return Unsigned_32;

   function GetFloat(b : in T_Block'Class; idx : Positive) return Float is
   begin
      return b.vars(idx).fp;
   end;

   function GetLFloat(b : in T_Block'Class; idx : Positive) return Long_Float is
   begin
      return b.vars(idx).lfp;
   end;

   procedure SetBool(b : in out T_Block'Class; idx : Positive; val : Boolean) is
   begin
      if b.vacc(idx) /= Var_Input then
         b.vars(idx).m := val;
      end if;
   end;

   procedure SetInt(b : in out T_Block'Class; idx : Positive; val : Integer) is
   begin
      if b.vacc(idx) /= Var_Input then
         b.vars(idx).di := val;
      end if;
   end;

   procedure SetFloat(b : in out T_Block'Class; idx : Positive; val : Float) is
   begin
      if b.vacc(idx) /= Var_Input then
         b.vars(idx).fp := val;
      end if;
   end;

   procedure SetLFloat(b : in out T_Block'Class; idx : Positive; val : Long_Float) is
   begin
      if b.vacc(idx) /= Var_Input then
         b.vars(idx).lfp := val;
      end if;
   end;

   ---------------------------------------------------------------------------

   -- The method 'Init' initializes the block
   procedure doInit(b : in out T_Block; res : out Boolean) is
   begin
      res := False;
   end;


   -- The method 'Calc[ulate]' implements the addition of the integers
   procedure doCalc (b : in out T_Block; res : out Boolean) is
   begin
      res := False;
   end;

   -- The method 'Final' releases the block resources
   procedure doFinal (b : in out T_Block) is
   begin
      for i in b.vars'First .. b.vars'Last loop
         if not b.vbnd(i) then
            destroyVar(b.vars(i));
         end if;
      end loop;
   end;

   function hasBind(b : in T_Block'Class; idx : Positive) return Boolean is
   begin
      return b.vbnd(idx);
   end;


end Ay.Block;
