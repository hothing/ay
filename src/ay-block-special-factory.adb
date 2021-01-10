package body Ay.Block.Special.Factory is

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_GetInputFactory; b : out P_Block) is
   begin
      b := new T_GetInput;
      T_GetInput(b.all).idx := bc.idx;
   end doNewBlock;

   ----------------
   -- doNewBlock --
   ----------------

   procedure doNewBlock (bc : in out T_SetOutputFactory; b : out P_Block) is
   begin
      b := new T_SetOutput;
      T_SetOutput(b.all).idx := bc.idx;
   end doNewBlock;

end Ay.Block.Special.Factory;
