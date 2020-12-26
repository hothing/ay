with Ay; use Ay;
with Ay.Memory; use Ay.Memory;

package Ay.IntBlocks is

   type T_Int16 is new T_Int16Proxy with
      record
         mem : P_Memory;
         offset :
   type T_Int32Proxy is abstract tagged null record
   type P_Int32Proxy is access all T_Int32Proxy'Class;

end Ay.IntBlocks;
