with Interfaces; use Interfaces;
with Ay.Memory; use Ay.Memory;

package Ay.Block is

   type T_BlockState is (Wait, Run, Failed);

   type T_Block is tagged record
      state : T_BlockState;
      enabled : Boolean;
   end record;

   type P_BlockRoot is access T_Block'Class;
   type P_Block is access all T_Block;

   type T_DataType is (Bool, Int, Real);
   type T_PinLink(t: T_DataType) is record
      case t is
         when Bool => pb : P_Bool;
         when Int  => pi : P_Int;
         when Real => pr : P_Real;
      end case;
   end record;
   type P_PinLink is access T_PinLink;

   -- in this procedure every block must assign every pin
   procedure init (b : in out T_Block'Class; ma: in out T_MemoryAllocator'Class);

   function calculate (b : in out T_Block'Class) return Boolean;

   function getInput (b : in T_Block'Class; idx : T_PinIndex) return P_PinLink;

   function getOutput(b : in T_Block'Class; idx : T_PinIndex) return P_PinLink;

   function setInput (b : in out T_Block'Class; idx : T_PinIndex; pl : P_PinLink) return Boolean;

   function setOutput(b : in out T_Block'Class; idx : T_PinIndex; pl : P_PinLink) return Boolean;

   function makeLink (bs : in T_Block'Class;
      bd: in out T_Block'Class;
      oid : T_PinIndex;
      iid : T_PinIndex
     )
                      return Boolean;

   procedure doInit(b : in out T_Block; ma: in out T_MemoryAllocator'Class);

   function doCalc (b : in out T_Block) return Boolean;

   function makePin(b : in T_Block; idx : T_PinIndex; isOut : Boolean) return P_PinLink;

   function linkPin (b : in out T_Block; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

end Ay.Block;
