  function targMap = targDataMap(),

  ;%***********************
  ;% Create Parameter Map *
  ;%***********************
      
    nTotData      = 0; %add to this count as we go
    nTotSects     = 10;
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
    ;% Auto data (px4demo_PositionController_qu_P)
    ;%
      section.nData     = 48;
      section.data(48)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.PID_x_D
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_qu_P.PID_x_I
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_qu_P.PID_x_N
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_PositionController_qu_P.PID_x_P
	  section.data(4).logicalSrcIdx = 3;
	  section.data(4).dtTransOffset = 3;
	
	  ;% px4demo_PositionController_qu_P.PID_y_D
	  section.data(5).logicalSrcIdx = 4;
	  section.data(5).dtTransOffset = 4;
	
	  ;% px4demo_PositionController_qu_P.PID_y_I
	  section.data(6).logicalSrcIdx = 5;
	  section.data(6).dtTransOffset = 5;
	
	  ;% px4demo_PositionController_qu_P.PID_y_N
	  section.data(7).logicalSrcIdx = 6;
	  section.data(7).dtTransOffset = 6;
	
	  ;% px4demo_PositionController_qu_P.PID_y_P
	  section.data(8).logicalSrcIdx = 7;
	  section.data(8).dtTransOffset = 7;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_D
	  section.data(9).logicalSrcIdx = 8;
	  section.data(9).dtTransOffset = 8;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_I
	  section.data(10).logicalSrcIdx = 9;
	  section.data(10).dtTransOffset = 9;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_N
	  section.data(11).logicalSrcIdx = 10;
	  section.data(11).dtTransOffset = 10;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_P
	  section.data(12).logicalSrcIdx = 11;
	  section.data(12).dtTransOffset = 11;
	
	  ;% px4demo_PositionController_qu_P.PID_z_D
	  section.data(13).logicalSrcIdx = 12;
	  section.data(13).dtTransOffset = 12;
	
	  ;% px4demo_PositionController_qu_P.PID_z_I
	  section.data(14).logicalSrcIdx = 13;
	  section.data(14).dtTransOffset = 13;
	
	  ;% px4demo_PositionController_qu_P.PID_z_N
	  section.data(15).logicalSrcIdx = 14;
	  section.data(15).dtTransOffset = 14;
	
	  ;% px4demo_PositionController_qu_P.PID_z_P
	  section.data(16).logicalSrcIdx = 15;
	  section.data(16).dtTransOffset = 15;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_D
	  section.data(17).logicalSrcIdx = 16;
	  section.data(17).dtTransOffset = 16;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_D
	  section.data(18).logicalSrcIdx = 17;
	  section.data(18).dtTransOffset = 17;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_I
	  section.data(19).logicalSrcIdx = 18;
	  section.data(19).dtTransOffset = 18;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_I
	  section.data(20).logicalSrcIdx = 19;
	  section.data(20).dtTransOffset = 19;
	
	  ;% px4demo_PositionController_qu_P.PID_Altitude_InitialConditionFo
	  section.data(21).logicalSrcIdx = 20;
	  section.data(21).dtTransOffset = 20;
	
	  ;% px4demo_PositionController_qu_P.PID_x_InitialConditionForFilter
	  section.data(22).logicalSrcIdx = 21;
	  section.data(22).dtTransOffset = 21;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_InitialConditionForFi
	  section.data(23).logicalSrcIdx = 22;
	  section.data(23).dtTransOffset = 22;
	
	  ;% px4demo_PositionController_qu_P.PID_y_InitialConditionForFilter
	  section.data(24).logicalSrcIdx = 23;
	  section.data(24).dtTransOffset = 23;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_InitialConditionForFil
	  section.data(25).logicalSrcIdx = 24;
	  section.data(25).dtTransOffset = 24;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_InitialConditionForFilt
	  section.data(26).logicalSrcIdx = 25;
	  section.data(26).dtTransOffset = 25;
	
	  ;% px4demo_PositionController_qu_P.PID_Altitude_InitialCondition_e
	  section.data(27).logicalSrcIdx = 26;
	  section.data(27).dtTransOffset = 26;
	
	  ;% px4demo_PositionController_qu_P.PID_x_InitialConditionForIntegr
	  section.data(28).logicalSrcIdx = 27;
	  section.data(28).dtTransOffset = 27;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_InitialConditionForIn
	  section.data(29).logicalSrcIdx = 28;
	  section.data(29).dtTransOffset = 28;
	
	  ;% px4demo_PositionController_qu_P.PID_y_InitialConditionForIntegr
	  section.data(30).logicalSrcIdx = 29;
	  section.data(30).dtTransOffset = 29;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_InitialConditionForInt
	  section.data(31).logicalSrcIdx = 30;
	  section.data(31).dtTransOffset = 30;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_InitialConditionForInte
	  section.data(32).logicalSrcIdx = 31;
	  section.data(32).dtTransOffset = 31;
	
	  ;% px4demo_PositionController_qu_P.PID_Altitude_LowerSaturationLim
	  section.data(33).logicalSrcIdx = 32;
	  section.data(33).dtTransOffset = 32;
	
	  ;% px4demo_PositionController_qu_P.PID_x_LowerSaturationLimit
	  section.data(34).logicalSrcIdx = 33;
	  section.data(34).dtTransOffset = 33;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_LowerSaturationLimit
	  section.data(35).logicalSrcIdx = 34;
	  section.data(35).dtTransOffset = 34;
	
	  ;% px4demo_PositionController_qu_P.PID_y_LowerSaturationLimit
	  section.data(36).logicalSrcIdx = 35;
	  section.data(36).dtTransOffset = 35;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_LowerSaturationLimit
	  section.data(37).logicalSrcIdx = 36;
	  section.data(37).dtTransOffset = 36;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_LowerSaturationLimit
	  section.data(38).logicalSrcIdx = 37;
	  section.data(38).dtTransOffset = 37;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_N
	  section.data(39).logicalSrcIdx = 38;
	  section.data(39).dtTransOffset = 38;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_N
	  section.data(40).logicalSrcIdx = 39;
	  section.data(40).dtTransOffset = 39;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_P
	  section.data(41).logicalSrcIdx = 40;
	  section.data(41).dtTransOffset = 40;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_P
	  section.data(42).logicalSrcIdx = 41;
	  section.data(42).dtTransOffset = 41;
	
	  ;% px4demo_PositionController_qu_P.PID_Altitude_UpperSaturationLim
	  section.data(43).logicalSrcIdx = 42;
	  section.data(43).dtTransOffset = 42;
	
	  ;% px4demo_PositionController_qu_P.PID_x_UpperSaturationLimit
	  section.data(44).logicalSrcIdx = 43;
	  section.data(44).dtTransOffset = 43;
	
	  ;% px4demo_PositionController_qu_P.PID_pitch_UpperSaturationLimit
	  section.data(45).logicalSrcIdx = 44;
	  section.data(45).dtTransOffset = 44;
	
	  ;% px4demo_PositionController_qu_P.PID_y_UpperSaturationLimit
	  section.data(46).logicalSrcIdx = 45;
	  section.data(46).dtTransOffset = 45;
	
	  ;% px4demo_PositionController_qu_P.PID_roll_UpperSaturationLimit
	  section.data(47).logicalSrcIdx = 46;
	  section.data(47).dtTransOffset = 46;
	
	  ;% px4demo_PositionController_qu_P.PID_yaw_UpperSaturationLimit
	  section.data(48).logicalSrcIdx = 47;
	  section.data(48).dtTransOffset = 47;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Out1_Y0
	  section.data(1).logicalSrcIdx = 48;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Constant_Value
	  section.data(1).logicalSrcIdx = 49;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(3) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Out1_Y0_e
	  section.data(1).logicalSrcIdx = 50;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Constant_Value_f
	  section.data(1).logicalSrcIdx = 51;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(5) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Out1_Y0_m
	  section.data(1).logicalSrcIdx = 52;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(6) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Constant_Value_n
	  section.data(1).logicalSrcIdx = 53;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(7) = section;
      clear section
      
      section.nData     = 41;
      section.data(41)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Constant_Value_fa
	  section.data(1).logicalSrcIdx = 54;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_qu_P.Constant_Value_h
	  section.data(2).logicalSrcIdx = 55;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_qu_P.des_y_Value
	  section.data(3).logicalSrcIdx = 56;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_PositionController_qu_P.des_x_Value
	  section.data(4).logicalSrcIdx = 57;
	  section.data(4).dtTransOffset = 3;
	
	  ;% px4demo_PositionController_qu_P.Constant1_Value
	  section.data(5).logicalSrcIdx = 58;
	  section.data(5).dtTransOffset = 4;
	
	  ;% px4demo_PositionController_qu_P.Mixermatrix_Value
	  section.data(6).logicalSrcIdx = 59;
	  section.data(6).dtTransOffset = 5;
	
	  ;% px4demo_PositionController_qu_P.Gain1_Gain
	  section.data(7).logicalSrcIdx = 60;
	  section.data(7).dtTransOffset = 21;
	
	  ;% px4demo_PositionController_qu_P.des_alt_Value
	  section.data(8).logicalSrcIdx = 61;
	  section.data(8).dtTransOffset = 22;
	
	  ;% px4demo_PositionController_qu_P.Filter_gainval
	  section.data(9).logicalSrcIdx = 62;
	  section.data(9).dtTransOffset = 23;
	
	  ;% px4demo_PositionController_qu_P.ZeroGain_Gain
	  section.data(10).logicalSrcIdx = 63;
	  section.data(10).dtTransOffset = 24;
	
	  ;% px4demo_PositionController_qu_P.Integrator_gainval
	  section.data(11).logicalSrcIdx = 64;
	  section.data(11).dtTransOffset = 25;
	
	  ;% px4demo_PositionController_qu_P.SineWave_Amp
	  section.data(12).logicalSrcIdx = 65;
	  section.data(12).dtTransOffset = 26;
	
	  ;% px4demo_PositionController_qu_P.SineWave_Bias
	  section.data(13).logicalSrcIdx = 66;
	  section.data(13).dtTransOffset = 27;
	
	  ;% px4demo_PositionController_qu_P.SineWave_Freq
	  section.data(14).logicalSrcIdx = 67;
	  section.data(14).dtTransOffset = 28;
	
	  ;% px4demo_PositionController_qu_P.SineWave_Hsin
	  section.data(15).logicalSrcIdx = 68;
	  section.data(15).dtTransOffset = 29;
	
	  ;% px4demo_PositionController_qu_P.SineWave_HCos
	  section.data(16).logicalSrcIdx = 69;
	  section.data(16).dtTransOffset = 30;
	
	  ;% px4demo_PositionController_qu_P.SineWave_PSin
	  section.data(17).logicalSrcIdx = 70;
	  section.data(17).dtTransOffset = 31;
	
	  ;% px4demo_PositionController_qu_P.SineWave_PCos
	  section.data(18).logicalSrcIdx = 71;
	  section.data(18).dtTransOffset = 32;
	
	  ;% px4demo_PositionController_qu_P.SineWave1_Amp
	  section.data(19).logicalSrcIdx = 72;
	  section.data(19).dtTransOffset = 33;
	
	  ;% px4demo_PositionController_qu_P.SineWave1_Bias
	  section.data(20).logicalSrcIdx = 73;
	  section.data(20).dtTransOffset = 34;
	
	  ;% px4demo_PositionController_qu_P.SineWave1_Freq
	  section.data(21).logicalSrcIdx = 74;
	  section.data(21).dtTransOffset = 35;
	
	  ;% px4demo_PositionController_qu_P.SineWave1_Hsin
	  section.data(22).logicalSrcIdx = 75;
	  section.data(22).dtTransOffset = 36;
	
	  ;% px4demo_PositionController_qu_P.SineWave1_HCos
	  section.data(23).logicalSrcIdx = 76;
	  section.data(23).dtTransOffset = 37;
	
	  ;% px4demo_PositionController_qu_P.SineWave1_PSin
	  section.data(24).logicalSrcIdx = 77;
	  section.data(24).dtTransOffset = 38;
	
	  ;% px4demo_PositionController_qu_P.SineWave1_PCos
	  section.data(25).logicalSrcIdx = 78;
	  section.data(25).dtTransOffset = 39;
	
	  ;% px4demo_PositionController_qu_P.Integrator_gainval_n
	  section.data(26).logicalSrcIdx = 79;
	  section.data(26).dtTransOffset = 40;
	
	  ;% px4demo_PositionController_qu_P.Filter_gainval_p
	  section.data(27).logicalSrcIdx = 80;
	  section.data(27).dtTransOffset = 41;
	
	  ;% px4demo_PositionController_qu_P.Gain1_Gain_j
	  section.data(28).logicalSrcIdx = 81;
	  section.data(28).dtTransOffset = 42;
	
	  ;% px4demo_PositionController_qu_P.Integrator_gainval_nf
	  section.data(29).logicalSrcIdx = 82;
	  section.data(29).dtTransOffset = 43;
	
	  ;% px4demo_PositionController_qu_P.Filter_gainval_h
	  section.data(30).logicalSrcIdx = 83;
	  section.data(30).dtTransOffset = 44;
	
	  ;% px4demo_PositionController_qu_P.Integrator_gainval_p
	  section.data(31).logicalSrcIdx = 84;
	  section.data(31).dtTransOffset = 45;
	
	  ;% px4demo_PositionController_qu_P.Filter_gainval_o
	  section.data(32).logicalSrcIdx = 85;
	  section.data(32).dtTransOffset = 46;
	
	  ;% px4demo_PositionController_qu_P.Gain_Gain
	  section.data(33).logicalSrcIdx = 86;
	  section.data(33).dtTransOffset = 47;
	
	  ;% px4demo_PositionController_qu_P.Gain1_Gain_g
	  section.data(34).logicalSrcIdx = 87;
	  section.data(34).dtTransOffset = 48;
	
	  ;% px4demo_PositionController_qu_P.Integrator_gainval_j
	  section.data(35).logicalSrcIdx = 88;
	  section.data(35).dtTransOffset = 49;
	
	  ;% px4demo_PositionController_qu_P.Filter_gainval_c
	  section.data(36).logicalSrcIdx = 89;
	  section.data(36).dtTransOffset = 50;
	
	  ;% px4demo_PositionController_qu_P.des_yaw_Value
	  section.data(37).logicalSrcIdx = 90;
	  section.data(37).dtTransOffset = 51;
	
	  ;% px4demo_PositionController_qu_P.Gain1_Gain_i
	  section.data(38).logicalSrcIdx = 91;
	  section.data(38).dtTransOffset = 52;
	
	  ;% px4demo_PositionController_qu_P.Integrator_gainval_ni
	  section.data(39).logicalSrcIdx = 92;
	  section.data(39).dtTransOffset = 53;
	
	  ;% px4demo_PositionController_qu_P.Filter_gainval_hv
	  section.data(40).logicalSrcIdx = 93;
	  section.data(40).dtTransOffset = 54;
	
	  ;% px4demo_PositionController_qu_P.Gain1_Gain_h
	  section.data(41).logicalSrcIdx = 94;
	  section.data(41).dtTransOffset = 55;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(8) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.Reset_Value
	  section.data(1).logicalSrcIdx = 95;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_qu_P.Constant_Value_i
	  section.data(2).logicalSrcIdx = 96;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_qu_P.DataStoreMemory_InitialValue
	  section.data(3).logicalSrcIdx = 97;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(9) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_P.ManualSwitch_CurrentSetting
	  section.data(1).logicalSrcIdx = 98;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_qu_P.ManualSwitch1_CurrentSetting
	  section.data(2).logicalSrcIdx = 99;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      paramMap.sections(10) = section;
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
    nTotSects     = 6;
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
    ;% Auto data (px4demo_PositionController_qu_B)
    ;%
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_B.In1
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_B.In1_o
	  section.data(1).logicalSrcIdx = 1;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_B.In1_j
	  section.data(1).logicalSrcIdx = 2;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(3) = section;
      clear section
      
      section.nData     = 10;
      section.data(10)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_B.alt
	  section.data(1).logicalSrcIdx = 3;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_qu_B.des_alt
	  section.data(2).logicalSrcIdx = 4;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_qu_B.VectorConcatenate
	  section.data(3).logicalSrcIdx = 6;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_PositionController_qu_B.des_x
	  section.data(4).logicalSrcIdx = 7;
	  section.data(4).dtTransOffset = 5;
	
	  ;% px4demo_PositionController_qu_B.des_y
	  section.data(5).logicalSrcIdx = 8;
	  section.data(5).dtTransOffset = 6;
	
	  ;% px4demo_PositionController_qu_B.x
	  section.data(6).logicalSrcIdx = 9;
	  section.data(6).dtTransOffset = 7;
	
	  ;% px4demo_PositionController_qu_B.y
	  section.data(7).logicalSrcIdx = 10;
	  section.data(7).dtTransOffset = 8;
	
	  ;% px4demo_PositionController_qu_B.des_pitch
	  section.data(8).logicalSrcIdx = 11;
	  section.data(8).dtTransOffset = 9;
	
	  ;% px4demo_PositionController_qu_B.des_roll
	  section.data(9).logicalSrcIdx = 13;
	  section.data(9).dtTransOffset = 10;
	
	  ;% px4demo_PositionController_qu_B.des_yaw
	  section.data(10).logicalSrcIdx = 15;
	  section.data(10).dtTransOffset = 11;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(4) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_B.Gain1
	  section.data(1).logicalSrcIdx = 17;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(5) = section;
      clear section
      
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_qu_B.NOT
	  section.data(1).logicalSrcIdx = 18;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_qu_B.NOT_e
	  section.data(2).logicalSrcIdx = 19;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_qu_B.NOT_h
	  section.data(3).logicalSrcIdx = 20;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      sigMap.sections(6) = section;
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
    nTotSects     = 7;
    sectIdxOffset = 6;
    
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
    ;% Auto data (px4demo_PositionController_q_DW)
    ;%
      section.nData     = 3;
      section.data(3)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_q_DW.obj
	  section.data(1).logicalSrcIdx = 0;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_q_DW.obj_h
	  section.data(2).logicalSrcIdx = 1;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_q_DW.obj_f
	  section.data(3).logicalSrcIdx = 2;
	  section.data(3).dtTransOffset = 2;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(1) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_q_DW.obj_a
	  section.data(1).logicalSrcIdx = 3;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(2) = section;
      clear section
      
      section.nData     = 1;
      section.data(1)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_q_DW.obj_o
	  section.data(1).logicalSrcIdx = 4;
	  section.data(1).dtTransOffset = 0;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(3) = section;
      clear section
      
      section.nData     = 16;
      section.data(16)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_q_DW.Filter_DSTATE
	  section.data(1).logicalSrcIdx = 5;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_q_DW.Integrator_DSTATE
	  section.data(2).logicalSrcIdx = 6;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_q_DW.Integrator_DSTATE_l
	  section.data(3).logicalSrcIdx = 7;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_PositionController_q_DW.Filter_DSTATE_j
	  section.data(4).logicalSrcIdx = 8;
	  section.data(4).dtTransOffset = 3;
	
	  ;% px4demo_PositionController_q_DW.Integrator_DSTATE_n
	  section.data(5).logicalSrcIdx = 9;
	  section.data(5).dtTransOffset = 4;
	
	  ;% px4demo_PositionController_q_DW.Filter_DSTATE_f
	  section.data(6).logicalSrcIdx = 10;
	  section.data(6).dtTransOffset = 5;
	
	  ;% px4demo_PositionController_q_DW.Integrator_DSTATE_f
	  section.data(7).logicalSrcIdx = 11;
	  section.data(7).dtTransOffset = 6;
	
	  ;% px4demo_PositionController_q_DW.Filter_DSTATE_a
	  section.data(8).logicalSrcIdx = 12;
	  section.data(8).dtTransOffset = 7;
	
	  ;% px4demo_PositionController_q_DW.Integrator_DSTATE_p
	  section.data(9).logicalSrcIdx = 13;
	  section.data(9).dtTransOffset = 8;
	
	  ;% px4demo_PositionController_q_DW.Filter_DSTATE_m
	  section.data(10).logicalSrcIdx = 14;
	  section.data(10).dtTransOffset = 9;
	
	  ;% px4demo_PositionController_q_DW.Integrator_DSTATE_nm
	  section.data(11).logicalSrcIdx = 15;
	  section.data(11).dtTransOffset = 10;
	
	  ;% px4demo_PositionController_q_DW.Filter_DSTATE_a1
	  section.data(12).logicalSrcIdx = 16;
	  section.data(12).dtTransOffset = 11;
	
	  ;% px4demo_PositionController_q_DW.lastSin
	  section.data(13).logicalSrcIdx = 17;
	  section.data(13).dtTransOffset = 12;
	
	  ;% px4demo_PositionController_q_DW.lastCos
	  section.data(14).logicalSrcIdx = 18;
	  section.data(14).dtTransOffset = 13;
	
	  ;% px4demo_PositionController_q_DW.lastSin_g
	  section.data(15).logicalSrcIdx = 19;
	  section.data(15).dtTransOffset = 14;
	
	  ;% px4demo_PositionController_q_DW.lastCos_j
	  section.data(16).logicalSrcIdx = 20;
	  section.data(16).dtTransOffset = 15;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(4) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_q_DW.ToWorkspace1_PWORK.LoggedData
	  section.data(1).logicalSrcIdx = 21;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_q_DW.ToWorkspace2_PWORK.LoggedData
	  section.data(2).logicalSrcIdx = 22;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(5) = section;
      clear section
      
      section.nData     = 2;
      section.data(2)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_q_DW.systemEnable
	  section.data(1).logicalSrcIdx = 23;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_q_DW.systemEnable_n
	  section.data(2).logicalSrcIdx = 24;
	  section.data(2).dtTransOffset = 1;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(6) = section;
      clear section
      
      section.nData     = 18;
      section.data(18)  = dumData; %prealloc
      
	  ;% px4demo_PositionController_q_DW.Filter_PrevResetState
	  section.data(1).logicalSrcIdx = 25;
	  section.data(1).dtTransOffset = 0;
	
	  ;% px4demo_PositionController_q_DW.Integrator_PrevResetState
	  section.data(2).logicalSrcIdx = 26;
	  section.data(2).dtTransOffset = 1;
	
	  ;% px4demo_PositionController_q_DW.Integrator_PrevResetState_b
	  section.data(3).logicalSrcIdx = 27;
	  section.data(3).dtTransOffset = 2;
	
	  ;% px4demo_PositionController_q_DW.Filter_PrevResetState_c
	  section.data(4).logicalSrcIdx = 28;
	  section.data(4).dtTransOffset = 3;
	
	  ;% px4demo_PositionController_q_DW.Integrator_PrevResetState_e
	  section.data(5).logicalSrcIdx = 29;
	  section.data(5).dtTransOffset = 4;
	
	  ;% px4demo_PositionController_q_DW.Filter_PrevResetState_f
	  section.data(6).logicalSrcIdx = 30;
	  section.data(6).dtTransOffset = 5;
	
	  ;% px4demo_PositionController_q_DW.Integrator_PrevResetState_j
	  section.data(7).logicalSrcIdx = 31;
	  section.data(7).dtTransOffset = 6;
	
	  ;% px4demo_PositionController_q_DW.Filter_PrevResetState_n
	  section.data(8).logicalSrcIdx = 32;
	  section.data(8).dtTransOffset = 7;
	
	  ;% px4demo_PositionController_q_DW.Integrator_PrevResetState_c
	  section.data(9).logicalSrcIdx = 33;
	  section.data(9).dtTransOffset = 8;
	
	  ;% px4demo_PositionController_q_DW.Filter_PrevResetState_l
	  section.data(10).logicalSrcIdx = 34;
	  section.data(10).dtTransOffset = 9;
	
	  ;% px4demo_PositionController_q_DW.Integrator_PrevResetState_i
	  section.data(11).logicalSrcIdx = 35;
	  section.data(11).dtTransOffset = 10;
	
	  ;% px4demo_PositionController_q_DW.Filter_PrevResetState_g
	  section.data(12).logicalSrcIdx = 36;
	  section.data(12).dtTransOffset = 11;
	
	  ;% px4demo_PositionController_q_DW.IfActionSubsystem2_SubsysRanBC
	  section.data(13).logicalSrcIdx = 37;
	  section.data(13).dtTransOffset = 12;
	
	  ;% px4demo_PositionController_q_DW.IfActionSubsystem1_SubsysRanBC
	  section.data(14).logicalSrcIdx = 38;
	  section.data(14).dtTransOffset = 13;
	
	  ;% px4demo_PositionController_q_DW.IfActionSubsystem_SubsysRanBC
	  section.data(15).logicalSrcIdx = 39;
	  section.data(15).dtTransOffset = 14;
	
	  ;% px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC
	  section.data(16).logicalSrcIdx = 40;
	  section.data(16).dtTransOffset = 15;
	
	  ;% px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_h
	  section.data(17).logicalSrcIdx = 41;
	  section.data(17).dtTransOffset = 16;
	
	  ;% px4demo_PositionController_q_DW.EnabledSubsystem_SubsysRanBC_n
	  section.data(18).logicalSrcIdx = 42;
	  section.data(18).dtTransOffset = 17;
	
      nTotData = nTotData + section.nData;
      dworkMap.sections(7) = section;
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


  targMap.checksum0 = 717730562;
  targMap.checksum1 = 2147603691;
  targMap.checksum2 = 3612359208;
  targMap.checksum3 = 576647171;

