//
//  px4demo_PositionController_quadrotor_dt.h
//
//  Academic License - for use in teaching, academic research, and meeting
//  course requirements at degree granting institutions only.  Not for
//  government, commercial, or other organizational use.
//
//  Code generation for model "px4demo_PositionController_quadrotor".
//
//  Model version              : 1.60
//  Simulink Coder version : 9.4 (R2020b) 29-Jul-2020
//  C++ source code generated on : Sat Jul 24 18:58:25 2021
//
//  Target selection: ert.tlc
//  Embedded hardware selection: ARM Compatible->ARM Cortex
//  Code generation objectives: Unspecified
//  Validation result: Not run


#include "ext_types.h"

// data type size table
static uint_T rtDataTypeSizes[] = {
  sizeof(real_T),
  sizeof(real32_T),
  sizeof(int8_T),
  sizeof(uint8_T),
  sizeof(int16_T),
  sizeof(uint16_T),
  sizeof(int32_T),
  sizeof(uint32_T),
  sizeof(boolean_T),
  sizeof(fcn_call_T),
  sizeof(int_T),
  sizeof(pointer_T),
  sizeof(action_T),
  2*sizeof(uint32_T),
  sizeof(uint64_T),
  sizeof(px4_Bus_actuator_armed),
  sizeof(px4_Bus_vehicle_local_position),
  sizeof(px4_Bus_vehicle_attitude),
  sizeof(px4_internal_block_Subscriber_T),
  sizeof(px4_internal_block_Publisher__T),
  sizeof(px4_internal_block_PWM_px4dem_T),
  sizeof(int64_T),
  sizeof(uint64_T)
};

// data type name table
static const char_T * rtDataTypeNames[] = {
  "real_T",
  "real32_T",
  "int8_T",
  "uint8_T",
  "int16_T",
  "uint16_T",
  "int32_T",
  "uint32_T",
  "boolean_T",
  "fcn_call_T",
  "int_T",
  "pointer_T",
  "action_T",
  "timer_uint32_pair_T",
  "uint64_T",
  "px4_Bus_actuator_armed",
  "px4_Bus_vehicle_local_position",
  "px4_Bus_vehicle_attitude",
  "px4_internal_block_Subscriber_T",
  "px4_internal_block_Publisher__T",
  "px4_internal_block_PWM_px4dem_T",
  "int64_T",
  "uint64_T"
};

// data type transitions for block I/O structure
static DataTypeTransition rtBTransitions[] = {
  { (char_T *)(&px4demo_PositionController_qu_B.In1), 16, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_B.In1_o), 17, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_B.In1_j), 15, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_B.alt), 0, 0, 12 },

  { (char_T *)(&px4demo_PositionController_qu_B.Gain1[0]), 5, 0, 4 },

  { (char_T *)(&px4demo_PositionController_qu_B.NOT), 8, 0, 3 }
  ,

  { (char_T *)(&px4demo_PositionController_q_DW.obj), 18, 0, 3 },

  { (char_T *)(&px4demo_PositionController_q_DW.obj_a), 20, 0, 1 },

  { (char_T *)(&px4demo_PositionController_q_DW.obj_o), 19, 0, 1 },

  { (char_T *)(&px4demo_PositionController_q_DW.Filter_DSTATE), 0, 0, 16 },

  { (char_T *)(&px4demo_PositionController_q_DW.ToWorkspace1_PWORK.LoggedData),
    11, 0, 2 },

  { (char_T *)(&px4demo_PositionController_q_DW.systemEnable), 6, 0, 2 },

  { (char_T *)(&px4demo_PositionController_q_DW.Filter_PrevResetState), 2, 0, 18
  }
};

// data type transition table for block I/O structure
static DataTypeTransitionTable rtBTransTable = {
  13U,
  rtBTransitions
};

// data type transitions for Parameters structure
static DataTypeTransition rtPTransitions[] = {
  { (char_T *)(&px4demo_PositionController_qu_P.PID_x_D), 0, 0, 48 },

  { (char_T *)(&px4demo_PositionController_qu_P.Out1_Y0), 16, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_P.Constant_Value), 16, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_P.Out1_Y0_e), 17, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_P.Constant_Value_f), 17, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_P.Out1_Y0_m), 15, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_P.Constant_Value_n), 15, 0, 1 },

  { (char_T *)(&px4demo_PositionController_qu_P.Constant_Value_fa), 0, 0, 56 },

  { (char_T *)(&px4demo_PositionController_qu_P.Reset_Value), 8, 0, 3 },

  { (char_T *)(&px4demo_PositionController_qu_P.ManualSwitch_CurrentSetting), 3,
    0, 2 }
};

// data type transition table for Parameters structure
static DataTypeTransitionTable rtPTransTable = {
  10U,
  rtPTransitions
};

// [EOF] px4demo_PositionController_quadrotor_dt.h
