//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_top_model_pil.h
//
// Code generated for Simulink model 'px4demo_top_model_pil'.
//
// Model version                  : 2.0
// Simulink Coder version         : 9.4 (R2020b) 29-Jul-2020
// C/C++ source code generated on : Tue Aug 31 08:48:50 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM Cortex
// Code generation objectives: Unspecified
// Validation result: Not run
//
#ifndef RTW_HEADER_px4demo_top_model_pil_h_
#define RTW_HEADER_px4demo_top_model_pil_h_
#include <stddef.h>
#include "rtwtypes.h"
#include "rtw_continuous.h"
#include "rtw_solver.h"
#include "px4demo_top_model_pil_types.h"

// Macros for accessing real-time model data structure
#ifndef rtmGetErrorStatus
#define rtmGetErrorStatus(rtm)         ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
#define rtmSetErrorStatus(rtm, val)    ((rtm)->errorStatus = (val))
#endif

#define px4demo_top_model_pil_M        (rtM)

// External inputs (root inport signals with default storage)
typedef struct {
  boolean_T ticks_to_count;            // '<Root>/ticks_to_count'
  boolean_T reset;                     // '<Root>/reset'
  boolean_T counter_mode;              // '<Root>/counter_mode'
  boolean_T count_enable;              // '<Root>/count_enable'
} ExternalInputs;

// External outputs (root outports fed by signals with default storage)
typedef struct {
  uint8_T count_a;                     // '<Root>/count_a'
  uint8_T count_b;                     // '<Root>/count_b'
} ExternalOutputs;

// Parameters (default storage)
struct Parameters_ {
  uint8_T countLower;                  // Variable: countLower
                                          //  Referenced by: '<S1>/C1'

  uint8_T countUpper;                  // Variable: countUpper
                                          //  Referenced by: '<S1>/C5'

  uint8_T count_Y0;                    // Computed Parameter: count_Y0
                                          //  Referenced by: '<S1>/count'

  uint8_T PreviousOutput_InitialCondition;
                          // Computed Parameter: PreviousOutput_InitialCondition
                             //  Referenced by: '<S1>/Previous Output'

  uint8_T C1_Value;                    // Computed Parameter: C1_Value
                                          //  Referenced by: '<S2>/C1'

  uint8_T count_Y0_d;                  // Computed Parameter: count_Y0_d
                                          //  Referenced by: '<S2>/count'

  uint8_T PreviousOutput_InitialConditi_m;
                          // Computed Parameter: PreviousOutput_InitialConditi_m
                             //  Referenced by: '<S2>/Previous Output'

};

// Real-time Model Data Structure
struct tag_RTM {
  const char_T *errorStatus;
};

// Block parameters (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern Parameters rtP;

#ifdef __cplusplus

}
#endif

#ifdef __cplusplus

extern "C" {

#endif

  // External inputs (root inport signals with default storage)
  extern ExternalInputs rtU;

  // External outputs (root outports fed by signals with default storage)
  extern ExternalOutputs rtY;

#ifdef __cplusplus

}
#endif

#ifdef __cplusplus

extern "C" {

#endif

  // Model entry point functions
  extern void px4demo_top_model_pil_initialize(void);
  extern void px4demo_top_model_pil_step(void);

#ifdef __cplusplus

}
#endif

// Real-time Model object
#ifdef __cplusplus

extern "C" {

#endif

  extern RT_MODEL *const rtM;

#ifdef __cplusplus

}
#endif

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
//  '<Root>' : 'px4demo_top_model_pil'
//  '<S1>'   : 'px4demo_top_model_pil/CounterTypeA'
//  '<S2>'   : 'px4demo_top_model_pil/CounterTypeB'

#endif                                 // RTW_HEADER_px4demo_top_model_pil_h_

//
// File trailer for generated code.
//
// [EOF]
//
