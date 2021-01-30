--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with Ay.Block.CBFactory.T_CBlockFactory_Test_Data.T_CBlockFactory_Tests.Suite;
with Ay.Block.CBFactory.Test_Data.Tests.Suite;
with Ay.Block.T_Block_Test_Data.T_Block_Tests.Suite;
with Ay.Block.T_CBlock_Test_Data.T_CBlock_Tests.Suite;
with Ay.Block.T_SpecialBlock_Test_Data.T_SpecialBlock_Tests.Suite;
with Ay.Block.Test_Data.Tests.Suite;
with Ay.Block.Test_Data.Tests.Boot.Test_Data.Tests.Suite;
with Ay.Block.Test_Data.Tests.BuildIn.Test_Data.Tests.Suite;
with Ay.Block.Test_Data.Tests.Factory.Test_Data.Tests.Suite;
with Ay.Memory.Test_Data.Tests.Suite;
with Ay.Block.Registry.Test_Data.Tests.Suite;
with Ay.Block.IntegerOp.Factory.T_IntAddFactory_Test_Data.T_IntAddFactory_Tests.Suite;
with Ay.Block.IntegerOp.Factory.T_IntDivFactory_Test_Data.T_IntDivFactory_Tests.Suite;
with Ay.Block.IntegerOp.Factory.T_IntMultFactory_Test_Data.T_IntMultFactory_Tests.Suite;
with Ay.Block.IntegerOp.Factory.T_IntSubFactory_Test_Data.T_IntSubFactory_Tests.Suite;
with Ay.Block.IntegerOp.T_IntAdd_Test_Data.T_IntAdd_Tests.Suite;
with Ay.Block.IntegerOp.T_IntDiv_Test_Data.T_IntDiv_Tests.Suite;
with Ay.Block.IntegerOp.T_IntGlobal_Test_Data.T_IntGlobal_Tests.Suite;
with Ay.Block.IntegerOp.T_IntMult_Test_Data.T_IntMult_Tests.Suite;
with Ay.Block.IntegerOp.T_IntSub_Test_Data.T_IntSub_Tests.Suite;
with Ay.Block.RealOp.Factory.T_FloatAddFactory_Test_Data.T_FloatAddFactory_Tests.Suite;
with Ay.Block.RealOp.Factory.T_FloatDivFactory_Test_Data.T_FloatDivFactory_Tests.Suite;
with Ay.Block.RealOp.Factory.T_FloatMultFactory_Test_Data.T_FloatMultFactory_Tests.Suite;
with Ay.Block.RealOp.Factory.T_FloatSubFactory_Test_Data.T_FloatSubFactory_Tests.Suite;
with Ay.Block.RealOp.T_FloatAdd_Test_Data.T_FloatAdd_Tests.Suite;
with Ay.Block.RealOp.T_FloatDiv_Test_Data.T_FloatDiv_Tests.Suite;
with Ay.Block.RealOp.T_FloatGlobal_Test_Data.T_FloatGlobal_Tests.Suite;
with Ay.Block.RealOp.T_FloatMult_Test_Data.T_FloatMult_Tests.Suite;
with Ay.Block.RealOp.T_FloatSub_Test_Data.T_FloatSub_Tests.Suite;
with Ay.Block.Special.Factory.T_GetInputFactory_Test_Data.T_GetInputFactory_Tests.Suite;
with Ay.Block.Special.Factory.T_SetOutputFactory_Test_Data.T_SetOutputFactory_Tests.Suite;
with Ay.Block.Special.T_GetInput_Test_Data.T_GetInput_Tests.Suite;
with Ay.Block.Special.T_SetOutput_Test_Data.T_SetOutput_Tests.Suite;

package body Gnattest_Main_Suite is

   Result : aliased AUnit.Test_Suites.Test_Suite;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Result.Add_Test (Ay.Block.CBFactory.T_CBlockFactory_Test_Data.T_CBlockFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.CBFactory.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.T_Block_Test_Data.T_Block_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.T_CBlock_Test_Data.T_CBlock_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.T_SpecialBlock_Test_Data.T_SpecialBlock_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Test_Data.Tests.Boot.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Test_Data.Tests.BuildIn.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Test_Data.Tests.Factory.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Ay.Memory.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Registry.Test_Data.Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.Factory.T_IntAddFactory_Test_Data.T_IntAddFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.Factory.T_IntDivFactory_Test_Data.T_IntDivFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.Factory.T_IntMultFactory_Test_Data.T_IntMultFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.Factory.T_IntSubFactory_Test_Data.T_IntSubFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.T_IntAdd_Test_Data.T_IntAdd_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.T_IntDiv_Test_Data.T_IntDiv_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.T_IntGlobal_Test_Data.T_IntGlobal_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.T_IntMult_Test_Data.T_IntMult_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.IntegerOp.T_IntSub_Test_Data.T_IntSub_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.Factory.T_FloatAddFactory_Test_Data.T_FloatAddFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.Factory.T_FloatDivFactory_Test_Data.T_FloatDivFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.Factory.T_FloatMultFactory_Test_Data.T_FloatMultFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.Factory.T_FloatSubFactory_Test_Data.T_FloatSubFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.T_FloatAdd_Test_Data.T_FloatAdd_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.T_FloatDiv_Test_Data.T_FloatDiv_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.T_FloatGlobal_Test_Data.T_FloatGlobal_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.T_FloatMult_Test_Data.T_FloatMult_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.RealOp.T_FloatSub_Test_Data.T_FloatSub_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Special.Factory.T_GetInputFactory_Test_Data.T_GetInputFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Special.Factory.T_SetOutputFactory_Test_Data.T_SetOutputFactory_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Special.T_GetInput_Test_Data.T_GetInput_Tests.Suite.Suite);
      Result.Add_Test (Ay.Block.Special.T_SetOutput_Test_Data.T_SetOutput_Tests.Suite.Suite);

      return Result'Access;

   end Suite;

end Gnattest_Main_Suite;
--  end read only
