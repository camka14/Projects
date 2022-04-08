//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: untitled.cpp
//
// Code generated for Simulink model 'untitled'.
//
// Model version                  : 1.0
// Simulink Coder version         : 9.4 (R2020b) 29-Jul-2020
// C/C++ source code generated on : Tue Jul 20 19:15:36 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM Cortex
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "untitled.h"
#include "untitled_private.h"
#include "untitled_dt.h"

// Block signals (default storage)
B_untitled_T untitled_B;

// Block states (default storage)
DW_untitled_T untitled_DW;

// Real-time model
RT_MODEL_untitled_T untitled_M_ = RT_MODEL_untitled_T();
RT_MODEL_untitled_T *const untitled_M = &untitled_M_;

// Model step function
void untitled_step(void)
{
  int32_T i;
  boolean_T b_varargout_1;

  // Reset subsysRan breadcrumbs
  srClearBC(untitled_DW.EnabledSubsystem_SubsysRanBC);

  // MATLABSystem: '<S2>/SourceBlock' incorporates:
  //   Inport: '<S3>/In1'

  b_varargout_1 = uORB_read_step(untitled_DW.obj.orbMetadataObj,
    &untitled_DW.obj.eventStructObj, &untitled_B.b_varargout_2, false, 1.0);

  // Outputs for Enabled SubSystem: '<S2>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S3>/Enable'

  if (b_varargout_1) {
    untitled_B.In1 = untitled_B.b_varargout_2;
    srUpdateBC(untitled_DW.EnabledSubsystem_SubsysRanBC);
  }

  // End of MATLABSystem: '<S2>/SourceBlock'
  // End of Outputs for SubSystem: '<S2>/Enabled Subsystem'
  for (i = 0; i < 12; i++) {
    // SignalConversion generated from: '<S1>/Bus Selector'
    untitled_B.channel_value[i] = untitled_B.In1.channel_value[i];
  }

  // External mode
  rtExtModeUploadCheckTrigger(1);

  {                                    // Sample time: [0.001s, 0.0s]
    rtExtModeUpload(0, (real_T)untitled_M->Timing.taskTime0);
  }

  // signal main to stop simulation
  {                                    // Sample time: [0.001s, 0.0s]
    if ((rtmGetTFinal(untitled_M)!=-1) &&
        !((rtmGetTFinal(untitled_M)-untitled_M->Timing.taskTime0) >
          untitled_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(untitled_M, "Simulation finished");
    }

    if (rtmGetStopRequested(untitled_M)) {
      rtmSetErrorStatus(untitled_M, "Simulation finished");
    }
  }

  // Update absolute time for base rate
  // The "clockTick0" counts the number of times the code of this task has
  //  been executed. The absolute time is the multiplication of "clockTick0"
  //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
  //  overflow during the application lifespan selected.

  untitled_M->Timing.taskTime0 =
    ((time_T)(++untitled_M->Timing.clockTick0)) * untitled_M->Timing.stepSize0;
}

// Model initialize function
void untitled_initialize(void)
{
  // Registration code
  rtmSetTFinal(untitled_M, -1);
  untitled_M->Timing.stepSize0 = 0.001;

  // External mode info
  untitled_M->Sizes.checksums[0] = (2964544271U);
  untitled_M->Sizes.checksums[1] = (2300585249U);
  untitled_M->Sizes.checksums[2] = (2247288057U);
  untitled_M->Sizes.checksums[3] = (2777683199U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[3];
    untitled_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = (sysRanDType *)&untitled_DW.EnabledSubsystem_SubsysRanBC;
    systemRan[2] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(untitled_M->extModeInfo,
      &untitled_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(untitled_M->extModeInfo, untitled_M->Sizes.checksums);
    rteiSetTPtr(untitled_M->extModeInfo, rtmGetTPtr(untitled_M));
  }

  // data type transition information
  {
    static DataTypeTransInfo dtInfo;
    untitled_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 19;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    // Block I/O transition table
    dtInfo.BTransTable = &rtBTransTable;

    // Parameters transition table
    dtInfo.PTransTable = &rtPTransTable;
  }

  // SystemInitialize for Enabled SubSystem: '<S2>/Enabled Subsystem'
  // SystemInitialize for Outport: '<S3>/Out1' incorporates:
  //   Inport: '<S3>/In1'

  untitled_B.In1 = untitled_P.Out1_Y0;

  // End of SystemInitialize for SubSystem: '<S2>/Enabled Subsystem'

  // Start for MATLABSystem: '<S2>/SourceBlock'
  untitled_DW.obj.matlabCodegenIsDeleted = false;
  untitled_DW.obj.isSetupComplete = false;
  untitled_DW.obj.isInitialized = 1;
  untitled_DW.obj.orbMetadataObj = ORB_ID(adc_report);
  uORB_read_initialize(untitled_DW.obj.orbMetadataObj,
                       &untitled_DW.obj.eventStructObj);
  untitled_DW.obj.isSetupComplete = true;
}

// Model terminate function
void untitled_terminate(void)
{
  // Terminate for MATLABSystem: '<S2>/SourceBlock'
  if (!untitled_DW.obj.matlabCodegenIsDeleted) {
    untitled_DW.obj.matlabCodegenIsDeleted = true;
    if ((untitled_DW.obj.isInitialized == 1) && untitled_DW.obj.isSetupComplete)
    {
      uORB_read_terminate(&untitled_DW.obj.eventStructObj);
    }
  }

  // End of Terminate for MATLABSystem: '<S2>/SourceBlock'
}

//
// File trailer for generated code.
//
// [EOF]
//
