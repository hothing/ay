--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.IntegerOp.T_IntGlobal_Test_Data.T_IntGlobal_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.IntegerOp.T_IntGlobal_Test_Data.T_IntGlobal_Tests.Test_T_IntGlobal);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_doInit_9a6f7e : aliased Runner_1.Test_Case;
   Case_2_1_Test_doCalc_a00920 : aliased Runner_1.Test_Case;
   Case_1i_1_Test_doFinal_513a94 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_doInit_9a6f7e,
         "ay-block-integerop.ads:8:4:",
         Test_doInit_9a6f7e'Access);
      Runner_1.Create
        (Case_2_1_Test_doCalc_a00920,
         "ay-block-integerop.ads:11:4:",
         Test_doCalc_a00920'Access);
      Runner_1.Create
        (Case_1i_1_Test_doFinal_513a94,
         "ay-block.ads:32:4: inherited at ay-block-integerop.ads:38:4:",
         Test_doFinal_513a94'Access);

      Result.Add_Test (Case_1_1_Test_doInit_9a6f7e'Access);
      Result.Add_Test (Case_2_1_Test_doCalc_a00920'Access);
      Result.Add_Test (Case_1i_1_Test_doFinal_513a94'Access);

      return Result'Access;

   end Suite;

end Ay.Block.IntegerOp.T_IntGlobal_Test_Data.T_IntGlobal_Tests.Suite;
--  end read only
