with Interfaces; use Interfaces;

package Ay.Memory is

   type T_BoolProxy is abstract tagged null record
   type P_BoolProxy is access all T_BoolProxy'Class;

   type T_Int16Proxy is abstract tagged null record
   type P_Int16Proxy is access all T_Int16Proxy'Class;

   type T_Int32Proxy is abstract tagged null record
   type P_Int32Proxy is access all T_Int32Proxy'Class;

   type T_Fp32Proxy is abstract tagged null record
   type P_Fp32Proxy is access all T_Fp32Proxy'Class;

   type T_Fp64Proxy is abstract tagged null record
   type P_Fp64Proxy is access all T_Fp64Proxy'Class;

   function Get(dp : P_BoolProxy) return Boolean;
   procedure Set(dp : in out P_BoolProxy; value : Boolean);

   function Get(dp : P_Int16Proxy) return Integer_16;
   procedure Set(dp : in out P_Int16Proxy; value : Integer_16);

   function Get(dp : P_Int32Proxy) return Integer_32;
   procedure Set(dp : in out P_Int32Proxy; value : Integer_32);

   function Get(dp : P_Fp32Proxy) return Float;
   procedure Set(dp : in out P_Fp32Proxy; value : Float);

   function Get(dp : P_Fp64Proxy) return Long_Float;
   procedure Set(dp : in out P_Fp64Proxy; value : Long_Float);

   type T_MemoryAllocator is abstract tagged null record;
   type P_MemoryAllocator is access all T_MemoryAllocator'Class;

   function newBool(ma : P_MemoryAllocator) return P_BoolProxy;
   function newInt16(ma : P_MemoryAllocator) return P_Int16Proxy;
   function newInt32(ma : P_MemoryAllocator) return P_Int32Proxy;
   function newFp32(ma : P_MemoryAllocator) return P_Fp32Proxy;
   function newFp64(ma : P_MemoryAllocator) return P_Fp64Proxy;

end Ay.Memory;
