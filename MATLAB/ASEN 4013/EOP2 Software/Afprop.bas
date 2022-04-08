Attribute VB_Name = "Module1"
'**************************************************'
'*       Program AFPROP - Jan 27, 2016            *'
'*                                                *'
'*           THERMODYNAMIC PROPERTIES OF          *'
'*              AIR with (CH2)n Fuel              *'
'*                                                *'
'*      Written for use with the textbook         *'
'*      Elements of Propulsion                    *'
'*                                                *'
'**************************************************'

Public FA As Single, T As Single, PHI As Single, H As Single
Public PR As Single, CP As Single, R As Single, GAM As Single
Public A0 As Single
Public UnitSystem As Integer, Unknown As Integer
Public Hconvert As Single, Tconvert As Single
Public CPconvert As Single, Sconvert As Single
Public phi0 As Single


Sub Main()
      Hconvert = 0.4299
      Tconvert = 1.8
      CPconvert = 0.23884
      Sconvert = 3.2808
      UnitSystem = 1
      phi0 = 1.5784181
      FA = 0.03
      T = 2000
      Form1.Text1.Text = FA
      Form1.Text2.Text = T
      Unknown = 1
      Call Calculate
      Form1.Visible = True
End Sub

Sub Calculate()
    If UnitSystem = 1 Then
        Call FAIR(Unknown, T, H, PR, PHI, CP, R, GAM, A0, FA)
        Form1.Text2.Text = Format(T, "###0.000")
        Form1.Label9.Caption = Format(A0, "###0.000")
        Form1.Label10.Caption = Format(GAM, "0.00000")
        Form1.Label11.Caption = Format(CP, "0.00000")
        Form1.Label20.Caption = Format(R, "0.00000")
        Form1.Label12.Caption = Format(PHI, "#0.00000")
        Form1.Text3.Text = Format(H, "###0.0000")
        If PR < 2 Then
            Form1.Text4.Text = Format(PR, "0.000000")
        Else
            Form1.Text4.Text = Format(PR, "###0.0000")
        End If
    Else
        Tz = T * Tconvert
        Hz = H * Hconvert
        Call FAIR(Unknown, Tz, Hz, PR, PHI, CP, R, GAM, A0, FA)
        Form1.Text2.Text = Format(Tz / Tconvert, "###0.000")
        Form1.Label9.Caption = Format(A0 / Sconvert, "###0.000")
        Form1.Label10.Caption = Format(GAM, "0.00000")
        Form1.Label11.Caption = Format(CP / CPconvert, "0.00000")
        Form1.Label20.Caption = Format(R / CPconvert, "0.00000")
        Form1.Label12.Caption = Format(PHI / CPconvert, "#0.00000")
        Form1.Text3.Text = Format(Hz / Hconvert, "###0.0000")
        If PR < 2 Then
            Form1.Text4.Text = Format(PR, "0.000000")
        Else
            Form1.Text4.Text = Format(PR, "###0.0000")
        End If
    End If
 End Sub
 

Sub FAIR(Unknown, T, H, PR, PHI, CP, R, GAM, A0, FA)

'******************************************************************
'*                                                                *
'*     SURBOUTINE FAIR                                            *
'*                                                                *
'*     Given: f/a  and T or H or PR or PHI for a fuel/air mixture *
'*                                                                *
'*     Find:  Other properties using PROCOM                       *
'*                                                                *
'*     Unknown = 1 then T   is known                              *
'*     Unknown = 2 then H   is known                              *
'*     Unknown = 3 then PR  is known                              *
'*     Unknown = 4 then PHI is known                              *
'*                                                                *
'******************************************************************

Const phi0 = 1.5784181

Select Case Unknown
  Case 1
    Call PROCOM(FA, T, A0, GAM, CP, R, PHI, PR, H)
  Case 2
    Call TEMP(H, FA, T)
    Call PROCOM(FA, T, A0, GAM, CP, R, PHI, PR, H)
  Case 3
    AMW = 28.97 - 0.946186 * FA
    RX = 1.9857117 / AMW
    PHI = RX * Log(PR) + phi0
    Call PHIT(PHI, FA, T)
    Call PROCOM(FA, T, A0, GAM, CP, R, PHI, PR, H)
  Case 4
    Call PHIT(PHI, FA, T)
    Call PROCOM(FA, T, A0, GAM, CP, R, PHI, PR, H)
  Case Else
End Select

End Sub

Sub PHIT(PHI, FA, T)

'***************************************************************
'*                                                             *
'*     SURBOUTINE PHIT                                         *
'*                                                             *
'*     Given: phi & f/a  for a fuel/air mixture                *
'*                                                             *
'*     Find:  T  using PROCOM                                  *
'*                                                             *
'***************************************************************
     
      TTO = PHI * 500!
      Call PROCOM(FA, TTO, DUM1, DUM2, DUM3, DUM4, PHIO, DUM5, DUM6)
      DELT = 25!
100   T = TTO + DELT
      Call PROCOM(FA, T, DUM1, DUM2, DUM3, DUM4, PHIN, DUM5, DUM6)
      If Abs(PHIN - PHIO) > 0.00000001 Then
        If Abs((PHIN - PHI) / PHI) > 0.000000001 Then
          SLOPE = (TTO - T) / (PHIO - PHIN)
          DELT = SLOPE * (PHI - PHIN)
          PHIO = PHIN
          TTO = T
          GoTo 100
        End If
      End If
