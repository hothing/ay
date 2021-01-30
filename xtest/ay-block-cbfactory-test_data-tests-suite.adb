--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.CBFactory.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.CBFactory.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_init_a82978 : aliased Runner_1.Test_Case;
   Case_2_1_Test_beginVars_28ffad : aliased Runner_1.Test_Case;
   Case_3_1_Test_addInput_589be3 : aliased Runner_1.Test_Case;
   Case_4_1_Test_addOutput_10ceda : aliased Runner_1.Test_Case;
   Case_5_1_Test_addStatic_4ba12f : aliased Runner_1.Test_Case;
   Case_6_1_Test_endVars_743631 : aliased Runner_1.Test_Case;
   Case_7_1_Test_beginCode_28ae9a : aliased Runner_1.Test_Case;
   Case_8_1_Test_addBlock_7421f3 : aliased Runner_1.Test_Case;
   Case_9_1_Test_connectIn_a8afd2 : aliased Runner_1.Test_Case;
   Case_10_1_Test_connectOut_424bf2 : aliased Runner_1.Test_Case;
   Case_11_1_Test_endCode_b2fc46 : aliased Runner_1.Test_Case;
   Case_12_1_Test_validate_b3e312 : aliased Runner_1.Test_Case;
   Case_13_1_Test_finish_c86ddd : aliased Runner_1.Test_Case;
   Case_14_1_Test_getInputConnId_6f291f : aliased Runner_1.Test_Case;
   Case_15_1_Test_getOutputConnId_4c4ee7 : aliased Runner_1.Test_Case;
   Case_16_1_Test_getStaticConnId_a33dd6 : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_init_a82978,
         "ay-block-cbfactory.ads:20:4:",
         Test_init_a82978'Access);
      Runner_1.Create
        (Case_2_1_Test_beginVars_28ffad,
         "ay-block-cbfactory.ads:24:4:",
         Test_beginVars_28ffad'Access);
      Runner_1.Create
        (Case_3_1_Test_addInput_589be3,
         "ay-block-cbfactory.ads:26:4:",
         Test_addInput_589be3'Access);
      Runner_1.Create
        (Case_4_1_Test_addOutput_10ceda,
         "ay-block-cbfactory.ads:28:4:",
         Test_addOutput_10ceda'Access);
      Runner_1.Create
        (Case_5_1_Test_addStatic_4ba12f,
         "ay-block-cbfactory.ads:30:4:",
         Test_addStatic_4ba12f'Access);
      Runner_1.Create
        (Case_6_1_Test_endVars_743631,
         "ay-block-cbfactory.ads:32:4:",
         Test_endVars_743631'Access);
      Runner_1.Create
        (Case_7_1_Test_beginCode_28ae9a,
         "ay-block-cbfactory.ads:36:4:",
         Test_beginCode_28ae9a'Access);
      Runner_1.Create
        (Case_8_1_Test_addBlock_7421f3,
         "ay-block-cbfactory.ads:38:4:",
         Test_addBlock_7421f3'Access);
      Runner_1.Create
        (Case_9_1_Test_connectIn_a8afd2,
         "ay-block-cbfactory.ads:43:4:",
         Test_connectIn_a8afd2'Access);
      Runner_1.Create
        (Case_10_1_Test_connectOut_424bf2,
         "ay-block-cbfactory.ads:48:4:",
         Test_connectOut_424bf2'Access);
      Runner_1.Create
        (Case_11_1_Test_endCode_b2fc46,
         "ay-block-cbfactory.ads:53:4:",
         Test_endCode_b2fc46'Access);
      Runner_1.Create
        (Case_12_1_Test_validate_b3e312,
         "ay-block-cbfactory.ads:57:4:",
         Test_validate_b3e312'Access);
      Runner_1.Create
        (Case_13_1_Test_finish_c86ddd,
         "ay-block-cbfactory.ads:59:4:",
         Test_finish_c86ddd'Access);
      Runner_1.Create
        (Case_14_1_Test_getInputConnId_6f291f,
         "ay-block-cbfactory.ads:63:4:",
         Test_getInputConnId_6f291f'Access);
      Runner_1.Create
        (Case_15_1_Test_getOutputConnId_4c4ee7,
         "ay-block-cbfactory.ads:65:4:",
         Test_getOutputConnId_4c4ee7'Access);
      Runner_1.Create
        (Case_16_1_Test_getStaticConnId_a33dd6,
         "ay-block-cbfactory.ads:67:4:",
         Test_getStaticConnId_a33dd6'Access);

      Result.Add_Test (Case_1_1_Test_init_a82978'Access);
      Result.Add_Test (Case_2_1_Test_beginVars_28ffad'Access);
      Result.Add_Test (Case_3_1_Test_addInput_589be3'Access);
      Result.Add_Test (Case_4_1_Test_addOutput_10ceda'Access);
      Result.Add_Test (Case_5_1_Test_addStatic_4ba12f'Access);
      Result.Add_Test (Case_6_1_Test_endVars_743631'Access);
      Result.Add_Test (Case_7_1_Test_beginCode_28ae9a'Access);
      Result.Add_Test (Case_8_1_Test_addBlock_7421f3'Access);
      Result.Add_Test (Case_9_1_Test_connectIn_a8afd2'Access);
      Result.Add_Test (Case_10_1_Test_connectOut_424bf2'Access);
      Result.Add_Test (Case_11_1_Test_endCode_b2fc46'Access);
      Result.Add_Test (Case_12_1_Test_validate_b3e312'Access);
      Result.Add_Test (Case_13_1_Test_finish_c86ddd'Access);
      Result.Add_Test (Case_14_1_Test_getInputConnId_6f291f'Access);
      Result.Add_Test (Case_15_1_Test_getOutputConnId_4c4ee7'Access);
      Result.Add_Test (Case_16_1_Test_getStaticConnId_a33dd6'Access);

      return Result'Access;

   end Suite;

end Ay.Block.CBFactory.Test_Data.Tests.Suite;
--  end read only
