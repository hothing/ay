package body Ay.Block is

   ----------
   -- init --
   ----------

   procedure init (b : in out T_Block'Class; ma: in out T_MemoryAllocator'Class) is
   begin
      doInit(b, ma);
   end init;

   ---------------
   -- calculate --
   ---------------

   function calculate (b : in out T_Block'Class) return Boolean is
   begin
      return doCalc(b);
   end calculate;

   --------------
   -- getInput --
   --------------

   function getInput
     (b : in T_Block'Class;
      idx : T_PinIndex)
      return P_PinLink
   is
   begin
      return makePin(b, idx, False);
   end getInput;

   ---------------
   -- getOutput --
   ---------------

   function getOutput
     (b : in T_Block'Class;
      idx : T_PinIndex)
      return P_PinLink
   is
   begin
      return makePin(b, idx, True);
   end getOutput;

   --------------
   -- setInput --
   --------------

   function setInput
     (b : in out T_Block'Class;
      idx : T_PinIndex;
      pl : P_PinLink) return Boolean
   is
   begin
      return linkPin(b, idx, False, pl);
   end setInput;

   ---------------
   -- setOutput --
   ---------------

   function setOutput
     (b : in out T_Block'Class;
      idx : T_PinIndex;
      pl : P_PinLink) return Boolean
   is
   begin
      return linkPin(b, idx, True, pl);
   end setOutput;

   --------------
   -- makeLink --
   --------------

   function makeLink
     (bs : in T_Block'Class;
      bd: in out T_Block'Class;
      oid : T_PinIndex;
      iid : T_PinIndex
     )
      return Boolean
   is
   begin
      return setInput(bd, iid, getOutput(bs, oid));
   end makeLink;

   ------------
   -- doInit --
   ------------

   procedure doInit (b : in out T_Block; ma: in out T_MemoryAllocator'Class) is
   begin
      null;
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_Block) return Boolean is
   begin
      return True;
   end doCalc;

   ---------------
   -- makePinIn --
   ---------------

   function makePin (b : in T_Block; idx : T_PinIndex; isOut : Boolean) return P_PinLink is
   begin
      return null;
   end makePin;

   ----------------
   -- makePinOut --
   ----------------

   function linkPin (b : in out T_Block; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean is
   begin
     return False;
   end linkPin;

end Ay.Block;
