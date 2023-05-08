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
<Group id='Main Panel - Secondary'>
    <PanelName>LGSW43408</PanelName>
    <PanelDescription>LG Secondary DSI Command Mode AMOLED Panel with DSC DV (1350x1800 24bpp)</PanelDescription>
    <Group id='EDID Configuration'>
        <ManufactureID>0xAF0D</ManufactureID>
        <ProductCode>0x01C2</ProductCode>
        <SerialNumber>0x000000</SerialNumber>
        <WeekofManufacture>0x09</WeekofManufacture>
        <YearofManufacture>0x13</YearofManufacture>
        <EDIDVersion>1</EDIDVersion>
        <EDIDRevision>3</EDIDRevision>
        <VideoInputDefinition>0x80</VideoInputDefinition>
        <HorizontalScreenSize>0x07</HorizontalScreenSize>
        <VerticalScreenSize>0x0d</VerticalScreenSize>
        <DisplayTransferCharacteristics>0x78</DisplayTransferCharacteristics>
        <FeatureSupport>0x0</FeatureSupport>
        <Red.GreenBits>0x0</Red.GreenBits>
        <Blue.WhiteBits>0x0</Blue.WhiteBits>
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
        <HorizontalScreenSizeMM>0x4D</HorizontalScreenSizeMM>
        <VerticalScreenSizeMM>0x8C</VerticalScreenSizeMM>
        <HorizontalVerticalScreenSizeMM>0x00</HorizontalVerticalScreenSizeMM>
    </Group>
    <Group id='Active Timing'>
        <HorizontalActive>1350</HorizontalActive>
        <HorizontalFrontPorch>5</HorizontalFrontPorch>
        <HorizontalBackPorch>5</HorizontalBackPorch>
        <HorizontalSyncPulse>1</HorizontalSyncPulse>
        <HorizontalSyncSkew>0</HorizontalSyncSkew>
        <HorizontalLeftBorder>0</HorizontalLeftBorder>
        <HorizontalRightBorder>0</HorizontalRightBorder>
        <VerticalActive>1800</VerticalActive>
        <VerticalFrontPorch>5</VerticalFrontPorch>
        <VerticalBackPorch>5</VerticalBackPorch>
        <VerticalSyncPulse>1</VerticalSyncPulse>
        <VerticalSyncSkew>0</VerticalSyncSkew>
        <VerticalTopBorder>0</VerticalTopBorder>
        <VerticalBottomBorder>0</VerticalBottomBorder>
        <InvertDataPolarity>False</InvertDataPolarity>
        <InvertVsyncPolairty>False</InvertVsyncPolairty>
        <InvertHsyncPolarity>False</InvertHsyncPolarity>
        <BorderColor>0x0</BorderColor>
        <UnderflowColor>0xFF</UnderflowColor>
    </Group>
    <Group id='Display Interface'>
        <InterfaceType>11</InterfaceType>
        <InterfaceColorFormat>3</InterfaceColorFormat>
        <DisplayRecoveryThreshold>0x3C</DisplayRecoveryThreshold>
        <ComponentOrdering>5</ComponentOrdering>
        <PanelOrientation>0</PanelOrientation>
    </Group>
    <Group id='DSI Interface'>
        <DSIChannelId>2</DSIChannelId>
        <DSIVirtualId>0</DSIVirtualId>
        <DSIColorFormat>36</DSIColorFormat>
        <DSITrafficMode>1</DSITrafficMode>
        <DSILanes>4</DSILanes>
        <DSIRefreshRate>0x3C0000</DSIRefreshRate>
        <DSICmdSwapInterface>False</DSICmdSwapInterface>
        <DSICmdUsingTrigger>False</DSICmdUsingTrigger>
        <DSIInitMasterTime>120</DSIInitMasterTime>
        <DSIEnterULPSPowerDown>False</DSIEnterULPSPowerDown>
        <DSIBitClockFrequency>500000000</DSIBitClockFrequency>
        <DisplayPrimaryFlags>0x00000009</DisplayPrimaryFlags>
        <DisplayPowerSavingOverride>2</DisplayPowerSavingOverride>
        <DSIClockHSForceRequest>1</DSIClockHSForceRequest>
        <DSIControllerMapping>
          01
        </DSIControllerMapping>
        <DSIDSCEnable>True</DSIDSCEnable>
        <DSIDSCProfileID>6</DSIDSCProfileID>
        <DSIDSCSliceWidth>675</DSIDSCSliceWidth>
        <DSIDSCSliceHeight>900</DSIDSCSliceHeight>
        <DSIDSCMajorVersion>1</DSIDSCMajorVersion>
        <DSIDSCMinorVersion>1</DSIDSCMinorVersion>
        <DSIDSCScrVersion>0</DSIDSCScrVersion>
        <DSITECheckEnable>False</DSITECheckEnable>
        <DSITEUsingDedicatedTEPin>True</DSITEUsingDedicatedTEPin>
        <DSITEvSyncStartPos>2</DSITEvSyncStartPos>
        <DSITEvSyncContinueLines>4000</DSITEvSyncContinueLines>
        <DSITEvSyncStartLineDivisor>4</DSITEvSyncStartLineDivisor>
        <DSITEPercentVariance>0xa0000</DSITEPercentVariance>
        <DSITEvSyncSelect>1</DSITEvSyncSelect>
        <DSIFlags>2</DSIFlags>
        <DSIEscapeClockFrequency>6000000</DSIEscapeClockFrequency>
        <DSIHsaHseAfterVsVe>False</DSIHsaHseAfterVsVe>
        <DSILowPowerModeInHFP>False</DSILowPowerModeInHFP>
        <DSILowPowerModeInHBP>False</DSILowPowerModeInHBP>
        <DSILowPowerModeInHSA>False</DSILowPowerModeInHSA>
        <DSILowPowerModeInBLLPEOF>True</DSILowPowerModeInBLLPEOF>
        <DSILowPowerModeInBLLP>True</DSILowPowerModeInBLLP>
        <DSIEnableAutoRefresh>True</DSIEnableAutoRefresh>
        <DSIPhyDCDCMode>False</DSIPhyDCDCMode>
        <DSIPacketTransferHS>False</DSIPacketTransferHS>
        <DSILP11AtInit>True</DSILP11AtInit>
        <DSIForceCmdInVideoHS>True</DSIForceCmdInVideoHS>
        <DSITEvSyncInitVal>1800</DSITEvSyncInitVal>
        <DSIDSCSlicePerPacket>2</DSIDSCSlicePerPacket>
        <DSICmdModeIdleTime>1</DSICmdModeIdleTime>
        <DSINullpacketInsertionBytes>1</DSINullpacketInsertionBytes>
        <DSIPixelXferTiming>3</DSIPixelXferTiming>
    </Group>
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
        <AdaptiveBrightnessFeature>1</AdaptiveBrightnessFeature>
        <BacklightSteps>100</BacklightSteps>
        <BacklightType>3</BacklightType>
        <BrightnessMaxLuminance>600000</BrightnessMaxLuminance>
        <BrightnessMinLuminance>4000</BrightnessMinLuminance>
        <BrightnessRangeLevel0>4000 600000 5960 0</BrightnessRangeLevel0>
        <CABLEnable>True</CABLEnable>
    </Group>
    <Group id='AD Configuration'>
        <ADMaxIterations>30</ADMaxIterations>
        <ADInitParam001>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam001>
        <ADInitParam002>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam002>
        <ADInitParam003>0x0000 0x0800 0x1000 0x1800 0x2000 0x2800 0x3000 0x3800 0x4000 0x4800 0x5000 0x5800 0x6000 0x6800 0x7000 0x7800 0x8000 0x87FF 0x8FFF 0x97FF 0x9FFF 0xA7FF 0xAFFF 0xB7FF 0xBFFF 0xC7FF 0xCFFF 0xD7FF 0xDFFF 0xE7FF 0xEFFF 0xF7FF 0xFFFF </ADInitParam003>
        <ADInitParam004>0x0000 0x0800 0x1000 0x1801 0x1D61 0x22F2 0x26A2 0x2993 0x2C23 0x2E94 0x3114 0x33A5 0x3685 0x39C6 0x3D66 0x4177 0x45E7 0x4AE8 0x5058 0x5669 0x5D29 0x648A 0x6CAA 0x759B 0x7F7B 0x8A5C 0x965C 0xA3AD 0xB25D 0xC2BE 0xD4EE 0xE93F 0xFFFF </ADInitParam004>
        <ADInitParam005>0x0001 0x0032 0x0064 0x0096 0x00FA 0x015E 0x0190 0x0384 0x04E2 0x0708 0x08FC 0x0BB8 0x1770 0x2EE0 0x5DC0 0xC350 0x04B0 0x2125 0x2EE0 0x3969 0x4A1E 0x57B2 0x5DC0 0x8CA0 0xA5BA 0xC6E0 0xE0CE 0xFFFF 0xFFFF 0xFFFF 0xFFFF 0xFFFF </ADInitParam005>
        <ADInitParam006>0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF 0x0000 0x000A 0x0019 0x0032 0x0064 0x00C8 0x0190 0x02BC 0x03E8 0x05DC 0x09C4 0x0FA0 0x1F40 0x3A98 0x7530 0xFFFF </ADInitParam006>
        <ADInitParam007>0x0000 0x0095 0x0128 0x01B9 0x0249 0x02D8 0x0365 0x03F1 0x047B 0x0504 0x058C 0x0612 0x0697 0x071A 0x079D 0x081E 0x089E 0x091C 0x099A 0x0A16 0x0A91 0x0B0B 0x0B83 0x0BFB 0x0C71 0x0CE7 0x0D5B 0x0DCE 0x0E41 0x0EB2 0x0F22 0x0F91 0x0FFF </ADInitParam007>
        <ADInitParam008>0x00FF 0x0116 0x012E 0x0146 0x015E 0x0176 0x018E 0x01A6 0x01BE 0x01D6 0x01EE 0x0205 0x021D 0x0235 0x024D 0x0265 0x027D 0x0295 0x02AC 0x02C4 0x02DC 0x02F3 0x030B 0x0323 0x033A 0x0352 0x036A 0x0381 0x0399 0x03B1 0x03C8 0x03E0 0x03F8 </ADInitParam008>
        <ADInitParam009>0x03</ADInitParam009>
        <ADInitParam010>0x3F</ADInitParam010>
        <ADInitParam011>0x0780</ADInitParam011>
        <ADInitParam012>0x0438</ADInitParam012>
        <ADInitParam013>0x0002</ADInitParam013>
        <ADInitParam014>0x0002</ADInitParam014>
        <ADInitParam015>0xFFFF</ADInitParam015>
        <ADInitParam016>0x06</ADInitParam016>
        <ADInitParam017>0x030</ADInitParam017>
        <ADInitParam018>0x012</ADInitParam018>
        <ADInitParam019>0x044</ADInitParam019>
        <ADInitParam020>0xFFFF</ADInitParam020>
        <ADInitParam021>0x80</ADInitParam021>
        <ADInitParam022>0x80</ADInitParam022>
        <ADInitParam023>0x07AE</ADInitParam023>
        <ADInitParam024>0x0800</ADInitParam024>
        <ADInitParam025>0x0333</ADInitParam025>
        <ADInitParam026>0x0800</ADInitParam026>
        <ADInitParam027>0x0333</ADInitParam027>
        <ADInitParam028>0x0006</ADInitParam028>
        <ADInitParam029>0x0222</ADInitParam029>
        <ADInitParam030>0x1000</ADInitParam030>
        <ADInitParam031>0x012C</ADInitParam031>
        <ADInitParam032>0x0BB8</ADInitParam032>
        <ADInitParam033>0x1DB0</ADInitParam033>
        <ADInitParam034>0xFFFF</ADInitParam034>
        <ADInitParam035>0xFFFF</ADInitParam035>
        <ADInitParam036>0x10</ADInitParam036>
        <ADInitParam037>0x00</ADInitParam037>
        <ADInitParam038>0x10</ADInitParam038>
        <ADInitParam039>0x00</ADInitParam039>
        <ADInitParam040>0xFFFF</ADInitParam040>
        <ADInitParam041>0x10</ADInitParam041>
        <ADInitParam042>0x1000</ADInitParam042>
        <ADInitParam043>0x10</ADInitParam043>
        <ADInitParam044>0x0200</ADInitParam044>
        <ADInitParam045>0x0080</ADInitParam045>
        <ADInitParam046>0x0</ADInitParam046>
        <ADInitParam047>0xFF</ADInitParam047>
        <ADInitParam048>0x07</ADInitParam048>
        <ADInitParam049>0xC6</ADInitParam049>
        <ADInitParam050>0x41</ADInitParam050>
        <ADInitParam051>0x3C</ADInitParam051>
        <ADInitParam052>0x80</ADInitParam052>
        <ADInitParam053>0x000</ADInitParam053>
        <ADInitParam054>0x3FF</ADInitParam054>
        <ADInitParam055>0xF0</ADInitParam055>
        <ADInitParam056>0x00</ADInitParam056>
        <ADInitParam057>0x01</ADInitParam057>
        <ADInitParam058>0x2</ADInitParam058>
        <ADInitParam059>0x05</ADInitParam059>
        <ADInitParam060>0x00</ADInitParam060>
        <ADInitParam061>0x00</ADInitParam061>
        <ADInitParam062>0x003</ADInitParam062>
        <ADInitParam063>0x001</ADInitParam063>
        <ADInitParam064>0x001</ADInitParam064>
        <ADInitParam065>0x3FF</ADInitParam065>
        <ADInitParam066>0x08</ADInitParam066>
        <ADInitParam067>0x08</ADInitParam067>
        <ADInitParam068>0x13</ADInitParam068>
        <ADInitParam069>0x0000</ADInitParam069>
        <ADInitParam070>0x001</ADInitParam070>
        <ADInitParam071>0x00C</ADInitParam071>
        <ADInitParam072>0x050</ADInitParam072>
        <ADInitParam073>0x80</ADInitParam073>
        <ADInitParam074>0x040</ADInitParam074>
        <ADInitParam075>0x008</ADInitParam075>

        <ADCfgParam001>0x0000</ADCfgParam001>
        <ADCfgParam002>0xFFFF</ADCfgParam002>
        <ADCfgParam003>0x0000</ADCfgParam003>
        <ADCfgParam004>0xFFFF</ADCfgParam004>
        <ADCfgParam005>0x86</ADCfgParam005>
        <ADCfgParam006>0x10</ADCfgParam006>
        <ADCfgParam007>0x80</ADCfgParam007>
        <ADCfgParam008>0x54</ADCfgParam008>
        <ADCfgParam009>0x200</ADCfgParam009>
        <ADCfgParam010>0x500</ADCfgParam010>
        <ADCfgParam011>0x0400</ADCfgParam011>
        <ADCfgParam012>0x0400</ADCfgParam012>
        <ADCfgParam013>0x80</ADCfgParam013>
        <ADCfgParam014>0x5025</ADCfgParam014>
        <ADCfgParam015>0x0000</ADCfgParam015>
        <ADCfgParam016>0x200</ADCfgParam016>
        <ADCfgParam017>0x0020</ADCfgParam017>
        <ADCfgParam018>0x0222</ADCfgParam018>
        <ADCfgParam019>0x0400</ADCfgParam019>
        <ADCfgParam020>0x0400</ADCfgParam020>
        <ADCfgParam021>0x0001</ADCfgParam021>
        <ADCfgParam022>0x0222</ADCfgParam022>
        <ADCfgParam023>0x0400</ADCfgParam023>
        <ADCfgParam024>0x1000</ADCfgParam024>
        <ADCfgParam025>0x0018</ADCfgParam025>
        <ADCfgParam026>0x005F</ADCfgParam026>
        <ADCfgParam027>0x0008</ADCfgParam027>
        <ADCfgParam028>0x0000</ADCfgParam028>
        <ADCfgParam029>0x0000</ADCfgParam029>
        <ADCfgParam030>0x0010</ADCfgParam030>
        <ADCfgParam031>0x080</ADCfgParam031>
        <ADCfgParam032>0x200</ADCfgParam032>
        <ADCfgParam033>0x80</ADCfgParam033>
        <ADCfgParam034>0x0020</ADCfgParam034>
        <ADCfgParam035>0x022</ADCfgParam035>
        <ADCfgParam036>0x600</ADCfgParam036>
        <ADCfgParam037>0x310</ADCfgParam037>
        <ADCfgParam038>0x80</ADCfgParam038>
        <ADCfgParam039>0x30</ADCfgParam039>
        <ADCfgParam040>0x19A</ADCfgParam040>
        <ADCfgParam041>0x03</ADCfgParam041>
        <ADCfgParam042>0x200</ADCfgParam042>
        <ADCfgParam043>0x200</ADCfgParam043>
        <ADCfgParam044>0x80</ADCfgParam044>
        <ADCfgParam045>0x90</ADCfgParam045>
        <ADCfgParam046>0x2000</ADCfgParam046>
    </Group>
</Group>"})