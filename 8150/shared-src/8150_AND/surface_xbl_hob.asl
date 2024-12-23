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
// The XBL Apps Hob is located in the SMEM OEM Specific area on Surface Duo (1st Gen)
//
Scope(\_SB) {
    OperationRegion(XACA, SystemMemory, 0x146BFA94, 0x64)
    Field(XACA, AnyAcc, NoLock, Preserve)
    {
        BDID,   8,   // Board ID               // (00)
        BATP,   8,   // Battery Present        // (01) Indicates battery presence: 0 - battery absent, 1 - battery present
        HWIR,   8,   // Hardware Init Retries  // (02) Indicates retries attempted to initialize descrete hardware circuit
        ISCM,   8,   // Is Customer Mode       // (03) Indicates whether the device is in Manufacturing Mode: 0 - in manuf mode, 1 - in Customer mode
        ISAM,   8,   // Act Mode               // (04) Indicates whether device has act mode enabled. 0 - disabled 1 - enabled
        PMRR,   8,   // Pmic Reset Reason      // (05) PmicResetReason: 9 - battery driver triggered
        TFWV,   128, // Touch FW Version       // (06) Current Touch Firmware version number
        OCEL,   16,  // OCP Error Location     // (07) Identify which power rail has the OCP Error
                                               //      Bit(s)     Meaning
                                               //      15         More than one OCP error occurred
                                               //      14-12      PMIC
                                               //      11-7       SMPS
                                               //      6-2        LDO
                                               //      1-0        BOB
    }

    //
    // Epsilon A Subtype
    //
    Method(MSDA)
    {
        Return (\_SB.BDID == 6 || \_SB.BDID == 9 || \_SB.BDID == 11 || \_SB.BDID == 13 || \_SB.BDID == 16)
    }

    //
    // Epsilon B Subtype
    //
    Method(MSDB)
    {
        Return (\_SB.BDID == 7 || \_SB.BDID == 10 || \_SB.BDID == 12 || \_SB.BDID == 14 || \_SB.BDID == 17)
    }

    //
    // Epsilon C Subtype
    //
    Method(MSDC)
    {
        Return (\_SB.BDID == 8 || \_SB.BDID == 15 || \_SB.BDID == 18)
    }

    //
    // Epsilon EV1 Subtype
    //
    Method(TEV1)
    {
        Return (\_SB.BDID == 6 || \_SB.BDID == 7 || \_SB.BDID == 8)
    }

    //
    // Epsilon EV1.5 Subtype
    //
    Method(TE15)
    {
        Return (\_SB.BDID == 9 || \_SB.BDID == 10)
    }

    //
    // Epsilon EV2 Subtype
    //
    Method(TEV2)
    {
        Return (\_SB.BDID == 11 || \_SB.BDID == 12)
    }

    //
    // Epsilon EV2_1 Subtype
    //
    Method(TE21)
    {
        Return (\_SB.BDID == 13 || \_SB.BDID == 14 || \_SB.BDID == 15)
    }

    //
    // Epsilon DV Subtype
    //
    Method(TDVM)
    {
        Return (\_SB.BDID == 16 || \_SB.BDID == 17 || \_SB.BDID == 18)
    }
}
