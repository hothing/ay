package Ay.Block.Logical.LXOr is

   type T_XOrBlock is limited new T_Logic2x1Block with  private;
   
   procedure calc (b : in out T_XOrBlock; res : out Boolean);
   
   type T_XOrMetaBlock is new T_Logic2x1MetaBlock with private;
   
   procedure newInstance(mb : in T_XOrMetaBlock; b : out P_InstantingBlock);
   
private
   
   type T_XOrBlock is limited new T_Logic2x1Block with null record;

   type T_XOrMetaBlock is new T_Logic2x1MetaBlock with null record;

end Ay.Block.Logical.LXOr;
