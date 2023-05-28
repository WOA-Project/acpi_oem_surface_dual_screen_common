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
}