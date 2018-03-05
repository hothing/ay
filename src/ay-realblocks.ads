with Ay.Block; use Ay.Block;
with Ay.Memory; use Ay.Memory;

package Ay.RealBlocks is

   type T_RealRead is new T_Block with record
      val  : P_Real;
      addr : T_Address;
   end record;
   type P_RealRead is access T_RealRead;

   procedure doInit (b : in out T_RealRead; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_RealRead) return Boolean;
   function makePin(b : in T_RealRead; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_RealRead; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_RealWrite is new T_Block with record
      val : P_Real;
      addr : T_Address;
   end record;
   type P_RealWrite is access T_RealWrite;

   procedure doInit(b : in out T_RealWrite; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_RealWrite) return Boolean;
   function makePin(b : in T_RealWrite; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin (b : in out T_RealWrite; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_AddReal is new T_Block with record
      z : P_Real;
      y : P_Real;
      x : P_Real;
   end record;
   type P_AddReal is access T_AddReal;

   procedure doInit(b : in out T_AddReal; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_AddReal) return Boolean;
   function makePin(b : in T_AddReal; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_AddReal; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_SubReal is new T_Block with record
      z : P_Real;
      y : P_Real;
      x : P_Real;
   end record;
   type P_SubReal is access T_SubReal;

   procedure doInit(b : in out T_SubReal; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_SubReal) return Boolean;
   function makePin(b : in T_SubReal; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_SubReal; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_MulReal is new T_Block with record
      z : P_Real;
      y : P_Real;
      x : P_Real;
   end record;
   type P_MulReal is access T_MulReal;

   procedure doInit(b : in out T_MulReal; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_MulReal) return Boolean;
   function makePin(b : in T_MulReal; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_MulReal; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_DivReal is new T_Block with record
      z : P_Real;
      y : P_Real;
      x : P_Real;
   end record;
   type P_DivReal is access T_DivReal;

   procedure doInit(b : in out T_DivReal; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_DivReal) return Boolean;
   function makePin(b : in T_DivReal; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_DivReal; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_AbsReal is new T_Block with record
      y : P_Real;
      x : P_Real;
   end record;
   type P_AbsReal is access T_AbsReal;

   procedure doInit(b : in out T_AbsReal; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_AbsReal) return Boolean;
   function makePin(b : in T_AbsReal; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_AbsReal; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_SinReal is new T_Block with record
      x : P_Real;
      y : P_Real;
   end record;
   type P_SinReal is access T_SinReal;

   procedure doInit(b : in out T_SinReal; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_SinReal) return Boolean;
   function makePin(b : in T_SinReal; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_SinReal; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_CosReal is new T_Block with record
      x : P_Real;
      y : P_Real;
   end record;
   type P_CosReal is access T_CosReal;

   procedure doInit(b : in out T_CosReal; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_CosReal) return Boolean;
   function makePin(b : in T_CosReal; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_CosReal; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

end Ay.RealBlocks;
