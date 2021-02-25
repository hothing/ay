with Ada.Containers.Ordered_Maps;

package body Ay.Program.Constructor is

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
      m.vdef.Append( dt );
      res := True;
   end add_User_Variable;

   procedure add_Variable
     (m : in out T_ProgramMaker;
      dt : in T_Signal_Type;
      res : out Boolean)
   is
   begin
      null;
--        case dt is
--           when DT_Bool =>
--              m.vdef.Append( T_VarReference'(dt, new Boolean) );
--           when DT_Int =>
--              m.vdef.Append( T_VarReference'(dt, new Integer) );
--           when DT_Float =>
--              m.vdef.Append( T_VarReference'(dt, new Float) );
--           when DT_LongFloat =>
--              m.vdef.Append( T_VarReference'(dt, new Long_Float) );
--           when others =>
--              raise Program_Error with "Unssuperted data type";
--        end case;
   end add_Variable;

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
      p : T_Connection;
   begin
      res := False;

      c := m.conn.Find( connId );
      if Connections.Has_Element(c) then
         -- aha connection is started
         p := Connections.Element(c);
         if p.cid = connId then
            -- FIXME: inefficient
            p.sink.Append(T_Plug'(bid => bid,
                                  pin => pin));
            Connections.Replace(m.conn, connId, p);
            res := True;
         end if;
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
      mc : Connections.Cursor;
      c : T_Connection;
   begin
      res := False;

      mc := m.conn.Find( connId );
      if not Connections.Has_Element(mc) then
         -- aha connection is not started
         c.cid := connId;
         c.source := T_Plug'(bid => bid, pin => pin);
         m.conn.Include(connId, c);
         res := True;
      end if;
   end connect_Out;

   --------------
   -- assemble --
   --------------

   procedure assemble (m : in out T_ProgramMaker; res : out Boolean) is
      pb : P_Meta_Info;
      bs : Positive;
      use type Ada.Containers.Count_Type;
   begin
      res := False;
      if m.iblock.Length > 0 then
         bs := Positive(m.iblock.Length);
         m.prg := new T_UserProgram( bs );
         for b of m.iblock loop
            pb := get_Meta(b.all);
            -- create all variables for In/Out
            for i in 1 .. pb.get_Input_Count loop
               m.vdef.Append(pb.get_Input_Type(i));
               -- ERROR: it is not possible to connect the variable and the block pin
            end loop;

            for i in 1 .. pb.get_Output_Count loop
               m.vdef.Append(pb.get_Output_Type(i));
               -- ERROR: it is not possible to connect the variable and the block pin
            end loop;
         end loop;
      end if;
      --  Generated stub: replace with real body!
      pragma Compile_Time_Warning (Standard.True, "assemble unimplemented");
      raise Program_Error with "Unimplemented procedure assemble";
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
