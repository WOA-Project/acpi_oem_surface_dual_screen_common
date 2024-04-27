//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_xbl_hob.asl
//
// Abstract:
//
//     Contains Region definitions for the Surface Application
//     Hob describing specifications of the hardware.
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

//
// The XBL Apps Hob is located in a reserved memory OEM Specific area on Surface Duo 2
//
Scope(\_SB) {
    OperationRegion(XACA, SystemMemory, 0xE3400000, 0x4C9)
    Field(XACA, AnyAcc, NoLock, Preserve)
    {
        BDID,   8,   // Board ID               // (00)
        BATP,   8,   // Battery Present        // (01) Indicates battery presence: 0 - battery absent, 1 - battery present
        HWIR,   8,   // Hardware Init Retries  // (02) Indicates retries attempted to initialize descrete hardware circuit
        ISCM,   8,   // Is Customer Mode       // (03) Indicates whether the device is in Manufacturing Mode: 0 - in manuf mode, 1 - in Customer mode
        ISAM,   8,   // Act Mode               // (04) Indicates whether device has act mode enabled. 0 - disabled 1 - enabled
        PMRR,   8,   // Pmic Reset Reason      // (05) PmicResetReason: 9 - battery driver triggered
        TFWV,   128, // Touch FW Version       // (06) Current Touch Firmware version number
        PRID,   16,  // Product Id             // (07) Product ID of the device.
        OCEL,   16,  // OCP Error Location     // (08) Identify which power rail has the OCP Error
                                               //      Bit(s)     Meaning
                                               //      15         More than one OCP error occurred
                                               //      14-12      PMIC
                                               //      11-7       SMPS
                                               //      6-2        LDO
                                               //      1-0        BOB
        IRAM,   8,   // Is Rafla Mode          // (09) Indicates whether the device is in Rafla Mode: 0 - not in Rafla mode, 1 - in Rafla mode
        RDID,   24,  // Display RDID           // (10) Indicates which TDM RDID has been read.
                                               //      Index 0 is related to manufacturer, LGD--, Here we will see 0x81 for Zeta
                                               //      Index 1 is related to TDM version, EV1, EV2, EV3, DV, MP etc
                                               //      0         - Unknown TDM, we have bigger problems.
                                               //      0x31-0x3F - EV2
                                               //      0x41-0x4F - EV3
                                               //      Index 2 tells us which one we read, left side or right side, we will mstly see left side
                                               //      0x9        - Left side
                                               //      0x10       - right side
        FUTR,   8,   // Future                 // (11)
        PPBK,   3408,// Pmic Pon Block         // (12) PMIC pon block from 0x885 to 0x8cb
        PS48,   1024,// Pmic Sdam Block 48     // PMIC SDAM48 block from 0x9F40 to 0x9FBF
        PS08,   1024,// Pmic Sdam Block 08     // PMIC SDAM8  block from 0x7740 to 0x77BF
        PS07,   1024,// Pmic Sdam Block 07     // PMIC SDAM7  block from 0x7640 to 0x76BF
        PS06,   1024,// Pmic Sdam Block 06     // PMIC SDAM6  block from 0x7540 to 0x75BF
        PS05,   1024,// Pmic Sdam Block 05     // PMIC SDAM5  block from 0x7440 to 0x74BF
        PS01,   1024,// Pmic Sdam Block 01     // PMIC SDAM1  block from 0x7040 to 0x70BF
    }

    //
    // Zeta Retail Subtype
    //
    Method(MSDR)
    {
        Return (\_SB.BDID == 8 || \_SB.BDID == 10 || \_SB.BDID == 12)
    }

    //
    // Zeta Debug Subtype
    //
    Method(MSDD)
    {
        Return (\_SB.BDID == 1 || \_SB.BDID == 2 || \_SB.BDID == 3 || \_SB.BDID == 4 || \_SB.BDID == 5 || \_SB.BDID == 6 || \_SB.BDID == 9 || \_SB.BDID == 11)
    }

    //
    // Zeta Wi-Fi Subtype
    //
    Method(MSDW)
    {
        Return (\_SB.BDID == 6)
    }

    //
    // Zeta EV1 Subtype
    //
    Method(TEV1)
    {
        Return (\_SB.BDID == 1)
    }

    //
    // Zeta EV1.1 Subtype
    //
    Method(TE11)
    {
        Return (\_SB.BDID == 2)
    }

    //
    // Zeta EV2 Subtype
    //
    Method(TEV2)
    {
        Return (\_SB.BDID == 3)
    }

    //
    // Zeta EV2.1 Subtype
    //
    Method(TE21)
    {
        Return (\_SB.BDID == 4)
    }

    //
    // Zeta EV2.2 Subtype
    //
    Method(TE22)
    {
        Return (\_SB.BDID == 5 || \_SB.BDID == 6)
    }

    //
    // Zeta EV3 Subtype
    //
    Method(TEV3)
    {
        Return (\_SB.BDID == 8 || \_SB.BDID == 9)
    }

    //
    // Zeta DV Subtype
    //
    Method(TZDV)
    {
        Return (\_SB.BDID == 10 || \_SB.BDID == 11)
    }

    //
    // Zeta MP Subtype
    //
    Method(TZMP)
    {
        Return (\_SB.BDID == 12)
    }

    OperationRegion(XPCA, SystemMemory, 0xE3401000, 0x90)
    Field(XPCA, AnyAcc, NoLock, Preserve)
    {
        CBOC,   32,  // Current Boot Cycle     // (00) This variable keeps the total counts of booting of the device.
                                               //
                                               // [00] PMIC PON History Information Block
        BOC0,   32,  // Boot Cycle             //      (01) If BootCycle is zero, it means this record is invalid.
                                               //           We can also use this BootCycle to know the gap between the CurrentBootCycle.
                                               //      PMIC PON PON Information Block
        S3R0,   8,   // S3 Reason              //           (02) S3Reason from SDAM5
        F1R0,   8,   // Fault 1 Reason         //           (03) Fault1Reason from SDAM5
        RTR0,   16,  // Reset Trigger          //           (04) ResetTrigger from SDAM5
                                               //      PMIC PON Battery Status Block
        SOC0,   32,  // State Of Charge        //           (05) State of Charge of battery (%)
        IBT0,   32,  // Charge Current         //           (06) Charging Current in mA
        VBT0,   32,  // Battery Voltage        //           (07) Battery voltage in mV
        TBT0,   32,  // Battery Temperature    //           (08) Battery temperature in degree C
        OCV0,   32,  // Open Circuit Voltage   //           (09) Battery Open-Circuit Voltage in mV
                                               //
                                               // [01] PMIC PON History Information Block
        BOC1,   32,  // Boot Cycle             //      (10) If BootCycle is zero, it means this record is invalid.
                                               //           We can also use this BootCycle to know the gap between the CurrentBootCycle.
                                               //      PMIC PON PON Information Block
        S3R1,   8,   // S3 Reason              //           (11) S3Reason from SDAM5
        F1R1,   8,   // Fault 1 Reason         //           (12) Fault1Reason from SDAM5
        RTR1,   16,  // Reset Trigger          //           (13) ResetTrigger from SDAM5
                                               //      PMIC PON Battery Status Block
        SOC1,   32,  // State Of Charge        //           (14) State of Charge of battery (%)
        IBT1,   32,  // Charge Current         //           (15) Charging Current in mA
        VBT1,   32,  // Battery Voltage        //           (16) Battery voltage in mV
        TBT1,   32,  // Battery Temperature    //           (17) Battery temperature in degree C
        OCV1,   32,  // Open Circuit Voltage   //           (18) Battery Open-Circuit Voltage in mV
                                               //
                                               // [02] PMIC PON History Information Block
        BOC2,   32,  // Boot Cycle             //      (19) If BootCycle is zero, it means this record is invalid.
                                               //           We can also use this BootCycle to know the gap between the CurrentBootCycle.
                                               //      PMIC PON PON Information Block
        S3R2,   8,   // S3 Reason              //           (20) S3Reason from SDAM5
        F1R2,   8,   // Fault 1 Reason         //           (21) Fault1Reason from SDAM5
        RTR2,   16,  // Reset Trigger          //           (22) ResetTrigger from SDAM5
                                               //      PMIC PON Battery Status Block
        SOC2,   32,  // State Of Charge        //           (23) State of Charge of battery (%)
        IBT2,   32,  // Charge Current         //           (24) Charging Current in mA
        VBT2,   32,  // Battery Voltage        //           (25) Battery voltage in mV
        TBT2,   32,  // Battery Temperature    //           (26) Battery temperature in degree C
        OCV2,   32,  // Open Circuit Voltage   //           (26) Battery Open-Circuit Voltage in mV
                                               //
                                               // [03] PMIC PON History Information Block
        BOC3,   32,  // Boot Cycle             //      (28) If BootCycle is zero, it means this record is invalid.
                                               //           We can also use this BootCycle to know the gap between the CurrentBootCycle.
                                               //      PMIC PON PON Information Block
        S3R3,   8,   // S3 Reason              //           (29) S3Reason from SDAM5
        F1R3,   8,   // Fault 1 Reason         //           (30) Fault1Reason from SDAM5
        RTR3,   16,  // Reset Trigger          //           (31) ResetTrigger from SDAM5
                                               //      PMIC PON Battery Status Block
        SOC3,   32,  // State Of Charge        //           (32) State of Charge of battery (%)
        IBT3,   32,  // Charge Current         //           (33) Charging Current in mA
        VBT3,   32,  // Battery Voltage        //           (34) Battery voltage in mV
        TBT3,   32,  // Battery Temperature    //           (35) Battery temperature in degree C
        OCV3,   32,  // Open Circuit Voltage   //           (36) Battery Open-Circuit Voltage in mV
                                               //
                                               // [04] PMIC PON History Information Block
        BOC4,   32,  // Boot Cycle             //      (37) If BootCycle is zero, it means this record is invalid.
                                               //           We can also use this BootCycle to know the gap between the CurrentBootCycle.
                                               //      PMIC PON PON Information Block
        S3R4,   8,   // S3 Reason              //           (38) S3Reason from SDAM5
        F1R4,   8,   // Fault 1 Reason         //           (39) Fault1Reason from SDAM5
        RTR4,   16,  // Reset Trigger          //           (40) ResetTrigger from SDAM5
                                               //      PMIC PON Battery Status Block
        SOC4,   32,  // State Of Charge        //           (41) State of Charge of battery (%)
        IBT4,   32,  // Charge Current         //           (42) Charging Current in mA
        VBT4,   32,  // Battery Voltage        //           (43) Battery voltage in mV
        TBT4,   32,  // Battery Temperature    //           (44) Battery temperature in degree C
        OCV4,   32,  // Open Circuit Voltage   //           (45) Battery Open-Circuit Voltage in mV
    }
}
