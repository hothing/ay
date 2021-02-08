generic
    type Item_Type is private;
package Ay.Lists is
   type List_Type     is limited private;
   type List_Iterator is private;

   function  Size   (List     : List_Type)     return Natural;
   function  First  (List     : List_Type)     return List_Iterator;
   function  Last   (List     : List_Type)     return List_Iterator;
   function  Succ   (Iterator : List_Iterator) return List_Iterator;
   function  Pred   (Iterator : List_Iterator) return List_Iterator;
   function  hasPred (Iterator : List_Iterator) return Boolean;
   function  hasSucc  (Iterator : List_Iterator) return Boolean;
   function  Value  (Iterator : List_Iterator) return Item_Type;
   procedure Insert (Iterator : in List_Iterator;
                      Item     : in Item_Type);
   procedure Delete (Iterator : in List_Iterator);

   procedure Rewind (Iterator : in out List_Iterator);
   
   List_Error : exception;
   
private
    type Item_Record;
    type Item_Access is access Item_Record;

    type Item_Record is
        record
            Item : Item_Type;
            Next : Item_Access;
            Pred : Item_Access;
        end record;

    type List_Header is
        record
            First : Item_Access;
            Last  : Item_Access;
            Count : Natural := 0;
        end record;
    type List_Access is access List_Header;

    type List_Type is
        record
            List : List_Access := new List_Header;
        end record;

    type List_Iterator is
        record
            List    : List_Access;
            Current : Item_Access;
        end record;
end Ay.Lists;
