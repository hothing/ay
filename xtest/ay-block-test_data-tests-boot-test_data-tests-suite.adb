--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.Test_Data.Tests.Boot.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.Test_Data.Tests.Boot.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_bind_a72832 : aliased Runner_1.Test_Case;
   Case_2_1_Test_boundIn_c09857 : aliased Runner_1.Test_Case;
   Case_3_1_Test_boundOut_cf7b28 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_bind_a72832,
         "ay-block.ads:120:7:",
         Test_bind_a72832'Access);
      Runner_1.Create
        (Case_2_1_Test_boundIn_c09857,
         "ay-block.ads:126:7:",
         Test_boundIn_c09857'Access);
      Runner_1.Create
        (Case_3_1_Test_boundOut_cf7b28,
         "ay-block.ads:128:7:",
         Test_boundOut_cf7b28'Access);

      Result.Add_Test (Case_1_1_Test_bind_a72832'Access);
      Result.Add_Test (Case_2_1_Test_boundIn_c09857'Access);
      Result.Add_Test (Case_3_1_Test_boundOut_cf7b28'Access);

      return Result'Access;

   end Suite;

end Ay.Block.Test_Data.Tests.Boot.Test_Data.Tests.Suite;
--  end read only
