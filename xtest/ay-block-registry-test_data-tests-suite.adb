--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.Registry.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.Registry.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_reset_70ef34 : aliased Runner_1.Test_Case;
   Case_2_1_Test_newRecord_f8cdcc : aliased Runner_1.Test_Case;
   Case_3_1_Test_exist_0f8140 : aliased Runner_1.Test_Case;
   Case_4_1_Test_getBlockFactory_355a35 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_reset_70ef34,
         "ay-block-registry.ads:8:4:",
         Test_reset_70ef34'Access);
      Runner_1.Create
        (Case_2_1_Test_newRecord_f8cdcc,
         "ay-block-registry.ads:10:4:",
         Test_newRecord_f8cdcc'Access);
      Runner_1.Create
        (Case_3_1_Test_exist_0f8140,
         "ay-block-registry.ads:15:4:",
         Test_exist_0f8140'Access);
      Runner_1.Create
        (Case_4_1_Test_getBlockFactory_355a35,
         "ay-block-registry.ads:17:4:",
         Test_getBlockFactory_355a35'Access);

      Result.Add_Test (Case_1_1_Test_reset_70ef34'Access);
      Result.Add_Test (Case_2_1_Test_newRecord_f8cdcc'Access);
      Result.Add_Test (Case_3_1_Test_exist_0f8140'Access);
      Result.Add_Test (Case_4_1_Test_getBlockFactory_355a35'Access);

      return Result'Access;

   end Suite;

end Ay.Block.Registry.Test_Data.Tests.Suite;
--  end read only
