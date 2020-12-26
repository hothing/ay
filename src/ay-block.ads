with Interfaces; use Interfaces;
with Ay.Memory; use Ay.Memory;

package Ay.Block is

   type T_BlockState is (Wait, Run, Failed);

   type T_Block is tagged record
      -- enabled : Boolean;
   end record;

   type P_BlockRoot is access T_Block'Class;
   type P_Block is access all T_Block;

   procedure init (b : in out T_Block'Class; ma: in out T_MemoryAllocator'Class);

   function calculate (b : in out T_Block'Class) return Boolean;

   function getState(b : in out T_Block'Class) return T_BlockState;

   procedure doInit(b : in out T_Block; ma: in out T_MemoryAllocator'Class);

   function doCalc (b : in out T_Block) return Boolean;
   
   -- The Block is 'external' function to implement some math or logic operation
end Ay.Block;
