//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: Test.h
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
#ifndef RTW_HEADER_Test_h_
#define RTW_HEADER_Test_h_
#include <string.h>
#include <float.h>
#include <stddef.h>
#include <poll.h>
#include <uORB/uORB.h>
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "dt_info.h"
#include "ext_work.h"
#include "MW_PX4_PWM.h"
#include "MW_uORB_Read.h"
#include "Test_types.h"

// Shared type includes
#include "multiword_types.h"

// Macros for accessing real-time model data structure
#ifndef rtmGetFinalTime
#define rtmGetFinalTime(rtm)           ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetRTWExtModeInfo
#define rtmGetRTWExtModeInfo(rtm)      ((rtm)->extModeInfo)
#endif

#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#ifndef rtmGetStopRequested
#define rtmGetStopRequested(rtm)       ((rtm)->Timing.stopRequestedFlag)
#endif

#ifndef rtmSetStopRequested
#define rtmSetStopRequested(rtm, val)  ((rtm)->Timing.stopRequestedFlag = (val))
#endif

#ifndef rtmGetStopRequestedPtr
#define rtmGetStopRequestedPtr(rtm)    (&((rtm)->Timing.stopRequestedFlag))
#endif

#ifndef rtmGetT
#define rtmGetT(rtm)                   ((rtm)->Timing.taskTime0)
#endif

#ifndef rtmGetTFinal
#define rtmGetTFinal(rtm)              ((rtm)->Timing.tFinal)
#endif

#ifndef rtmGetTPtr
#define rtmGetTPtr(rtm)                (&(rtm)->Timing.taskTime0)
#endif

// Block signals (default storage)
typedef struct {
  px4_Bus_actuator_outputs In1;        // '<S2>/In1'
  px4_Bus_actuator_outputs b_varargout_2;
  real32_T output[16];
} B_Test_T;

// Block states (default storage) for system '<Root>'
typedef struct {
  px4_internal_block_PWM_Test_T obj;   // '<Root>/PX4 PWM Output'
  px4_internal_block_Subscriber_T obj_e;// '<S1>/SourceBlock'
  int8_T EnabledSubsystem_SubsysRanBC; // '<S1>/Enabled Subsystem'
} DW_Test_T;

// Parameters (default storage)
struct P_Test_T_ {
  px4_Bus_actuator_outputs Out1_Y0;    // Computed Parameter: Out1_Y0
                                          //  Referenced by: '<S2>/Out1'

  px4_Bus_actuator_outputs Constant_Value;// Computed Parameter: Constant_Value
                                             //  Referenced by: '<S1>/Constant'

  uint16_T Constant8_Value;            // Computed Parameter: Constant8_Value
                                          //  Referenced by: '<Root>/Constant8'

  uint16_T Constant9_Value;            // Computed Parameter: Constant9_Value
                                          //  Referenced by: '<Root>/Constant9'

  boolean_T Constant_Value_c;          // Computed Parameter: Constant_Value_c
                                          //  Referenced by: '<Root>/Constant'

  boolean_T Constant1_Value;           // Computed Parameter: Constant1_Value
                                          //  Referenced by: '<Root>/Constant1'

};

// Real-time Model Data Structure
struct tag_RTM_Test_T {
  const char_T *errorStatus;
  RTWExtModeInfo *extModeInfo;

  //
  //  Sizes:
  //  The following substructure contains sizes information
  //  for many of the model attributes such as inputs, outputs,
  //  dwork, sample times, etc.

  struct {
    uint32_T checksums[4];
  } Sizes;

  //
  //  SpecialInfo:
  //  The following substructure contains special information
  //  related to other components that are dependent on RTW.

  struct {
    const void *mappingInfo;
  } SpecialInfo;

  //
  //  Timing:
  //  The following substructure contains information regarding
  //  the timing information for the model.

  struct {
    time_T taskTime0;
    uint32_T clockTick0;
    time_T stepSize0;
    time_T tFinal;
    boolean_T stopRequestedFlag;
  } Timing;
};

// Block parameters (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern P_Test_T Test_P;

#ifdef __cplusplus

}
#endif

// Block signals (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern B_Test_T Test_B;

#ifdef __cplusplus

}
#endif

// Block states (default storage)
extern DW_Test_T Test_DW;

#ifdef __cplusplus

extern "C" {

#endif

  // Model entry point functions
  extern void Test_initialize(void);
  extern void Test_step(void);
  extern void Test_terminate(void);

#ifdef __cplusplus

}
#endif

// Real-time Model object
#ifdef __cplusplus

extern "C" {

#endif

  extern RT_MODEL_Test_T *const Test_M;

#ifdef __cplusplus

}
#endif

//-
//  These blocks were eliminated from the model due to optimizations:
//
//  Block '<S1>/NOT' : Unused code path elimination


//-
//  The generated code includes comments that allow you to trace directly
//  back to the appropriate location in the model.  The basic format
//  is <system>/block_name, where system is the system number (uniquely
//  assigned by Simulink) and block_name is the name of the block.
//
//  Use the MATLAB hilite_system command to trace the generated code back
//  to the model.  For example,
//
//  hilite_system('<S3>')    - opens system 3
//  hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
//
//  Here is the system hierarchy for this model
//
//  '<Root>' : 'Test'
//  '<S1>'   : 'Test/PX4 uORB Read'
//  '<S2>'   : 'Test/PX4 uORB Read/Enabled Subsystem'

#endif                                 // RTW_HEADER_Test_h_

//
// File trailer for generated code.
//
// [EOF]
//
