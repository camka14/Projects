//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: Test.cpp
//
// Code generated for Simulink model 'Test'.
//
// Model version                  : 1.2
// Simulink Coder version         : 9.4 (R2020b) 29-Jul-2020
// C/C++ source code generated on : Tue Jul 20 20:33:29 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM Cortex
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "Test.h"
#include "Test_private.h"
#include "Test_dt.h"

// Block signals (default storage)
B_Test_T Test_B;

// Block states (default storage)
DW_Test_T Test_DW;

// Real-time model
RT_MODEL_Test_T Test_M_ = RT_MODEL_Test_T();
RT_MODEL_Test_T *const Test_M = &Test_M_;

// Forward declaration for local functions
static void Test_SystemCore_setup(px4_internal_block_PWM_Test_T *obj, boolean_T
  varargin_1, boolean_T varargin_2);
static void Test_SystemCore_setup(px4_internal_block_PWM_Test_T *obj, boolean_T
  varargin_1, boolean_T varargin_2)
{
  uint16_T status;
  obj->isSetupComplete = false;
  obj->isInitialized = 1;
  obj->isMain = true;
  obj->pwmDevObj = MW_PWM_OUTPUT_MAIN_DEVICE_PATH;
  status = pwm_open(&obj->pwmDevHandler, obj->pwmDevObj,
                    &obj->actuatorAdvertiseObj, &obj->armAdvertiseObj);
  obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  obj->servoCount = 0;
  status = pwm_getServoCount(&obj->pwmDevHandler, &obj->servoCount);
  obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  if (varargin_1) {
    status = pwm_arm(&obj->pwmDevHandler, &obj->armAdvertiseObj);
    obj->isArmed = true;
  } else {
    status = pwm_disarm(&obj->pwmDevHandler, &obj->armAdvertiseObj);
    obj->isArmed = false;
  }

  obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  status = pwm_setPWMRate(&obj->pwmDevHandler, obj->isMain);
  obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  obj->channelMask = 3;
  status = pwm_setChannelMask(&obj->pwmDevHandler, obj->channelMask);
  obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  status = pwm_setFailsafePWM(&obj->pwmDevHandler, obj->servoCount,
    obj->channelMask, obj->isMain);
  obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  status = pwm_setDisarmedPWM(&obj->pwmDevHandler, obj->servoCount,
    obj->channelMask, obj->isMain, &obj->actuatorAdvertiseObj);
  obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  if (obj->isMain) {
    status = pwm_forceFailsafe(&obj->pwmDevHandler, varargin_2);
    obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
    status = pwm_forceTerminateFailsafe(&obj->pwmDevHandler, false);
    obj->errorStatus = static_cast<uint16_T>(obj->errorStatus | status);
  }

  obj->isSetupComplete = true;
}

// Model step function
void Test_step(void)
{
  int32_T i;
  uint16_T b_pwmValue[8];
  uint16_T status;
  boolean_T b_varargout_1;

  // Reset subsysRan breadcrumbs
  srClearBC(Test_DW.EnabledSubsystem_SubsysRanBC);

  // MATLABSystem: '<S1>/SourceBlock' incorporates:
  //   Inport: '<S2>/In1'

  b_varargout_1 = uORB_read_step(Test_DW.obj_e.orbMetadataObj,
    &Test_DW.obj_e.eventStructObj, &Test_B.b_varargout_2, false, 1.0);

  // Outputs for Enabled SubSystem: '<S1>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S2>/Enable'

  if (b_varargout_1) {
    Test_B.In1 = Test_B.b_varargout_2;
    srUpdateBC(Test_DW.EnabledSubsystem_SubsysRanBC);
  }

  // End of MATLABSystem: '<S1>/SourceBlock'
  // End of Outputs for SubSystem: '<S1>/Enabled Subsystem'

  // SignalConversion generated from: '<Root>/Bus Selector'
  memcpy(&Test_B.output[0], &Test_B.In1.output[0], sizeof(real32_T) << 4U);

  // MATLABSystem: '<Root>/PX4 PWM Output' incorporates:
  //   Constant: '<Root>/Constant'
  //   Constant: '<Root>/Constant1'
  //   Constant: '<Root>/Constant8'
  //   Constant: '<Root>/Constant9'

  if (Test_P.Constant_Value_c) {
    if (!Test_DW.obj.isArmed) {
      Test_DW.obj.isArmed = true;
      status = pwm_arm(&Test_DW.obj.pwmDevHandler, &Test_DW.obj.armAdvertiseObj);
      Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
        status);
    }

    for (i = 0; i < 8; i++) {
      b_pwmValue[i] = 0U;
    }

    b_pwmValue[0] = Test_P.Constant8_Value;
    b_pwmValue[1] = Test_P.Constant9_Value;
    status = pwm_setServo(&Test_DW.obj.pwmDevHandler, Test_DW.obj.servoCount,
                          Test_DW.obj.channelMask, &b_pwmValue[0],
                          Test_DW.obj.isMain, &Test_DW.obj.actuatorAdvertiseObj);
    Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
      status);
  } else {
    status = pwm_disarm(&Test_DW.obj.pwmDevHandler, &Test_DW.obj.armAdvertiseObj);
    Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
      status);
    Test_DW.obj.isArmed = false;
    status = pwm_resetServo(&Test_DW.obj.pwmDevHandler, Test_DW.obj.servoCount,
      Test_DW.obj.channelMask, Test_DW.obj.isMain,
      &Test_DW.obj.actuatorAdvertiseObj);
    Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
      status);
  }

  if (Test_DW.obj.isMain) {
    status = pwm_forceFailsafe(&Test_DW.obj.pwmDevHandler,
      Test_P.Constant1_Value);
    Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
      status);
  }

  // End of MATLABSystem: '<Root>/PX4 PWM Output'

  // External mode
  rtExtModeUploadCheckTrigger(1);

  {                                    // Sample time: [0.001s, 0.0s]
    rtExtModeUpload(0, (real_T)Test_M->Timing.taskTime0);
  }

  // signal main to stop simulation
  {                                    // Sample time: [0.001s, 0.0s]
    if ((rtmGetTFinal(Test_M)!=-1) &&
        !((rtmGetTFinal(Test_M)-Test_M->Timing.taskTime0) >
          Test_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(Test_M, "Simulation finished");
    }

    if (rtmGetStopRequested(Test_M)) {
      rtmSetErrorStatus(Test_M, "Simulation finished");
    }
  }

  // Update absolute time for base rate
  // The "clockTick0" counts the number of times the code of this task has
  //  been executed. The absolute time is the multiplication of "clockTick0"
  //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
  //  overflow during the application lifespan selected.

  Test_M->Timing.taskTime0 =
    ((time_T)(++Test_M->Timing.clockTick0)) * Test_M->Timing.stepSize0;
}

