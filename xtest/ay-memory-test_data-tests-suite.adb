--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Memory.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Memory.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_destroyVar_822130 : aliased Runner_1.Test_Case;
   Case_2_1_Test_get_80631e : aliased Runner_1.Test_Case;
   Case_3_1_Test_get_777808 : aliased Runner_1.Test_Case;
   Case_4_1_Test_get_3474a4 : aliased Runner_1.Test_Case;
   Case_5_1_Test_get_1372e8 : aliased Runner_1.Test_Case;
   Case_6_1_Test_set_32600e : aliased Runner_1.Test_Case;
   Case_7_1_Test_set_96ba80 : aliased Runner_1.Test_Case;
   Case_8_1_Test_set_9a8ca1 : aliased Runner_1.Test_Case;
   Case_9_1_Test_set_bb802b : aliased Runner_1.Test_Case;
   Case_10_1_Test_clone_a2c2a4 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_destroyVar_822130,
         "ay-memory.ads:25:4:",
         Test_destroyVar_822130'Access);
      Runner_1.Create
        (Case_2_1_Test_get_80631e,
         "ay-memory.ads:29:4:",
         Test_get_80631e'Access);
      Runner_1.Create
        (Case_3_1_Test_get_777808,
         "ay-memory.ads:31:4:",
         Test_get_777808'Access);
      Runner_1.Create
        (Case_4_1_Test_get_3474a4,
         "ay-memory.ads:33:4:",
         Test_get_3474a4'Access);
      Runner_1.Create
        (Case_5_1_Test_get_1372e8,
         "ay-memory.ads:35:4:",
         Test_get_1372e8'Access);
      Runner_1.Create
        (Case_6_1_Test_set_32600e,
         "ay-memory.ads:37:4:",
         Test_set_32600e'Access);
      Runner_1.Create
        (Case_7_1_Test_set_96ba80,
         "ay-memory.ads:39:4:",
         Test_set_96ba80'Access);
      Runner_1.Create
        (Case_8_1_Test_set_9a8ca1,
         "ay-memory.ads:41:4:",
         Test_set_9a8ca1'Access);
      Runner_1.Create
        (Case_9_1_Test_set_bb802b,
         "ay-memory.ads:43:4:",
         Test_set_bb802b'Access);
      Runner_1.Create
        (Case_10_1_Test_clone_a2c2a4,
         "ay-memory.ads:47:4:",
         Test_clone_a2c2a4'Access);

      Result.Add_Test (Case_1_1_Test_destroyVar_822130'Access);
      Result.Add_Test (Case_2_1_Test_get_80631e'Access);
      Result.Add_Test (Case_3_1_Test_get_777808'Access);
      Result.Add_Test (Case_4_1_Test_get_3474a4'Access);
      Result.Add_Test (Case_5_1_Test_get_1372e8'Access);
      Result.Add_Test (Case_6_1_Test_set_32600e'Access);
      Result.Add_Test (Case_7_1_Test_set_96ba80'Access);
      Result.Add_Test (Case_8_1_Test_set_9a8ca1'Access);
      Result.Add_Test (Case_9_1_Test_set_bb802b'Access);
      Result.Add_Test (Case_10_1_Test_clone_a2c2a4'Access);

      return Result'Access;

   end Suite;

end Ay.Memory.Test_Data.Tests.Suite;
--  end read only
