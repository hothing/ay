--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.Test_Data.Tests.Factory.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.Test_Data.Tests.Factory.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_newBlock_c2dda7 : aliased Runner_1.Test_Case;
   Case_2_1_Test_isBuildIn_93e5cc : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_newBlock_c2dda7,
         "ay-block.ads:140:7:",
         Test_newBlock_c2dda7'Access);
      Runner_1.Create
        (Case_2_1_Test_isBuildIn_93e5cc,
         "ay-block.ads:143:7:",
         Test_isBuildIn_93e5cc'Access);

      Result.Add_Test (Case_1_1_Test_newBlock_c2dda7'Access);
      Result.Add_Test (Case_2_1_Test_isBuildIn_93e5cc'Access);

      return Result'Access;

   end Suite;

end Ay.Block.Test_Data.Tests.Factory.Test_Data.Tests.Suite;
--  end read only
