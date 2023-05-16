//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_biometrics.asl
//
// Abstract:
//
//     Contains device definitions for the Qualcomm button device
//     and Fingerprints AB FPC1020 Fingerprint Scanner over
//     Qualcomm Secure Element Extension Communication bus
//     (QSEECOM)
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
// Biometric Sensor Device - SPI
//
Device (FPS1)
{
    Name (_HID, "MSHW0133")
    Name (_UID, 0)
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF,
            ResourceTemplate ()
            {
                // IPC IRQ
                GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0, ResourceConsumer, , ){118}
                // Reset GPIO
                GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , ){95}
            }
        )
        Return(RBUF)
    }
}