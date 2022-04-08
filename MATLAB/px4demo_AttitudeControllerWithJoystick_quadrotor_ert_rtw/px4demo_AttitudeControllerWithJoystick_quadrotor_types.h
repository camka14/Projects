//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_AttitudeControllerWithJoystick_quadrotor_types.h
//
// Code generated for Simulink model 'px4demo_AttitudeControllerWithJoystick_quadrotor'.
//
// Model version                  : 1.19
// Simulink Coder version         : 9.4 (R2020b) 29-Jul-2020
// C/C++ source code generated on : Wed Sep  1 14:42:46 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM Cortex
// Code generation objectives: Unspecified
// Validation result: Not run
//
#ifndef RTW_HEADER_px4demo_AttitudeControllerWithJoystick_quadrotor_types_h_
#define RTW_HEADER_px4demo_AttitudeControllerWithJoystick_quadrotor_types_h_
#include "rtwtypes.h"
#include <uORB/topics/actuator_armed.h>
#include <uORB/topics/vehicle_odometry.h>
#include <uORB/topics/manual_control_setpoint.h>

// Model Code Variants
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

#ifndef struct_tag_eDcrHY7lOcUxDQxCboL0iC
#define struct_tag_eDcrHY7lOcUxDQxCboL0iC

struct tag_eDcrHY7lOcUxDQxCboL0iC
{
  boolean_T matlabCodegenIsDeleted;
  int32_T isInitialized;
  boolean_T isSetupComplete;
  orb_advert_t orbAdvertiseObj;
  orb_metadata_t * orbMetadataObj;
};

#endif                                 //struct_tag_eDcrHY7lOcUxDQxCboL0iC

#ifndef typedef_px4_internal_block_Publisher__T
#define typedef_px4_internal_block_Publisher__T

typedef tag_eDcrHY7lOcUxDQxCboL0iC px4_internal_block_Publisher__T;

#endif                                 //typedef_px4_internal_block_Publisher__T

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

#ifndef typedef_px4_internal_block_PWM_px4dem_T
#define typedef_px4_internal_block_PWM_px4dem_T

typedef tag_JPDJ9VGFsZQU7p4XjTW5PH px4_internal_block_PWM_px4dem_T;

#endif                                 //typedef_px4_internal_block_PWM_px4dem_T

// Parameters (default storage)
typedef struct P_px4demo_AttitudeControllerW_T_ P_px4demo_AttitudeControllerW_T;

// Forward declaration for rtModel
typedef struct tag_RTM_px4demo_AttitudeContr_T RT_MODEL_px4demo_AttitudeCont_T;

#endif  // RTW_HEADER_px4demo_AttitudeControllerWithJoystick_quadrotor_types_h_

//
// File trailer for generated code.
//
// [EOF]
//
