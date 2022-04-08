//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_PositionController_quadrotor.cpp
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
#include "px4demo_PositionController_quadrotor_dt.h"

// Block signals (default storage)
B_px4demo_PositionController__T px4demo_PositionController_qu_B;

// Block states (default storage)
DW_px4demo_PositionController_T px4demo_PositionController_q_DW;

// Real-time model
RT_MODEL_px4demo_PositionCont_T px4demo_PositionController_q_M_ =
  RT_MODEL_px4demo_PositionCont_T();
RT_MODEL_px4demo_PositionCont_T *const px4demo_PositionController_q_M =
  &px4demo_PositionController_q_M_;

// Forward declaration for local functions
static void px4demo_Positi_SystemCore_setup(px4_internal_block_PWM_px4dem_T *obj,
  boolean_T varargin_1, boolean_T varargin_2);
real_T rt_atan2d_snf(real_T u0, real_T u1)
{
  real_T y;
  int32_T u0_0;
  int32_T u1_0;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = (rtNaN);
  } else if (rtIsInf(u0) && rtIsInf(u1)) {
    if (u0 > 0.0) {
      u0_0 = 1;
    } else {
      u0_0 = -1;
    }

    if (u1 > 0.0) {
      u1_0 = 1;
    } else {
      u1_0 = -1;
    }

    y = atan2(static_cast<real_T>(u0_0), static_cast<real_T>(u1_0));
  } else if (u1 == 0.0) {
    if (u0 > 0.0) {
      y = RT_PI / 2.0;
    } else if (u0 < 0.0) {
      y = -(RT_PI / 2.0);
    } else {
      y = 0.0;
    }
  } else {
    y = atan2(u0, u1);
  }

  return y;
}

