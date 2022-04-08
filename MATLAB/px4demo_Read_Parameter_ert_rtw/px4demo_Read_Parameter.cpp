//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_Read_Parameter.cpp
//
// Code generated for Simulink model 'px4demo_Read_Parameter'.
//
// Model version                  : 1.19
// Simulink Coder version         : 9.4 (R2020b) 29-Jul-2020
// C/C++ source code generated on : Wed Jul 21 21:08:09 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM Cortex
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "px4demo_Read_Parameter.h"
#include "px4demo_Read_Parameter_private.h"
#include "px4demo_Read_Parameter_dt.h"

// Block signals (default storage)
B_px4demo_Read_Parameter_T px4demo_Read_Parameter_B;

// Block states (default storage)
DW_px4demo_Read_Parameter_T px4demo_Read_Parameter_DW;

// Real-time model
RT_MODEL_px4demo_Read_Paramet_T px4demo_Read_Parameter_M_ =
  RT_MODEL_px4demo_Read_Paramet_T();
RT_MODEL_px4demo_Read_Paramet_T *const px4demo_Read_Parameter_M =
  &px4demo_Read_Parameter_M_;

// Model step function
void px4demo_Read_Parameter_step(void)
{
  MW_PARAM_DATA_TYPE ParamDataType;
  real32_T ParamStep;
  boolean_T b_varargout_1;

  // Reset subsysRan breadcrumbs
  srClearBC(px4demo_Read_Parameter_DW.EnabledSubsystem_SubsysRanBC);

  // MATLABSystem: '<S2>/SourceBlock' incorporates:
  //   Inport: '<S3>/In1'

  b_varargout_1 = uORB_read_step(px4demo_Read_Parameter_DW.obj_an.orbMetadataObj,
    &px4demo_Read_Parameter_DW.obj_an.eventStructObj,
    &px4demo_Read_Parameter_B.b_varargout_2, false, 1.0);

  // Outputs for Enabled SubSystem: '<S2>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S3>/Enable'

  if (b_varargout_1) {
    px4demo_Read_Parameter_B.In1 = px4demo_Read_Parameter_B.b_varargout_2;
    srUpdateBC(px4demo_Read_Parameter_DW.EnabledSubsystem_SubsysRanBC);
  }

  // End of MATLABSystem: '<S2>/SourceBlock'
  // End of Outputs for SubSystem: '<S2>/Enabled Subsystem'

  // SignalConversion generated from: '<S1>/Bus Selector'
  px4demo_Read_Parameter_B.x = px4demo_Read_Parameter_B.In1.x;

  // SignalConversion generated from: '<S1>/Bus Selector'
  px4demo_Read_Parameter_B.y = px4demo_Read_Parameter_B.In1.y;

  // SignalConversion generated from: '<S1>/Bus Selector'
  px4demo_Read_Parameter_B.z = px4demo_Read_Parameter_B.In1.z;

  // MATLABSystem: '<Root>/Read Parameter2'
  if (px4demo_Read_Parameter_DW.obj_b.SampleTime !=
      px4demo_Read_Parameter_P.ReadParameter2_SampleTime) {
    px4demo_Read_Parameter_DW.obj_b.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter2_SampleTime;
  }

  ParamDataType = MW_SINGLE;
  b_varargout_1 = MW_Param_Step(px4demo_Read_Parameter_DW.obj_b.MW_PARAMHANDLE,
    ParamDataType, &ParamStep);
  if (b_varargout_1) {
    ParamStep = 0.0F;
  }

  // Product: '<Root>/Divide2' incorporates:
  //   MATLABSystem: '<Root>/Read Parameter2'

  px4demo_Read_Parameter_B.Divide2 = px4demo_Read_Parameter_B.z / ParamStep;

  // MATLABSystem: '<Root>/Read Parameter5'
  if (px4demo_Read_Parameter_DW.obj.SampleTime !=
      px4demo_Read_Parameter_P.ReadParameter5_SampleTime) {
    px4demo_Read_Parameter_DW.obj.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter5_SampleTime;
  }

  ParamDataType = MW_SINGLE;
  b_varargout_1 = MW_Param_Step(px4demo_Read_Parameter_DW.obj.MW_PARAMHANDLE,
    ParamDataType, &px4demo_Read_Parameter_B.ReadParameter5_o1);
  if (b_varargout_1) {
    px4demo_Read_Parameter_B.ReadParameter5_o1 = 0.0F;
  }

  // End of MATLABSystem: '<Root>/Read Parameter5'

  // Sum: '<Root>/Add2'
  px4demo_Read_Parameter_B.Add2 = px4demo_Read_Parameter_B.Divide2 +
    px4demo_Read_Parameter_B.ReadParameter5_o1;

  // MATLABSystem: '<Root>/Read Parameter3'
  if (px4demo_Read_Parameter_DW.obj_d.SampleTime !=
      px4demo_Read_Parameter_P.ReadParameter3_SampleTime) {
    px4demo_Read_Parameter_DW.obj_d.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter3_SampleTime;
  }

  ParamDataType = MW_SINGLE;
  b_varargout_1 = MW_Param_Step(px4demo_Read_Parameter_DW.obj_d.MW_PARAMHANDLE,
    ParamDataType, &px4demo_Read_Parameter_B.ReadParameter3_o1);
  if (b_varargout_1) {
    px4demo_Read_Parameter_B.ReadParameter3_o1 = 0.0F;
  }

  // End of MATLABSystem: '<Root>/Read Parameter3'

  // MATLABSystem: '<Root>/Read Parameter4'
  if (px4demo_Read_Parameter_DW.obj_a.SampleTime !=
      px4demo_Read_Parameter_P.ReadParameter4_SampleTime) {
    px4demo_Read_Parameter_DW.obj_a.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter4_SampleTime;
  }

  ParamDataType = MW_SINGLE;
  b_varargout_1 = MW_Param_Step(px4demo_Read_Parameter_DW.obj_a.MW_PARAMHANDLE,
    ParamDataType, &px4demo_Read_Parameter_B.ReadParameter4_o1);
  if (b_varargout_1) {
    px4demo_Read_Parameter_B.ReadParameter4_o1 = 0.0F;
  }

  // End of MATLABSystem: '<Root>/Read Parameter4'

  // MATLABSystem: '<Root>/Read Parameter1'
  if (px4demo_Read_Parameter_DW.obj_h.SampleTime !=
      px4demo_Read_Parameter_P.ReadParameter1_SampleTime) {
    px4demo_Read_Parameter_DW.obj_h.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter1_SampleTime;
  }

  ParamDataType = MW_SINGLE;
  b_varargout_1 = MW_Param_Step(px4demo_Read_Parameter_DW.obj_h.MW_PARAMHANDLE,
    ParamDataType, &ParamStep);
  if (b_varargout_1) {
    ParamStep = 0.0F;
  }

  // Product: '<Root>/Divide1' incorporates:
  //   MATLABSystem: '<Root>/Read Parameter1'

  px4demo_Read_Parameter_B.Divide1 = px4demo_Read_Parameter_B.y / ParamStep;

  // Sum: '<Root>/Add1'
  px4demo_Read_Parameter_B.Add1 = px4demo_Read_Parameter_B.Divide1 +
    px4demo_Read_Parameter_B.ReadParameter4_o1;

  // MATLABSystem: '<Root>/Read Parameter'
  if (px4demo_Read_Parameter_DW.obj_k.SampleTime !=
      px4demo_Read_Parameter_P.ReadParameter_SampleTime) {
    px4demo_Read_Parameter_DW.obj_k.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter_SampleTime;
  }

  ParamDataType = MW_SINGLE;
  px4demo_Read_Parameter_B.ReadParameter_o2 = MW_Param_Step
    (px4demo_Read_Parameter_DW.obj_k.MW_PARAMHANDLE, ParamDataType,
     &px4demo_Read_Parameter_B.ReadParameter_o1);
  if (px4demo_Read_Parameter_B.ReadParameter_o2) {
    px4demo_Read_Parameter_B.ReadParameter_o1 = 0.0F;
  }

  // End of MATLABSystem: '<Root>/Read Parameter'

  // Product: '<Root>/Divide'
  px4demo_Read_Parameter_B.Divide = px4demo_Read_Parameter_B.x /
    px4demo_Read_Parameter_B.ReadParameter_o1;

  // Sum: '<Root>/Add'
  px4demo_Read_Parameter_B.Add = px4demo_Read_Parameter_B.Divide +
    px4demo_Read_Parameter_B.ReadParameter3_o1;

  // External mode
  rtExtModeUploadCheckTrigger(1);

  {                                    // Sample time: [0.004s, 0.0s]
    rtExtModeUpload(0, (real_T)px4demo_Read_Parameter_M->Timing.taskTime0);
  }

  // signal main to stop simulation
  {                                    // Sample time: [0.004s, 0.0s]
    if ((rtmGetTFinal(px4demo_Read_Parameter_M)!=-1) &&
        !((rtmGetTFinal(px4demo_Read_Parameter_M)-
           px4demo_Read_Parameter_M->Timing.taskTime0) >
          px4demo_Read_Parameter_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(px4demo_Read_Parameter_M, "Simulation finished");
    }

    if (rtmGetStopRequested(px4demo_Read_Parameter_M)) {
      rtmSetErrorStatus(px4demo_Read_Parameter_M, "Simulation finished");
    }
  }

  // Update absolute time for base rate
  // The "clockTick0" counts the number of times the code of this task has
  //  been executed. The absolute time is the multiplication of "clockTick0"
  //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
  //  overflow during the application lifespan selected.

  px4demo_Read_Parameter_M->Timing.taskTime0 =
    ((time_T)(++px4demo_Read_Parameter_M->Timing.clockTick0)) *
    px4demo_Read_Parameter_M->Timing.stepSize0;
}

// Model initialize function
void px4demo_Read_Parameter_initialize(void)
{
  // Registration code

  // initialize non-finites
  rt_InitInfAndNaN(sizeof(real_T));

  // non-finite (run-time) assignments
  px4demo_Read_Parameter_P.ReadParameter_SampleTime = rtInf;
  px4demo_Read_Parameter_P.ReadParameter1_SampleTime = rtInf;
  px4demo_Read_Parameter_P.ReadParameter2_SampleTime = rtInf;
  px4demo_Read_Parameter_P.ReadParameter3_SampleTime = rtInf;
  px4demo_Read_Parameter_P.ReadParameter4_SampleTime = rtInf;
  px4demo_Read_Parameter_P.ReadParameter5_SampleTime = rtInf;
  rtmSetTFinal(px4demo_Read_Parameter_M, -1);
  px4demo_Read_Parameter_M->Timing.stepSize0 = 0.004;

  // External mode info
  px4demo_Read_Parameter_M->Sizes.checksums[0] = (3208043641U);
  px4demo_Read_Parameter_M->Sizes.checksums[1] = (2338980058U);
  px4demo_Read_Parameter_M->Sizes.checksums[2] = (3334027643U);
  px4demo_Read_Parameter_M->Sizes.checksums[3] = (1610897292U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[9];
    px4demo_Read_Parameter_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = (sysRanDType *)
      &px4demo_Read_Parameter_DW.EnabledSubsystem_SubsysRanBC;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = &rtAlwaysEnabled;
    systemRan[5] = &rtAlwaysEnabled;
    systemRan[6] = &rtAlwaysEnabled;
    systemRan[7] = &rtAlwaysEnabled;
    systemRan[8] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(px4demo_Read_Parameter_M->extModeInfo,
      &px4demo_Read_Parameter_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(px4demo_Read_Parameter_M->extModeInfo,
                        px4demo_Read_Parameter_M->Sizes.checksums);
    rteiSetTPtr(px4demo_Read_Parameter_M->extModeInfo, rtmGetTPtr
                (px4demo_Read_Parameter_M));
  }

  // block I/O
  (void) memset((static_cast<void *>(&px4demo_Read_Parameter_B)), 0,
                sizeof(B_px4demo_Read_Parameter_T));

  // states (dwork)
  (void) memset(static_cast<void *>(&px4demo_Read_Parameter_DW), 0,
                sizeof(DW_px4demo_Read_Parameter_T));

  // data type transition information
  {
    static DataTypeTransInfo dtInfo;
    px4demo_Read_Parameter_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 20;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    // Block I/O transition table
    dtInfo.BTransTable = &rtBTransTable;

    // Parameters transition table
    dtInfo.PTransTable = &rtPTransTable;
  }

  {
    static const char_T tmp[16] = { 'C', 'A', 'L', '_', 'G', 'Y', 'R', 'O', '0',
      '_', 'Z', 'S', 'C', 'A', 'L', 'E' };

    static const char_T tmp_3[16] = { 'C', 'A', 'L', '_', 'G', 'Y', 'R', 'O',
      '0', '_', 'Y', 'S', 'C', 'A', 'L', 'E' };

    static const char_T tmp_4[16] = { 'C', 'A', 'L', '_', 'G', 'Y', 'R', 'O',
      '0', '_', 'X', 'S', 'C', 'A', 'L', 'E' };

    static const char_T tmp_0[14] = { 'C', 'A', 'L', '_', 'G', 'Y', 'R', 'O',
      '0', '_', 'Z', 'O', 'F', 'F' };

    static const char_T tmp_1[14] = { 'C', 'A', 'L', '_', 'G', 'Y', 'R', 'O',
      '0', '_', 'X', 'O', 'F', 'F' };

    static const char_T tmp_2[14] = { 'C', 'A', 'L', '_', 'G', 'Y', 'R', 'O',
      '0', '_', 'Y', 'O', 'F', 'F' };

    px4_internal_block_ParameterU_T *obj;
    real_T sts;
    int32_T i;
    char_T ParameterNameStr[17];
    char_T ParameterNameStr_0[15];

    // SystemInitialize for Enabled SubSystem: '<S2>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S3>/Out1' incorporates:
    //   Inport: '<S3>/In1'

    px4demo_Read_Parameter_B.In1 = px4demo_Read_Parameter_P.Out1_Y0;

    // End of SystemInitialize for SubSystem: '<S2>/Enabled Subsystem'

    // Start for MATLABSystem: '<S2>/SourceBlock'
    px4demo_Read_Parameter_DW.obj_an.matlabCodegenIsDeleted = false;
    px4demo_Read_Parameter_DW.obj_an.isSetupComplete = false;
    px4demo_Read_Parameter_DW.obj_an.isInitialized = 1;
    px4demo_Read_Parameter_DW.obj_an.orbMetadataObj = ORB_ID(sensor_gyro);
    uORB_read_initialize(px4demo_Read_Parameter_DW.obj_an.orbMetadataObj,
                         &px4demo_Read_Parameter_DW.obj_an.eventStructObj);
    px4demo_Read_Parameter_DW.obj_an.isSetupComplete = true;

    // Start for MATLABSystem: '<Root>/Read Parameter2'
    px4demo_Read_Parameter_DW.obj_b.matlabCodegenIsDeleted = true;
    px4demo_Read_Parameter_DW.obj_b.isInitialized = 0;
    px4demo_Read_Parameter_DW.obj_b.SampleTime = -1.0;
    px4demo_Read_Parameter_DW.obj_b.matlabCodegenIsDeleted = false;
    px4demo_Read_Parameter_DW.obj_b.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter2_SampleTime;
    obj = &px4demo_Read_Parameter_DW.obj_b;
    px4demo_Read_Parameter_DW.obj_b.isSetupComplete = false;
    px4demo_Read_Parameter_DW.obj_b.isInitialized = 1;
    for (i = 0; i < 16; i++) {
      ParameterNameStr[i] = tmp[i];
    }

    ParameterNameStr[16] = '\x00';
    if (px4demo_Read_Parameter_DW.obj_b.SampleTime == -1.0) {
      sts = 0.2;
    } else {
      sts = px4demo_Read_Parameter_DW.obj_b.SampleTime;
    }

    obj->MW_PARAMHANDLE = MW_Init_Param(&ParameterNameStr[0], true, sts * 1000.0);
    px4demo_Read_Parameter_DW.obj_b.isSetupComplete = true;

    // End of Start for MATLABSystem: '<Root>/Read Parameter2'

    // Start for MATLABSystem: '<Root>/Read Parameter5'
    px4demo_Read_Parameter_DW.obj.matlabCodegenIsDeleted = true;
    px4demo_Read_Parameter_DW.obj.isInitialized = 0;
    px4demo_Read_Parameter_DW.obj.SampleTime = -1.0;
    px4demo_Read_Parameter_DW.obj.matlabCodegenIsDeleted = false;
    px4demo_Read_Parameter_DW.obj.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter5_SampleTime;
    obj = &px4demo_Read_Parameter_DW.obj;
    px4demo_Read_Parameter_DW.obj.isSetupComplete = false;
    px4demo_Read_Parameter_DW.obj.isInitialized = 1;
    for (i = 0; i < 14; i++) {
      ParameterNameStr_0[i] = tmp_0[i];
    }

    ParameterNameStr_0[14] = '\x00';
    if (px4demo_Read_Parameter_DW.obj.SampleTime == -1.0) {
      sts = 0.2;
    } else {
      sts = px4demo_Read_Parameter_DW.obj.SampleTime;
    }

    obj->MW_PARAMHANDLE = MW_Init_Param(&ParameterNameStr_0[0], true, sts *
      1000.0);
    px4demo_Read_Parameter_DW.obj.isSetupComplete = true;

    // End of Start for MATLABSystem: '<Root>/Read Parameter5'

    // Start for MATLABSystem: '<Root>/Read Parameter3'
    px4demo_Read_Parameter_DW.obj_d.matlabCodegenIsDeleted = true;
    px4demo_Read_Parameter_DW.obj_d.isInitialized = 0;
    px4demo_Read_Parameter_DW.obj_d.SampleTime = -1.0;
    px4demo_Read_Parameter_DW.obj_d.matlabCodegenIsDeleted = false;
    px4demo_Read_Parameter_DW.obj_d.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter3_SampleTime;
    obj = &px4demo_Read_Parameter_DW.obj_d;
    px4demo_Read_Parameter_DW.obj_d.isSetupComplete = false;
    px4demo_Read_Parameter_DW.obj_d.isInitialized = 1;
    for (i = 0; i < 14; i++) {
      ParameterNameStr_0[i] = tmp_1[i];
    }

    ParameterNameStr_0[14] = '\x00';
    if (px4demo_Read_Parameter_DW.obj_d.SampleTime == -1.0) {
      sts = 0.2;
    } else {
      sts = px4demo_Read_Parameter_DW.obj_d.SampleTime;
    }

    obj->MW_PARAMHANDLE = MW_Init_Param(&ParameterNameStr_0[0], true, sts *
      1000.0);
    px4demo_Read_Parameter_DW.obj_d.isSetupComplete = true;

    // End of Start for MATLABSystem: '<Root>/Read Parameter3'

    // Start for MATLABSystem: '<Root>/Read Parameter4'
    px4demo_Read_Parameter_DW.obj_a.matlabCodegenIsDeleted = true;
    px4demo_Read_Parameter_DW.obj_a.isInitialized = 0;
    px4demo_Read_Parameter_DW.obj_a.SampleTime = -1.0;
    px4demo_Read_Parameter_DW.obj_a.matlabCodegenIsDeleted = false;
    px4demo_Read_Parameter_DW.obj_a.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter4_SampleTime;
    obj = &px4demo_Read_Parameter_DW.obj_a;
    px4demo_Read_Parameter_DW.obj_a.isSetupComplete = false;
    px4demo_Read_Parameter_DW.obj_a.isInitialized = 1;
    for (i = 0; i < 14; i++) {
      ParameterNameStr_0[i] = tmp_2[i];
    }

    ParameterNameStr_0[14] = '\x00';
    if (px4demo_Read_Parameter_DW.obj_a.SampleTime == -1.0) {
      sts = 0.2;
    } else {
      sts = px4demo_Read_Parameter_DW.obj_a.SampleTime;
    }

    obj->MW_PARAMHANDLE = MW_Init_Param(&ParameterNameStr_0[0], true, sts *
      1000.0);
    px4demo_Read_Parameter_DW.obj_a.isSetupComplete = true;

    // End of Start for MATLABSystem: '<Root>/Read Parameter4'

    // Start for MATLABSystem: '<Root>/Read Parameter1'
    px4demo_Read_Parameter_DW.obj_h.matlabCodegenIsDeleted = true;
    px4demo_Read_Parameter_DW.obj_h.isInitialized = 0;
    px4demo_Read_Parameter_DW.obj_h.SampleTime = -1.0;
    px4demo_Read_Parameter_DW.obj_h.matlabCodegenIsDeleted = false;
    px4demo_Read_Parameter_DW.obj_h.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter1_SampleTime;
    obj = &px4demo_Read_Parameter_DW.obj_h;
    px4demo_Read_Parameter_DW.obj_h.isSetupComplete = false;
    px4demo_Read_Parameter_DW.obj_h.isInitialized = 1;
    for (i = 0; i < 16; i++) {
      ParameterNameStr[i] = tmp_3[i];
    }

    ParameterNameStr[16] = '\x00';
    if (px4demo_Read_Parameter_DW.obj_h.SampleTime == -1.0) {
      sts = 0.2;
    } else {
      sts = px4demo_Read_Parameter_DW.obj_h.SampleTime;
    }

    obj->MW_PARAMHANDLE = MW_Init_Param(&ParameterNameStr[0], true, sts * 1000.0);
    px4demo_Read_Parameter_DW.obj_h.isSetupComplete = true;

    // End of Start for MATLABSystem: '<Root>/Read Parameter1'

    // Start for MATLABSystem: '<Root>/Read Parameter'
    px4demo_Read_Parameter_DW.obj_k.matlabCodegenIsDeleted = true;
    px4demo_Read_Parameter_DW.obj_k.isInitialized = 0;
    px4demo_Read_Parameter_DW.obj_k.SampleTime = -1.0;
    px4demo_Read_Parameter_DW.obj_k.matlabCodegenIsDeleted = false;
    px4demo_Read_Parameter_DW.obj_k.SampleTime =
      px4demo_Read_Parameter_P.ReadParameter_SampleTime;
    obj = &px4demo_Read_Parameter_DW.obj_k;
    px4demo_Read_Parameter_DW.obj_k.isSetupComplete = false;
    px4demo_Read_Parameter_DW.obj_k.isInitialized = 1;
    for (i = 0; i < 16; i++) {
      ParameterNameStr[i] = tmp_4[i];
    }

    ParameterNameStr[16] = '\x00';
    if (px4demo_Read_Parameter_DW.obj_k.SampleTime == -1.0) {
      sts = 0.2;
    } else {
      sts = px4demo_Read_Parameter_DW.obj_k.SampleTime;
    }

    obj->MW_PARAMHANDLE = MW_Init_Param(&ParameterNameStr[0], true, sts * 1000.0);
    px4demo_Read_Parameter_DW.obj_k.isSetupComplete = true;

    // End of Start for MATLABSystem: '<Root>/Read Parameter'
  }
}

// Model terminate function
void px4demo_Read_Parameter_terminate(void)
{
  // Terminate for MATLABSystem: '<S2>/SourceBlock'
  if (!px4demo_Read_Parameter_DW.obj_an.matlabCodegenIsDeleted) {
    px4demo_Read_Parameter_DW.obj_an.matlabCodegenIsDeleted = true;
    if ((px4demo_Read_Parameter_DW.obj_an.isInitialized == 1) &&
        px4demo_Read_Parameter_DW.obj_an.isSetupComplete) {
      uORB_read_terminate(&px4demo_Read_Parameter_DW.obj_an.eventStructObj);
    }
  }

  // End of Terminate for MATLABSystem: '<S2>/SourceBlock'

  // Terminate for MATLABSystem: '<Root>/Read Parameter2'
  if (!px4demo_Read_Parameter_DW.obj_b.matlabCodegenIsDeleted) {
    px4demo_Read_Parameter_DW.obj_b.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Read Parameter2'

  // Terminate for MATLABSystem: '<Root>/Read Parameter5'
  if (!px4demo_Read_Parameter_DW.obj.matlabCodegenIsDeleted) {
    px4demo_Read_Parameter_DW.obj.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Read Parameter5'

  // Terminate for MATLABSystem: '<Root>/Read Parameter3'
  if (!px4demo_Read_Parameter_DW.obj_d.matlabCodegenIsDeleted) {
    px4demo_Read_Parameter_DW.obj_d.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Read Parameter3'

  // Terminate for MATLABSystem: '<Root>/Read Parameter4'
  if (!px4demo_Read_Parameter_DW.obj_a.matlabCodegenIsDeleted) {
    px4demo_Read_Parameter_DW.obj_a.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Read Parameter4'

  // Terminate for MATLABSystem: '<Root>/Read Parameter1'
  if (!px4demo_Read_Parameter_DW.obj_h.matlabCodegenIsDeleted) {
    px4demo_Read_Parameter_DW.obj_h.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Read Parameter1'

  // Terminate for MATLABSystem: '<Root>/Read Parameter'
  if (!px4demo_Read_Parameter_DW.obj_k.matlabCodegenIsDeleted) {
    px4demo_Read_Parameter_DW.obj_k.matlabCodegenIsDeleted = true;
  }

  // End of Terminate for MATLABSystem: '<Root>/Read Parameter'
}

//
// File trailer for generated code.
//
// [EOF]
//
