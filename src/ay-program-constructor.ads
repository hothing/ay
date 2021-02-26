with Ada.Containers;
with Ada.Containers.Vectors;
with Ay.Registry;
with Ada.Containers.Ordered_Maps;

package Ay.Program.Constructor is

   type T_ProgramMaker is tagged private;
   
   procedure add_User_Variable(m : in out T_ProgramMaker; 
                               dt : in T_Signal_Type; 
                               res : out Boolean);
   
   procedure add_Block(m : in out T_ProgramMaker; 
                      pb : P_Meta_Info; -- added a block by producer
                      idx : out Natural -- internal index of the block instance
                     );
   
   procedure connect_In(m : in out T_ProgramMaker;
                       bid : in Natural; -- the block instance index
                       pin : Natural; -- index of the input
                       connId : Integer; -- connection identity
                       res : out Boolean);
   
   procedure connect_Out(m : in out T_ProgramMaker; 
                        bid : in Natural; -- the block instance index
                        pin : Natural; -- index of the output
                        connId : Integer; -- connection identity
                        res : out Boolean);
   
   procedure assemble(m : in out T_ProgramMaker; res : out Boolean);
   
   function new_Maker(r : Ay.Registry.P_BlockRegistry) return T_ProgramMaker;
   
private
         
   package BlockVector is new Ada.Containers.Vectors(Index_Type => Positive,
                                                     Element_Type => P_Block);
   
   package Connections is new Ada.Containers.Ordered_Maps(Key_Type => Natural,
                                                          Element_Type => Positive);
   
   package References is new Ada.Containers.Vectors(Index_Type => Natural,
                                                    Element_Type => T_Connector);
   
   type T_ProgramMaker is tagged record
      iblock : BlockVector.Vector; -- build-in block sequence
      conn : Connections.Map; -- connections identities
      vref : References.Vector; -- variables and connection points references
      prg : P_UserProgram; -- created program
   end record;   

end Ay.Program.Constructor;
