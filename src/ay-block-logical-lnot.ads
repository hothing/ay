package Ay.Block.Logical.LNot is

   type T_NotBlock is new T_Logic1x1Block with  private;
   
   procedure calc (b : in out T_NotBlock; res : out Boolean);
   
   type T_NotMetaBlock is new T_Logic1x1MetaBlock with private;
   
   procedure newInstance(mb : in T_NotMetaBlock; b : out P_InstantingBlock);
   
private
   
   type T_NotBlock is new T_Logic1x1Block with null record;
   
   type T_NotMetaBlock is new T_Logic1x1MetaBlock with null record;

end Ay.Block.Logical.LNot;
