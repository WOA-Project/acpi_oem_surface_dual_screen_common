//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_esim.asl
//
// Abstract:
//
//     Contains device definitions for the eSIM SE.
//
// Environment:
//
//     Advanced Configuration and Power Interface (ACPI)
//
// Revision History:
//
//     2023-09-30 - @gus33000 - Initial revision
//
// License:
//
//     SPDX-License-Identifier: MIT
//

//
// Gemalto eSIM Firmware Update
//
Device (GMLT)
{
    Name (_HID, "GEM7001")
    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}