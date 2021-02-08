package Ay.Block.Logical.LOr is

   type T_OrBlock is limited new T_Logic2x1Block with  private;
   
   procedure calc (b : in out T_OrBlock; res : out Boolean);
   
   type T_OrMetaBlock is new T_Logic2x1MetaBlock with private;
   
   procedure newInstance(mb : in T_OrMetaBlock; b : out P_InstantingBlock);
   
private
   
   type T_OrBlock is limited new T_Logic2x1Block with null record;

   type T_OrMetaBlock is new T_Logic2x1MetaBlock with null record;

end Ay.Block.Logical.LOr;