End Sub

Sub PROCOM(FA, T, AX, GAM, CPX, RX, PHI, PR, HX)

'***************************************************************
'*                                                             *
'*     SURBOUTINE PROCOM                                       *
'*                                                             *
'*     Based on FORTRAN Subroutine PROCOM written by Captain   *
'*     John S. McKinney, USAF as part of his SMOTE computer    *
'*     program and referred to in his report "Simulation of    *
'*     Turbofan Engine," Air Force Aero Propulsion Laboratory, *
'*     TR 67-125, November 1967                                *
'*                                                             *
'*     Given: f/a & T                                          *
'*                                                             *
'*     Finds: Cp, Ht, R, a, gamma, phi, and Pr                 *
'*                                                             *
'*         GAM  - gamma of fuel/air mixture                    *
'*         CPA  - Cp of air                                    *
'*         CPF  - Cp of fuel                                   *
'*         CPX  - Cp of fuel/air mixture                       *
'*         AX   - Speed of sound for fuel/air mixture          *
'*         FA   - Fuel to air ratio                            *
'*         HA   - Enthalpy of air                              *
'*         HF   - Enthalpy of fuel                             *
'*         HX   - Enthalpy of fuel/air mixture                 *
'*         RX   - Gas Constant R                               *
'*         PHIA - Real gas variable (phi) for air              *
'*         PHIF - Real gas variable (phi) for fuel             *
'*         PHI  - Real gas variable (phi) for fuel/air mixture *
'*         PR   - Reduced Pressure                             *
'*         T    - Temperature (R)                              *
'*                                                             *
'***************************************************************

'Coefficients for air
  Const A0 = 0.25020051
  Const A1 = -0.000051536879
  Const A2 = 0.000000065519486
  Const A3 = -6.7178376E-12
  Const A4 = -1.5128259E-14
  Const A5 = 7.6215767E-18
  Const A6 = -1.452677E-21
  Const A7 = 1.011554E-25
  Const href = -1.7558886
  Const phiref = 0.0454323
    
'Coefficients for Combustion Products
  Const A0F = 0.073816638
  Const A1F = 0.001225863
  Const A2F = -0.0000013771901
  Const A3F = 9.9686793E-10
  Const A4F = -4.2051104E-13
  Const A5F = 1.0212913E-16
  Const A6F = -1.3335668E-20
  Const A7F = 7.267871E-25
  Const hrefF = 30.58153
  Const phirefF = 0.6483398

  Const phi0 = 1.5784181

  If FA > 0.067623 Then FA = 0.067623
  If T < 250 Then
    T = 300
  End If
  If T > 4100 Then
    T = 4000
  End If
  If FA < 0! Then FA = 0

' AIR PATH
  CP = ((A7 * T + A6) * T + A5) * T + A4
  CPA = (((CP * T + A3) * T + A2) * T + A1) * T + A0
  H = ((A7 / 8 * T + A6 / 7) * T + A5 / 6) * T + A4 / 5
  HA = ((((H * T + A3 / 4) * T + A2 / 3) * T + A1 / 2) * T + A0) * T + href
  PHI = ((A7 / 7 * T + A6 / 6) * T + A5 / 5) * T + A4 / 4
  PHIA = (((PHI * T + A3 / 3) * T + A2 / 2) * T + A1) * T + A0 * Log(T) + phiref
     
' FUEL/AIR PATH
  If FA > 0 Then
    CP = ((A7F * T + A6F) * T + A5F) * T + A4F
    CPF = (((CP * T + A3F) * T + A2F) * T + A1F) * T + A0F
    H = ((A7F / 8 * T + A6F / 7) * T + A5F / 6) * T + A4F / 5
    HF = ((((H * T + A3F / 4) * T + A2F / 3) * T + A1F / 2) * T + A0F) * T + hrefF
    PHI = ((A7F / 7 * T + A6F / 6) * T + A5F / 5) * T + A4F / 4
    PHIF = (((PHI * T + A3F / 3) * T + A2F / 2) * T + A1F) * T + A0F * Log(T) + phirefF
  End If

  CPX = (CPA + FA * CPF) / (1! + FA)
  HX = (HA + FA * HF) / (1! + FA)
  PHI = (PHIA + FA * PHIF) / (1! + FA)
  AMW = 28.97 - 0.946186 * FA
  RX = 1.9857117 / AMW
  GAM = CPX / (CPX - RX)
  PR = Exp((PHI - phi0) / RX)
  AX = Sqr(GAM * RX * T * 25039.775)

End Sub

Sub TEMP(H, F, T)

'***************************************************************
'*                                                             *
'*     SURBOUTINE TEMP                                         *
'*                                                             *
'*     Given: H & f/a  for a fuel/air mixture                  *
'*                                                             *
'*     Find:  T  using PROCOM                                  *
'*                                                             *
'***************************************************************
     
      T = H * 4.2
      H0 = H
      Call PROCOM(F, T, DUM1, DUM2, DUM3, DUM4, DUM5, DUM6, H1)
      DELT = 25!
      T2 = T
10    T = T2 + DELT
      Call PROCOM(F, T, DUM1, DUM2, CP, DUM3, DUM4, DUM5, H2)
      If Abs((H2 - H0) / H0) > 0.0000001 Then
        DELT = (H0 - H2) / CP
        H1 = H2
        T2 = T
        GoTo 10
      End If
End Sub

