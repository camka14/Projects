//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_PositionController_quadrotor_data.cpp
//
// Code generated for Simulink model 'px4demo_PositionController_quadrotor'.
//
// Model version                  : 1.60
// Simulink Coder version         : 9.4 (R2020b) 29-Jul-2020
// C/C++ source code generated on : Sat Jul 24 18:58:25 2021
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM Cortex
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include "px4demo_PositionController_quadrotor.h"
#include "px4demo_PositionController_quadrotor_private.h"

// Block parameters (default storage)
P_px4demo_PositionController__T px4demo_PositionController_qu_P = {
  // Variable: PID_x_D
  //  Referenced by: '<S245>/Derivative Gain'

  9.9881570904645471,

  // Variable: PID_x_I
  //  Referenced by: '<S248>/Integral Gain'

  0.1,

  // Variable: PID_x_N
  //  Referenced by: '<S254>/Filter Coefficient'

  10.0,

  // Variable: PID_x_P
  //  Referenced by: '<S256>/Proportional Gain'

  6.44483024691358,

  // Variable: PID_y_D
  //  Referenced by: '<S293>/Derivative Gain'

  6.0,

  // Variable: PID_y_I
  //  Referenced by: '<S296>/Integral Gain'

  0.1,

  // Variable: PID_y_N
  //  Referenced by: '<S302>/Filter Coefficient'

  10.0,

  // Variable: PID_y_P
  //  Referenced by: '<S304>/Proportional Gain'

  8.0,

  // Variable: PID_yaw_D
  //  Referenced by: '<S141>/Derivative Gain'

  0.075,

  // Variable: PID_yaw_I
  //  Referenced by: '<S144>/Integral Gain'

  0.005,

  // Variable: PID_yaw_N
  //  Referenced by: '<S150>/Filter Coefficient'

  100.0,

  // Variable: PID_yaw_P
  //  Referenced by: '<S152>/Proportional Gain'

  0.08024,

  // Variable: PID_z_D
  //  Referenced by: '<S197>/Derivative Gain'

  0.8,

  // Variable: PID_z_I
  //  Referenced by: '<S200>/Integral Gain'

  0.1,

  // Variable: PID_z_N
  //  Referenced by: '<S206>/Filter Coefficient'

  100.0,

  // Variable: PID_z_P
  //  Referenced by: '<S208>/Proportional Gain'

  1.13,

  // Mask Parameter: PID_pitch_D
  //  Referenced by: '<S45>/Derivative Gain'

  0.030180271192528741,

  // Mask Parameter: PID_roll_D
  //  Referenced by: '<S93>/Derivative Gain'

  0.015,

  // Mask Parameter: PID_pitch_I
  //  Referenced by: '<S48>/Integral Gain'

  0.005,

  // Mask Parameter: PID_roll_I
  //  Referenced by: '<S96>/Integral Gain'

  0.005,

  // Mask Parameter: PID_Altitude_InitialConditionFo
  //  Referenced by: '<S198>/Filter'

  0.0,

  // Mask Parameter: PID_x_InitialConditionForFilter
  //  Referenced by: '<S246>/Filter'

  0.0,

  // Mask Parameter: PID_pitch_InitialConditionForFi
  //  Referenced by: '<S46>/Filter'

  0.0,

  // Mask Parameter: PID_y_InitialConditionForFilter
  //  Referenced by: '<S294>/Filter'

  0.0,

  // Mask Parameter: PID_roll_InitialConditionForFil
  //  Referenced by: '<S94>/Filter'

  0.0,

  // Mask Parameter: PID_yaw_InitialConditionForFilt
  //  Referenced by: '<S142>/Filter'

  0.0,

  // Mask Parameter: PID_Altitude_InitialCondition_e
  //  Referenced by: '<S203>/Integrator'

  0.0,

  // Mask Parameter: PID_x_InitialConditionForIntegr
  //  Referenced by: '<S251>/Integrator'

  0.0,

  // Mask Parameter: PID_pitch_InitialConditionForIn
  //  Referenced by: '<S51>/Integrator'

  0.0,

  // Mask Parameter: PID_y_InitialConditionForIntegr
  //  Referenced by: '<S299>/Integrator'

  0.0,

  // Mask Parameter: PID_roll_InitialConditionForInt
  //  Referenced by: '<S99>/Integrator'

  0.0,

  // Mask Parameter: PID_yaw_InitialConditionForInte
  //  Referenced by: '<S147>/Integrator'

  0.0,

  // Mask Parameter: PID_Altitude_LowerSaturationLim
  //  Referenced by:
  //    '<S210>/Saturation'
  //    '<S196>/DeadZone'

  1.0,

  // Mask Parameter: PID_x_LowerSaturationLimit
  //  Referenced by: '<S258>/Saturation'

  -50.0,

  // Mask Parameter: PID_pitch_LowerSaturationLimit
  //  Referenced by: '<S58>/Saturation'

  -0.05,

  // Mask Parameter: PID_y_LowerSaturationLimit
  //  Referenced by: '<S306>/Saturation'

  -50.0,

  // Mask Parameter: PID_roll_LowerSaturationLimit
  //  Referenced by: '<S106>/Saturation'

  -0.05,

  // Mask Parameter: PID_yaw_LowerSaturationLimit
  //  Referenced by: '<S154>/Saturation'

  -0.1,

  // Mask Parameter: PID_pitch_N
  //  Referenced by: '<S54>/Filter Coefficient'

  50.0,

  // Mask Parameter: PID_roll_N
  //  Referenced by: '<S102>/Filter Coefficient'

  100.0,

  // Mask Parameter: PID_pitch_P
  //  Referenced by: '<S56>/Proportional Gain'

  0.030488640381895329,

  // Mask Parameter: PID_roll_P
  //  Referenced by: '<S104>/Proportional Gain'

  0.03,

  // Mask Parameter: PID_Altitude_UpperSaturationLim
  //  Referenced by:
  //    '<S210>/Saturation'
  //    '<S196>/DeadZone'

  2.0,

  // Mask Parameter: PID_x_UpperSaturationLimit
  //  Referenced by: '<S258>/Saturation'

  50.0,

  // Mask Parameter: PID_pitch_UpperSaturationLimit
  //  Referenced by: '<S58>/Saturation'

  0.05,

  // Mask Parameter: PID_y_UpperSaturationLimit
  //  Referenced by: '<S306>/Saturation'

  50.0,

  // Mask Parameter: PID_roll_UpperSaturationLimit
  //  Referenced by: '<S106>/Saturation'

  0.05,

  // Mask Parameter: PID_yaw_UpperSaturationLimit
  //  Referenced by: '<S154>/Saturation'

  0.1,

  // Computed Parameter: Out1_Y0
  //  Referenced by: '<S164>/Out1'

  {
    (0ULL),                            // timestamp
    (0ULL),                            // ref_timestamp
    0.0,                               // ref_lat
    0.0,                               // ref_lon
    0.0F,                              // x
    0.0F,                              // y
    0.0F,                              // z

    {
      0.0F, 0.0F }
    ,                                  // delta_xy
    0.0F,                              // delta_z
    0.0F,                              // vx
    0.0F,                              // vy
    0.0F,                              // vz
    0.0F,                              // z_deriv

    {
      0.0F, 0.0F }
    ,                                  // delta_vxy
    0.0F,                              // delta_vz
    0.0F,                              // ax
    0.0F,                              // ay
    0.0F,                              // az
    0.0F,                              // yaw
    0.0F,                              // ref_alt
    0.0F,                              // dist_bottom
    0.0F,                              // dist_bottom_rate
    0.0F,                              // eph
    0.0F,                              // epv
    0.0F,                              // evh
    0.0F,                              // evv
    0.0F,                              // vxy_max
    0.0F,                              // vz_max
    0.0F,                              // hagl_min
    0.0F,                              // hagl_max
    false,                             // xy_valid
    false,                             // z_valid
    false,                             // v_xy_valid
    false,                             // v_z_valid
    0U,                                // xy_reset_counter
    0U,                                // z_reset_counter
    0U,                                // vxy_reset_counter
    0U,                                // vz_reset_counter
    false,                             // xy_global
    false,                             // z_global
    false,                             // dist_bottom_valid

    {
      0U, 0U, 0U, 0U, 0U }
    // _padding0
  },

  // Computed Parameter: Constant_Value
  //  Referenced by: '<S3>/Constant'

  {
    (0ULL),                            // timestamp
    (0ULL),                            // ref_timestamp
    0.0,                               // ref_lat
    0.0,                               // ref_lon
    0.0F,                              // x
    0.0F,                              // y
    0.0F,                              // z

    {
      0.0F, 0.0F }
    ,                                  // delta_xy
    0.0F,                              // delta_z
    0.0F,                              // vx
    0.0F,                              // vy
    0.0F,                              // vz
    0.0F,                              // z_deriv

    {
      0.0F, 0.0F }
    ,                                  // delta_vxy
    0.0F,                              // delta_vz
    0.0F,                              // ax
    0.0F,                              // ay
    0.0F,                              // az
    0.0F,                              // yaw
    0.0F,                              // ref_alt
    0.0F,                              // dist_bottom
    0.0F,                              // dist_bottom_rate
    0.0F,                              // eph
    0.0F,                              // epv
    0.0F,                              // evh
    0.0F,                              // evv
    0.0F,                              // vxy_max
    0.0F,                              // vz_max
    0.0F,                              // hagl_min
    0.0F,                              // hagl_max
    false,                             // xy_valid
    false,                             // z_valid
    false,                             // v_xy_valid
    false,                             // v_z_valid
    0U,                                // xy_reset_counter
    0U,                                // z_reset_counter
    0U,                                // vxy_reset_counter
    0U,                                // vz_reset_counter
    false,                             // xy_global
    false,                             // z_global
    false,                             // dist_bottom_valid

    {
      0U, 0U, 0U, 0U, 0U }
    // _padding0
  },

  // Computed Parameter: Out1_Y0_e
  //  Referenced by: '<S165>/Out1'

  {
    (0ULL),                            // timestamp

    {
      0.0F, 0.0F, 0.0F, 0.0F }
    ,                                  // q

    {
      0.0F, 0.0F, 0.0F, 0.0F }
    ,                                  // delta_q_reset
    0U,                                // quat_reset_counter

    {
      0U, 0U, 0U, 0U, 0U, 0U, 0U }
    // _padding0
  },

  // Computed Parameter: Constant_Value_f
  //  Referenced by: '<S4>/Constant'

  {
    (0ULL),                            // timestamp

    {
      0.0F, 0.0F, 0.0F, 0.0F }
    ,                                  // q

    {
      0.0F, 0.0F, 0.0F, 0.0F }
    ,                                  // delta_q_reset
    0U,                                // quat_reset_counter

    {
      0U, 0U, 0U, 0U, 0U, 0U, 0U }
    // _padding0
  },

  // Computed Parameter: Out1_Y0_m
  //  Referenced by: '<S13>/Out1'

  {
    (0ULL),                            // timestamp
    0U,                                // armed_time_ms
    false,                             // armed
    false,                             // prearmed
    false,                             // ready_to_arm
    false,                             // lockdown
    false,                             // manual_lockdown
    false,                             // force_failsafe
    false,                             // in_esc_calibration_mode
    false,                             // soft_stop

    {
      0U, 0U, 0U, 0U }
    // _padding0
  },

  // Computed Parameter: Constant_Value_n
  //  Referenced by: '<S11>/Constant'

  {
    (0ULL),                            // timestamp
    0U,                                // armed_time_ms
    false,                             // armed
    false,                             // prearmed
    false,                             // ready_to_arm
    false,                             // lockdown
    false,                             // manual_lockdown
    false,                             // force_failsafe
    false,                             // in_esc_calibration_mode
    false,                             // soft_stop

    {
      0U, 0U, 0U, 0U }
    // _padding0
  },

  // Expression: 1
  //  Referenced by: '<S319>/Constant'

  1.0,

  // Expression: 1
  //  Referenced by: '<S320>/Constant'

  1.0,

  // Expression: 0
  //  Referenced by: '<Root>/des_y'

  0.0,

  // Expression: 0
  //  Referenced by: '<Root>/des_x'

  0.0,

  // Expression: 0
  //  Referenced by: '<S194>/Constant1'

  0.0,

  // Expression: [1 -1 1 1;1 1 -1 1;1 -1 -1 -1;1 1 1 -1]
  //  Referenced by: '<S7>/Mixer matrix'

  { 1.0, 1.0, 1.0, 1.0, -1.0, 1.0, -1.0, 1.0, 1.0, -1.0, -1.0, 1.0, 1.0, 1.0,
    -1.0, -1.0 },

  // Expression: -1
  //  Referenced by: '<S5>/Gain1'

  -1.0,

  // Expression: -10.40688222543353
  //  Referenced by: '<Root>/des_alt'

  -10.406882225433529,

  // Computed Parameter: Filter_gainval
  //  Referenced by: '<S198>/Filter'

  0.01,

  // Expression: 0
  //  Referenced by: '<S194>/ZeroGain'

  0.0,

  // Computed Parameter: Integrator_gainval
  //  Referenced by: '<S203>/Integrator'

  0.01,

  // Expression: 10
  //  Referenced by: '<Root>/Sine Wave'

  10.0,

  // Expression: 0
  //  Referenced by: '<Root>/Sine Wave'

  0.0,

  // Expression: 2*pi*0.08
  //  Referenced by: '<Root>/Sine Wave'

  0.50265482457436694,

  // Computed Parameter: SineWave_Hsin
  //  Referenced by: '<Root>/Sine Wave'

  0.0050265270788188631,

  // Computed Parameter: SineWave_HCos
  //  Referenced by: '<Root>/Sine Wave'

  0.99998736693296575,

  // Computed Parameter: SineWave_PSin
  //  Referenced by: '<Root>/Sine Wave'

  -0.0050265270788188631,

  // Computed Parameter: SineWave_PCos
  //  Referenced by: '<Root>/Sine Wave'

  0.99998736693296575,

  // Expression: 10
  //  Referenced by: '<Root>/Sine Wave1'

  10.0,

  // Expression: 0
  //  Referenced by: '<Root>/Sine Wave1'

  0.0,

  // Expression: 2*pi*0.08
  //  Referenced by: '<Root>/Sine Wave1'

  0.50265482457436694,

  // Computed Parameter: SineWave1_Hsin
  //  Referenced by: '<Root>/Sine Wave1'

  0.0050265270788188631,

  // Computed Parameter: SineWave1_HCos
  //  Referenced by: '<Root>/Sine Wave1'

  0.99998736693296575,

  // Computed Parameter: SineWave1_PSin
  //  Referenced by: '<Root>/Sine Wave1'

  0.99998736693296575,

  // Computed Parameter: SineWave1_PCos
  //  Referenced by: '<Root>/Sine Wave1'

  0.0050265270788189221,

  // Computed Parameter: Integrator_gainval_n
  //  Referenced by: '<S251>/Integrator'

  0.01,

  // Computed Parameter: Filter_gainval_p
  //  Referenced by: '<S246>/Filter'

  0.01,

  // Expression: pi/180
  //  Referenced by: '<S15>/Gain1'

  0.017453292519943295,

  // Computed Parameter: Integrator_gainval_nf
  //  Referenced by: '<S51>/Integrator'

  0.01,

  // Computed Parameter: Filter_gainval_h
  //  Referenced by: '<S46>/Filter'

  0.01,

  // Computed Parameter: Integrator_gainval_p
  //  Referenced by: '<S299>/Integrator'

  0.01,

  // Computed Parameter: Filter_gainval_o
  //  Referenced by: '<S294>/Filter'

  0.01,

  // Expression: -1
  //  Referenced by: '<S5>/Gain'

  -1.0,

  // Expression: pi/180
  //  Referenced by: '<S16>/Gain1'

  0.017453292519943295,

  // Computed Parameter: Integrator_gainval_j
  //  Referenced by: '<S99>/Integrator'

  0.01,

  // Computed Parameter: Filter_gainval_c
  //  Referenced by: '<S94>/Filter'

  0.01,

  // Expression: 0
  //  Referenced by: '<Root>/des_yaw'

  0.0,

  // Expression: pi/180
  //  Referenced by: '<S14>/Gain1'

  0.017453292519943295,

  // Computed Parameter: Integrator_gainval_ni
  //  Referenced by: '<S147>/Integrator'

  0.01,

  // Computed Parameter: Filter_gainval_hv
  //  Referenced by: '<S142>/Filter'

  0.01,

  // Expression: 1000
  //  Referenced by: '<S7>/Gain1'

  1000.0,

  // Computed Parameter: Reset_Value
  //  Referenced by: '<Root>/Reset'

  0,

  // Computed Parameter: Constant_Value_i
  //  Referenced by: '<S1>/Constant'

  1,

  // Computed Parameter: DataStoreMemory_InitialValue
  //  Referenced by: '<Root>/Data Store Memory'

  0,

  // Computed Parameter: ManualSwitch_CurrentSetting
  //  Referenced by: '<Root>/Manual Switch'

  1U,

  // Computed Parameter: ManualSwitch1_CurrentSetting
  //  Referenced by: '<Root>/Manual Switch1'

  1U
};

//
// File trailer for generated code.
//
// [EOF]
//
