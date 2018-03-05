with Ay; use Ay;
with Ay.Block; use Ay.Block;
with Ay.Memory; use Ay.Memory;

package Ay.IntBlocks is

   type T_IntRead is new T_Block with record
      val  : P_Int;
      addr : T_Address;
   end record;
   type P_IntRead is access T_IntRead;

   procedure doInit (b : in out T_IntRead; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_IntRead) return Boolean;
   function makePin(b : in T_IntRead; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_IntRead; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_IntWrite is new T_Block with record
      val : P_Int;
      addr : T_Address;
   end record;
   type P_IntWrite is access T_IntWrite;

   procedure doInit(b : in out T_IntWrite; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_IntWrite) return Boolean;
   function makePin(b : in T_IntWrite; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin (b : in out T_IntWrite; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_AddInt is new T_Block with record
      out1 : P_Int;
      in1 : P_Int;
      in2 : P_Int;
   end record;
   type P_AddInt is access T_AddInt;

   procedure doInit(b : in out T_AddInt; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_AddInt) return Boolean;
   function makePin(b : in T_AddInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_AddInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_SubInt is new T_Block with record
      out1 : P_Int;
      in1 : P_Int;
      in2 : P_Int;
   end record;
   type P_SubInt is access T_SubInt;

   procedure doInit(b : in out T_SubInt; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_SubInt) return Boolean;
   function makePin(b : in T_SubInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_SubInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_MulInt is new T_Block with record
      out1 : P_Int;
      in1 : P_Int;
      in2 : P_Int;
   end record;
   type P_MulInt is access T_MulInt;

   procedure doInit(b : in out T_MulInt; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_MulInt) return Boolean;
   function makePin(b : in T_MulInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_MulInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_DivInt is new T_Block with record
      out1 : P_Int;
      in1 : P_Int;
      in2 : P_Int;
   end record;
   type P_DivInt is access T_DivInt;

   procedure doInit(b : in out T_DivInt; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_DivInt) return Boolean;
   function makePin(b : in T_DivInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_DivInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

   type T_ModInt is new T_Block with record
      out1 : P_Int;
      in1 : P_Int;
      in2 : P_Int;
   end record;
   type P_ModInt is access T_ModInt;

   procedure doInit(b : in out T_ModInt; ma: in out T_MemoryAllocator'Class);
   function doCalc (b : in out T_ModInt) return Boolean;
   function makePin(b : in T_ModInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink;
   function linkPin(b : in out T_ModInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean;

end Ay.IntBlocks;
