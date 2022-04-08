//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_Read_Parameter.h
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
#ifndef RTW_HEADER_px4demo_Read_Parameter_h_
#define RTW_HEADER_px4demo_Read_Parameter_h_
#include <float.h>
#include <string.h>
#include <stddef.h>
#include <poll.h>
#include <uORB/uORB.h>
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "dt_info.h"
#include "ext_work.h"
#include "MW_uORB_Read.h"
#include "MW_Parameter.h"
#include "MW_ParameterRead.h"
#include "px4demo_Read_Parameter_types.h"

// Shared type includes
#include "multiword_types.h"
#include "rtGetInf.h"
#include "rt_nonfinite.h"

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
  px4_Bus_sensor_gyro In1;             // '<S3>/In1'
  px4_Bus_sensor_gyro b_varargout_2;
  real32_T x;
  real32_T y;
  real32_T z;
  real32_T Divide2;                    // '<Root>/Divide2'
  real32_T Add2;                       // '<Root>/Add2'
  real32_T Divide1;                    // '<Root>/Divide1'
  real32_T Add1;                       // '<Root>/Add1'
  real32_T Divide;                     // '<Root>/Divide'
  real32_T Add;                        // '<Root>/Add'
  real32_T ReadParameter5_o1;          // '<Root>/Read Parameter5'
  real32_T ReadParameter4_o1;          // '<Root>/Read Parameter4'
  real32_T ReadParameter3_o1;          // '<Root>/Read Parameter3'
  real32_T ReadParameter_o1;           // '<Root>/Read Parameter'
  boolean_T ReadParameter_o2;          // '<Root>/Read Parameter'
} B_px4demo_Read_Parameter_T;

// Block states (default storage) for system '<Root>'
typedef struct {
  px4_internal_block_ParameterU_T obj; // '<Root>/Read Parameter5'
  px4_internal_block_ParameterU_T obj_a;// '<Root>/Read Parameter4'
  px4_internal_block_ParameterU_T obj_d;// '<Root>/Read Parameter3'
  px4_internal_block_ParameterU_T obj_b;// '<Root>/Read Parameter2'
  px4_internal_block_ParameterU_T obj_h;// '<Root>/Read Parameter1'
  px4_internal_block_ParameterU_T obj_k;// '<Root>/Read Parameter'
  px4_internal_block_Subscriber_T obj_an;// '<S2>/SourceBlock'
  struct {
    void *LoggedData[2];
  } Scope_PWORK;                       // '<Root>/Scope'

  int8_T EnabledSubsystem_SubsysRanBC; // '<S2>/Enabled Subsystem'
} DW_px4demo_Read_Parameter_T;

// Parameters (default storage)
struct P_px4demo_Read_Parameter_T_ {
  px4_Bus_sensor_gyro Out1_Y0;         // Computed Parameter: Out1_Y0
                                          //  Referenced by: '<S3>/Out1'

  px4_Bus_sensor_gyro Constant_Value;  // Computed Parameter: Constant_Value
                                          //  Referenced by: '<S2>/Constant'

  real_T ReadParameter_SampleTime;     // Expression: inf
                                          //  Referenced by: '<Root>/Read Parameter'

  real_T ReadParameter1_SampleTime;    // Expression: inf
                                          //  Referenced by: '<Root>/Read Parameter1'

  real_T ReadParameter2_SampleTime;    // Expression: inf
                                          //  Referenced by: '<Root>/Read Parameter2'

  real_T ReadParameter3_SampleTime;    // Expression: inf
                                          //  Referenced by: '<Root>/Read Parameter3'

  real_T ReadParameter4_SampleTime;    // Expression: inf
                                          //  Referenced by: '<Root>/Read Parameter4'

  real_T ReadParameter5_SampleTime;    // Expression: inf
                                          //  Referenced by: '<Root>/Read Parameter5'

};

// Real-time Model Data Structure
struct tag_RTM_px4demo_Read_Paramete_T {
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

  extern P_px4demo_Read_Parameter_T px4demo_Read_Parameter_P;

#ifdef __cplusplus

}
#endif

// Block signals (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern B_px4demo_Read_Parameter_T px4demo_Read_Parameter_B;

#ifdef __cplusplus

}
#endif

// Block states (default storage)
extern DW_px4demo_Read_Parameter_T px4demo_Read_Parameter_DW;

#ifdef __cplusplus

extern "C" {

#endif

  // Model entry point functions
  extern void px4demo_Read_Parameter_initialize(void);
  extern void px4demo_Read_Parameter_step(void);
  extern void px4demo_Read_Parameter_terminate(void);

#ifdef __cplusplus

}
#endif

// Real-time Model object
#ifdef __cplusplus

extern "C" {

#endif

  extern RT_MODEL_px4demo_Read_Paramet_T *const px4demo_Read_Parameter_M;

#ifdef __cplusplus

}
#endif

//-
//  These blocks were eliminated from the model due to optimizations:
//
//  Block '<S2>/NOT' : Unused code path elimination


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
//  '<Root>' : 'px4demo_Read_Parameter'
//  '<S1>'   : 'px4demo_Read_Parameter/Gyroscope'
//  '<S2>'   : 'px4demo_Read_Parameter/Gyroscope/PX4 uORB Read'
//  '<S3>'   : 'px4demo_Read_Parameter/Gyroscope/PX4 uORB Read/Enabled Subsystem'

#endif                                 // RTW_HEADER_px4demo_Read_Parameter_h_

//
// File trailer for generated code.
//
// [EOF]
//
