//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_PositionController_quadrotor.h
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
#ifndef RTW_HEADER_px4demo_PositionController_quadrotor_h_
#define RTW_HEADER_px4demo_PositionController_quadrotor_h_
#include <math.h>
#include <float.h>
#include <stddef.h>
#include <poll.h>
#include <uORB/uORB.h>
#include "rtwtypes.h"
#include "rtw_extmode.h"
#include "sysran_types.h"
#include "dt_info.h"
#include "ext_work.h"
#include "MW_uORB_Read.h"
#include "MW_uORB_Write.h"
#include "MW_PX4_PWM.h"
#include "px4demo_PositionController_quadrotor_types.h"

// Shared type includes
#include "multiword_types.h"
#include "rt_nonfinite.h"
#include "rt_defines.h"
#include "rtGetInf.h"

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

#define px4demo_PositionController_quadrotor_M (px4demo_PositionController_q_M)

// Block signals (default storage)
typedef struct {
  px4_Bus_vehicle_local_position In1;  // '<S164>/In1'
  px4_Bus_vehicle_local_position b_varargout_2;
  px4_Bus_vehicle_attitude In1_o;      // '<S165>/In1'
  px4_Bus_vehicle_attitude b_varargout_2_m;
  px4_Bus_actuator_armed In1_j;        // '<S13>/In1'
  px4_Bus_actuator_armed BusAssignment;// '<S1>/Bus Assignment'
  uint16_T b_pwmValue[8];
  real_T alt;                          // '<S5>/Data Type Conversion2'
  real_T des_alt;                      // '<Root>/des_alt'
  real_T VectorConcatenate[3];         // '<S316>/Vector Concatenate'
  real_T des_x;                        // '<Root>/Manual Switch'
  real_T des_y;                        // '<Root>/Manual Switch1'
  real_T x;                            // '<S5>/Data Type Conversion3'
  real_T y;                            // '<S5>/Data Type Conversion1'
  real_T des_pitch;                    // '<S15>/Gain1'
  real_T des_roll;                     // '<S16>/Gain1'
  real_T des_yaw;                      // '<S14>/Gain1'
  real_T Saturation_jh;                // '<S106>/Saturation'
  real_T Saturation_k;                 // '<S58>/Saturation'
  real_T Saturation_j;                 // '<S210>/Saturation'
  real_T Integrator_a;                 // '<S299>/Integrator'
  real_T Filter_d;                     // '<S246>/Filter'
  real_T Filter_f;                     // '<S142>/Filter'
  real_T Filter_g;                     // '<S94>/Filter'
  real_T FilterCoefficient_ft;         // '<S150>/Filter Coefficient'
  real_T FilterCoefficient_ju;         // '<S102>/Filter Coefficient'
  real_T FilterCoefficient_j;          // '<S302>/Filter Coefficient'
  real_T FilterCoefficient;            // '<S206>/Filter Coefficient'
  real_T fcn3;                         // '<S6>/fcn3'
  uint16_T Gain1[4];                   // '<S7>/Gain1'
  boolean_T NOT;                       // '<S3>/NOT'
  boolean_T NOT_e;                     // '<S4>/NOT'
  boolean_T NOT_h;                     // '<S11>/NOT'
} B_px4demo_PositionController__T;

