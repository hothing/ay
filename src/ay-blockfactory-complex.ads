with Ada.Containers.Vectors;
with Ada.Containers.Ordered_Sets;
with Ada.Containers.Indefinite_Ordered_Maps;
use Ada.Containers;

package Ay.BlockFactory.Complex is

   subtype T_BlockTypeIdentity is Natural;
   
   type T_ComplexBlockFactory is new T_BlockFactory with private;
   
   procedure registerBlockType (r : in out T_ComplexBlockFactory;
                                bid : in T_BlockTypeIdentity;
                                desc : in P_BlockFactory;
                                res : out Integer);
   
   procedure lookupBlockType (r : in out T_ComplexBlockFactory; 
                              bid : in T_BlockTypeIdentity;
                              desc : out P_BlockFactory
                             ); 
   
   procedure setInputSize(bc : in out T_BlockFactory'Class; 
                          asize : in Positive);

   procedure setOutputSize(bc : in out T_BlockFactory'Class; 
                           asize : in Positive);

   procedure setStaticSize(bc : in out T_BlockFactory'Class; 
                           asize : in Positive);

   procedure declareInput(
                          bc : in out T_BlockFactory'Class; 
                          idx : in Positive;
                          dt : in T_DataType;
                          res : out Integer
                         );

   procedure declareOutput(
                           bc : in out T_BlockFactory'Class; 
                           idx : in Positive;
                           dt : in T_DataType;
                           res : out Integer
                          );
      
   procedure declareStatic(
                           bc : in out T_BlockFactory'Class; 
                           idx : in Positive;
                           dt : in T_DataType;
                           res : out Integer
                          );
   
   procedure addBlock (r : in out T_ComplexBlockFactory;
                       bid : in T_BlockTypeIdentity;
                       bsid : out Natural;
                       res : out Integer);
   
   procedure makeBindPoint (r : in out T_ComplexBlockFactory;
                            id : Positive;  -- bind identity
                            bsid : Natural; -- 'bsid' is number of block in the block chain
                            -- bsid = 0 is a refernece to the user block itself
                            pin : Positive; -- identity of block pin (or block variable)
                            res : out Integer);
   
   procedure transpile (r : in out T_ComplexBlockFactory;
                        res : out Integer);
   
   procedure doNewBlock(bc : in out T_ComplexBlockFactory; b : out P_Block);
   
private 
   
   package BlockTypes is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type => T_BlockTypeIdentity, Element_Type => P_BlockFactory);
  
   package BlockInstances is new Ada.Containers.Vectors
     (Index_Type   => Positive, Element_Type => T_BlockTypeIdentity);
   
   type T_BindPoint is record
      bsid : Natural; -- 'bsid' is number of block in the block chain
      -- 'bsid' = 0 is a refernece to the user block itself
      pin : Positive; -- identity of block pin (or block variable)
   end record;

   function "=" (Left, Right : T_BindPoint) return Boolean;
   
   function "<" (Left, Right : T_BindPoint) return Boolean;
   
   package BindSets is new Ada.Containers.Ordered_Sets
     (Element_Type => T_BindPoint);
   
   type P_BindSets is access BindSets.Set;
   
   package BlockBinds is new Ada.Containers.Indefinite_Ordered_Maps
     (Key_Type => Positive, Element_Type => P_BindSets);   
    
   type T_VarDescriptor is record
      dt : T_DataType;
      ac : T_VariableAccess;
   end record;
      
   package VarDesc is new Ada.Containers.Vectors
     (Index_Type   => Positive, Element_Type => T_VarDescriptor);
   
   type T_ComplexBlockFactory is new T_BlockFactory with record
      registry : BlockTypes.Map; -- registry of the block types
      binds : BlockBinds.Map; -- registry of the binds
      blocks : BlockInstances.Vector; --list of the instances
      vars : VarDesc.Vector; -- list of variables
   end record;

end Ay.BlockFactory.Complex;
