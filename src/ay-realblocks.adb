package body Ay.RealBlocks is

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_RealRead;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.val := newReal(ma);
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_RealRead) return Boolean is
      res : Boolean;
   begin
      -- Here must be a code to read variable
      res := True;
      return res;
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_RealRead;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
      p : P_PinLink;
   begin
      if idx = 0 then
         p := new T_PinLink(Real);
         p.pr := b.val;
         return p;
      else
         return null;
      end if;
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_RealRead;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_RealWrite;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_RealWrite) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_RealWrite;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_RealWrite;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_AddReal;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_AddReal) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_AddReal;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_AddReal;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_SubReal;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_SubReal) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_SubReal;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_SubReal;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_MulReal;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_MulReal) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_MulReal;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_MulReal;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_DivReal;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_DivReal) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_DivReal;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_DivReal;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_AbsReal;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_AbsReal) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_AbsReal;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_AbsReal;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_SinReal;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_SinReal) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_SinReal;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_SinReal;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

   ------------
   -- doInit --
   ------------

   procedure doInit
     (b : in out T_CosReal;
      ma: in out T_MemoryAllocator'Class)
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doInit unimplemented");
      raise Program_Error with "Unimplemented procedure doInit";
   end doInit;

   ------------
   -- doCalc --
   ------------

   function doCalc (b : in out T_CosReal) return Boolean is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "doCalc unimplemented");
      raise Program_Error with "Unimplemented function doCalc";
      return doCalc (b => b);
   end doCalc;

   -------------
   -- makePin --
   -------------

   function makePin
     (b : in T_CosReal;
      idx : T_PinIndex;
      isOut : Boolean)
      return P_PinLink
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "makePin unimplemented");
      raise Program_Error with "Unimplemented function makePin";
      return makePin (b => b, idx => idx, isOut => isOut);
   end makePin;

   -------------
   -- linkPin --
   -------------

   function linkPin
     (b : in out T_CosReal;
      idx : T_PinIndex;
      isOut : Boolean;
      p : P_PinLink)
      return Boolean
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "linkPin unimplemented");
      raise Program_Error with "Unimplemented function linkPin";
      return linkPin (b => b, idx => idx, isOut => isOut, p => p);
   end linkPin;

end Ay.RealBlocks;
