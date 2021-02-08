package Ay.Block.Logical.TriggerRS is

   type T_RsBlock is limited new T_Logic2x1Block with  private;
   
   procedure calc (b : in out T_RsBlock; res : out Boolean);
   
   type T_RsMetaBlock is new T_Logic2x1MetaBlock with private;
   
   procedure newInstance(mb : in T_RsMetaBlock; b : out P_InstantingBlock);

   type T_SrBlock is limited new T_Logic2x1Block with  private;
   
   procedure calc (b : in out T_SrBlock; res : out Boolean);
   
   type T_SrMetaBlock is new T_Logic2x1MetaBlock with private;
   
   procedure newInstance(mb : in T_srMetaBlock; b : out P_InstantingBlock);
   
private
   
   type T_RsBlock is limited new T_Logic2x1Block with null record;

   type T_RsMetaBlock is new T_Logic2x1MetaBlock with null record; 
   
   type T_SrBlock is limited new T_Logic2x1Block with null record;

   type T_SrMetaBlock is new T_Logic2x1MetaBlock with null record;

end Ay.Block.Logical.TriggerRS;