// Block states (default storage) for system '<Root>'
typedef struct {
  px4_internal_block_Subscriber_T obj; // '<S4>/SourceBlock'
  px4_internal_block_Subscriber_T obj_h;// '<S3>/SourceBlock'
  px4_internal_block_Subscriber_T obj_f;// '<S11>/SourceBlock'
  px4_internal_block_PWM_px4dem_T obj_a;// '<S7>/PX4 PWM Output'
  px4_internal_block_Publisher__T obj_o;// '<S12>/SinkBlock'
  real_T Filter_DSTATE;                // '<S198>/Filter'
  real_T Integrator_DSTATE;            // '<S203>/Integrator'
  real_T Integrator_DSTATE_l;          // '<S251>/Integrator'
  real_T Filter_DSTATE_j;              // '<S246>/Filter'
  real_T Integrator_DSTATE_n;          // '<S51>/Integrator'
  real_T Filter_DSTATE_f;              // '<S46>/Filter'
  real_T Integrator_DSTATE_f;          // '<S299>/Integrator'
  real_T Filter_DSTATE_a;              // '<S294>/Filter'
  real_T Integrator_DSTATE_p;          // '<S99>/Integrator'
  real_T Filter_DSTATE_m;              // '<S94>/Filter'
  real_T Integrator_DSTATE_nm;         // '<S147>/Integrator'
  real_T Filter_DSTATE_a1;             // '<S142>/Filter'
  real_T lastSin;                      // '<Root>/Sine Wave'
  real_T lastCos;                      // '<Root>/Sine Wave'
  real_T lastSin_g;                    // '<Root>/Sine Wave1'
  real_T lastCos_j;                    // '<Root>/Sine Wave1'
  struct {
    void *LoggedData;
  } ToWorkspace1_PWORK;                // '<S5>/To Workspace1'

  struct {
    void *LoggedData;
  } ToWorkspace2_PWORK;                // '<S5>/To Workspace2'

  int32_T systemEnable;                // '<Root>/Sine Wave'
  int32_T systemEnable_n;              // '<Root>/Sine Wave1'
  int8_T Filter_PrevResetState;        // '<S198>/Filter'
  int8_T Integrator_PrevResetState;    // '<S203>/Integrator'
  int8_T Integrator_PrevResetState_b;  // '<S251>/Integrator'
  int8_T Filter_PrevResetState_c;      // '<S246>/Filter'
  int8_T Integrator_PrevResetState_e;  // '<S51>/Integrator'
  int8_T Filter_PrevResetState_f;      // '<S46>/Filter'
  int8_T Integrator_PrevResetState_j;  // '<S299>/Integrator'
  int8_T Filter_PrevResetState_n;      // '<S294>/Filter'
  int8_T Integrator_PrevResetState_c;  // '<S99>/Integrator'
  int8_T Filter_PrevResetState_l;      // '<S94>/Filter'
  int8_T Integrator_PrevResetState_i;  // '<S147>/Integrator'
  int8_T Filter_PrevResetState_g;      // '<S142>/Filter'
  int8_T IfActionSubsystem2_SubsysRanBC;// '<S318>/If Action Subsystem2'
  int8_T IfActionSubsystem1_SubsysRanBC;// '<S318>/If Action Subsystem1'
  int8_T IfActionSubsystem_SubsysRanBC;// '<S318>/If Action Subsystem'
  int8_T EnabledSubsystem_SubsysRanBC; // '<S4>/Enabled Subsystem'
  int8_T EnabledSubsystem_SubsysRanBC_h;// '<S3>/Enabled Subsystem'
  int8_T EnabledSubsystem_SubsysRanBC_n;// '<S11>/Enabled Subsystem'
} DW_px4demo_PositionController_T;

// Parameters (default storage)
struct P_px4demo_PositionController__T_ {
  real_T PID_x_D;                      // Variable: PID_x_D
                                          //  Referenced by: '<S245>/Derivative Gain'

  real_T PID_x_I;                      // Variable: PID_x_I
                                          //  Referenced by: '<S248>/Integral Gain'

  real_T PID_x_N;                      // Variable: PID_x_N
                                          //  Referenced by: '<S254>/Filter Coefficient'

  real_T PID_x_P;                      // Variable: PID_x_P
                                          //  Referenced by: '<S256>/Proportional Gain'

  real_T PID_y_D;                      // Variable: PID_y_D
                                          //  Referenced by: '<S293>/Derivative Gain'

  real_T PID_y_I;                      // Variable: PID_y_I
                                          //  Referenced by: '<S296>/Integral Gain'

  real_T PID_y_N;                      // Variable: PID_y_N
                                          //  Referenced by: '<S302>/Filter Coefficient'

  real_T PID_y_P;                      // Variable: PID_y_P
                                          //  Referenced by: '<S304>/Proportional Gain'

  real_T PID_yaw_D;                    // Variable: PID_yaw_D
                                          //  Referenced by: '<S141>/Derivative Gain'

  real_T PID_yaw_I;                    // Variable: PID_yaw_I
                                          //  Referenced by: '<S144>/Integral Gain'

  real_T PID_yaw_N;                    // Variable: PID_yaw_N
                                          //  Referenced by: '<S150>/Filter Coefficient'

  real_T PID_yaw_P;                    // Variable: PID_yaw_P
                                          //  Referenced by: '<S152>/Proportional Gain'

  real_T PID_z_D;                      // Variable: PID_z_D
                                          //  Referenced by: '<S197>/Derivative Gain'

  real_T PID_z_I;                      // Variable: PID_z_I
                                          //  Referenced by: '<S200>/Integral Gain'

  real_T PID_z_N;                      // Variable: PID_z_N
                                          //  Referenced by: '<S206>/Filter Coefficient'

  real_T PID_z_P;                      // Variable: PID_z_P
                                          //  Referenced by: '<S208>/Proportional Gain'

  real_T PID_pitch_D;                  // Mask Parameter: PID_pitch_D
                                          //  Referenced by: '<S45>/Derivative Gain'

  real_T PID_roll_D;                   // Mask Parameter: PID_roll_D
                                          //  Referenced by: '<S93>/Derivative Gain'

  real_T PID_pitch_I;                  // Mask Parameter: PID_pitch_I
                                          //  Referenced by: '<S48>/Integral Gain'

  real_T PID_roll_I;                   // Mask Parameter: PID_roll_I
                                          //  Referenced by: '<S96>/Integral Gain'

  real_T PID_Altitude_InitialConditionFo;
                              // Mask Parameter: PID_Altitude_InitialConditionFo
                                 //  Referenced by: '<S198>/Filter'

  real_T PID_x_InitialConditionForFilter;
                              // Mask Parameter: PID_x_InitialConditionForFilter
                                 //  Referenced by: '<S246>/Filter'

  real_T PID_pitch_InitialConditionForFi;
                              // Mask Parameter: PID_pitch_InitialConditionForFi
                                 //  Referenced by: '<S46>/Filter'

