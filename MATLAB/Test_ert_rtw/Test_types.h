//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: Test_types.h
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
#ifndef RTW_HEADER_Test_types_h_
#define RTW_HEADER_Test_types_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#include <uORB/topics/actuator_outputs.h>

// Model Code Variants
#ifndef struct_tag_JPDJ9VGFsZQU7p4XjTW5PH
#define struct_tag_JPDJ9VGFsZQU7p4XjTW5PH

struct tag_JPDJ9VGFsZQU7p4XjTW5PH
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  int pwmDevHandler;
  const char * pwmDevObj;
  unsigned int servoCount;
  int channelMask;
  boolean_T isMain;
  uint16_T errorStatus;
  orb_advert_t armAdvertiseObj;
  orb_advert_t actuatorAdvertiseObj;
  boolean_T isArmed;
};

#endif                                 //struct_tag_JPDJ9VGFsZQU7p4XjTW5PH

#ifndef typedef_px4_internal_block_PWM_Test_T
#define typedef_px4_internal_block_PWM_Test_T

typedef tag_JPDJ9VGFsZQU7p4XjTW5PH px4_internal_block_PWM_Test_T;

#endif                                 //typedef_px4_internal_block_PWM_Test_T

#ifndef struct_tag_YgA2umAxY1QaUdNJg8JkbB
#define struct_tag_YgA2umAxY1QaUdNJg8JkbB

struct tag_YgA2umAxY1QaUdNJg8JkbB
{
  int32_T __dummy;
};

#endif                                 //struct_tag_YgA2umAxY1QaUdNJg8JkbB

#ifndef typedef_e_px4_internal_block_SampleTi_T
#define typedef_e_px4_internal_block_SampleTi_T

typedef tag_YgA2umAxY1QaUdNJg8JkbB e_px4_internal_block_SampleTi_T;

#endif                                 //typedef_e_px4_internal_block_SampleTi_T

#ifndef struct_tag_b7Prt6FPM0T5j3THBzNIjG
#define struct_tag_b7Prt6FPM0T5j3THBzNIjG

struct tag_b7Prt6FPM0T5j3THBzNIjG
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  e_px4_internal_block_SampleTi_T SampleTimeHandler;
  pollfd_t eventStructObj;
  orb_metadata_t * orbMetadataObj;
};

#endif                                 //struct_tag_b7Prt6FPM0T5j3THBzNIjG

#ifndef typedef_px4_internal_block_Subscriber_T
#define typedef_px4_internal_block_Subscriber_T

typedef tag_b7Prt6FPM0T5j3THBzNIjG px4_internal_block_Subscriber_T;

#endif                                 //typedef_px4_internal_block_Subscriber_T

// Parameters (default storage)
typedef struct P_Test_T_ P_Test_T;

// Forward declaration for rtModel
typedef struct tag_RTM_Test_T RT_MODEL_Test_T;

#endif                                 // RTW_HEADER_Test_types_h_

//
// File trailer for generated code.
//
// [EOF]
//
