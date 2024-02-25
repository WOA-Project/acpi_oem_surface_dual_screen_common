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

// Device declaration for Hall Effect Sensor
// Default LIDB Value is 1 because lid open is 1
Device (LID0)
{
    Name (_HID, "PNP0C0D")
    Alias(\_SB.PSUB, _SUB)
	Name (_DEP, Package () { \_SB.GIO0, \_SB.SCM0 })
    Name(LIDB, 1) //LID Buffer value  0=closed, non-zero = open
    Method (_LID, 0, NotSerialized)
    {
        Return(LIDB)
    }
    Method(_PS0, 0x0, NotSerialized)
    {
        If(\_SB.GIO0.GABL)
        {
            Store (\_SB.GIO0.LIDR, \_SB.LID0.LIDB)
            Notify (\_SB.LID0, 0x80)
        }
    }

    Method(_PS3, 0x0, NotSerialized)
    {
        If(\_SB.GIO0.GABL)
        {
            Store (\_SB.GIO0.LIDR, \_SB.LID0.LIDB)
            Notify (\_SB.LID0, 0x80)
        }
    }
}