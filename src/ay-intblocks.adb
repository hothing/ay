package body Ay.IntBlocks is

   ---------------
   -- T_IntRead --
   ---------------

   procedure doInit(b : in out T_IntRead; ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.val := newInt(ma);
   end doInit;

   function doCalc (b : in out T_IntRead) return Boolean is
      res : Boolean;
   begin
      -- Here must be a code to read variable
      res := True;
      return res;
   end doCalc;

   function makePin (b : in T_IntRead; idx : T_PinIndex; isOut : Boolean) return P_PinLink
   is
      p : P_PinLink;
   begin
      if idx = 0 then
         p := new T_PinLink(Int);
         p.pi := b.val;
         return p;
      else
         return null;
      end if;
   end makePin;

   function linkPin (b : in out T_IntRead; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean
   is
   begin
      return False;
   end linkPin;

   ----------------
   -- T_IntWrite --
   ----------------

   procedure doInit(b : in out T_IntWrite; ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.val := newInt(ma);
   end doInit;

   function doCalc (b : in out T_IntWrite) return Boolean is
      res : Boolean;
   begin
      res := b.val /= null;
      if res then
         null; -- Here must be a code to write variable
      end if;
      return res;
   end doCalc;

   function makePin (b : in T_IntWrite; idx : T_PinIndex; isOut : Boolean) return P_PinLink
   is
      p : P_PinLink;
   begin
      if idx = 0 then
         p := new T_PinLink(Int);
         p.pi := b.val;
         return p;
      else
         return null;
      end if;
   end makePin;

   function linkPin(b : in out T_IntWrite; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean
   is
      res : Boolean;
   begin
      res := False;
      if p /= null and then p.t = Int then
         b.val := p.pi;
         res := True;
      end if;
      return res;
   end linkPin;

   ------------
   -- doCalc --
   ------------

   procedure doInit(b : in out T_AddInt; ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.in1 := newInt(ma);
      b.in2 := newInt(ma);
      b.out1 := newInt(ma);
   end doInit;

   function doCalc (b : in out T_AddInt) return Boolean is
      res : Boolean;
   begin

      res := b.out1 /= null and b.in1 /= null and b.in2 /= null;
      if res then b.out1.all := b.in1.all + b.in2.all; end if;
      return res;
   end doCalc;

   function makePin (b : in T_AddInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink
   is
      p : P_PinLink;
   begin
      p := new T_PinLink(Int);
      case idx is
         when 0 => p.pi := b.in1;
         when 1 => p.pi := b.in2;
         when others => p := null;
      end case;
      return p;
   end makePin;

   function linkPin (b : in out T_AddInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean
   is
      res : Boolean;
   begin
      res := False;
      if p /= null and then p.t = Int and then p.pi /= null then
         if isOut then
            b.out1 := p.pi;
         else
            res := True;
            case idx is
               when 0 => b.in1 := p.pi;
               when 1 => b.in2 := p.pi;
               when others => res := False;
            end case;
         end if;
      end if;
      return res;
   end linkPin;

   ------------
   -- doCalc --
   ------------

   procedure doInit(b : in out T_SubInt; ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.in1 := newInt(ma);
      b.in2 := newInt(ma);
      b.out1 := newInt(ma);
   end doInit;

   function doCalc (b : in out T_SubInt) return Boolean is
      res : Boolean;
   begin
      res := b.out1 /= null and b.in1 /= null and b.in2 /= null;
      if res then b.out1.all := b.in1.all - b.in2.all; end if;
      return res;
   end doCalc;

   function makePin (b : in T_SubInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink
   is
      p : P_PinLink;
   begin
      p := new T_PinLink(Int);
      case idx is
         when 0 => p.pi := b.in1;
         when 1 => p.pi := b.in2;
         when others => p := null;
      end case;
      return p;
   end makePin;

   function linkPin (b : in out T_SubInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean
   is
      res : Boolean;
   begin
      res := False;
      if p /= null and then p.t = Int and then p.pi /= null then
         if isOut then
            b.out1 := p.pi;
         else
            res := True;
            case idx is
               when 0 => b.in1 := p.pi;
               when 1 => b.in2 := p.pi;
               when others => res := False;
            end case;
         end if;
      end if;
      return res;
   end linkPin;

   ------------
   -- doCalc --
   ------------

   procedure doInit(b : in out T_MulInt; ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.in1 := newInt(ma);
      b.in2 := newInt(ma);
      b.out1 := newInt(ma);
   end doInit;

   function doCalc (b : in out T_MulInt) return Boolean is
      res : Boolean;
   begin
      res := b.out1 /= null and b.in1 /= null and b.in2 /= null;
      if res then b.out1.all := b.in1.all * b.in2.all; end if;
      return res;
   end doCalc;

   function makePin (b : in T_MulInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink
   is
      p : P_PinLink;
   begin
      p := new T_PinLink(Int);
      case idx is
         when 0 => p.pi := b.in1;
         when 1 => p.pi := b.in2;
         when others => p := null;
      end case;
      return p;
   end makePin;

   function linkPin (b : in out T_MulInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean
   is
      res : Boolean;
   begin
      res := False;
      if p /= null and then p.t = Int and then p.pi /= null then
         if isOut then
            b.out1 := p.pi;
         else
            res := True;
            case idx is
               when 0 => b.in1 := p.pi;
               when 1 => b.in2 := p.pi;
               when others => res := False;
            end case;
         end if;
      end if;
      return res;
   end linkPin;

   ------------
   -- doCalc --
   ------------

   procedure doInit(b : in out T_DivInt; ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.in1 := newInt(ma);
      b.in2 := newInt(ma);
      b.out1 := newInt(ma);
      b.out1.all := 19780907; -- only for test DELETE THIS!
   end doInit;

   function doCalc (b : in out T_DivInt) return Boolean is
      res : Boolean;
   begin
      res := b.out1 /= null and b.in1 /= null and b.in2 /= null;
      if res then
         b.out1.all := b.in1.all / b.in2.all;
         b.out1.all := 19780907; -- only for test DELETE THIS!
      end if;
      return res;
   end doCalc;

   function makePin (b : in T_DivInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink
   is
      p : P_PinLink;
   begin
      p := new T_PinLink(Int);
      case idx is
         when 0 => p.pi := b.in1;
         when 1 => p.pi := b.in2;
         when others => p := null;
      end case;
      return p;
   end makePin;

   function linkPin (b : in out T_DivInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean
   is
      res : Boolean;
   begin
      res := False;
      if p /= null and then p.t = Int and then p.pi /= null then
         if isOut then
            b.out1 := p.pi;
         else
            res := True;
            case idx is
               when 0 => b.in1 := p.pi;
               when 1 => b.in2 := p.pi;
               when others => res := False;
            end case;
         end if;
      end if;
      return res;
   end linkPin;

   ------------
   -- doCalc --
   ------------

   procedure doInit(b : in out T_ModInt; ma: in out T_MemoryAllocator'Class)
   is
   begin
      b.in1 := newInt(ma);
      b.in2 := newInt(ma);
      b.out1 := newInt(ma);
   end doInit;

   function doCalc (b : in out T_ModInt) return Boolean is
      res : Boolean;
   begin
      res := b.out1 /= null and b.in1 /= null and b.in2 /= null;
      if res then b.out1.all := b.in1.all mod b.in2.all; end if;
      return res;
   end doCalc;

   function makePin (b : in T_ModInt; idx : T_PinIndex; isOut : Boolean) return P_PinLink
   is
      p : P_PinLink;
   begin
      p := new T_PinLink(Int);
      case idx is
         when 0 => p.pi := b.in1;
         when 1 => p.pi := b.in2;
         when others => p := null;
      end case;
      return p;
   end makePin;

   function linkPin (b : in out T_ModInt; idx : T_PinIndex; isOut : Boolean; p : P_PinLink) return Boolean
   is
      res : Boolean;
   begin
      res := False;
      if p /= null and then p.t = Int and then p.pi /= null then
         if isOut then
            b.out1 := p.pi;
         else
            res := True;
            case idx is
               when 0 => b.in1 := p.pi;
               when 1 => b.in2 := p.pi;
               when others => res := False;
            end case;
         end if;
      end if;
      return res;
   end linkPin;

end Ay.IntBlocks;
