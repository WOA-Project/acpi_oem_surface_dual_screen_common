//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_sar_manager.asl
//
// Abstract:
//
//     Contains device definitions for the SAR management.
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
// Surface Sar Manager
//
Device (SARP)
{
    Name (_HID, "MSHW0131")
    Name (_UID, 0)
    Name (_DEP, Package ()
    {
        \_SB.SEN2
    })
}
