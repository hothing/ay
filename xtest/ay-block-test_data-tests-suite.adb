--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_init_ac83b1 : aliased Runner_1.Test_Case;
   Case_2_1_Test_calc_00cf4a : aliased Runner_1.Test_Case;
   Case_3_1_Test_finalize_0d6119 : aliased Runner_1.Test_Case;
   Case_4_1_Test_preCalc_060ad6 : aliased Runner_1.Test_Case;
   Case_5_1_Test_postCalc_4e6e4b : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_init_ac83b1,
         "ay-block.ads:14:4:",
         Test_init_ac83b1'Access);
      Runner_1.Create
        (Case_2_1_Test_calc_00cf4a,
         "ay-block.ads:17:4:",
         Test_calc_00cf4a'Access);
      Runner_1.Create
        (Case_3_1_Test_finalize_0d6119,
         "ay-block.ads:20:4:",
         Test_finalize_0d6119'Access);
      Runner_1.Create
        (Case_4_1_Test_preCalc_060ad6,
         "ay-block.ads:44:4:",
         Test_preCalc_060ad6'Access);
      Runner_1.Create
        (Case_5_1_Test_postCalc_4e6e4b,
         "ay-block.ads:50:4:",
         Test_postCalc_4e6e4b'Access);

      Result.Add_Test (Case_1_1_Test_init_ac83b1'Access);
      Result.Add_Test (Case_2_1_Test_calc_00cf4a'Access);
      Result.Add_Test (Case_3_1_Test_finalize_0d6119'Access);
      Result.Add_Test (Case_4_1_Test_preCalc_060ad6'Access);
      Result.Add_Test (Case_5_1_Test_postCalc_4e6e4b'Access);

      return Result'Access;

   end Suite;

end Ay.Block.Test_Data.Tests.Suite;
--  end read only
