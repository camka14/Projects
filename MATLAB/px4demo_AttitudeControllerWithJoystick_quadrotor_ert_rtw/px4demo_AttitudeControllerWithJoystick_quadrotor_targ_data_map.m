  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 9;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc paramMap
    ;%
    paramMap.nSections           = nTotSects;
    paramMap.sectIdxOffset       = sectIdxOffset;
      paramMap.sections(nTotSects) = dumSection; %prealloc
    paramMap.nTotData            = -1;
    
    ;%
    ;% Auto data (px4demo_AttitudeControllerWit_P)
    ;%
      section.nData     = 24;
      section.data(24)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_D
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_D
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_D
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_I
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_I
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_I
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_InitialConditionForFi
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_InitialConditionForFil
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_InitialConditionFo
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_InitialConditionForIn
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_InitialConditionForInt
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_InitialCondition_l
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_LowerSaturationLimit
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 12;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_LowerSaturationLimit
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 13;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_LowerSaturationLim
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 14;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_N
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 15;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_N
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 16;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_N
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 17;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_P
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 18;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_P
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 19;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_P
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 20;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_pitch_UpperSaturationLimit
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 21;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_roll_UpperSaturationLimit
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 22;
	
	  ;% px4demo_AttitudeControllerWit_P.PID_yaw_rate_UpperSaturationLim
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 23;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Out1_Y0
	  section.data(1).logicalSrcIdx = 24;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Constant_Value
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Out1_Y0_p
	  section.data(1).logicalSrcIdx = 26;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Constant_Value_h
	  section.data(1).logicalSrcIdx = 27;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Out1_Y0_n
	  section.data(1).logicalSrcIdx = 28;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Constant_Value_l
	  section.data(1).logicalSrcIdx = 29;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(7) = section;
      clear section
      
      section.nData     = 21;
      section.data(21)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Constant_Value_lz
	  section.data(1).logicalSrcIdx = 30;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_AttitudeControllerWit_P.Constant_Value_i
	  section.data(2).logicalSrcIdx = 31;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_AttitudeControllerWit_P.Mixermatrix_Value
	  section.data(3).logicalSrcIdx = 32;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_AttitudeControllerWit_P.Constant_Value_m
	  section.data(4).logicalSrcIdx = 33;
	  section.data(4).dtTransOffset = 18;
	
	  ;% px4demo_AttitudeControllerWit_P.Deadband_Start
	  section.data(5).logicalSrcIdx = 34;
	  section.data(5).dtTransOffset = 19;
	
	  ;% px4demo_AttitudeControllerWit_P.Deadband_End
	  section.data(6).logicalSrcIdx = 35;
	  section.data(6).dtTransOffset = 20;
	
	  ;% px4demo_AttitudeControllerWit_P.Gain_Gain
	  section.data(7).logicalSrcIdx = 36;
	  section.data(7).dtTransOffset = 21;
	
	  ;% px4demo_AttitudeControllerWit_P.Gain1_Gain
	  section.data(8).logicalSrcIdx = 37;
	  section.data(8).dtTransOffset = 22;
	
	  ;% px4demo_AttitudeControllerWit_P.Integrator_gainval
	  section.data(9).logicalSrcIdx = 38;
	  section.data(9).dtTransOffset = 23;
	
	  ;% px4demo_AttitudeControllerWit_P.Filter_gainval
	  section.data(10).logicalSrcIdx = 39;
	  section.data(10).dtTransOffset = 24;
	
	  ;% px4demo_AttitudeControllerWit_P.Deadband1_Start
	  section.data(11).logicalSrcIdx = 40;
	  section.data(11).dtTransOffset = 25;
	
	  ;% px4demo_AttitudeControllerWit_P.Deadband1_End
	  section.data(12).logicalSrcIdx = 41;
	  section.data(12).dtTransOffset = 26;
	
	  ;% px4demo_AttitudeControllerWit_P.Gain1_Gain_g
	  section.data(13).logicalSrcIdx = 42;
	  section.data(13).dtTransOffset = 27;
	
	  ;% px4demo_AttitudeControllerWit_P.Gain1_Gain_c
	  section.data(14).logicalSrcIdx = 43;
	  section.data(14).dtTransOffset = 28;
	
	  ;% px4demo_AttitudeControllerWit_P.Integrator_gainval_e
	  section.data(15).logicalSrcIdx = 44;
	  section.data(15).dtTransOffset = 29;
	
	  ;% px4demo_AttitudeControllerWit_P.Filter_gainval_j
	  section.data(16).logicalSrcIdx = 45;
	  section.data(16).dtTransOffset = 30;
	
	  ;% px4demo_AttitudeControllerWit_P.Deadband2_Start
	  section.data(17).logicalSrcIdx = 46;
	  section.data(17).dtTransOffset = 31;
	
	  ;% px4demo_AttitudeControllerWit_P.Deadband2_End
	  section.data(18).logicalSrcIdx = 47;
	  section.data(18).dtTransOffset = 32;
	
	  ;% px4demo_AttitudeControllerWit_P.Integrator_gainval_b
	  section.data(19).logicalSrcIdx = 48;
	  section.data(19).dtTransOffset = 33;
	
	  ;% px4demo_AttitudeControllerWit_P.Filter_gainval_i
	  section.data(20).logicalSrcIdx = 49;
	  section.data(20).dtTransOffset = 34;
	
	  ;% px4demo_AttitudeControllerWit_P.Gain1_Gain_gr
	  section.data(21).logicalSrcIdx = 50;
	  section.data(21).dtTransOffset = 35;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(8) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_P.Reset_Value
	  section.data(1).logicalSrcIdx = 51;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_AttitudeControllerWit_P.Constant_Value_a
	  section.data(2).logicalSrcIdx = 52;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(9) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (parameter)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    paramMap.nTotData = nTotData;
    


  ;%**************************
  ;% Create Block Output Map *
  ;%**************************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 0;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc sigMap
    ;%
    sigMap.nSections           = nTotSects;
    sigMap.sectIdxOffset       = sectIdxOffset;
      sigMap.sections(nTotSects) = dumSection; %prealloc
    sigMap.nTotData            = -1;
    
    ;%
    ;% Auto data (px4demo_AttitudeControllerWit_B)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_B.In1
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_B.In1_p
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_B.In1_a
	  section.data(1).logicalSrcIdx = 2;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_B.values
	  section.data(1).logicalSrcIdx = 6;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWit_B.NOT
	  section.data(1).logicalSrcIdx = 7;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_AttitudeControllerWit_B.NOT_p
	  section.data(2).logicalSrcIdx = 8;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_AttitudeControllerWit_B.NOT_m
	  section.data(3).logicalSrcIdx = 9;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (signal)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    sigMap.nTotData = nTotData;
    


  ;%*******************
  ;% Create DWork Map *
  ;%*******************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 5;
    sectIdxOffset = 5;
    
    ;%
    ;% Define dummy sections & preallocate arrays
    ;%
    dumSection.nData = -1;  
    dumSection.data  = [];
    
    dumData.logicalSrcIdx = -1;
    dumData.dtTransOffset = -1;
    
    ;%
    ;% Init/prealloc dworkMap
    ;%
    dworkMap.nSections           = nTotSects;
    dworkMap.sectIdxOffset       = sectIdxOffset;
      dworkMap.sections(nTotSects) = dumSection; %prealloc
    dworkMap.nTotData            = -1;
    
    ;%
    ;% Auto data (px4demo_AttitudeControllerWi_DW)
    ;%
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWi_DW.obj
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_AttitudeControllerWi_DW.obj_d
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_AttitudeControllerWi_DW.obj_l
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWi_DW.obj_dx
	  section.data(1).logicalSrcIdx = 3;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWi_DW.obj_e
	  section.data(1).logicalSrcIdx = 4;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWi_DW.Integrator_DSTATE
	  section.data(1).logicalSrcIdx = 5;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_AttitudeControllerWi_DW.Filter_DSTATE
	  section.data(2).logicalSrcIdx = 6;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_AttitudeControllerWi_DW.Integrator_DSTATE_m
	  section.data(3).logicalSrcIdx = 7;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_AttitudeControllerWi_DW.Filter_DSTATE_d
	  section.data(4).logicalSrcIdx = 8;
	  section.data(4).dtTransOffset = 3;
	
	  ;% px4demo_AttitudeControllerWi_DW.Integrator_DSTATE_i
	  section.data(5).logicalSrcIdx = 9;
	  section.data(5).dtTransOffset = 4;
	
	  ;% px4demo_AttitudeControllerWi_DW.Filter_DSTATE_k
	  section.data(6).logicalSrcIdx = 10;
	  section.data(6).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 6;
      section.data(6)  = dumData; %prealloc
      
	  ;% px4demo_AttitudeControllerWi_DW.IfActionSubsystem2_SubsysRanBC
	  section.data(1).logicalSrcIdx = 11;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_AttitudeControllerWi_DW.IfActionSubsystem1_SubsysRanBC
	  section.data(2).logicalSrcIdx = 12;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_AttitudeControllerWi_DW.IfActionSubsystem_SubsysRanBC
	  section.data(3).logicalSrcIdx = 13;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_AttitudeControllerWi_DW.EnabledSubsystem_SubsysRanBC
	  section.data(4).logicalSrcIdx = 14;
	  section.data(4).dtTransOffset = 3;
	
	  ;% px4demo_AttitudeControllerWi_DW.EnabledSubsystem_SubsysRanBC_g
	  section.data(5).logicalSrcIdx = 15;
	  section.data(5).dtTransOffset = 4;
	
	  ;% px4demo_AttitudeControllerWi_DW.EnabledSubsystem_SubsysRanBC_c
	  section.data(6).logicalSrcIdx = 16;
	  section.data(6).dtTransOffset = 5;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
    
      ;%
      ;% Non-auto Data (dwork)
      ;%
    

    ;%
    ;% Add final counts to struct.
    ;%
    dworkMap.nTotData = nTotData;
    


  ;%
  ;% Add individual maps to base struct.
  ;%

  targMap.paramMap  = paramMap;    
  targMap.signalMap = sigMap;
  targMap.dworkMap  = dworkMap;
  
  ;%
  ;% Add checksums to base struct.
  ;%


  targMap.checksum0 = 4242536614;
  targMap.checksum1 = 4122860865;
  targMap.checksum2 = 1859907991;
  targMap.checksum3 = 3287530756;

