//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     oem_panel.asl
//
// Abstract:
//
//     Contains device definitions for the Surface OEM Panel
//     Device.
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

Device (DISP)
{
    Name(_HID, "MSHW0160")
    Name(_UID, 0x0)
    Name (_DEP, Package() { \_SB_.PEP0 })

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            /*// TLMM GPIO used to reset the DSI panel
            //
            GpioIo(Exclusive, PullNone, 0, 0, , "\\_SB.GIO0", ,) {5}

            // TLMM GPIO used to reset the DSI panel
            //
            GpioIo(Exclusive, PullNone, 0, 0, , "\\_SB.GIO0", ,) {6}*/
        })
        Return(RBUF)
    }
}
