//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
//
// File: px4demo_top_model_pil.cpp
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
#include "px4demo_top_model_pil.h"
#include "px4demo_top_model_pil_private.h"

// Exported data definition

// Definition for custom storage class: FileScope
static boolean_T enableA;              // '<Root>/Logical Operator2'
static boolean_T enableB;              // '<Root>/Logical Operator1'

// External inputs (root inport signals with default storage)
ExternalInputs rtU;

// External outputs (root outports fed by signals with default storage)
ExternalOutputs rtY;

// Real-time model
RT_MODEL rtM_ = RT_MODEL();
RT_MODEL *const rtM = &rtM_;

// System initialize for enable system: '<Root>/CounterTypeA'
void CounterTypeA_Init(void)
{
  // SystemInitialize for Switch: '<S1>/Switch1' incorporates:
  //   Outport: '<Root>/count_a'
  //   Outport: '<S1>/count'

  rtY.count_a = rtP.count_Y0;
}

// Output and update for enable system: '<Root>/CounterTypeA'
void CounterTypeA(void)
{
  // Outputs for Enabled SubSystem: '<Root>/CounterTypeA' incorporates:
  //   EnablePort: '<S1>/Enable'

  if (enableA) {
    // Switch: '<S1>/Switch1' incorporates:
    //   Constant: '<S1>/C1'
    //   Inport: '<Root>/reset'
    //   Inport: '<Root>/ticks_to_count'
    //   Sum: '<S1>/Add'

    if (rtU.reset) {
      rtY.count_a = rtP.countLower;
    }

    rtY.count_a = static_cast<uint8_T>(static_cast<uint32_T>(rtU.ticks_to_count)
      + rtY.count_a);

    // Switch: '<S1>/Switch' incorporates:
    //   Constant: '<S1>/C5'
    //   RelationalOperator: '<S1>/upper GE input'

    if (rtP.countUpper < rtY.count_a) {
      // Switch: '<S1>/Switch1' incorporates:
      //   Constant: '<S1>/C1'
      //   Outport: '<Root>/count_a'

      rtY.count_a = rtP.countLower;
    }

    // End of Switch: '<S1>/Switch'
  }

  // End of Outputs for SubSystem: '<Root>/CounterTypeA'
}

// System initialize for enable system: '<Root>/CounterTypeB'
void CounterTypeB_Init(void)
{
  // SystemInitialize for Switch: '<S2>/Switch1' incorporates:
  //   Outport: '<Root>/count_b'
  //   Outport: '<S2>/count'

  rtY.count_b = rtP.count_Y0_d;
}

// Output and update for enable system: '<Root>/CounterTypeB'
void CounterTypeB(void)
{
  // Outputs for Enabled SubSystem: '<Root>/CounterTypeB' incorporates:
  //   EnablePort: '<S2>/Enable'

  if (enableB) {
    // Switch: '<S2>/Switch1' incorporates:
    //   Constant: '<S2>/C1'
    //   Inport: '<Root>/reset'
    //   Inport: '<Root>/ticks_to_count'
    //   Outport: '<Root>/count_b'
    //   Sum: '<S2>/Add'

    if (rtU.reset) {
      rtY.count_b = rtP.C1_Value;
    }

    rtY.count_b = static_cast<uint8_T>(static_cast<uint32_T>(rtU.ticks_to_count)
      + rtY.count_b);

    // End of Switch: '<S2>/Switch1'
  }

  // End of Outputs for SubSystem: '<Root>/CounterTypeB'
}

// Model step function
void px4demo_top_model_pil_step(void)
{
  // Logic: '<Root>/Logical Operator2' incorporates:
  //   Inport: '<Root>/count_enable'
  //   Inport: '<Root>/counter_mode'
  //   Logic: '<Root>/Logical Operator'

  enableA = ((!rtU.counter_mode) && rtU.count_enable);

  // Outputs for Enabled SubSystem: '<Root>/CounterTypeA'
  CounterTypeA();

  // End of Outputs for SubSystem: '<Root>/CounterTypeA'

  // Logic: '<Root>/Logical Operator1' incorporates:
  //   Inport: '<Root>/count_enable'
  //   Inport: '<Root>/counter_mode'

  enableB = (rtU.counter_mode && rtU.count_enable);

  // Outputs for Enabled SubSystem: '<Root>/CounterTypeB'
  CounterTypeB();

  // End of Outputs for SubSystem: '<Root>/CounterTypeB'
}

// Model initialize function
void px4demo_top_model_pil_initialize(void)
{
  // SystemInitialize for Enabled SubSystem: '<Root>/CounterTypeA'
  CounterTypeA_Init();

  // End of SystemInitialize for SubSystem: '<Root>/CounterTypeA'

  // SystemInitialize for Enabled SubSystem: '<Root>/CounterTypeB'
  CounterTypeB_Init();

  // End of SystemInitialize for SubSystem: '<Root>/CounterTypeB'
}

//
// File trailer for generated code.
//
// [EOF]
//
