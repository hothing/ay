package body Ay.Connector is

   ----------
   -- init --
   ----------

   procedure init (c : in out T_Connector) is
      ni : Boolean;
   begin
      ni := true;
      case c.stype is
         when DT_Bool =>
            if c.pb = null then
               c.pb := new Boolean;
               ni := False;
            end if;
         when DT_Int =>
            if c.pi = null then
               c.pi := new Integer;
               ni := False;
            end if;
         when DT_Float =>
            if c.pf = null then
               c.pf := new Float;
               ni := False;
            end if;
         when DT_LongFloat =>
            if c.plf = null then
               c.plf := new Long_Float;
               ni := False;
            end if;
         when others => null;
      end case;
      if ni then
         raise Program_Error with "The connector is already in use";
      end if;
   end init;

   -------------
   -- getBool --
   -------------

   function get (c : in T_Connector) return P_Boolean is
   begin
      if c.stype = DT_Bool and (c.pb /= null) then
         return c.pb;
      else
         raise Program_Error with "The connector type is wrong";
      end if;
   end get;

   ----------------
   -- getInteger --
   ----------------

   function get (c : in T_Connector) return P_Integer is
   begin
         if c.stype = DT_Int and (c.pi /= null) then
            return c.pi;
         else
            raise Program_Error with "The connector type is wrong";
         end if;
   end get;

   --------------
   -- getFloat --
   --------------

   function get (c : in T_Connector) return P_Float is
   begin
         if c.stype = DT_Float and (c.pf /= null) then
            return c.pf;
         else
            raise Program_Error with "The connector type is wrong";
         end if;
   end get;

   ------------------
   -- getLongFloat --
   ------------------

   function get (c : in T_Connector) return P_LongFloat is
   begin
         if c.stype = DT_LongFloat and (c.plf /= null) then
            return c.plf;
         else
            raise Program_Error with "The connector type is wrong";
         end if;
   end get;

   -----------
   -- reset --
   -----------

   procedure reset (c : in out T_Connector) is
   begin
      case c.stype is
         when DT_Bool =>
               c.pb := null;
         when DT_Int =>
              c.pi := null;
         when DT_Float =>
               c.pf := null;
         when DT_LongFloat =>
               c.plf := null;
         when others => null;
      end case;
   end reset;

end Ay.Connector;