static void px4demo_Positi_SystemCore_setup(px4_internal_block_PWM_px4dem_T *obj,
  boolean_T varargin_1, boolean_T varargin_2)
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
  obj->channelMask = 15;
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
void px4demo_PositionController_quadrotor_step(void)
{
  real_T Integrator_c;
  real_T Integrator_o;
  real_T rtb_MatrixMultiply;
  real_T rtb_ZeroGain;
  real_T u0;
  int32_T i;
  uint16_T status;
  boolean_T b_varargout_1;
  boolean_T reset;
  boolean_T rtb_NotEqual;

  // Reset subsysRan breadcrumbs
  srClearBC(px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_n);

  // Reset subsysRan breadcrumbs
  srClearBC(px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_h);

  // Reset subsysRan breadcrumbs
  srClearBC(px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC);

  // Reset subsysRan breadcrumbs
  srClearBC(px4demo_PositionController_q_DW.IfActionSubsystem_SubsysRanBC);

  // Reset subsysRan breadcrumbs
  srClearBC(px4demo_PositionController_q_DW.IfActionSubsystem1_SubsysRanBC);

  // Reset subsysRan breadcrumbs
  srClearBC(px4demo_PositionController_q_DW.IfActionSubsystem2_SubsysRanBC);

  // DataStoreWrite: '<Root>/Data Store Write' incorporates:
  //   Constant: '<Root>/Reset'

  reset = px4demo_PositionController_qu_P.Reset_Value;

  // MATLABSystem: '<S3>/SourceBlock'
  rtb_NotEqual = uORB_read_step
    (px4demo_PositionController_q_DW.obj_h.orbMetadataObj,
     &px4demo_PositionController_q_DW.obj_h.eventStructObj,
     &px4demo_PositionController_qu_B.b_varargout_2, false, 1.0);

  // Logic: '<S3>/NOT' incorporates:
  //   MATLABSystem: '<S3>/SourceBlock'

  px4demo_PositionController_qu_B.NOT = !rtb_NotEqual;

  // MATLABSystem: '<S4>/SourceBlock'
  b_varargout_1 = uORB_read_step
    (px4demo_PositionController_q_DW.obj.orbMetadataObj,
     &px4demo_PositionController_q_DW.obj.eventStructObj,
     &px4demo_PositionController_qu_B.b_varargout_2_m, false, 1.0);

  // Logic: '<S4>/NOT' incorporates:
  //   MATLABSystem: '<S4>/SourceBlock'

  px4demo_PositionController_qu_B.NOT_e = !b_varargout_1;

  // Outputs for Enabled SubSystem: '<S3>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S164>/Enable'

  // MATLABSystem: '<S3>/SourceBlock' incorporates:
  //   Inport: '<S164>/In1'

  if (rtb_NotEqual) {
    px4demo_PositionController_qu_B.In1 =
      px4demo_PositionController_qu_B.b_varargout_2;
    srUpdateBC(px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_h);
  }

  // End of Outputs for SubSystem: '<S3>/Enabled Subsystem'

  // DataTypeConversion: '<S5>/Data Type Conversion2'
  px4demo_PositionController_qu_B.alt = px4demo_PositionController_qu_B.In1.z;

  // Constant: '<Root>/des_alt'
  px4demo_PositionController_qu_B.des_alt =
    px4demo_PositionController_qu_P.des_alt_Value;

  // Sum: '<S5>/Add' incorporates:
  //   Gain: '<S5>/Gain1'

  px4demo_PositionController_qu_B.Integrator_a =
    px4demo_PositionController_qu_P.Gain1_Gain *
    px4demo_PositionController_qu_B.alt -
    px4demo_PositionController_qu_B.des_alt;

  // Gain: '<S208>/Proportional Gain'
  px4demo_PositionController_qu_B.Saturation_j =
    px4demo_PositionController_qu_P.PID_z_P *
    px4demo_PositionController_qu_B.Integrator_a;

  // DiscreteIntegrator: '<S198>/Filter' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Filter_PrevResetState != 0)) {
    px4demo_PositionController_q_DW.Filter_DSTATE =
      px4demo_PositionController_qu_P.PID_Altitude_InitialConditionFo;
  }

  // Gain: '<S206>/Filter Coefficient' incorporates:
  //   DiscreteIntegrator: '<S198>/Filter'
  //   Gain: '<S197>/Derivative Gain'
  //   Sum: '<S198>/SumD'

  px4demo_PositionController_qu_B.FilterCoefficient =
    (px4demo_PositionController_qu_P.PID_z_D *
     px4demo_PositionController_qu_B.Integrator_a -
     px4demo_PositionController_q_DW.Filter_DSTATE) *
    px4demo_PositionController_qu_P.PID_z_N;

  // Sum: '<S213>/Sum Fdbk'
  px4demo_PositionController_qu_B.Saturation_jh =
    (px4demo_PositionController_qu_B.Saturation_j +
     px4demo_PositionController_q_DW.Integrator_DSTATE) +
    px4demo_PositionController_qu_B.FilterCoefficient;

  // Gain: '<S194>/ZeroGain'
  rtb_ZeroGain = px4demo_PositionController_qu_P.ZeroGain_Gain *
    px4demo_PositionController_qu_B.Saturation_jh;

  // DeadZone: '<S196>/DeadZone'
  if (px4demo_PositionController_qu_B.Saturation_jh >
      px4demo_PositionController_qu_P.PID_Altitude_UpperSaturationLim) {
    px4demo_PositionController_qu_B.Saturation_jh -=
      px4demo_PositionController_qu_P.PID_Altitude_UpperSaturationLim;
  } else if (px4demo_PositionController_qu_B.Saturation_jh >=
             px4demo_PositionController_qu_P.PID_Altitude_LowerSaturationLim) {
    px4demo_PositionController_qu_B.Saturation_jh = 0.0;
  } else {
    px4demo_PositionController_qu_B.Saturation_jh -=
      px4demo_PositionController_qu_P.PID_Altitude_LowerSaturationLim;
  }

  // End of DeadZone: '<S196>/DeadZone'

  // RelationalOperator: '<S194>/NotEqual'
  rtb_NotEqual = (rtb_ZeroGain != px4demo_PositionController_qu_B.Saturation_jh);

  // Signum: '<S194>/SignPreSat'
  if (px4demo_PositionController_qu_B.Saturation_jh < 0.0) {
    px4demo_PositionController_qu_B.Saturation_jh = -1.0;
  } else if (px4demo_PositionController_qu_B.Saturation_jh > 0.0) {
    px4demo_PositionController_qu_B.Saturation_jh = 1.0;
  } else if (px4demo_PositionController_qu_B.Saturation_jh == 0.0) {
    px4demo_PositionController_qu_B.Saturation_jh = 0.0;
  } else {
    px4demo_PositionController_qu_B.Saturation_jh = (rtNaN);
  }

  // End of Signum: '<S194>/SignPreSat'

  // Gain: '<S200>/Integral Gain'
  px4demo_PositionController_qu_B.Integrator_a *=
    px4demo_PositionController_qu_P.PID_z_I;

  // DiscreteIntegrator: '<S203>/Integrator' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Integrator_PrevResetState != 0)) {
    px4demo_PositionController_q_DW.Integrator_DSTATE =
      px4demo_PositionController_qu_P.PID_Altitude_InitialCondition_e;
  }

  // DataTypeConversion: '<S194>/DataTypeConv1'
  if (rtIsNaN(px4demo_PositionController_qu_B.Saturation_jh)) {
    px4demo_PositionController_qu_B.fcn3 = 0.0;
  } else {
    px4demo_PositionController_qu_B.fcn3 = fmod
      (px4demo_PositionController_qu_B.Saturation_jh, 256.0);
  }

  // Signum: '<S194>/SignPreIntegrator'
  if (px4demo_PositionController_qu_B.Integrator_a < 0.0) {
    // DataTypeConversion: '<S194>/DataTypeConv2'
    rtb_ZeroGain = -1.0;
  } else if (px4demo_PositionController_qu_B.Integrator_a > 0.0) {
    // DataTypeConversion: '<S194>/DataTypeConv2'
    rtb_ZeroGain = 1.0;
  } else if (px4demo_PositionController_qu_B.Integrator_a == 0.0) {
    // DataTypeConversion: '<S194>/DataTypeConv2'
    rtb_ZeroGain = 0.0;
  } else {
    // DataTypeConversion: '<S194>/DataTypeConv2'
    rtb_ZeroGain = (rtNaN);
  }

  // End of Signum: '<S194>/SignPreIntegrator'

  // DataTypeConversion: '<S194>/DataTypeConv2'
  if (rtIsNaN(rtb_ZeroGain)) {
    rtb_ZeroGain = 0.0;
  } else {
    rtb_ZeroGain = fmod(rtb_ZeroGain, 256.0);
  }

  // Switch: '<S194>/Switch' incorporates:
  //   Constant: '<S194>/Constant1'
  //   DataTypeConversion: '<S194>/DataTypeConv1'
  //   DataTypeConversion: '<S194>/DataTypeConv2'
  //   Logic: '<S194>/AND3'
  //   RelationalOperator: '<S194>/Equal1'

  if (rtb_NotEqual && ((px4demo_PositionController_qu_B.fcn3 < 0.0 ?
                        static_cast<int32_T>(static_cast<int8_T>
         (-static_cast<int8_T>(static_cast<uint8_T>
           (-px4demo_PositionController_qu_B.fcn3)))) : static_cast<int32_T>(
         static_cast<int8_T>(static_cast<uint8_T>
          (px4demo_PositionController_qu_B.fcn3)))) == (rtb_ZeroGain < 0.0 ?
        static_cast<int32_T>(static_cast<int8_T>(-static_cast<int8_T>(
           static_cast<uint8_T>(-rtb_ZeroGain)))) : static_cast<int32_T>(
         static_cast<int8_T>(static_cast<uint8_T>(rtb_ZeroGain)))))) {
    px4demo_PositionController_qu_B.Integrator_a =
      px4demo_PositionController_qu_P.Constant1_Value;
  }

  // End of Switch: '<S194>/Switch'

  // DiscreteIntegrator: '<S203>/Integrator'
  rtb_ZeroGain = px4demo_PositionController_qu_P.Integrator_gainval *
    px4demo_PositionController_qu_B.Integrator_a +
    px4demo_PositionController_q_DW.Integrator_DSTATE;

  // Sum: '<S212>/Sum'
  px4demo_PositionController_qu_B.Saturation_j =
    (px4demo_PositionController_qu_B.Saturation_j + rtb_ZeroGain) +
    px4demo_PositionController_qu_B.FilterCoefficient;

  // Saturate: '<S210>/Saturation'
  if (px4demo_PositionController_qu_B.Saturation_j >
      px4demo_PositionController_qu_P.PID_Altitude_UpperSaturationLim) {
    px4demo_PositionController_qu_B.Saturation_j =
      px4demo_PositionController_qu_P.PID_Altitude_UpperSaturationLim;
  } else {
    if (px4demo_PositionController_qu_B.Saturation_j <
        px4demo_PositionController_qu_P.PID_Altitude_LowerSaturationLim) {
      px4demo_PositionController_qu_B.Saturation_j =
        px4demo_PositionController_qu_P.PID_Altitude_LowerSaturationLim;
    }
  }

  // End of Saturate: '<S210>/Saturation'

  // Outputs for Enabled SubSystem: '<S4>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S165>/Enable'

  // MATLABSystem: '<S4>/SourceBlock' incorporates:
  //   Inport: '<S165>/In1'

  if (b_varargout_1) {
    px4demo_PositionController_qu_B.In1_o =
      px4demo_PositionController_qu_B.b_varargout_2_m;
    srUpdateBC(px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC);
  }

  // End of Outputs for SubSystem: '<S4>/Enabled Subsystem'

  // Sqrt: '<S322>/sqrt' incorporates:
  //   DataTypeConversion: '<Root>/Data Type Conversion1'
  //   Product: '<S323>/Product'
  //   Product: '<S323>/Product1'
  //   Product: '<S323>/Product2'
  //   Product: '<S323>/Product3'
  //   Sum: '<S323>/Sum'

  px4demo_PositionController_qu_B.Saturation_jh = sqrt(((static_cast<real_T>
    (px4demo_PositionController_qu_B.In1_o.q[0]) *
    px4demo_PositionController_qu_B.In1_o.q[0] + static_cast<real_T>
    (px4demo_PositionController_qu_B.In1_o.q[1]) *
    px4demo_PositionController_qu_B.In1_o.q[1]) + static_cast<real_T>
    (px4demo_PositionController_qu_B.In1_o.q[2]) *
    px4demo_PositionController_qu_B.In1_o.q[2]) + static_cast<real_T>
    (px4demo_PositionController_qu_B.In1_o.q[3]) *
    px4demo_PositionController_qu_B.In1_o.q[3]);

  // Product: '<S317>/Product' incorporates:
  //   DataTypeConversion: '<Root>/Data Type Conversion1'

  px4demo_PositionController_qu_B.Saturation_k =
    px4demo_PositionController_qu_B.In1_o.q[0] /
    px4demo_PositionController_qu_B.Saturation_jh;

  // Product: '<S317>/Product1' incorporates:
  //   DataTypeConversion: '<Root>/Data Type Conversion1'

  px4demo_PositionController_qu_B.Filter_d =
    px4demo_PositionController_qu_B.In1_o.q[1] /
    px4demo_PositionController_qu_B.Saturation_jh;

  // Product: '<S317>/Product2' incorporates:
  //   DataTypeConversion: '<Root>/Data Type Conversion1'

  px4demo_PositionController_qu_B.Integrator_a =
    px4demo_PositionController_qu_B.In1_o.q[2] /
    px4demo_PositionController_qu_B.Saturation_jh;

  // Product: '<S317>/Product3' incorporates:
  //   DataTypeConversion: '<Root>/Data Type Conversion1'

  px4demo_PositionController_qu_B.Saturation_jh =
    px4demo_PositionController_qu_B.In1_o.q[3] /
    px4demo_PositionController_qu_B.Saturation_jh;

  // Fcn: '<S6>/fcn2' incorporates:
  //   Fcn: '<S6>/fcn5'

  px4demo_PositionController_qu_B.FilterCoefficient_j =
    px4demo_PositionController_qu_B.Saturation_k *
    px4demo_PositionController_qu_B.Saturation_k;
  Integrator_c = px4demo_PositionController_qu_B.Filter_d *
    px4demo_PositionController_qu_B.Filter_d;
  px4demo_PositionController_qu_B.FilterCoefficient_ju =
    px4demo_PositionController_qu_B.Integrator_a *
    px4demo_PositionController_qu_B.Integrator_a;
  Integrator_o = px4demo_PositionController_qu_B.Saturation_jh *
    px4demo_PositionController_qu_B.Saturation_jh;

  // Trigonometry: '<S316>/Trigonometric Function1' incorporates:
  //   Fcn: '<S6>/fcn1'
  //   Fcn: '<S6>/fcn2'

  px4demo_PositionController_qu_B.VectorConcatenate[0] = rt_atan2d_snf
    ((px4demo_PositionController_qu_B.Filter_d *
      px4demo_PositionController_qu_B.Integrator_a +
      px4demo_PositionController_qu_B.Saturation_k *
      px4demo_PositionController_qu_B.Saturation_jh) * 2.0,
     ((px4demo_PositionController_qu_B.FilterCoefficient_j + Integrator_c) -
      px4demo_PositionController_qu_B.FilterCoefficient_ju) - Integrator_o);

  // Fcn: '<S6>/fcn3'
  px4demo_PositionController_qu_B.fcn3 =
    (px4demo_PositionController_qu_B.Filter_d *
     px4demo_PositionController_qu_B.Saturation_jh -
     px4demo_PositionController_qu_B.Saturation_k *
     px4demo_PositionController_qu_B.Integrator_a) * -2.0;

  // If: '<S318>/If' incorporates:
  //   Constant: '<S319>/Constant'
  //   Constant: '<S320>/Constant'

  if (px4demo_PositionController_qu_B.fcn3 > 1.0) {
    // Outputs for IfAction SubSystem: '<S318>/If Action Subsystem' incorporates:
    //   ActionPort: '<S319>/Action Port'

    px4demo_PositionController_qu_B.fcn3 =
      px4demo_PositionController_qu_P.Constant_Value_fa;

    // End of Outputs for SubSystem: '<S318>/If Action Subsystem'

    // Update for IfAction SubSystem: '<S318>/If Action Subsystem' incorporates:
    //   ActionPort: '<S319>/Action Port'

    // Update for If: '<S318>/If' incorporates:
    //   Constant: '<S319>/Constant'

    srUpdateBC(px4demo_PositionController_q_DW.IfActionSubsystem_SubsysRanBC);

    // End of Update for SubSystem: '<S318>/If Action Subsystem'
  } else if (px4demo_PositionController_qu_B.fcn3 < -1.0) {
    // Outputs for IfAction SubSystem: '<S318>/If Action Subsystem1' incorporates:
    //   ActionPort: '<S320>/Action Port'

    px4demo_PositionController_qu_B.fcn3 =
      px4demo_PositionController_qu_P.Constant_Value_h;

    // End of Outputs for SubSystem: '<S318>/If Action Subsystem1'

    // Update for IfAction SubSystem: '<S318>/If Action Subsystem1' incorporates:
    //   ActionPort: '<S320>/Action Port'

    // Update for If: '<S318>/If' incorporates:
    //   Constant: '<S320>/Constant'

    srUpdateBC(px4demo_PositionController_q_DW.IfActionSubsystem1_SubsysRanBC);

    // End of Update for SubSystem: '<S318>/If Action Subsystem1'
  } else {
    // Update for IfAction SubSystem: '<S318>/If Action Subsystem2' incorporates:
    //   ActionPort: '<S321>/Action Port'

    // Update for If: '<S318>/If'
    srUpdateBC(px4demo_PositionController_q_DW.IfActionSubsystem2_SubsysRanBC);

    // End of Update for SubSystem: '<S318>/If Action Subsystem2'
  }

  // End of If: '<S318>/If'

  // Trigonometry: '<S316>/trigFcn'
  if (px4demo_PositionController_qu_B.fcn3 > 1.0) {
    px4demo_PositionController_qu_B.fcn3 = 1.0;
  } else {
    if (px4demo_PositionController_qu_B.fcn3 < -1.0) {
      px4demo_PositionController_qu_B.fcn3 = -1.0;
    }
  }

  px4demo_PositionController_qu_B.VectorConcatenate[1] = asin
    (px4demo_PositionController_qu_B.fcn3);

  // End of Trigonometry: '<S316>/trigFcn'

  // Trigonometry: '<S316>/Trigonometric Function3' incorporates:
  //   Fcn: '<S6>/fcn4'
  //   Fcn: '<S6>/fcn5'

  px4demo_PositionController_qu_B.VectorConcatenate[2] = rt_atan2d_snf
    ((px4demo_PositionController_qu_B.Integrator_a *
      px4demo_PositionController_qu_B.Saturation_jh +
      px4demo_PositionController_qu_B.Saturation_k *
      px4demo_PositionController_qu_B.Filter_d) * 2.0,
     ((px4demo_PositionController_qu_B.FilterCoefficient_j - Integrator_c) -
      px4demo_PositionController_qu_B.FilterCoefficient_ju) + Integrator_o);

  // Sin: '<Root>/Sine Wave'
  if (px4demo_PositionController_q_DW.systemEnable != 0) {
    px4demo_PositionController_qu_B.fcn3 =
      px4demo_PositionController_qu_P.SineWave_Freq *
      px4demo_PositionController_q_M->Timing.taskTime0;
    px4demo_PositionController_q_DW.lastSin = sin
      (px4demo_PositionController_qu_B.fcn3);
    px4demo_PositionController_q_DW.lastCos = cos
      (px4demo_PositionController_qu_B.fcn3);
    px4demo_PositionController_q_DW.systemEnable = 0;
  }

  // ManualSwitch: '<Root>/Manual Switch'
  if (px4demo_PositionController_qu_P.ManualSwitch_CurrentSetting == 1) {
    // ManualSwitch: '<Root>/Manual Switch' incorporates:
    //   Constant: '<Root>/des_x'

    px4demo_PositionController_qu_B.des_x =
      px4demo_PositionController_qu_P.des_x_Value;
  } else {
    // ManualSwitch: '<Root>/Manual Switch' incorporates:
    //   Sin: '<Root>/Sine Wave'

    px4demo_PositionController_qu_B.des_x =
      ((px4demo_PositionController_q_DW.lastSin *
        px4demo_PositionController_qu_P.SineWave_PCos +
        px4demo_PositionController_q_DW.lastCos *
        px4demo_PositionController_qu_P.SineWave_PSin) *
       px4demo_PositionController_qu_P.SineWave_HCos +
       (px4demo_PositionController_q_DW.lastCos *
        px4demo_PositionController_qu_P.SineWave_PCos -
        px4demo_PositionController_q_DW.lastSin *
        px4demo_PositionController_qu_P.SineWave_PSin) *
       px4demo_PositionController_qu_P.SineWave_Hsin) *
      px4demo_PositionController_qu_P.SineWave_Amp +
      px4demo_PositionController_qu_P.SineWave_Bias;
  }

  // End of ManualSwitch: '<Root>/Manual Switch'

  // Sin: '<Root>/Sine Wave1'
  if (px4demo_PositionController_q_DW.systemEnable_n != 0) {
    px4demo_PositionController_qu_B.fcn3 =
      px4demo_PositionController_qu_P.SineWave1_Freq *
      px4demo_PositionController_q_M->Timing.taskTime0;
    px4demo_PositionController_q_DW.lastSin_g = sin
      (px4demo_PositionController_qu_B.fcn3);
    px4demo_PositionController_q_DW.lastCos_j = cos
      (px4demo_PositionController_qu_B.fcn3);
    px4demo_PositionController_q_DW.systemEnable_n = 0;
  }

  // ManualSwitch: '<Root>/Manual Switch1'
  if (px4demo_PositionController_qu_P.ManualSwitch1_CurrentSetting == 1) {
    // ManualSwitch: '<Root>/Manual Switch1' incorporates:
    //   Constant: '<Root>/des_y'

    px4demo_PositionController_qu_B.des_y =
      px4demo_PositionController_qu_P.des_y_Value;
  } else {
    // ManualSwitch: '<Root>/Manual Switch1' incorporates:
    //   Sin: '<Root>/Sine Wave1'

    px4demo_PositionController_qu_B.des_y =
      ((px4demo_PositionController_q_DW.lastSin_g *
        px4demo_PositionController_qu_P.SineWave1_PCos +
        px4demo_PositionController_q_DW.lastCos_j *
        px4demo_PositionController_qu_P.SineWave1_PSin) *
       px4demo_PositionController_qu_P.SineWave1_HCos +
       (px4demo_PositionController_q_DW.lastCos_j *
        px4demo_PositionController_qu_P.SineWave1_PCos -
        px4demo_PositionController_q_DW.lastSin_g *
        px4demo_PositionController_qu_P.SineWave1_PSin) *
       px4demo_PositionController_qu_P.SineWave1_Hsin) *
      px4demo_PositionController_qu_P.SineWave1_Amp +
      px4demo_PositionController_qu_P.SineWave1_Bias;
  }

  // End of ManualSwitch: '<Root>/Manual Switch1'

  // DataTypeConversion: '<S5>/Data Type Conversion3'
  px4demo_PositionController_qu_B.x = px4demo_PositionController_qu_B.In1.x;

  // DataTypeConversion: '<S5>/Data Type Conversion1'
  px4demo_PositionController_qu_B.y = px4demo_PositionController_qu_B.In1.y;

  // MATLAB Function: '<S5>/Rotation mat '
  px4demo_PositionController_qu_B.fcn3 = sin
    (px4demo_PositionController_qu_B.VectorConcatenate[0]);
  px4demo_PositionController_qu_B.Saturation_jh = cos
    (px4demo_PositionController_qu_B.VectorConcatenate[0]);

  // Sum: '<S5>/Subtract'
  px4demo_PositionController_qu_B.Saturation_k =
    px4demo_PositionController_qu_B.x - px4demo_PositionController_qu_B.des_x;
  px4demo_PositionController_qu_B.Filter_d = px4demo_PositionController_qu_B.y -
    px4demo_PositionController_qu_B.des_y;

  // Product: '<S5>/MatrixMultiply' incorporates:
  //   MATLAB Function: '<S5>/Rotation mat '

  px4demo_PositionController_qu_B.Integrator_a =
    px4demo_PositionController_qu_B.Saturation_jh *
    px4demo_PositionController_qu_B.Saturation_k +
    px4demo_PositionController_qu_B.fcn3 *
    px4demo_PositionController_qu_B.Filter_d;
  rtb_MatrixMultiply = -px4demo_PositionController_qu_B.fcn3 *
    px4demo_PositionController_qu_B.Saturation_k +
    px4demo_PositionController_qu_B.Saturation_jh *
    px4demo_PositionController_qu_B.Filter_d;

  // DiscreteIntegrator: '<S251>/Integrator' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Integrator_PrevResetState_b != 0)) {
    px4demo_PositionController_q_DW.Integrator_DSTATE_l =
      px4demo_PositionController_qu_P.PID_x_InitialConditionForIntegr;
  }

  // DiscreteIntegrator: '<S246>/Filter' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Filter_PrevResetState_c != 0)) {
    px4demo_PositionController_q_DW.Filter_DSTATE_j =
      px4demo_PositionController_qu_P.PID_x_InitialConditionForFilter;
  }

  // Gain: '<S254>/Filter Coefficient' incorporates:
  //   DiscreteIntegrator: '<S246>/Filter'
  //   Gain: '<S245>/Derivative Gain'
  //   Sum: '<S246>/SumD'

  px4demo_PositionController_qu_B.Saturation_jh =
    (px4demo_PositionController_qu_P.PID_x_D *
     px4demo_PositionController_qu_B.Integrator_a -
     px4demo_PositionController_q_DW.Filter_DSTATE_j) *
    px4demo_PositionController_qu_P.PID_x_N;

  // Sum: '<S260>/Sum' incorporates:
  //   DiscreteIntegrator: '<S251>/Integrator'
  //   Gain: '<S256>/Proportional Gain'

  u0 = (px4demo_PositionController_qu_P.PID_x_P *
        px4demo_PositionController_qu_B.Integrator_a +
        px4demo_PositionController_q_DW.Integrator_DSTATE_l) +
    px4demo_PositionController_qu_B.Saturation_jh;

  // Saturate: '<S258>/Saturation'
  if (u0 > px4demo_PositionController_qu_P.PID_x_UpperSaturationLimit) {
    u0 = px4demo_PositionController_qu_P.PID_x_UpperSaturationLimit;
  } else {
    if (u0 < px4demo_PositionController_qu_P.PID_x_LowerSaturationLimit) {
      u0 = px4demo_PositionController_qu_P.PID_x_LowerSaturationLimit;
    }
  }

  // End of Saturate: '<S258>/Saturation'

  // Gain: '<S15>/Gain1'
  px4demo_PositionController_qu_B.des_pitch =
    px4demo_PositionController_qu_P.Gain1_Gain_j * u0;

  // Sum: '<S2>/Add2'
  px4demo_PositionController_qu_B.fcn3 =
    px4demo_PositionController_qu_B.VectorConcatenate[1] -
    px4demo_PositionController_qu_B.des_pitch;

  // DiscreteIntegrator: '<S51>/Integrator' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Integrator_PrevResetState_e != 0)) {
    px4demo_PositionController_q_DW.Integrator_DSTATE_n =
      px4demo_PositionController_qu_P.PID_pitch_InitialConditionForIn;
  }

  // DiscreteIntegrator: '<S51>/Integrator' incorporates:
  //   Gain: '<S48>/Integral Gain'

  px4demo_PositionController_qu_B.Saturation_k =
    px4demo_PositionController_qu_P.PID_pitch_I *
    px4demo_PositionController_qu_B.fcn3 *
    px4demo_PositionController_qu_P.Integrator_gainval_nf +
    px4demo_PositionController_q_DW.Integrator_DSTATE_n;

  // DiscreteIntegrator: '<S46>/Filter' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Filter_PrevResetState_f != 0)) {
    px4demo_PositionController_q_DW.Filter_DSTATE_f =
      px4demo_PositionController_qu_P.PID_pitch_InitialConditionForFi;
  }

  // Gain: '<S54>/Filter Coefficient' incorporates:
  //   DiscreteIntegrator: '<S46>/Filter'
  //   Gain: '<S45>/Derivative Gain'
  //   Sum: '<S46>/SumD'

  px4demo_PositionController_qu_B.Filter_d =
    (px4demo_PositionController_qu_P.PID_pitch_D *
     px4demo_PositionController_qu_B.fcn3 -
     px4demo_PositionController_q_DW.Filter_DSTATE_f) *
    px4demo_PositionController_qu_P.PID_pitch_N;

  // DiscreteIntegrator: '<S299>/Integrator' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Integrator_PrevResetState_j != 0)) {
    px4demo_PositionController_q_DW.Integrator_DSTATE_f =
      px4demo_PositionController_qu_P.PID_y_InitialConditionForIntegr;
  }

  // DiscreteIntegrator: '<S294>/Filter' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Filter_PrevResetState_n != 0)) {
    px4demo_PositionController_q_DW.Filter_DSTATE_a =
      px4demo_PositionController_qu_P.PID_y_InitialConditionForFilter;
  }

  // Gain: '<S302>/Filter Coefficient' incorporates:
  //   DiscreteIntegrator: '<S294>/Filter'
  //   Gain: '<S293>/Derivative Gain'
  //   Sum: '<S294>/SumD'

  px4demo_PositionController_qu_B.FilterCoefficient_j =
    (px4demo_PositionController_qu_P.PID_y_D * rtb_MatrixMultiply -
     px4demo_PositionController_q_DW.Filter_DSTATE_a) *
    px4demo_PositionController_qu_P.PID_y_N;

  // Sum: '<S308>/Sum' incorporates:
  //   DiscreteIntegrator: '<S299>/Integrator'
  //   Gain: '<S304>/Proportional Gain'

  u0 = (px4demo_PositionController_qu_P.PID_y_P * rtb_MatrixMultiply +
        px4demo_PositionController_q_DW.Integrator_DSTATE_f) +
    px4demo_PositionController_qu_B.FilterCoefficient_j;

  // Saturate: '<S306>/Saturation'
  if (u0 > px4demo_PositionController_qu_P.PID_y_UpperSaturationLimit) {
    u0 = px4demo_PositionController_qu_P.PID_y_UpperSaturationLimit;
  } else {
    if (u0 < px4demo_PositionController_qu_P.PID_y_LowerSaturationLimit) {
      u0 = px4demo_PositionController_qu_P.PID_y_LowerSaturationLimit;
    }
  }

  // End of Saturate: '<S306>/Saturation'

  // Gain: '<S16>/Gain1' incorporates:
  //   Gain: '<S5>/Gain'

  px4demo_PositionController_qu_B.des_roll =
    px4demo_PositionController_qu_P.Gain_Gain * u0 *
    px4demo_PositionController_qu_P.Gain1_Gain_g;

  // Sum: '<S2>/Add3'
  px4demo_PositionController_qu_B.Filter_g =
    px4demo_PositionController_qu_B.VectorConcatenate[2] -
    px4demo_PositionController_qu_B.des_roll;

  // DiscreteIntegrator: '<S99>/Integrator' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Integrator_PrevResetState_c != 0)) {
    px4demo_PositionController_q_DW.Integrator_DSTATE_p =
      px4demo_PositionController_qu_P.PID_roll_InitialConditionForInt;
  }

  // DiscreteIntegrator: '<S99>/Integrator' incorporates:
  //   Gain: '<S96>/Integral Gain'

  Integrator_c = px4demo_PositionController_qu_P.PID_roll_I *
    px4demo_PositionController_qu_B.Filter_g *
    px4demo_PositionController_qu_P.Integrator_gainval_j +
    px4demo_PositionController_q_DW.Integrator_DSTATE_p;

  // DiscreteIntegrator: '<S94>/Filter' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Filter_PrevResetState_l != 0)) {
    px4demo_PositionController_q_DW.Filter_DSTATE_m =
      px4demo_PositionController_qu_P.PID_roll_InitialConditionForFil;
  }

  // Gain: '<S102>/Filter Coefficient' incorporates:
  //   DiscreteIntegrator: '<S94>/Filter'
  //   Gain: '<S93>/Derivative Gain'
  //   Sum: '<S94>/SumD'

  px4demo_PositionController_qu_B.FilterCoefficient_ju =
    (px4demo_PositionController_qu_P.PID_roll_D *
     px4demo_PositionController_qu_B.Filter_g -
     px4demo_PositionController_q_DW.Filter_DSTATE_m) *
    px4demo_PositionController_qu_P.PID_roll_N;

  // Gain: '<S14>/Gain1' incorporates:
  //   Constant: '<Root>/des_yaw'

  px4demo_PositionController_qu_B.des_yaw =
    px4demo_PositionController_qu_P.Gain1_Gain_i *
    px4demo_PositionController_qu_P.des_yaw_Value;

  // Sum: '<S2>/Add1'
  px4demo_PositionController_qu_B.Filter_f =
    px4demo_PositionController_qu_B.des_yaw -
    px4demo_PositionController_qu_B.VectorConcatenate[0];

  // DiscreteIntegrator: '<S147>/Integrator' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Integrator_PrevResetState_i != 0)) {
    px4demo_PositionController_q_DW.Integrator_DSTATE_nm =
      px4demo_PositionController_qu_P.PID_yaw_InitialConditionForInte;
  }

  // DiscreteIntegrator: '<S147>/Integrator' incorporates:
  //   Gain: '<S144>/Integral Gain'

  Integrator_o = px4demo_PositionController_qu_P.PID_yaw_I *
    px4demo_PositionController_qu_B.Filter_f *
    px4demo_PositionController_qu_P.Integrator_gainval_ni +
    px4demo_PositionController_q_DW.Integrator_DSTATE_nm;

  // DiscreteIntegrator: '<S142>/Filter' incorporates:
  //   Constant: '<Root>/Reset'

  if (px4demo_PositionController_qu_P.Reset_Value ||
      (px4demo_PositionController_q_DW.Filter_PrevResetState_g != 0)) {
    px4demo_PositionController_q_DW.Filter_DSTATE_a1 =
      px4demo_PositionController_qu_P.PID_yaw_InitialConditionForFilt;
  }

  // Gain: '<S150>/Filter Coefficient' incorporates:
  //   DiscreteIntegrator: '<S142>/Filter'
  //   Gain: '<S141>/Derivative Gain'
  //   Sum: '<S142>/SumD'

  px4demo_PositionController_qu_B.FilterCoefficient_ft =
    (px4demo_PositionController_qu_P.PID_yaw_D *
     px4demo_PositionController_qu_B.Filter_f -
     px4demo_PositionController_q_DW.Filter_DSTATE_a1) *
    px4demo_PositionController_qu_P.PID_yaw_N;

  // Sum: '<S60>/Sum' incorporates:
  //   Gain: '<S56>/Proportional Gain'

  u0 = (px4demo_PositionController_qu_P.PID_pitch_P *
        px4demo_PositionController_qu_B.fcn3 +
        px4demo_PositionController_qu_B.Saturation_k) +
    px4demo_PositionController_qu_B.Filter_d;

  // Saturate: '<S58>/Saturation'
  if (u0 > px4demo_PositionController_qu_P.PID_pitch_UpperSaturationLimit) {
    u0 = px4demo_PositionController_qu_P.PID_pitch_UpperSaturationLimit;
  } else {
    if (u0 < px4demo_PositionController_qu_P.PID_pitch_LowerSaturationLimit) {
      u0 = px4demo_PositionController_qu_P.PID_pitch_LowerSaturationLimit;
    }
  }

  // Sum: '<S108>/Sum' incorporates:
  //   Gain: '<S104>/Proportional Gain'

  px4demo_PositionController_qu_B.Filter_g =
    (px4demo_PositionController_qu_P.PID_roll_P *
     px4demo_PositionController_qu_B.Filter_g + Integrator_c) +
    px4demo_PositionController_qu_B.FilterCoefficient_ju;

  // Saturate: '<S106>/Saturation'
  if (px4demo_PositionController_qu_B.Filter_g >
      px4demo_PositionController_qu_P.PID_roll_UpperSaturationLimit) {
    px4demo_PositionController_qu_B.Filter_g =
      px4demo_PositionController_qu_P.PID_roll_UpperSaturationLimit;
  } else {
    if (px4demo_PositionController_qu_B.Filter_g <
        px4demo_PositionController_qu_P.PID_roll_LowerSaturationLimit) {
      px4demo_PositionController_qu_B.Filter_g =
        px4demo_PositionController_qu_P.PID_roll_LowerSaturationLimit;
    }
  }

  // Sum: '<S156>/Sum' incorporates:
  //   Gain: '<S152>/Proportional Gain'

  px4demo_PositionController_qu_B.Filter_f =
    (px4demo_PositionController_qu_P.PID_yaw_P *
     px4demo_PositionController_qu_B.Filter_f + Integrator_o) +
    px4demo_PositionController_qu_B.FilterCoefficient_ft;

  // Saturate: '<S154>/Saturation'
  if (px4demo_PositionController_qu_B.Filter_f >
      px4demo_PositionController_qu_P.PID_yaw_UpperSaturationLimit) {
    px4demo_PositionController_qu_B.Filter_f =
      px4demo_PositionController_qu_P.PID_yaw_UpperSaturationLimit;
  } else {
    if (px4demo_PositionController_qu_B.Filter_f <
        px4demo_PositionController_qu_P.PID_yaw_LowerSaturationLimit) {
      px4demo_PositionController_qu_B.Filter_f =
        px4demo_PositionController_qu_P.PID_yaw_LowerSaturationLimit;
    }
  }

  for (i = 0; i < 4; i++) {
    // Product: '<S7>/Product1' incorporates:
    //   Constant: '<S7>/Mixer matrix'
    //   Saturate: '<S106>/Saturation'
    //   Saturate: '<S154>/Saturation'
    //   Saturate: '<S58>/Saturation'
    //   SignalConversion generated from: '<S7>/Product1'

    px4demo_PositionController_qu_B.fcn3 =
      px4demo_PositionController_qu_P.Mixermatrix_Value[i + 12] *
      px4demo_PositionController_qu_B.Filter_f +
      (px4demo_PositionController_qu_P.Mixermatrix_Value[i + 8] *
       px4demo_PositionController_qu_B.Filter_g +
       (px4demo_PositionController_qu_P.Mixermatrix_Value[i + 4] * u0 +
        px4demo_PositionController_qu_P.Mixermatrix_Value[i] *
        px4demo_PositionController_qu_B.Saturation_j));

    // Gain: '<S7>/Gain1'
    px4demo_PositionController_qu_B.fcn3 = floor
      (px4demo_PositionController_qu_P.Gain1_Gain_h *
       px4demo_PositionController_qu_B.fcn3);
    if (rtIsNaN(px4demo_PositionController_qu_B.fcn3) || rtIsInf
        (px4demo_PositionController_qu_B.fcn3)) {
      px4demo_PositionController_qu_B.fcn3 = 0.0;
    } else {
      px4demo_PositionController_qu_B.fcn3 = fmod
        (px4demo_PositionController_qu_B.fcn3, 65536.0);
    }

    // Gain: '<S7>/Gain1'
    px4demo_PositionController_qu_B.Gain1[i] = static_cast<uint16_T>
      (px4demo_PositionController_qu_B.fcn3 < 0.0 ? static_cast<int32_T>(
        static_cast<uint16_T>(-static_cast<int16_T>(static_cast<uint16_T>
          (-px4demo_PositionController_qu_B.fcn3)))) : static_cast<int32_T>(
        static_cast<uint16_T>(px4demo_PositionController_qu_B.fcn3)));
  }

  // MATLABSystem: '<S7>/PX4 PWM Output' incorporates:
  //   Constant: '<Root>/Reset'
  //   Logic: '<S7>/NOT'

  if (!px4demo_PositionController_qu_P.Reset_Value) {
    if (!px4demo_PositionController_q_DW.obj_a.isArmed) {
      px4demo_PositionController_q_DW.obj_a.isArmed = true;
      status = pwm_arm(&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
                       &px4demo_PositionController_q_DW.obj_a.armAdvertiseObj);
      px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
        (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
    }

    for (i = 0; i < 8; i++) {
      px4demo_PositionController_qu_B.b_pwmValue[i] = 0U;
    }

    px4demo_PositionController_qu_B.b_pwmValue[0] =
      px4demo_PositionController_qu_B.Gain1[0];
    px4demo_PositionController_qu_B.b_pwmValue[1] =
      px4demo_PositionController_qu_B.Gain1[1];
    px4demo_PositionController_qu_B.b_pwmValue[2] =
      px4demo_PositionController_qu_B.Gain1[2];
    px4demo_PositionController_qu_B.b_pwmValue[3] =
      px4demo_PositionController_qu_B.Gain1[3];
    status = pwm_setServo(&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
                          px4demo_PositionController_q_DW.obj_a.servoCount,
                          px4demo_PositionController_q_DW.obj_a.channelMask,
                          &px4demo_PositionController_qu_B.b_pwmValue[0],
                          px4demo_PositionController_q_DW.obj_a.isMain,
                          &px4demo_PositionController_q_DW.obj_a.actuatorAdvertiseObj);
    px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
      (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
  } else {
    status = pwm_disarm(&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
                        &px4demo_PositionController_q_DW.obj_a.armAdvertiseObj);
    px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
      (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
    px4demo_PositionController_q_DW.obj_a.isArmed = false;
    status = pwm_resetServo(&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
      px4demo_PositionController_q_DW.obj_a.servoCount,
      px4demo_PositionController_q_DW.obj_a.channelMask,
      px4demo_PositionController_q_DW.obj_a.isMain,
      &px4demo_PositionController_q_DW.obj_a.actuatorAdvertiseObj);
    px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
      (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
  }

  if (px4demo_PositionController_q_DW.obj_a.isMain) {
    status = pwm_forceFailsafe
      (&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
       px4demo_PositionController_qu_P.Reset_Value);
    px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
      (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
  }

  // End of MATLABSystem: '<S7>/PX4 PWM Output'
  // Gain: '<S248>/Integral Gain'
  px4demo_PositionController_qu_B.Saturation_j =
    px4demo_PositionController_qu_P.PID_x_I *
    px4demo_PositionController_qu_B.Integrator_a;

  // Gain: '<S296>/Integral Gain'
  px4demo_PositionController_qu_B.fcn3 = px4demo_PositionController_qu_P.PID_y_I
    * rtb_MatrixMultiply;

  // MATLABSystem: '<S11>/SourceBlock'
  rtb_NotEqual = uORB_read_step
    (px4demo_PositionController_q_DW.obj_f.orbMetadataObj,
     &px4demo_PositionController_q_DW.obj_f.eventStructObj,
     &px4demo_PositionController_qu_B.BusAssignment, false, 1.0);

  // Logic: '<S11>/NOT' incorporates:
  //   MATLABSystem: '<S11>/SourceBlock'

  px4demo_PositionController_qu_B.NOT_h = !rtb_NotEqual;

  // Outputs for Enabled SubSystem: '<S11>/Enabled Subsystem' incorporates:
  //   EnablePort: '<S13>/Enable'

  // MATLABSystem: '<S11>/SourceBlock' incorporates:
  //   Inport: '<S13>/In1'

  if (rtb_NotEqual) {
    px4demo_PositionController_qu_B.In1_j =
      px4demo_PositionController_qu_B.BusAssignment;
    srUpdateBC(px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_n);
  }

  // End of Outputs for SubSystem: '<S11>/Enabled Subsystem'

  // BusAssignment: '<S1>/Bus Assignment' incorporates:
  //   Constant: '<S1>/Constant'
  //   Inport: '<S13>/In1'

  px4demo_PositionController_qu_B.BusAssignment =
    px4demo_PositionController_qu_B.In1_j;
  px4demo_PositionController_qu_B.BusAssignment.armed =
    px4demo_PositionController_qu_P.Constant_Value_i;

  // MATLABSystem: '<S12>/SinkBlock' incorporates:
  //   BusAssignment: '<S1>/Bus Assignment'

  uORB_write_step(px4demo_PositionController_q_DW.obj_o.orbMetadataObj,
                  &px4demo_PositionController_q_DW.obj_o.orbAdvertiseObj,
                  &px4demo_PositionController_qu_B.BusAssignment);

  // Update for DiscreteIntegrator: '<S198>/Filter' incorporates:
  //   DataStoreRead: '<S5>/Data Store Read'

  px4demo_PositionController_q_DW.Filter_DSTATE +=
    px4demo_PositionController_qu_P.Filter_gainval *
    px4demo_PositionController_qu_B.FilterCoefficient;
  px4demo_PositionController_q_DW.Filter_PrevResetState = static_cast<int8_T>
    (reset);

  // Update for DiscreteIntegrator: '<S203>/Integrator' incorporates:
  //   DataStoreRead: '<S5>/Data Store Read'

  px4demo_PositionController_q_DW.Integrator_DSTATE = rtb_ZeroGain;
  px4demo_PositionController_q_DW.Integrator_PrevResetState = static_cast<int8_T>
    (reset);

  // Update for Sin: '<Root>/Sine Wave'
  px4demo_PositionController_qu_B.FilterCoefficient =
    px4demo_PositionController_q_DW.lastSin;
  px4demo_PositionController_q_DW.lastSin =
    px4demo_PositionController_q_DW.lastSin *
    px4demo_PositionController_qu_P.SineWave_HCos +
    px4demo_PositionController_q_DW.lastCos *
    px4demo_PositionController_qu_P.SineWave_Hsin;
  px4demo_PositionController_q_DW.lastCos =
    px4demo_PositionController_q_DW.lastCos *
    px4demo_PositionController_qu_P.SineWave_HCos -
    px4demo_PositionController_qu_B.FilterCoefficient *
    px4demo_PositionController_qu_P.SineWave_Hsin;

  // Update for Sin: '<Root>/Sine Wave1'
  px4demo_PositionController_qu_B.FilterCoefficient =
    px4demo_PositionController_q_DW.lastSin_g;
  px4demo_PositionController_q_DW.lastSin_g =
    px4demo_PositionController_q_DW.lastSin_g *
    px4demo_PositionController_qu_P.SineWave1_HCos +
    px4demo_PositionController_q_DW.lastCos_j *
    px4demo_PositionController_qu_P.SineWave1_Hsin;
  px4demo_PositionController_q_DW.lastCos_j =
    px4demo_PositionController_q_DW.lastCos_j *
    px4demo_PositionController_qu_P.SineWave1_HCos -
    px4demo_PositionController_qu_B.FilterCoefficient *
    px4demo_PositionController_qu_P.SineWave1_Hsin;

  // Update for DiscreteIntegrator: '<S251>/Integrator' incorporates:
  //   DataStoreRead: '<S5>/Data Store Read5'

  px4demo_PositionController_q_DW.Integrator_DSTATE_l +=
    px4demo_PositionController_qu_P.Integrator_gainval_n *
    px4demo_PositionController_qu_B.Saturation_j;
  px4demo_PositionController_q_DW.Integrator_PrevResetState_b =
    static_cast<int8_T>(reset);

  // Update for DiscreteIntegrator: '<S246>/Filter' incorporates:
  //   DataStoreRead: '<S5>/Data Store Read5'

  px4demo_PositionController_q_DW.Filter_DSTATE_j +=
    px4demo_PositionController_qu_P.Filter_gainval_p *
    px4demo_PositionController_qu_B.Saturation_jh;
  px4demo_PositionController_q_DW.Filter_PrevResetState_c = static_cast<int8_T>
    (reset);

  // Update for DiscreteIntegrator: '<S51>/Integrator' incorporates:
  //   DataStoreRead: '<S2>/Data Store Read1'

  px4demo_PositionController_q_DW.Integrator_DSTATE_n =
    px4demo_PositionController_qu_B.Saturation_k;
  px4demo_PositionController_q_DW.Integrator_PrevResetState_e =
    static_cast<int8_T>(reset);

  // Update for DiscreteIntegrator: '<S46>/Filter' incorporates:
  //   DataStoreRead: '<S2>/Data Store Read1'

  px4demo_PositionController_q_DW.Filter_DSTATE_f +=
    px4demo_PositionController_qu_P.Filter_gainval_h *
    px4demo_PositionController_qu_B.Filter_d;
  px4demo_PositionController_q_DW.Filter_PrevResetState_f = static_cast<int8_T>
    (reset);

  // Update for DiscreteIntegrator: '<S299>/Integrator' incorporates:
  //   DataStoreRead: '<S5>/Data Store Read6'

  px4demo_PositionController_q_DW.Integrator_DSTATE_f +=
    px4demo_PositionController_qu_P.Integrator_gainval_p *
    px4demo_PositionController_qu_B.fcn3;
  px4demo_PositionController_q_DW.Integrator_PrevResetState_j =
    static_cast<int8_T>(reset);

  // Update for DiscreteIntegrator: '<S294>/Filter' incorporates:
  //   DataStoreRead: '<S5>/Data Store Read6'

  px4demo_PositionController_q_DW.Filter_DSTATE_a +=
    px4demo_PositionController_qu_P.Filter_gainval_o *
    px4demo_PositionController_qu_B.FilterCoefficient_j;
  px4demo_PositionController_q_DW.Filter_PrevResetState_n = static_cast<int8_T>
    (reset);

  // Update for DiscreteIntegrator: '<S99>/Integrator' incorporates:
  //   DataStoreRead: '<S2>/Data Store Read4'

  px4demo_PositionController_q_DW.Integrator_DSTATE_p = Integrator_c;
  px4demo_PositionController_q_DW.Integrator_PrevResetState_c =
    static_cast<int8_T>(reset);

  // Update for DiscreteIntegrator: '<S94>/Filter' incorporates:
  //   DataStoreRead: '<S2>/Data Store Read4'

  px4demo_PositionController_q_DW.Filter_DSTATE_m +=
    px4demo_PositionController_qu_P.Filter_gainval_c *
    px4demo_PositionController_qu_B.FilterCoefficient_ju;
  px4demo_PositionController_q_DW.Filter_PrevResetState_l = static_cast<int8_T>
    (reset);

  // Update for DiscreteIntegrator: '<S147>/Integrator' incorporates:
  //   DataStoreRead: '<S2>/Data Store Read2'

  px4demo_PositionController_q_DW.Integrator_DSTATE_nm = Integrator_o;
  px4demo_PositionController_q_DW.Integrator_PrevResetState_i =
    static_cast<int8_T>(reset);

  // Update for DiscreteIntegrator: '<S142>/Filter' incorporates:
  //   DataStoreRead: '<S2>/Data Store Read2'

  px4demo_PositionController_q_DW.Filter_DSTATE_a1 +=
    px4demo_PositionController_qu_P.Filter_gainval_hv *
    px4demo_PositionController_qu_B.FilterCoefficient_ft;
  px4demo_PositionController_q_DW.Filter_PrevResetState_g = static_cast<int8_T>
    (reset);

  // External mode
  rtExtModeUploadCheckTrigger(1);

  {                                    // Sample time: [0.01s, 0.0s]
    rtExtModeUpload(0, (real_T)px4demo_PositionController_q_M->Timing.taskTime0);
  }

  // signal main to stop simulation
  {                                    // Sample time: [0.01s, 0.0s]
    if ((rtmGetTFinal(px4demo_PositionController_q_M)!=-1) &&
        !((rtmGetTFinal(px4demo_PositionController_q_M)-
           px4demo_PositionController_q_M->Timing.taskTime0) >
          px4demo_PositionController_q_M->Timing.taskTime0 * (DBL_EPSILON))) {
      rtmSetErrorStatus(px4demo_PositionController_q_M, "Simulation finished");
    }

    if (rtmGetStopRequested(px4demo_PositionController_q_M)) {
      rtmSetErrorStatus(px4demo_PositionController_q_M, "Simulation finished");
    }
  }

  // Update absolute time for base rate
  // The "clockTick0" counts the number of times the code of this task has
  //  been executed. The absolute time is the multiplication of "clockTick0"
  //  and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
  //  overflow during the application lifespan selected.

  px4demo_PositionController_q_M->Timing.taskTime0 =
    ((time_T)(++px4demo_PositionController_q_M->Timing.clockTick0)) *
    px4demo_PositionController_q_M->Timing.stepSize0;
}

// Model initialize function
void px4demo_PositionController_quadrotor_initialize(void)
{
  // Registration code

  // initialize non-finites
  rt_InitInfAndNaN(sizeof(real_T));
  rtmSetTFinal(px4demo_PositionController_q_M, -1);
  px4demo_PositionController_q_M->Timing.stepSize0 = 0.01;

  // External mode info
  px4demo_PositionController_q_M->Sizes.checksums[0] = (717730562U);
  px4demo_PositionController_q_M->Sizes.checksums[1] = (2147603691U);
  px4demo_PositionController_q_M->Sizes.checksums[2] = (3612359208U);
  px4demo_PositionController_q_M->Sizes.checksums[3] = (576647171U);

  {
    static const sysRanDType rtAlwaysEnabled = SUBSYS_RAN_BC_ENABLE;
    static RTWExtModeInfo rt_ExtModeInfo;
    static const sysRanDType *systemRan[15];
    px4demo_PositionController_q_M->extModeInfo = (&rt_ExtModeInfo);
    rteiSetSubSystemActiveVectorAddresses(&rt_ExtModeInfo, systemRan);
    systemRan[0] = &rtAlwaysEnabled;
    systemRan[1] = (sysRanDType *)
      &px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_n;
    systemRan[2] = &rtAlwaysEnabled;
    systemRan[3] = &rtAlwaysEnabled;
    systemRan[4] = (sysRanDType *)
      &px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_h;
    systemRan[5] = &rtAlwaysEnabled;
    systemRan[6] = (sysRanDType *)
      &px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC;
    systemRan[7] = &rtAlwaysEnabled;
    systemRan[8] = &rtAlwaysEnabled;
    systemRan[9] = (sysRanDType *)
      &px4demo_PositionController_q_DW.IfActionSubsystem_SubsysRanBC;
    systemRan[10] = (sysRanDType *)
      &px4demo_PositionController_q_DW.IfActionSubsystem1_SubsysRanBC;
    systemRan[11] = (sysRanDType *)
      &px4demo_PositionController_q_DW.IfActionSubsystem2_SubsysRanBC;
    systemRan[12] = &rtAlwaysEnabled;
    systemRan[13] = &rtAlwaysEnabled;
    systemRan[14] = &rtAlwaysEnabled;
    rteiSetModelMappingInfoPtr(px4demo_PositionController_q_M->extModeInfo,
      &px4demo_PositionController_q_M->SpecialInfo.mappingInfo);
    rteiSetChecksumsPtr(px4demo_PositionController_q_M->extModeInfo,
                        px4demo_PositionController_q_M->Sizes.checksums);
    rteiSetTPtr(px4demo_PositionController_q_M->extModeInfo, rtmGetTPtr
                (px4demo_PositionController_q_M));
  }

  // data type transition information
  {
    static DataTypeTransInfo dtInfo;
    px4demo_PositionController_q_M->SpecialInfo.mappingInfo = (&dtInfo);
    dtInfo.numDataTypes = 23;
    dtInfo.dataTypeSizes = &rtDataTypeSizes[0];
    dtInfo.dataTypeNames = &rtDataTypeNames[0];

    // Block I/O transition table
    dtInfo.BTransTable = &rtBTransTable;

    // Parameters transition table
    dtInfo.PTransTable = &rtPTransTable;
  }

  {
    px4_Bus_actuator_armed rtb_BusAssignment;
    boolean_T rtb_NOT;

    // InitializeConditions for DiscreteIntegrator: '<S198>/Filter'
    px4demo_PositionController_q_DW.Filter_DSTATE =
      px4demo_PositionController_qu_P.PID_Altitude_InitialConditionFo;

    // InitializeConditions for DiscreteIntegrator: '<S203>/Integrator'
    px4demo_PositionController_q_DW.Integrator_DSTATE =
      px4demo_PositionController_qu_P.PID_Altitude_InitialCondition_e;

    // InitializeConditions for DiscreteIntegrator: '<S251>/Integrator'
    px4demo_PositionController_q_DW.Integrator_DSTATE_l =
      px4demo_PositionController_qu_P.PID_x_InitialConditionForIntegr;

    // InitializeConditions for DiscreteIntegrator: '<S246>/Filter'
    px4demo_PositionController_q_DW.Filter_DSTATE_j =
      px4demo_PositionController_qu_P.PID_x_InitialConditionForFilter;

    // InitializeConditions for DiscreteIntegrator: '<S51>/Integrator'
    px4demo_PositionController_q_DW.Integrator_DSTATE_n =
      px4demo_PositionController_qu_P.PID_pitch_InitialConditionForIn;

    // InitializeConditions for DiscreteIntegrator: '<S46>/Filter'
    px4demo_PositionController_q_DW.Filter_DSTATE_f =
      px4demo_PositionController_qu_P.PID_pitch_InitialConditionForFi;

    // InitializeConditions for DiscreteIntegrator: '<S299>/Integrator'
    px4demo_PositionController_q_DW.Integrator_DSTATE_f =
      px4demo_PositionController_qu_P.PID_y_InitialConditionForIntegr;

    // InitializeConditions for DiscreteIntegrator: '<S294>/Filter'
    px4demo_PositionController_q_DW.Filter_DSTATE_a =
      px4demo_PositionController_qu_P.PID_y_InitialConditionForFilter;

    // InitializeConditions for DiscreteIntegrator: '<S99>/Integrator'
    px4demo_PositionController_q_DW.Integrator_DSTATE_p =
      px4demo_PositionController_qu_P.PID_roll_InitialConditionForInt;

    // InitializeConditions for DiscreteIntegrator: '<S94>/Filter'
    px4demo_PositionController_q_DW.Filter_DSTATE_m =
      px4demo_PositionController_qu_P.PID_roll_InitialConditionForFil;

    // InitializeConditions for DiscreteIntegrator: '<S147>/Integrator'
    px4demo_PositionController_q_DW.Integrator_DSTATE_nm =
      px4demo_PositionController_qu_P.PID_yaw_InitialConditionForInte;

    // InitializeConditions for DiscreteIntegrator: '<S142>/Filter'
    px4demo_PositionController_q_DW.Filter_DSTATE_a1 =
      px4demo_PositionController_qu_P.PID_yaw_InitialConditionForFilt;

    // SystemInitialize for Enabled SubSystem: '<S3>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S164>/Out1' incorporates:
    //   Inport: '<S164>/In1'

    px4demo_PositionController_qu_B.In1 =
      px4demo_PositionController_qu_P.Out1_Y0;

    // End of SystemInitialize for SubSystem: '<S3>/Enabled Subsystem'

    // SystemInitialize for Enabled SubSystem: '<S4>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S165>/Out1' incorporates:
    //   Inport: '<S165>/In1'

    px4demo_PositionController_qu_B.In1_o =
      px4demo_PositionController_qu_P.Out1_Y0_e;

    // End of SystemInitialize for SubSystem: '<S4>/Enabled Subsystem'

    // SystemInitialize for Enabled SubSystem: '<S11>/Enabled Subsystem'
    // SystemInitialize for Outport: '<S13>/Out1' incorporates:
    //   Inport: '<S13>/In1'

    px4demo_PositionController_qu_B.In1_j =
      px4demo_PositionController_qu_P.Out1_Y0_m;

    // End of SystemInitialize for SubSystem: '<S11>/Enabled Subsystem'

    // Start for MATLABSystem: '<S3>/SourceBlock'
    px4demo_PositionController_q_DW.obj_h.matlabCodegenIsDeleted = true;
    px4demo_PositionController_q_DW.obj_h.isInitialized = 0;
    px4demo_PositionController_q_DW.obj_h.matlabCodegenIsDeleted = false;
    px4demo_PositionController_q_DW.obj_h.isSetupComplete = false;
    px4demo_PositionController_q_DW.obj_h.isInitialized = 1;
    px4demo_PositionController_q_DW.obj_h.orbMetadataObj = ORB_ID
      (vehicle_local_position_groundtruth);
    uORB_read_initialize(px4demo_PositionController_q_DW.obj_h.orbMetadataObj,
                         &px4demo_PositionController_q_DW.obj_h.eventStructObj);
    px4demo_PositionController_q_DW.obj_h.isSetupComplete = true;

    // Start for MATLABSystem: '<S4>/SourceBlock'
    px4demo_PositionController_q_DW.obj.matlabCodegenIsDeleted = true;
    px4demo_PositionController_q_DW.obj.isInitialized = 0;
    px4demo_PositionController_q_DW.obj.matlabCodegenIsDeleted = false;
    px4demo_PositionController_q_DW.obj.isSetupComplete = false;
    px4demo_PositionController_q_DW.obj.isInitialized = 1;
    px4demo_PositionController_q_DW.obj.orbMetadataObj = ORB_ID
      (vehicle_attitude_groundtruth);
    uORB_read_initialize(px4demo_PositionController_q_DW.obj.orbMetadataObj,
                         &px4demo_PositionController_q_DW.obj.eventStructObj);
    px4demo_PositionController_q_DW.obj.isSetupComplete = true;

    // Start for MATLABSystem: '<S7>/PX4 PWM Output'
    px4demo_PositionController_q_DW.obj_a.matlabCodegenIsDeleted = true;
    px4demo_PositionController_q_DW.obj_a.errorStatus = 0U;
    px4demo_PositionController_q_DW.obj_a.isInitialized = 0;
    px4demo_PositionController_q_DW.obj_a.matlabCodegenIsDeleted = false;
    px4demo_Positi_SystemCore_setup(&px4demo_PositionController_q_DW.obj_a,
      rtb_NOT, rtb_NOT);

    // Start for MATLABSystem: '<S11>/SourceBlock'
    px4demo_PositionController_q_DW.obj_f.matlabCodegenIsDeleted = true;
    px4demo_PositionController_q_DW.obj_f.isInitialized = 0;
    px4demo_PositionController_q_DW.obj_f.matlabCodegenIsDeleted = false;
    px4demo_PositionController_q_DW.obj_f.isSetupComplete = false;
    px4demo_PositionController_q_DW.obj_f.isInitialized = 1;
    px4demo_PositionController_q_DW.obj_f.orbMetadataObj = ORB_ID(actuator_armed);
    uORB_read_initialize(px4demo_PositionController_q_DW.obj_f.orbMetadataObj,
                         &px4demo_PositionController_q_DW.obj_f.eventStructObj);
    px4demo_PositionController_q_DW.obj_f.isSetupComplete = true;

    // Start for MATLABSystem: '<S12>/SinkBlock' incorporates:
    //   BusAssignment: '<S1>/Bus Assignment'

    px4demo_PositionController_q_DW.obj_o.matlabCodegenIsDeleted = true;
    px4demo_PositionController_q_DW.obj_o.isInitialized = 0;
    px4demo_PositionController_q_DW.obj_o.matlabCodegenIsDeleted = false;
    px4demo_PositionController_q_DW.obj_o.isSetupComplete = false;
    px4demo_PositionController_q_DW.obj_o.isInitialized = 1;
    px4demo_PositionController_q_DW.obj_o.orbMetadataObj = ORB_ID(actuator_armed);
    uORB_write_initialize(px4demo_PositionController_q_DW.obj_o.orbMetadataObj,
                          &px4demo_PositionController_q_DW.obj_o.orbAdvertiseObj,
                          &rtb_BusAssignment, 1);
    px4demo_PositionController_q_DW.obj_o.isSetupComplete = true;

    // Enable for Sin: '<Root>/Sine Wave'
    px4demo_PositionController_q_DW.systemEnable = 1;

    // Enable for Sin: '<Root>/Sine Wave1'
    px4demo_PositionController_q_DW.systemEnable_n = 1;
  }
}

// Model terminate function
void px4demo_PositionController_quadrotor_terminate(void)
{
  uint16_T status;

  // Terminate for MATLABSystem: '<S3>/SourceBlock'
  if (!px4demo_PositionController_q_DW.obj_h.matlabCodegenIsDeleted) {
    px4demo_PositionController_q_DW.obj_h.matlabCodegenIsDeleted = true;
    if ((px4demo_PositionController_q_DW.obj_h.isInitialized == 1) &&
        px4demo_PositionController_q_DW.obj_h.isSetupComplete) {
      uORB_read_terminate(&px4demo_PositionController_q_DW.obj_h.eventStructObj);
    }
  }

  // End of Terminate for MATLABSystem: '<S3>/SourceBlock'

  // Terminate for MATLABSystem: '<S4>/SourceBlock'
  if (!px4demo_PositionController_q_DW.obj.matlabCodegenIsDeleted) {
    px4demo_PositionController_q_DW.obj.matlabCodegenIsDeleted = true;
    if ((px4demo_PositionController_q_DW.obj.isInitialized == 1) &&
        px4demo_PositionController_q_DW.obj.isSetupComplete) {
      uORB_read_terminate(&px4demo_PositionController_q_DW.obj.eventStructObj);
    }
  }

  // End of Terminate for MATLABSystem: '<S4>/SourceBlock'

  // Terminate for MATLABSystem: '<S7>/PX4 PWM Output'
  if (!px4demo_PositionController_q_DW.obj_a.matlabCodegenIsDeleted) {
    px4demo_PositionController_q_DW.obj_a.matlabCodegenIsDeleted = true;
    if ((px4demo_PositionController_q_DW.obj_a.isInitialized == 1) &&
        px4demo_PositionController_q_DW.obj_a.isSetupComplete) {
      status = pwm_disarm(&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
                          &px4demo_PositionController_q_DW.obj_a.armAdvertiseObj);
      px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
        (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
      status = pwm_resetServo
        (&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
         px4demo_PositionController_q_DW.obj_a.servoCount,
         px4demo_PositionController_q_DW.obj_a.channelMask,
         px4demo_PositionController_q_DW.obj_a.isMain,
         &px4demo_PositionController_q_DW.obj_a.actuatorAdvertiseObj);
      px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
        (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
      status = pwm_close(&px4demo_PositionController_q_DW.obj_a.pwmDevHandler,
                         &px4demo_PositionController_q_DW.obj_a.actuatorAdvertiseObj,
                         &px4demo_PositionController_q_DW.obj_a.armAdvertiseObj);
      px4demo_PositionController_q_DW.obj_a.errorStatus = static_cast<uint16_T>
        (px4demo_PositionController_q_DW.obj_a.errorStatus | status);
    }
  }

  // End of Terminate for MATLABSystem: '<S7>/PX4 PWM Output'
  // Terminate for MATLABSystem: '<S11>/SourceBlock'
  if (!px4demo_PositionController_q_DW.obj_f.matlabCodegenIsDeleted) {
    px4demo_PositionController_q_DW.obj_f.matlabCodegenIsDeleted = true;
    if ((px4demo_PositionController_q_DW.obj_f.isInitialized == 1) &&
        px4demo_PositionController_q_DW.obj_f.isSetupComplete) {
      uORB_read_terminate(&px4demo_PositionController_q_DW.obj_f.eventStructObj);
    }
  }

  // End of Terminate for MATLABSystem: '<S11>/SourceBlock'

  // Terminate for MATLABSystem: '<S12>/SinkBlock'
  if (!px4demo_PositionController_q_DW.obj_o.matlabCodegenIsDeleted) {
    px4demo_PositionController_q_DW.obj_o.matlabCodegenIsDeleted = true;
    if ((px4demo_PositionController_q_DW.obj_o.isInitialized == 1) &&
        px4demo_PositionController_q_DW.obj_o.isSetupComplete) {
      uORB_write_terminate
        (&px4demo_PositionController_q_DW.obj_o.orbAdvertiseObj);
    }
  }

  // End of Terminate for MATLABSystem: '<S12>/SinkBlock'
}

//
// File trailer for generated code.
//
// [EOF]
//
