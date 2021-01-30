--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.IntegerOp.Factory.T_IntMultFactory_Test_Data.T_IntMultFactory_Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.IntegerOp.Factory.T_IntMultFactory_Test_Data.T_IntMultFactory_Tests.Test_T_IntMultFactory);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_doNewBlock_723db4 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_doNewBlock_723db4,
         "ay-block-integerop-factory.ads:13:4:",
         Test_doNewBlock_723db4'Access);

      Result.Add_Test (Case_1_1_Test_doNewBlock_723db4'Access);

      return Result'Access;

   end Suite;

end Ay.Block.IntegerOp.Factory.T_IntMultFactory_Test_Data.T_IntMultFactory_Tests.Suite;
--  end read only
