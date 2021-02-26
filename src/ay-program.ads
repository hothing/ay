with Ay.Block; use Ay.Block;
with Ay.Connector; use Ay.Connector;

with Ada.Containers;
with Ada.Containers.Indefinite_Vectors;

package Ay.Program is
     
   ---------------------------------------------------------------------------

   type T_UserProgram(V_Size : Positive; B_Size : Positive) is private;
   
   type P_UserProgram is access all T_UserProgram;
   
   procedure init (b : in out T_UserProgram; res : out Boolean);
   
   procedure reset (b : in out T_UserProgram);
   
   procedure calc (b : in out T_UserProgram; res : out Boolean);
   
   procedure final (b : in out T_UserProgram);    
   
   procedure get_var (b : in out T_UserProgram;
                      idx : Natural;
                      var : out T_Connector);
   
   function get_var_count(b : in out T_UserProgram) return Natural;
       
private
   
   type T_BlockArray is array (Positive range <>) of P_Block;
   
   type T_VarArray is array (Positive range <>) of T_Connector;
   
   type T_UserProgram(V_Size : Positive; B_Size : Positive) is tagged record
      vars : T_VarArray(1 .. V_Size);
      iblocks : T_BlockArray(1 .. B_Size); -- internal blocks
   end record;

end Ay.Program;
