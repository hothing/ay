with Interfaces; use Interfaces;

package Ay is

   subtype T_Bool is Boolean;
   subtype T_Int is Integer;
   subtype T_Real is Long_Float;

   subtype T_Address is Integer;

   subtype T_PinIndex is Unsigned_8;

   type P_Bool is access all T_Bool;
   type P_Int is access all T_Int;
   type P_Real is access all T_Real;

end Ay;