  real_T PID_y_InitialConditionForFilter;
                              // Mask Parameter: PID_y_InitialConditionForFilter
                                 //  Referenced by: '<S294>/Filter'

  real_T PID_roll_InitialConditionForFil;
                              // Mask Parameter: PID_roll_InitialConditionForFil
                                 //  Referenced by: '<S94>/Filter'

  real_T PID_yaw_InitialConditionForFilt;
                              // Mask Parameter: PID_yaw_InitialConditionForFilt
                                 //  Referenced by: '<S142>/Filter'

  real_T PID_Altitude_InitialCondition_e;
                              // Mask Parameter: PID_Altitude_InitialCondition_e
                                 //  Referenced by: '<S203>/Integrator'

  real_T PID_x_InitialConditionForIntegr;
                              // Mask Parameter: PID_x_InitialConditionForIntegr
                                 //  Referenced by: '<S251>/Integrator'

  real_T PID_pitch_InitialConditionForIn;
                              // Mask Parameter: PID_pitch_InitialConditionForIn
                                 //  Referenced by: '<S51>/Integrator'

  real_T PID_y_InitialConditionForIntegr;
                              // Mask Parameter: PID_y_InitialConditionForIntegr
                                 //  Referenced by: '<S299>/Integrator'

  real_T PID_roll_InitialConditionForInt;
                              // Mask Parameter: PID_roll_InitialConditionForInt
                                 //  Referenced by: '<S99>/Integrator'

  real_T PID_yaw_InitialConditionForInte;
                              // Mask Parameter: PID_yaw_InitialConditionForInte
                                 //  Referenced by: '<S147>/Integrator'

  real_T PID_Altitude_LowerSaturationLim;
                              // Mask Parameter: PID_Altitude_LowerSaturationLim
                                 //  Referenced by:
                                 //    '<S210>/Saturation'
                                 //    '<S196>/DeadZone'

  real_T PID_x_LowerSaturationLimit;
                                   // Mask Parameter: PID_x_LowerSaturationLimit
                                      //  Referenced by: '<S258>/Saturation'

  real_T PID_pitch_LowerSaturationLimit;
                               // Mask Parameter: PID_pitch_LowerSaturationLimit
                                  //  Referenced by: '<S58>/Saturation'

  real_T PID_y_LowerSaturationLimit;
                                   // Mask Parameter: PID_y_LowerSaturationLimit
                                      //  Referenced by: '<S306>/Saturation'

  real_T PID_roll_LowerSaturationLimit;
                                // Mask Parameter: PID_roll_LowerSaturationLimit
                                   //  Referenced by: '<S106>/Saturation'

  real_T PID_yaw_LowerSaturationLimit;
                                 // Mask Parameter: PID_yaw_LowerSaturationLimit
                                    //  Referenced by: '<S154>/Saturation'

  real_T PID_pitch_N;                  // Mask Parameter: PID_pitch_N
                                          //  Referenced by: '<S54>/Filter Coefficient'

  real_T PID_roll_N;                   // Mask Parameter: PID_roll_N
                                          //  Referenced by: '<S102>/Filter Coefficient'

  real_T PID_pitch_P;                  // Mask Parameter: PID_pitch_P
                                          //  Referenced by: '<S56>/Proportional Gain'

  real_T PID_roll_P;                   // Mask Parameter: PID_roll_P
                                          //  Referenced by: '<S104>/Proportional Gain'

  real_T PID_Altitude_UpperSaturationLim;
                              // Mask Parameter: PID_Altitude_UpperSaturationLim
                                 //  Referenced by:
                                 //    '<S210>/Saturation'
                                 //    '<S196>/DeadZone'

  real_T PID_x_UpperSaturationLimit;
                                   // Mask Parameter: PID_x_UpperSaturationLimit
                                      //  Referenced by: '<S258>/Saturation'

  real_T PID_pitch_UpperSaturationLimit;
                               // Mask Parameter: PID_pitch_UpperSaturationLimit
                                  //  Referenced by: '<S58>/Saturation'

  real_T PID_y_UpperSaturationLimit;
                                   // Mask Parameter: PID_y_UpperSaturationLimit
                                      //  Referenced by: '<S306>/Saturation'

  real_T PID_roll_UpperSaturationLimit;
                                // Mask Parameter: PID_roll_UpperSaturationLimit
                                   //  Referenced by: '<S106>/Saturation'

  real_T PID_yaw_UpperSaturationLimit;
                                 // Mask Parameter: PID_yaw_UpperSaturationLimit
                                    //  Referenced by: '<S154>/Saturation'

  px4_Bus_vehicle_local_position Out1_Y0;// Computed Parameter: Out1_Y0
                                            //  Referenced by: '<S164>/Out1'

  px4_Bus_vehicle_local_position Constant_Value;// Computed Parameter: Constant_Value
                                                   //  Referenced by: '<S3>/Constant'

  px4_Bus_vehicle_attitude Out1_Y0_e;  // Computed Parameter: Out1_Y0_e
                                          //  Referenced by: '<S165>/Out1'

