package body Ay.Program is

   ---- T_VarReference -------------------------------------------------------

   function get (v : in T_VarReference) return Boolean is
   begin
      case v.stype is
         when DT_Bool => return v.pb.all;
         when others => return False;
      end case;
   end get;

   function get (v : in T_VarReference) return Integer is
   begin
      case v.stype is
         when DT_Int => return v.pi.all;
         when others => return 0;
      end case;
   end get;

   function get (v : in T_VarReference) return Float is
   begin
      case v.stype is
         when DT_Float => return v.pf.all;
         when others => return 0.0;
      end case;
   end get;

   function get (v : in T_VarReference) return Long_Float  is
   begin
      case v.stype is
         when DT_LongFloat => return v.plf.all;
         when others => return 0.0;
      end case;
   end get;

   procedure set (v : in out T_VarReference; val : in Boolean) is
   begin
      case v.stype is
         when DT_Bool => v.pb.all := val ;
         when others => null;
      end case;
   end set;

   procedure set (v : in out T_VarReference; val : in Integer) is
   begin
      case v.stype is
         when DT_Int => v.pi.all := val ;
         when others => null;
      end case;
   end set;

   procedure set (v : in out T_VarReference; val : in Float) is
   begin
      case v.stype is
         when DT_Float => v.pf.all := val ;
         when others => null;
      end case;
   end set;

   procedure set (v : in out T_VarReference; val : in Long_Float) is
   begin
      case v.stype is
         when DT_LongFloat => v.plf.all := val ;
         when others => null;
      end case;
   end set;

   ---- T_UserProgram --------------------------------------------------------

   ----------
   -- init --
   ----------

   procedure init (b : in out T_UserProgram; res : out Boolean) is
      rc : Boolean;
   begin
      res := True;
      -- variables and connections initiating
      -- TODO:it
      -- blocks initiating
      for i in 1 .. b.B_Size loop
         b.iblocks(i).init(rc);
         res := res and rc;
      end loop;
   end init;

   -----------
   -- reset --
   -----------

   procedure reset (b : in out T_UserProgram) is
   begin
      for i in 1 .. b.B_Size loop
         b.iblocks(i).reset;
      end loop;
   end reset;

   ----------
   -- calc --
   ----------

   procedure calc (b : in out T_UserProgram; res : out Boolean) is
      rc : Boolean;
   begin
      res := True;
      for eb of b.iblocks loop
         eb.calc(rc);
         res := res and rc;
      end loop;
   end calc;

   -----------
   -- final --
   -----------

   procedure final (b : in out T_UserProgram) is
   begin
      for eb of b.iblocks loop
         eb.final;
      end loop;
   end final;

   procedure get_var (b : in out T_UserProgram;
                      idx : Natural;
                      var : out T_VarReference) is
   begin
      var := b.conn.Element(idx);
   end get_var;

   function get_var_count(b : in out T_UserProgram) return Natural is
   begin
      return Natural(b.conn.Length);
   end get_var_count;

end Ay.Program;
