package Ay.Block.Logical.LAnd is

   type T_AndBlock is limited new T_Logic2x1Block with  private;
   
   procedure calc (b : in out T_AndBlock; res : out Boolean);
   
   type T_AndMetaBlock is new T_Logic2x1MetaBlock with private;
   
   procedure newInstance(mb : in T_AndMetaBlock; b : out P_InstantingBlock);
   
private
   
   type T_AndBlock is limited new T_Logic2x1Block with null record;

   type T_AndMetaBlock is new T_Logic2x1MetaBlock with null record;

end Ay.Block.Logical.LAnd;