  px4_Bus_vehicle_attitude Constant_Value_f;// Computed Parameter: Constant_Value_f
                                               //  Referenced by: '<S4>/Constant'

  px4_Bus_actuator_armed Out1_Y0_m;    // Computed Parameter: Out1_Y0_m
                                          //  Referenced by: '<S13>/Out1'

  px4_Bus_actuator_armed Constant_Value_n;// Computed Parameter: Constant_Value_n
                                             //  Referenced by: '<S11>/Constant'

  real_T Constant_Value_fa;            // Expression: 1
                                          //  Referenced by: '<S319>/Constant'

  real_T Constant_Value_h;             // Expression: 1
                                          //  Referenced by: '<S320>/Constant'

  real_T des_y_Value;                  // Expression: 0
                                          //  Referenced by: '<Root>/des_y'

  real_T des_x_Value;                  // Expression: 0
                                          //  Referenced by: '<Root>/des_x'

  real_T Constant1_Value;              // Expression: 0
                                          //  Referenced by: '<S194>/Constant1'

  real_T Mixermatrix_Value[16];
                          // Expression: [1 -1 1 1;1 1 -1 1;1 -1 -1 -1;1 1 1 -1]
                             //  Referenced by: '<S7>/Mixer matrix'

  real_T Gain1_Gain;                   // Expression: -1
                                          //  Referenced by: '<S5>/Gain1'

  real_T des_alt_Value;                // Expression: -10.40688222543353
                                          //  Referenced by: '<Root>/des_alt'

  real_T Filter_gainval;               // Computed Parameter: Filter_gainval
                                          //  Referenced by: '<S198>/Filter'

  real_T ZeroGain_Gain;                // Expression: 0
                                          //  Referenced by: '<S194>/ZeroGain'

  real_T Integrator_gainval;           // Computed Parameter: Integrator_gainval
                                          //  Referenced by: '<S203>/Integrator'

  real_T SineWave_Amp;                 // Expression: 10
                                          //  Referenced by: '<Root>/Sine Wave'

  real_T SineWave_Bias;                // Expression: 0
                                          //  Referenced by: '<Root>/Sine Wave'

  real_T SineWave_Freq;                // Expression: 2*pi*0.08
                                          //  Referenced by: '<Root>/Sine Wave'

  real_T SineWave_Hsin;                // Computed Parameter: SineWave_Hsin
                                          //  Referenced by: '<Root>/Sine Wave'

  real_T SineWave_HCos;                // Computed Parameter: SineWave_HCos
                                          //  Referenced by: '<Root>/Sine Wave'

  real_T SineWave_PSin;                // Computed Parameter: SineWave_PSin
                                          //  Referenced by: '<Root>/Sine Wave'

  real_T SineWave_PCos;                // Computed Parameter: SineWave_PCos
                                          //  Referenced by: '<Root>/Sine Wave'

  real_T SineWave1_Amp;                // Expression: 10
                                          //  Referenced by: '<Root>/Sine Wave1'

  real_T SineWave1_Bias;               // Expression: 0
                                          //  Referenced by: '<Root>/Sine Wave1'

  real_T SineWave1_Freq;               // Expression: 2*pi*0.08
                                          //  Referenced by: '<Root>/Sine Wave1'

  real_T SineWave1_Hsin;               // Computed Parameter: SineWave1_Hsin
                                          //  Referenced by: '<Root>/Sine Wave1'

  real_T SineWave1_HCos;               // Computed Parameter: SineWave1_HCos
                                          //  Referenced by: '<Root>/Sine Wave1'

  real_T SineWave1_PSin;               // Computed Parameter: SineWave1_PSin
                                          //  Referenced by: '<Root>/Sine Wave1'

  real_T SineWave1_PCos;               // Computed Parameter: SineWave1_PCos
                                          //  Referenced by: '<Root>/Sine Wave1'

  real_T Integrator_gainval_n;       // Computed Parameter: Integrator_gainval_n
                                        //  Referenced by: '<S251>/Integrator'

  real_T Filter_gainval_p;             // Computed Parameter: Filter_gainval_p
                                          //  Referenced by: '<S246>/Filter'

  real_T Gain1_Gain_j;                 // Expression: pi/180
                                          //  Referenced by: '<S15>/Gain1'

  real_T Integrator_gainval_nf;     // Computed Parameter: Integrator_gainval_nf
                                       //  Referenced by: '<S51>/Integrator'

  real_T Filter_gainval_h;             // Computed Parameter: Filter_gainval_h
                                          //  Referenced by: '<S46>/Filter'

  real_T Integrator_gainval_p;       // Computed Parameter: Integrator_gainval_p
                                        //  Referenced by: '<S299>/Integrator'

  real_T Filter_gainval_o;             // Computed Parameter: Filter_gainval_o
                                          //  Referenced by: '<S294>/Filter'

  real_T Gain_Gain;                    // Expression: -1
                                          //  Referenced by: '<S5>/Gain'

  real_T Gain1_Gain_g;                 // Expression: pi/180
                                          //  Referenced by: '<S16>/Gain1'

