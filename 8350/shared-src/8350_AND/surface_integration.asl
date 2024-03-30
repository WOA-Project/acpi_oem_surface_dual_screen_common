//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_integration.asl
//
// Abstract:
//
//     Contains device definitions for additional
//     Surface Integration OS devices.
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
// Surface Integration
//
Device (WSID)
{
    Name (_HID, "MSHW0107")
    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}
