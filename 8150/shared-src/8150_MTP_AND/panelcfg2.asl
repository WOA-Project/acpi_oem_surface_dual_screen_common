//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     panelcfg2.asl
//
// Abstract:
//
//     Contains configuration information for the Right (R2) Panel.
//
// Environment:
//
//     Advanced Configuration and Power Interface (ACPI)
//
// Revision History:
//
//     2022-12-23 - @gus33000 - Initial revision
//
// License:
//
//     SPDX-License-Identifier: MIT
//

Name (PCFG,
    Buffer() {"<?xml version='1.0' encoding='utf-8'?>
<PanelName>Surface_Duo_Secondary DV</PanelName>
<PanelDescription>Duo DSI Secondary Cmd Mode AMOLED Panel with DSC DV (1350x1800 24bpp)</PanelDescription>
<Group id='Active Timing'>
    <ManufactureID>0xE430</ManufactureID>
    <ProductCode>0xA990</ProductCode>
    <SerialNumber>0x000001</SerialNumber>
    <WeekofManufacture>0x01</WeekofManufacture>
    <YearofManufacture>0x1E</YearofManufacture>
    <EDIDVersion>1</EDIDVersion>
    <EDIDRevision>4</EDIDRevision>
    <HorizontalScreenSize>0x08</HorizontalScreenSize>
    <VerticalScreenSize>0x0B</VerticalScreenSize>
    <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
    <FeatureSupport>0x2</FeatureSupport>
    <Red.GreenBits>0xA4</Red.GreenBits>
    <Blue.WhiteBits>0x15</Blue.WhiteBits>
    <RedX>0x9E</RedX>
    <RedY>0x55</RedY>
    <GreenX>0x4E</GreenX>
    <GreenY>0x9B</GreenY>
    <BlueX>0x26</BlueX>
    <BlueY>0x0F</BlueY>
    <WhiteX>0x50</WhiteX>
    <WhiteY>0x54</WhiteY>
    <EstablishedTimingsI>0x0</EstablishedTimingsI>
    <EstablishedTimingsII>0x0</EstablishedTimingsII>
    <ManufacturesTiming>0x0</ManufacturesTiming>
    <StandardTimings1/>
    <StandardTimings2/>
    <StandardTimings3/>
    <StandardTimings4/>
    <StandardTimings5/>
    <StandardTimings6/>
    <StandardTimings7/>
    <SignalTimingInterface/>
</Group>
<Group id='Detailed Timing'>
    <HorizontalScreenSizeMM>0x55</HorizontalScreenSizeMM>
    <VerticalScreenSizeMM>0x72</VerticalScreenSizeMM>
    <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
</Group>
<Group id='Active Timing'>
    <HorizontalActive>1350</HorizontalActive>
    <HorizontalFrontPorch>20</HorizontalFrontPorch>
    <HorizontalBackPorch>20</HorizontalBackPorch>
    <HorizontalSyncPulse>0</HorizontalSyncPulse>
    <HorizontalSyncSkew>0</HorizontalSyncSkew>
    <HorizontalLeftBorder>0</HorizontalLeftBorder>
    <HorizontalRightBorder>0</HorizontalRightBorder>
    <VerticalActive>1800</VerticalActive>
    <VerticalFrontPorch>20</VerticalFrontPorch>
    <VerticalBackPorch>20</VerticalBackPorch>
    <VerticalTopBorder>0</VerticalTopBorder>
    <VerticalBottomBorder>0</VerticalBottomBorder>
    <InvertDataPolarity>False</InvertDataPolarity>
    <InvertVsyncPolarity>False</InvertVsyncPolarity>
    <InvertHsyncPolarity>False</InvertHsyncPolarity>
    <BorderColor>0x0</BorderColor>
    <UnderflowColor>0xFF</UnderflowColor>
</Group>
<Group id='Display Interface'>
    <InterfaceType>9</InterfaceType>
    <PanelOrientation>0</PanelOrientation>
    <InterfaceColorFormat>3</InterfaceColorFormat>
    <ComponentOrdering>5</ComponentOrdering>
</Group>
<Group id='DSI Interface'>
    <DSIChannelId>2</DSIChannelId>
    <DSIVirtualId>0</DSIVirtualId>
    <DSIColorFormat>36</DSIColorFormat>
    <DSITrafficMode>1</DSITrafficMode>
    <DSILanes>4</DSILanes>
    <DSIHsaHseAfterVsVe>False</DSIHsaHseAfterVsVe>
    <DSILowPowerModeInHFP>False</DSILowPowerModeInHFP>
    <DSILowPowerModeInHBP>False</DSILowPowerModeInHBP>
    <DSILowPowerModeInHSA>False</DSILowPowerModeInHSA>
    <DSILowPowerModeInBLLPEOF>True</DSILowPowerModeInBLLPEOF>
    <DSILowPowerModeInBLLP>True</DSILowPowerModeInBLLP>
    <DSIRefreshRate>0x3C0000</DSIRefreshRate>
    <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh>
    <DSIPhyDCDCMode>False</DSIPhyDCDCMode>
    <DSIPacketTransferHS>False</DSIPacketTransferHS>
    <DSIClockHSForceRequest>1</DSIClockHSForceRequest>
    <DSILP11AtInit>True</DSILP11AtInit>
    <DSIForceCmdInVideoHS>True</DSIForceCmdInVideoHS>
    <DSIDSCEnable>True</DSIDSCEnable>
    <DSIDSCMajor>1</DSIDSCMajor>
    <DSIDSCMinor>1</DSIDSCMinor>
    <DSIDSCScr>0</DSIDSCScr>
    <DSIDSCProfileID>6</DSIDSCProfileID>
    <DSITECheckEnable>True</DSITECheckEnable>
    <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
    <DSITEvSyncSelect>1</DSITEvSyncSelect>
    <DSITEvSyncStartPos>1800</DSITEvSyncStartPos>
    <DSITEvSyncInitVal>1800</DSITEvSyncInitVal>
    <DSIDSCSliceWidth>675</DSIDSCSliceWidth>
    <DSIDSCSliceHeight>900</DSIDSCSliceHeight>
    <DSIBitClockFrequency>500000000</DSIBitClockFrequency>
    <DSIFlags>0x00000002</DSIFlags>
    <DSICmdModeIdleTime>1</DSICmdModeIdleTime>
    <DSINullpacketInsertionBytes>1</DSINullpacketInsertionBytes>
    <DSIEnterULPSPowerDown>True</DSIEnterULPSPowerDown>
    <DSIInitMasterTime>120</DSIInitMasterTime>
    <DSIPixelXferTiming>3</DSIPixelXferTiming>
</Group>
<DSIControllerMapping>
    01
</DSIControllerMapping>
<DSIInitSequence>
    07 11 00
    0A 11 00 00 89 30 80 07 08 05 46 03 84 02 A3 02 A3 02 00 02 51 00 20 5F 4B 00 09 00 0C 00 1C 00 18 18 00 10 F0 03 0C 20 00 06 0B 0B 33 0E 1C 2A 38 46 54 62 69 70 77 79 7B 7D 7E 01 02 01 00 09 40 09 BE 19 FC 19 FA 19 F8 1A 38 1A 78 1A B6 2A F6 2B 34 2B 74 3B 74 6B F4 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
    15 B0 AC
    39 2A 00 00 05 45
    39 2B 00 00 07 07
    15 26 02
    39 44 03 84
    05 35
    39 51 01 47
    39 53 0C 30
    39 55 04 70 DB 00 78 DB
    15 EE 24
    15 FB AC
    15 B0 CA
    05 11
    FF 5A
    05 29
    FF 32
    15 B0 AC
    39 E9 32 32 55 06 00 1C 00 00 55 50 4B
    39 D0 80 10 81 02 0B 00 00 00 00 00 00 00 01 0C 00 D4 0B 00 11 00 1C
    15 B0 CA
    39 53 0D 30
</DSIInitSequence>
<Group id='DSI Timing parameters'>
    <DSITimingHSPrepareOverride>False</DSITimingHSPrepareOverride>
    <DSITimingHSPrepareValue>21</DSITimingHSPrepareValue>
    <DSITimingHSExitValue>22</DSITimingHSExitValue>
</Group>
<DSITermSequence>
    05 28
    FF 01
    05 10
    FF 78
</DSITermSequence>
<Group id='Connection Configuration'>
    <Display1Reset1Info>DSI_PANEL2_RESET, 0, 40</Display1Reset1Info>
</Group>
<Group id='Backlight Configuration'>
    <BacklightType>3</BacklightType>
    <BacklightSteps>100</BacklightSteps>
    <BrightnessMinLuminance>4000</BrightnessMinLuminance>
    <BrightnessMaxLuminance>600000</BrightnessMaxLuminance>
    <BrightnessRangeLevel0>4000 600000 5960 0</BrightnessRangeLevel0>
    <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
    <CABLEnable>True</CABLEnable>
</Group>"})