  real_T Integrator_gainval_j;       // Computed Parameter: Integrator_gainval_j
                                        //  Referenced by: '<S99>/Integrator'

  real_T Filter_gainval_c;             // Computed Parameter: Filter_gainval_c
                                          //  Referenced by: '<S94>/Filter'

  real_T des_yaw_Value;                // Expression: 0
                                          //  Referenced by: '<Root>/des_yaw'

  real_T Gain1_Gain_i;                 // Expression: pi/180
                                          //  Referenced by: '<S14>/Gain1'

  real_T Integrator_gainval_ni;     // Computed Parameter: Integrator_gainval_ni
                                       //  Referenced by: '<S147>/Integrator'

  real_T Filter_gainval_hv;            // Computed Parameter: Filter_gainval_hv
                                          //  Referenced by: '<S142>/Filter'

  real_T Gain1_Gain_h;                 // Expression: 1000
                                          //  Referenced by: '<S7>/Gain1'

  boolean_T Reset_Value;               // Computed Parameter: Reset_Value
                                          //  Referenced by: '<Root>/Reset'

  boolean_T Constant_Value_i;          // Computed Parameter: Constant_Value_i
                                          //  Referenced by: '<S1>/Constant'

  boolean_T DataStoreMemory_InitialValue;
                             // Computed Parameter: DataStoreMemory_InitialValue
                                //  Referenced by: '<Root>/Data Store Memory'

  uint8_T ManualSwitch_CurrentSetting;
                              // Computed Parameter: ManualSwitch_CurrentSetting
                                 //  Referenced by: '<Root>/Manual Switch'

  uint8_T ManualSwitch1_CurrentSetting;
                             // Computed Parameter: ManualSwitch1_CurrentSetting
                                //  Referenced by: '<Root>/Manual Switch1'

};

// Real-time Model Data Structure
struct tag_RTM_px4demo_PositionContr_T {
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

  extern P_px4demo_PositionController__T px4demo_PositionController_qu_P;

#ifdef __cplusplus

}
#endif

// Block signals (default storage)
#ifdef __cplusplus

extern "C" {

#endif

  extern B_px4demo_PositionController__T px4demo_PositionController_qu_B;

#ifdef __cplusplus

}
#endif

// Block states (default storage)
extern DW_px4demo_PositionController_T px4demo_PositionController_q_DW;

#ifdef __cplusplus

extern "C" {

#endif

  // Model entry point functions
  extern void px4demo_PositionController_quadrotor_initialize(void);
  extern void px4demo_PositionController_quadrotor_step(void);
  extern void px4demo_PositionController_quadrotor_terminate(void);

#ifdef __cplusplus

}
#endif

// Real-time Model object
#ifdef __cplusplus

