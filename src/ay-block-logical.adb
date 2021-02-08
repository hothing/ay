package body Ay.Block.Logical is

   ----------
   -- init --
   ----------

   procedure init (b : in out T_Logic1x1Block; res : out Boolean) is
   begin
      if b.in1 = null then
         b.in1 := new T_Boolean;
      end if;
      if b.out1 = null then
         b.out1 := new T_Boolean;
      end if;
      res := True;
   end init;

   procedure reset (b : in out T_Logic1x1Block) is
   begin
      b.in1.v := False;
      b.out1.v := False;
   end reset;

   procedure final (b : in out T_Logic1x1Block) is
   begin
      null;
   end final;
   -------------
   -- connect --
   -------------

   procedure connect (b : in out T_Logic1x1Block; idx : T_PinIndex; p : P_Value) is
      pb : P_Boolean;
   begin
      if p'Tag in T_Boolean'Tag then
         pb := P_Boolean(p);
      else
         raise Program_Error with "wrong type of connection";
      end if;
      case idx is
         when 1 =>
            b.in1 := pb;
         when others =>
            raise Program_Error with "wrong pin index";
      end case;
   end connect;

   ----------
   -- pull --
   ----------

   procedure pull (b : in out T_Logic1x1Block; idx : T_PinIndex; p : out P_Value)
   is
   begin
      if idx = 1 then
         p := P_Value(b.out1);
      else
         raise Program_Error with "wrong pin index";
      end if;
   end pull;


   ----------
   -- init --
   ----------

   procedure init (b : in out T_Logic2x1Block; res : out Boolean) is
   begin
      if b.in1 = null then
         b.in1 := new T_Boolean;
      end if;
      if b.in2 = null then
         b.in2 := new T_Boolean;
      end if;
      if b.out1 = null then
         b.out1 := new T_Boolean;
      end if;
      res := True;
   end init;

   procedure reset (b : in out T_Logic2x1Block) is
   begin
      b.in1.v := False;
      b.in2.v := False;
      b.out1.v := False;
   end reset;

   -------------
   -- connect --
   -------------

   procedure connect (b : in out T_Logic2x1Block; idx : T_PinIndex; p : P_Value) is
      pb : P_Boolean;
   begin
      if p'Tag in T_Boolean'Tag then
         pb := P_Boolean(p);
      else
         raise Program_Error with "wrong type of connection";
      end if;
      case idx is
         when 1 =>
            b.in1 := pb;
         when 2=>
            b.in2 := pb;
         when others =>
            raise Program_Error with "wrong pin index";
      end case;
   end connect;

   ---------------
   -- isBuildIn --
   ---------------

   function isBuildIn (mb : in T_Logic1x1MetaBlock) return Boolean is
   begin
      return True;
   end isBuildIn;

   -------------------
   -- getInputCount --
   -------------------

   function getInputCount (mb : in T_Logic1x1MetaBlock) return Natural is
   begin
      return 1;
   end getInputCount;

   --------------------
   -- getOutputCount --
   --------------------

   function getOutputCount (mb : in T_Logic1x1MetaBlock) return Natural is
   begin
      return 1;
   end getOutputCount;

   --------------------
   -- getStaticCount --
   --------------------

   function getStaticCount (mb : in T_Logic1x1MetaBlock) return Natural is
   begin
      return 0;
   end getStaticCount;

   ------------------
   -- getInputType --
   ------------------

   function getInputType
     (mb : in T_Logic1x1MetaBlock;
      idx : T_PinIndex)
      return T_DataType
   is
   begin
      if idx <= getInputCount(mb) then
         return T_DataType'(atype => DT_Bool, isArray => false, dim1 => 0,dim2 =>0);
      else
         return T_DataType'(atype => DT_Unknown, isArray => false, dim1 => 0,dim2 =>0);
      end if;
   end getInputType;

   -------------------
   -- getOutputType --
   -------------------

   function getOutputType
     (mb : in T_Logic1x1MetaBlock;
      idx : T_PinIndex)
      return T_DataType
   is
   begin
      if idx < getOutputCount(mb) then
         return T_DataType'(atype => DT_Bool, isArray => false, dim1 => 0,dim2 =>0);
      else
         return T_DataType'(atype => DT_Unknown, isArray => false, dim1 => 0,dim2 =>0);
      end if;
   end getOutputType;

   -------------------
   -- getStaticType --
   -------------------

   function getStaticType
     (mb : in T_Logic1x1MetaBlock;
      idx : T_PinIndex)
      return T_DataType
   is
   begin
      return T_DataType'(atype => DT_Unknown,
                         isArray => false,
                         dim1 => 0,
                         dim2 =>0);
   end getStaticType;

   -------------------
   -- getInputCount --
   -------------------

   function getInputCount (mb : in T_Logic2x1MetaBlock) return Natural is
   begin
      return 2;
   end getInputCount;

   ------------------
   -- getInputType --
   ------------------

   function getInputType
     (mb : in T_Logic2x1MetaBlock;
      idx : T_PinIndex)
      return T_DataType
   is
   begin
      if idx <= getInputCount(mb) then
         return T_DataType'(atype => DT_Bool, isArray => false, dim1 => 0,dim2 =>0);
      else
         return T_DataType'(atype => DT_Unknown, isArray => false, dim1 => 0,dim2 =>0);
      end if;
   end getInputType;

end Ay.Block.Logical;
