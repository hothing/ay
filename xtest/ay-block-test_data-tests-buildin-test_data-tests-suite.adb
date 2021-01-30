--  This package has been generated automatically by GNATtest.
--  Do not edit any part of it, see GNATtest documentation for more details.

--  begin read only
with AUnit.Test_Caller;
with Gnattest_Generated;

package body Ay.Block.Test_Data.Tests.BuildIn.Test_Data.Tests.Suite is

   package Runner_1 is new AUnit.Test_Caller
     (GNATtest_Generated.GNATtest_Standard.Ay.Block.Test_Data.Tests.BuildIn.Test_Data.Tests.Test);

   Result : aliased AUnit.Test_Suites.Test_Suite;

   Case_1_1_Test_getIn_c8b1f9 : aliased Runner_1.Test_Case;
   Case_2_1_Test_getIn_b32a2b : aliased Runner_1.Test_Case;
   Case_3_1_Test_getIn_a8219d : aliased Runner_1.Test_Case;
   Case_4_1_Test_getIn_3cc6d5 : aliased Runner_1.Test_Case;
   Case_5_1_Test_setOut_f3e93e : aliased Runner_1.Test_Case;
   Case_6_1_Test_setOut_3b79c8 : aliased Runner_1.Test_Case;
   Case_7_1_Test_setOut_203fe2 : aliased Runner_1.Test_Case;
   Case_8_1_Test_setOut_a30b75 : aliased Runner_1.Test_Case;
   Case_9_1_Test_get_e62a27 : aliased Runner_1.Test_Case;
   Case_10_1_Test_get_44249e : aliased Runner_1.Test_Case;
   Case_11_1_Test_get_7f3239 : aliased Runner_1.Test_Case;
   Case_12_1_Test_get_4f0660 : aliased Runner_1.Test_Case;
   Case_13_1_Test_set_145d98 : aliased Runner_1.Test_Case;
   Case_14_1_Test_set_722748 : aliased Runner_1.Test_Case;
   Case_15_1_Test_set_76fde7 : aliased Runner_1.Test_Case;
   Case_16_1_Test_set_7be25c : aliased Runner_1.Test_Case;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is
   begin

      Runner_1.Create
        (Case_1_1_Test_getIn_c8b1f9,
         "ay-block.ads:75:7:",
         Test_getIn_c8b1f9'Access);
      Runner_1.Create
        (Case_2_1_Test_getIn_b32a2b,
         "ay-block.ads:77:7:",
         Test_getIn_b32a2b'Access);
      Runner_1.Create
        (Case_3_1_Test_getIn_a8219d,
         "ay-block.ads:79:7:",
         Test_getIn_a8219d'Access);
      Runner_1.Create
        (Case_4_1_Test_getIn_3cc6d5,
         "ay-block.ads:81:7:",
         Test_getIn_3cc6d5'Access);
      Runner_1.Create
        (Case_5_1_Test_setOut_f3e93e,
         "ay-block.ads:85:7:",
         Test_setOut_f3e93e'Access);
      Runner_1.Create
        (Case_6_1_Test_setOut_3b79c8,
         "ay-block.ads:87:7:",
         Test_setOut_3b79c8'Access);
      Runner_1.Create
        (Case_7_1_Test_setOut_203fe2,
         "ay-block.ads:89:7:",
         Test_setOut_203fe2'Access);
      Runner_1.Create
        (Case_8_1_Test_setOut_a30b75,
         "ay-block.ads:91:7:",
         Test_setOut_a30b75'Access);
      Runner_1.Create
        (Case_9_1_Test_get_e62a27,
         "ay-block.ads:95:7:",
         Test_get_e62a27'Access);
      Runner_1.Create
        (Case_10_1_Test_get_44249e,
         "ay-block.ads:97:7:",
         Test_get_44249e'Access);
      Runner_1.Create
        (Case_11_1_Test_get_7f3239,
         "ay-block.ads:99:7:",
         Test_get_7f3239'Access);
      Runner_1.Create
        (Case_12_1_Test_get_4f0660,
         "ay-block.ads:101:7:",
         Test_get_4f0660'Access);
      Runner_1.Create
        (Case_13_1_Test_set_145d98,
         "ay-block.ads:103:7:",
         Test_set_145d98'Access);
      Runner_1.Create
        (Case_14_1_Test_set_722748,
         "ay-block.ads:105:7:",
         Test_set_722748'Access);
      Runner_1.Create
        (Case_15_1_Test_set_76fde7,
         "ay-block.ads:107:7:",
         Test_set_76fde7'Access);
      Runner_1.Create
        (Case_16_1_Test_set_7be25c,
         "ay-block.ads:109:7:",
         Test_set_7be25c'Access);

      Result.Add_Test (Case_1_1_Test_getIn_c8b1f9'Access);
      Result.Add_Test (Case_2_1_Test_getIn_b32a2b'Access);
      Result.Add_Test (Case_3_1_Test_getIn_a8219d'Access);
      Result.Add_Test (Case_4_1_Test_getIn_3cc6d5'Access);
      Result.Add_Test (Case_5_1_Test_setOut_f3e93e'Access);
      Result.Add_Test (Case_6_1_Test_setOut_3b79c8'Access);
      Result.Add_Test (Case_7_1_Test_setOut_203fe2'Access);
      Result.Add_Test (Case_8_1_Test_setOut_a30b75'Access);
      Result.Add_Test (Case_9_1_Test_get_e62a27'Access);
      Result.Add_Test (Case_10_1_Test_get_44249e'Access);
      Result.Add_Test (Case_11_1_Test_get_7f3239'Access);
      Result.Add_Test (Case_12_1_Test_get_4f0660'Access);
      Result.Add_Test (Case_13_1_Test_set_145d98'Access);
      Result.Add_Test (Case_14_1_Test_set_722748'Access);
      Result.Add_Test (Case_15_1_Test_set_76fde7'Access);
      Result.Add_Test (Case_16_1_Test_set_7be25c'Access);

      return Result'Access;

   end Suite;

end Ay.Block.Test_Data.Tests.BuildIn.Test_Data.Tests.Suite;
--  end read only