extern "C" {

#endif

  extern RT_MODEL_px4demo_PositionCont_T *const px4demo_PositionController_q_M;

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
//  '<Root>' : 'px4demo_PositionController_quadrotor'
//  '<S1>'   : 'px4demo_PositionController_quadrotor/Arm'
//  '<S2>'   : 'px4demo_PositionController_quadrotor/Attitude controller'
//  '<S3>'   : 'px4demo_PositionController_quadrotor/PX4 uORB Read1'
//  '<S4>'   : 'px4demo_PositionController_quadrotor/PX4 uORB Read2'
//  '<S5>'   : 'px4demo_PositionController_quadrotor/Position & Altitude controller'
//  '<S6>'   : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles'
//  '<S7>'   : 'px4demo_PositionController_quadrotor/To Actuator'
//  '<S8>'   : 'px4demo_PositionController_quadrotor/Tune Pitch PID'
//  '<S9>'   : 'px4demo_PositionController_quadrotor/Tune X PID'
//  '<S10>'  : 'px4demo_PositionController_quadrotor/Tune Yaw PID'
//  '<S11>'  : 'px4demo_PositionController_quadrotor/Arm/PX4 uORB Read'
//  '<S12>'  : 'px4demo_PositionController_quadrotor/Arm/PX4 uORB Write'
//  '<S13>'  : 'px4demo_PositionController_quadrotor/Arm/PX4 uORB Read/Enabled Subsystem'
//  '<S14>'  : 'px4demo_PositionController_quadrotor/Attitude controller/Degrees to Radians'
//  '<S15>'  : 'px4demo_PositionController_quadrotor/Attitude controller/Degrees to Radians1'
//  '<S16>'  : 'px4demo_PositionController_quadrotor/Attitude controller/Degrees to Radians2'
//  '<S17>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch'
//  '<S18>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll'
//  '<S19>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw'
//  '<S20>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Anti-windup'
//  '<S21>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/D Gain'
//  '<S22>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Filter'
//  '<S23>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Filter ICs'
//  '<S24>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/I Gain'
//  '<S25>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Ideal P Gain'
//  '<S26>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Ideal P Gain Fdbk'
//  '<S27>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Integrator'
//  '<S28>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Integrator ICs'
//  '<S29>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/N Copy'
//  '<S30>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/N Gain'
//  '<S31>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/P Copy'
//  '<S32>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Parallel P Gain'
//  '<S33>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Reset Signal'
//  '<S34>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Saturation'
//  '<S35>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Saturation Fdbk'
//  '<S36>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Sum'
//  '<S37>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Sum Fdbk'
//  '<S38>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tracking Mode'
//  '<S39>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tracking Mode Sum'
//  '<S40>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tsamp - Integral'
//  '<S41>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tsamp - Ngain'
//  '<S42>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/postSat Signal'
//  '<S43>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/preSat Signal'
//  '<S44>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Anti-windup/Passthrough'
//  '<S45>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/D Gain/Internal Parameters'
//  '<S46>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Filter/Disc. Forward Euler Filter'
//  '<S47>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Filter ICs/Internal IC - Filter'
//  '<S48>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/I Gain/Internal Parameters'
//  '<S49>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Ideal P Gain/Passthrough'
//  '<S50>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Ideal P Gain Fdbk/Disabled'
//  '<S51>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Integrator/Discrete'
//  '<S52>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Integrator ICs/Internal IC'
//  '<S53>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/N Copy/Disabled'
//  '<S54>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/N Gain/Internal Parameters'
//  '<S55>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/P Copy/Disabled'
//  '<S56>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Parallel P Gain/Internal Parameters'
//  '<S57>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Reset Signal/External Reset'
//  '<S58>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Saturation/Enabled'
//  '<S59>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Saturation Fdbk/Disabled'
//  '<S60>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Sum/Sum_PID'
//  '<S61>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Sum Fdbk/Disabled'
//  '<S62>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tracking Mode/Disabled'
//  '<S63>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tracking Mode Sum/Passthrough'
//  '<S64>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tsamp - Integral/Passthrough'
//  '<S65>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/Tsamp - Ngain/Passthrough'
//  '<S66>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/postSat Signal/Forward_Path'
//  '<S67>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_pitch/preSat Signal/Forward_Path'
//  '<S68>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Anti-windup'
//  '<S69>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/D Gain'
//  '<S70>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Filter'
//  '<S71>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Filter ICs'
//  '<S72>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/I Gain'
//  '<S73>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Ideal P Gain'
//  '<S74>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Ideal P Gain Fdbk'
//  '<S75>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Integrator'
//  '<S76>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Integrator ICs'
//  '<S77>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/N Copy'
//  '<S78>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/N Gain'
//  '<S79>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/P Copy'
//  '<S80>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Parallel P Gain'
//  '<S81>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Reset Signal'
//  '<S82>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Saturation'
//  '<S83>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Saturation Fdbk'
//  '<S84>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Sum'
//  '<S85>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Sum Fdbk'
//  '<S86>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tracking Mode'
//  '<S87>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tracking Mode Sum'
//  '<S88>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tsamp - Integral'
//  '<S89>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tsamp - Ngain'
//  '<S90>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/postSat Signal'
//  '<S91>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/preSat Signal'
//  '<S92>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Anti-windup/Passthrough'
//  '<S93>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/D Gain/Internal Parameters'
//  '<S94>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Filter/Disc. Forward Euler Filter'
//  '<S95>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Filter ICs/Internal IC - Filter'
//  '<S96>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/I Gain/Internal Parameters'
//  '<S97>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Ideal P Gain/Passthrough'
//  '<S98>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Ideal P Gain Fdbk/Disabled'
//  '<S99>'  : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Integrator/Discrete'
//  '<S100>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Integrator ICs/Internal IC'
//  '<S101>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/N Copy/Disabled'
//  '<S102>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/N Gain/Internal Parameters'
//  '<S103>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/P Copy/Disabled'
//  '<S104>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Parallel P Gain/Internal Parameters'
//  '<S105>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Reset Signal/External Reset'
//  '<S106>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Saturation/Enabled'
//  '<S107>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Saturation Fdbk/Disabled'
//  '<S108>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Sum/Sum_PID'
//  '<S109>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Sum Fdbk/Disabled'
//  '<S110>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tracking Mode/Disabled'
//  '<S111>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tracking Mode Sum/Passthrough'
//  '<S112>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tsamp - Integral/Passthrough'
//  '<S113>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/Tsamp - Ngain/Passthrough'
//  '<S114>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/postSat Signal/Forward_Path'
//  '<S115>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_roll/preSat Signal/Forward_Path'
//  '<S116>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Anti-windup'
//  '<S117>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/D Gain'
//  '<S118>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Filter'
//  '<S119>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Filter ICs'
//  '<S120>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/I Gain'
//  '<S121>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Ideal P Gain'
//  '<S122>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Ideal P Gain Fdbk'
//  '<S123>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Integrator'
//  '<S124>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Integrator ICs'
//  '<S125>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/N Copy'
//  '<S126>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/N Gain'
//  '<S127>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/P Copy'
//  '<S128>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Parallel P Gain'
//  '<S129>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Reset Signal'
//  '<S130>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Saturation'
//  '<S131>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Saturation Fdbk'
//  '<S132>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Sum'
//  '<S133>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Sum Fdbk'
//  '<S134>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tracking Mode'
//  '<S135>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tracking Mode Sum'
//  '<S136>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tsamp - Integral'
//  '<S137>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tsamp - Ngain'
//  '<S138>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/postSat Signal'
//  '<S139>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/preSat Signal'
//  '<S140>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Anti-windup/Passthrough'
//  '<S141>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/D Gain/Internal Parameters'
//  '<S142>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Filter/Disc. Forward Euler Filter'
//  '<S143>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Filter ICs/Internal IC - Filter'
//  '<S144>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/I Gain/Internal Parameters'
//  '<S145>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Ideal P Gain/Passthrough'
//  '<S146>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Ideal P Gain Fdbk/Disabled'
//  '<S147>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Integrator/Discrete'
//  '<S148>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Integrator ICs/Internal IC'
//  '<S149>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/N Copy/Disabled'
//  '<S150>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/N Gain/Internal Parameters'
//  '<S151>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/P Copy/Disabled'
//  '<S152>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Parallel P Gain/Internal Parameters'
//  '<S153>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Reset Signal/External Reset'
//  '<S154>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Saturation/Enabled'
//  '<S155>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Saturation Fdbk/Disabled'
//  '<S156>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Sum/Sum_PID'
//  '<S157>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Sum Fdbk/Disabled'
//  '<S158>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tracking Mode/Disabled'
//  '<S159>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tracking Mode Sum/Passthrough'
//  '<S160>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tsamp - Integral/Passthrough'
//  '<S161>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/Tsamp - Ngain/Passthrough'
//  '<S162>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/postSat Signal/Forward_Path'
//  '<S163>' : 'px4demo_PositionController_quadrotor/Attitude controller/PID_yaw/preSat Signal/Forward_Path'
//  '<S164>' : 'px4demo_PositionController_quadrotor/PX4 uORB Read1/Enabled Subsystem'
//  '<S165>' : 'px4demo_PositionController_quadrotor/PX4 uORB Read2/Enabled Subsystem'
//  '<S166>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude'
//  '<S167>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x'
//  '<S168>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y'
//  '<S169>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/Rotation mat '
//  '<S170>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Anti-windup'
//  '<S171>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/D Gain'
//  '<S172>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Filter'
//  '<S173>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Filter ICs'
//  '<S174>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/I Gain'
//  '<S175>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Ideal P Gain'
//  '<S176>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Ideal P Gain Fdbk'
//  '<S177>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Integrator'
//  '<S178>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Integrator ICs'
//  '<S179>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/N Copy'
//  '<S180>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/N Gain'
//  '<S181>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/P Copy'
//  '<S182>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Parallel P Gain'
//  '<S183>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Reset Signal'
//  '<S184>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Saturation'
//  '<S185>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Saturation Fdbk'
//  '<S186>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Sum'
//  '<S187>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Sum Fdbk'
//  '<S188>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tracking Mode'
//  '<S189>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tracking Mode Sum'
//  '<S190>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tsamp - Integral'
//  '<S191>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tsamp - Ngain'
//  '<S192>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/postSat Signal'
//  '<S193>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/preSat Signal'
//  '<S194>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Anti-windup/Disc. Clamping Parallel'
//  '<S195>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Anti-windup/Disc. Clamping Parallel/Dead Zone'
//  '<S196>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Anti-windup/Disc. Clamping Parallel/Dead Zone/Enabled'
//  '<S197>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/D Gain/Internal Parameters'
//  '<S198>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Filter/Disc. Forward Euler Filter'
//  '<S199>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Filter ICs/Internal IC - Filter'
//  '<S200>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/I Gain/Internal Parameters'
//  '<S201>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Ideal P Gain/Passthrough'
//  '<S202>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Ideal P Gain Fdbk/Passthrough'
//  '<S203>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Integrator/Discrete'
//  '<S204>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Integrator ICs/Internal IC'
//  '<S205>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/N Copy/Disabled'
//  '<S206>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/N Gain/Internal Parameters'
//  '<S207>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/P Copy/Disabled'
//  '<S208>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Parallel P Gain/Internal Parameters'
//  '<S209>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Reset Signal/External Reset'
//  '<S210>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Saturation/Enabled'
//  '<S211>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Saturation Fdbk/Passthrough'
//  '<S212>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Sum/Sum_PID'
//  '<S213>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Sum Fdbk/Enabled'
//  '<S214>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tracking Mode/Disabled'
//  '<S215>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tracking Mode Sum/Passthrough'
//  '<S216>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tsamp - Integral/Passthrough'
//  '<S217>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/Tsamp - Ngain/Passthrough'
//  '<S218>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/postSat Signal/Feedback_Path'
//  '<S219>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_Altitude/preSat Signal/Feedback_Path'
//  '<S220>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Anti-windup'
//  '<S221>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/D Gain'
//  '<S222>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Filter'
//  '<S223>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Filter ICs'
//  '<S224>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/I Gain'
//  '<S225>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Ideal P Gain'
//  '<S226>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Ideal P Gain Fdbk'
//  '<S227>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Integrator'
//  '<S228>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Integrator ICs'
//  '<S229>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/N Copy'
//  '<S230>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/N Gain'
//  '<S231>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/P Copy'
//  '<S232>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Parallel P Gain'
//  '<S233>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Reset Signal'
//  '<S234>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Saturation'
//  '<S235>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Saturation Fdbk'
//  '<S236>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Sum'
//  '<S237>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Sum Fdbk'
//  '<S238>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tracking Mode'
//  '<S239>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tracking Mode Sum'
//  '<S240>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tsamp - Integral'
//  '<S241>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tsamp - Ngain'
//  '<S242>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/postSat Signal'
//  '<S243>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/preSat Signal'
//  '<S244>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Anti-windup/Passthrough'
//  '<S245>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/D Gain/Internal Parameters'
//  '<S246>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Filter/Disc. Forward Euler Filter'
//  '<S247>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Filter ICs/Internal IC - Filter'
//  '<S248>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/I Gain/Internal Parameters'
//  '<S249>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Ideal P Gain/Passthrough'
//  '<S250>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Ideal P Gain Fdbk/Disabled'
//  '<S251>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Integrator/Discrete'
//  '<S252>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Integrator ICs/Internal IC'
//  '<S253>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/N Copy/Disabled'
//  '<S254>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/N Gain/Internal Parameters'
//  '<S255>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/P Copy/Disabled'
//  '<S256>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Parallel P Gain/Internal Parameters'
//  '<S257>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Reset Signal/External Reset'
//  '<S258>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Saturation/Enabled'
//  '<S259>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Saturation Fdbk/Disabled'
//  '<S260>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Sum/Sum_PID'
//  '<S261>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Sum Fdbk/Disabled'
//  '<S262>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tracking Mode/Disabled'
//  '<S263>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tracking Mode Sum/Passthrough'
//  '<S264>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tsamp - Integral/Passthrough'
//  '<S265>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/Tsamp - Ngain/Passthrough'
//  '<S266>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/postSat Signal/Forward_Path'
//  '<S267>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_x/preSat Signal/Forward_Path'
//  '<S268>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Anti-windup'
//  '<S269>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/D Gain'
//  '<S270>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Filter'
//  '<S271>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Filter ICs'
//  '<S272>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/I Gain'
//  '<S273>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Ideal P Gain'
//  '<S274>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Ideal P Gain Fdbk'
//  '<S275>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Integrator'
//  '<S276>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Integrator ICs'
//  '<S277>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/N Copy'
//  '<S278>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/N Gain'
//  '<S279>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/P Copy'
//  '<S280>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Parallel P Gain'
//  '<S281>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Reset Signal'
//  '<S282>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Saturation'
//  '<S283>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Saturation Fdbk'
//  '<S284>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Sum'
//  '<S285>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Sum Fdbk'
//  '<S286>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tracking Mode'
//  '<S287>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tracking Mode Sum'
//  '<S288>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tsamp - Integral'
//  '<S289>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tsamp - Ngain'
//  '<S290>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/postSat Signal'
//  '<S291>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/preSat Signal'
//  '<S292>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Anti-windup/Passthrough'
//  '<S293>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/D Gain/Internal Parameters'
//  '<S294>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Filter/Disc. Forward Euler Filter'
//  '<S295>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Filter ICs/Internal IC - Filter'
//  '<S296>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/I Gain/Internal Parameters'
//  '<S297>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Ideal P Gain/Passthrough'
//  '<S298>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Ideal P Gain Fdbk/Disabled'
//  '<S299>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Integrator/Discrete'
//  '<S300>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Integrator ICs/Internal IC'
//  '<S301>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/N Copy/Disabled'
//  '<S302>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/N Gain/Internal Parameters'
//  '<S303>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/P Copy/Disabled'
//  '<S304>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Parallel P Gain/Internal Parameters'
//  '<S305>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Reset Signal/External Reset'
//  '<S306>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Saturation/Enabled'
//  '<S307>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Saturation Fdbk/Disabled'
//  '<S308>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Sum/Sum_PID'
//  '<S309>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Sum Fdbk/Disabled'
//  '<S310>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tracking Mode/Disabled'
//  '<S311>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tracking Mode Sum/Passthrough'
//  '<S312>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tsamp - Integral/Passthrough'
//  '<S313>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/Tsamp - Ngain/Passthrough'
//  '<S314>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/postSat Signal/Forward_Path'
//  '<S315>' : 'px4demo_PositionController_quadrotor/Position & Altitude controller/PID_y/preSat Signal/Forward_Path'
//  '<S316>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Angle Calculation'
//  '<S317>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Quaternion Normalize'
//  '<S318>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input'
//  '<S319>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input/If Action Subsystem'
//  '<S320>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input/If Action Subsystem1'
//  '<S321>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Angle Calculation/Protect asincos input/If Action Subsystem2'
//  '<S322>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus'
//  '<S323>' : 'px4demo_PositionController_quadrotor/Quaternions to Rotation Angles/Quaternion Normalize/Quaternion Modulus/Quaternion Norm'

#endif                    // RTW_HEADER_px4demo_PositionController_quadrotor_h_

//
// File trailer for generated code.
//
// [EOF]
//
