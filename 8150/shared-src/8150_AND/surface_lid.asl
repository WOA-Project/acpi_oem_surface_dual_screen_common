//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_lid.asl
//
// Abstract:
//
//     Contains device definitions for the device lid.
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
// LID Hall Effect Sensor
//
Device (LID0)
{
    Name (_HID, EisaId ("PNP0C0D"))
    Name (_UID, 0)

    Method (_DEP, 0, NotSerialized)
    {
        Return (Package ()
        {
            \_SB.GIO0
        })
    }

    Method (_LID, 0, NotSerialized)
    {
        If ((\_SB.GIO0.GPH0 == 0))
        {
            Return (0)
        }
        Else
        {
            Return (1)
        }
    }
}