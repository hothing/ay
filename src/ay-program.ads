with Ay.Block; use Ay.Block;
with Ay.Connector; use Ay.Connector;

with Ada.Containers;
with Ada.Containers.Indefinite_Vectors;

package Ay.Program is
   
   type T_VarReference(stype : T_Signal_Type := DT_Bool) is private;
   
   function get (v : in T_VarReference) return Boolean;
   
   function get (v : in T_VarReference) return Integer;
   
   function get (v : in T_VarReference) return Float;   
   
   function get (v : in T_VarReference) return Long_Float;   
   
   procedure set (v : in out T_VarReference; val : in Boolean);
   
   procedure set (v : in out T_VarReference; val : in Integer);
   
   procedure set (v : in out T_VarReference; val : in Float);
   
   procedure set (v : in out T_VarReference; val : in Long_Float);
   
   ---------------------------------------------------------------------------

   type T_UserProgram(B_Size : Positive) is private;
   
   type P_UserProgram is access all T_UserProgram;
   
   procedure init (b : in out T_UserProgram; res : out Boolean);
   
   procedure reset (b : in out T_UserProgram);
   
   procedure calc (b : in out T_UserProgram; res : out Boolean);
   
   procedure final (b : in out T_UserProgram);    
   
   procedure get_var (b : in out T_UserProgram;
                      idx : Natural;
                      var : out T_VarReference);
   
   function get_var_count(b : in out T_UserProgram) return Natural;
       
private
   
   type T_VarReference(stype : T_Signal_Type := DT_Bool) is record
      case stype is
         when DT_Bool => pb : P_Boolean;
         when DT_Int => pi : P_Integer;
         when DT_Float => pf : P_Float;
         when DT_LongFloat => plf : P_LongFloat;
         when others => null;
      end case;      
   end record;
   
   type T_BlockArray is array (Positive range <>) of P_Block;
   
   package Variables is new Ada.Containers.Indefinite_Vectors(Index_Type => Natural,
                                                               Element_Type => T_VarReference);
   
   type T_UserProgram(B_Size : Positive) is tagged record
      conn : Variables.Vector;
      iblocks : T_BlockArray(1 .. B_Size); -- internal blocks
   end record;

end Ay.Program;
