with Ay.Connector; use Ay.Connector;

with Ada.Containers.Ordered_Maps;

package body Ay.Program.Constructor is

   function new_Connector(st : T_Signal_Type) return T_Connector is
      cp : T_Connector(st);
   begin
      case st is
         when DT_Unknown => raise Program_Error with "Unexpected signal type";
         when others => init(cp); return cp;
      end case;
   end new_Connector;

   -----------------------
   -- add_User_Variable --
   -----------------------

   procedure add_User_Variable
     (m : in out T_ProgramMaker;
      dt : in T_Signal_Type;
      res : out Boolean)
   is
   begin
      res := False;
      null;
      res := True;
   end add_User_Variable;

   ---------------
   -- add_Block --
   ---------------

   procedure add_Block
     (m : in out T_ProgramMaker;
      pb : P_Meta_Info;
      idx : out Natural)
   is
      b : P_Block;
   begin
      make_Instance(pb, b);
      m.iblock.Append(b);
      idx := m.iblock.Last_Index;
   end add_Block;

   ----------------
   -- connect_In --
   ----------------

   procedure connect_In
     (m : in out T_ProgramMaker;
      bid : in Natural;
      pin : Natural;
      connId : Integer;
      res : out Boolean)
   is
      c : Connections.Cursor;
      p : Natural;
      b : P_Block;
      mb : P_Meta_Info;
      cp : T_Connector;
   begin
      res := False;
      b := m.iblock.Element(bid);
      if b /=null then
         c := m.conn.Find( connId );
         if Connections.Has_Element(c) then
            p := Connections.Element(c);
            cp := m.vref.Element(p);
         else
            mb := get_Meta(b.all);
            cp := new_Connector(mb.get_Input_Type(pin));
            m.vref.Append(cp);
            m.conn.Include(connId, m.vref.Last_Index);
         end if;
         connect_Input(b.all, pin, cp, False);
         res := True;
      end if;
   end connect_In;

   -----------------
   -- connect_Out --
   -----------------

   procedure connect_Out
     (m : in out T_ProgramMaker;
      bid : in Natural;
      pin : Natural;
      connId : Integer;
      res : out Boolean)
   is
      c : Connections.Cursor;
      p : Natural;
      b : P_Block;
      mb : P_Meta_Info;
      cp : T_Connector;
   begin
      res := False;
      b := m.iblock.Element(bid);
      if b /= null then
         c := m.conn.Find( connId );
         if Connections.Has_Element(c) then
            p := Connections.Element(c);
            cp := m.vref.Element(p);
         else
            mb := get_Meta(b.all);
            cp := new_Connector(mb.get_Input_Type(pin));
            m.vref.Append(cp);
            m.conn.Include(connId, m.vref.Last_Index);
         end if;
         connect_Output(b.all, pin, cp, False);
         res := True;
      end if;
   end connect_Out;

   --------------
   -- assemble --
   --------------




   procedure assemble (m : in out T_ProgramMaker; res : out Boolean) is
      pb : P_Meta_Info;
      bs, vs : Positive;
      cp : T_Connector;
      k : Natural;
      use type Ada.Containers.Count_Type;
   begin
      res := False;
      if m.iblock.Length > 0 then
         bs := Positive(m.iblock.Length);
         vs := Positive(m.vref.Length);
         m.prg := new T_UserProgram( vs, bs );
         k := m.prg.iblocks'First;
         for b of m.iblock loop
            pb := get_Meta(b.all);
            -- create variables for all not connected In/Out
            for i in 1 .. pb.get_Output_Count loop
               if not is_In_Connected(b.all, i) then
                  cp := new_Connector(pb.get_Input_Type(i));
                  m.vref.Append(cp);
                  connect_Output(b.all, i, cp, True);
               end if;
            end loop;

            for i in 1 .. pb.get_Input_Count loop
               if not is_In_Connected(b.all, i) then
                  cp := new_Connector(pb.get_Input_Type(i));
                  m.vref.Append(cp);
                  connect_Input(b.all, i, cp, True);
               end if;
            end loop;
            m.prg.iblocks(k) := b; k := k + 1;
         end loop;

         -- copy all connectors to the program
         k := m.prg.vars'First;
         for v of m.vref loop
            m.prg.vars(k) := v;
         end loop;
      end if;
   end assemble;

   ---------------
   -- new_Maker --
   ---------------

   function new_Maker
     (r : Ay.Registry.P_BlockRegistry)
      return T_ProgramMaker
   is
   begin
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "new_Maker unimplemented");
      raise Program_Error with "Unimplemented function new_Maker";
      return new_Maker (r => r);
   end new_Maker;

end Ay.Program.Constructor;