// Model initialize function
void Test_initialize(void)
{
  // Registration code
  rtmSetTFinal(Test_M, -1);
  Test_M->Timing.stepSize0 = 0.001;

  // External mode info
  Test_M->Sizes.checksums[0] = (2143202674U);
  Test_M->Sizes.checksums[1] = (3353307570U);
  Test_M->Sizes.checksums[2] = (745532822U);
  Test_M->Sizes.checksums[3] = (2336353909U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[4];
    Test_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = &rtAlwaysEnabled;
    systemRan[2] = (sysRanDType *)&Test_DW.EnabledSubsystem_SubsysRanBC;
    systemRan[3] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(Test_M->extModeInfo,
      &Test_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(Test_M->extModeInfo, Test_M->Sizes.checksums);
    rteiSetTPtr(Test_M->extModeInfo, rtmGetTPtr(Test_M));
  }

  // data type transition information
  {
    static DataTypeTransInfo dtInfo;
    Test_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 20;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    // Block I/O transition table
    dtInfo.BTransTable = &rtBTransTable;

    // Parameters transition table
    dtInfo.PTransTable = &rtPTransTable;
  }

  // SystemInitialize for Enabled SubSystem: '<S1>/Enabled Subsystem'
  // SystemInitialize for Outport: '<S2>/Out1' incorporates:
  //   Inport: '<S2>/In1'

  Test_B.In1 = Test_P.Out1_Y0;

  // End of SystemInitialize for SubSystem: '<S1>/Enabled Subsystem'

  // Start for MATLABSystem: '<S1>/SourceBlock'
  Test_DW.obj_e.matlabCodegenIsDeleted = false;
  Test_DW.obj_e.isSetupComplete = false;
  Test_DW.obj_e.isInitialized = 1;
  Test_DW.obj_e.orbMetadataObj = ORB_ID(actuator_outputs);
  uORB_read_initialize(Test_DW.obj_e.orbMetadataObj,
                       &Test_DW.obj_e.eventStructObj);
  Test_DW.obj_e.isSetupComplete = true;

  // Start for MATLABSystem: '<Root>/PX4 PWM Output' incorporates:
  //   Constant: '<Root>/Constant'
  //   Constant: '<Root>/Constant1'

  Test_DW.obj.errorStatus = 0U;
  Test_DW.obj.isInitialized = 0;
  Test_DW.obj.matlabCodegenIsDeleted = false;
  Test_SystemCore_setup(&Test_DW.obj, Test_P.Constant_Value_c,
                        Test_P.Constant1_Value);
}

// Model terminate function
void Test_terminate(void)
{
  uint16_T status;

  // Terminate for MATLABSystem: '<S1>/SourceBlock'
  if (!Test_DW.obj_e.matlabCodegenIsDeleted) {
    Test_DW.obj_e.matlabCodegenIsDeleted = true;
    if ((Test_DW.obj_e.isInitialized == 1) && Test_DW.obj_e.isSetupComplete) {
      uORB_read_terminate(&Test_DW.obj_e.eventStructObj);
    }
  }

  // End of Terminate for MATLABSystem: '<S1>/SourceBlock'

  // Terminate for MATLABSystem: '<Root>/PX4 PWM Output'
  if (!Test_DW.obj.matlabCodegenIsDeleted) {
    Test_DW.obj.matlabCodegenIsDeleted = true;
    if ((Test_DW.obj.isInitialized == 1) && Test_DW.obj.isSetupComplete) {
      status = pwm_disarm(&Test_DW.obj.pwmDevHandler,
                          &Test_DW.obj.armAdvertiseObj);
      Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
        status);
      status = pwm_resetServo(&Test_DW.obj.pwmDevHandler, Test_DW.obj.servoCount,
        Test_DW.obj.channelMask, Test_DW.obj.isMain,
        &Test_DW.obj.actuatorAdvertiseObj);
      Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
        status);
      status = pwm_close(&Test_DW.obj.pwmDevHandler,
                         &Test_DW.obj.actuatorAdvertiseObj,
                         &Test_DW.obj.armAdvertiseObj);
      Test_DW.obj.errorStatus = static_cast<uint16_T>(Test_DW.obj.errorStatus |
        status);
    }
  }

  // End of Terminate for MATLABSystem: '<Root>/PX4 PWM Output'
}

//
// File trailer for generated code.
//
// [EOF]
//
