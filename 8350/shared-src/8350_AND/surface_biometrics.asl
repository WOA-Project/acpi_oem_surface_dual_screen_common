//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_biometrics.asl
//
// Abstract:
//
//     Contains device definitions for the Fingerprints
//     AB FPC1020 Fingerprint Scanner over Qualcomm Secure
//     Element Extension Communication bus (QSEECOM)
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
                GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0, ResourceConsumer, , ){27}
                // Reset GPIO
                GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionNone, "\\_SB.GIO0", 0, ResourceConsumer, , ){9}
            }
        )
        Return(RBUF)
    }

    Name (FLAG, 0x03)

    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3

    Method(_PS0, 0x0, NotSerialized)
    {
        // Are we in sleep state?
        If ((FLAG == 0x03))
        {
            // Wait 300ms
            Sleep(300)

            // TLMM GPIO_9 FPC_RESET
            OperationRegion(GI09, SystemMemory, 0x0F109000, 0x20)
            Field(GI09, DWordAcc, NoLock, Preserve)
            {
                DWD1,   32,
                DWD2,   32
            }

            // Pull Down
            DWD2 = 0x01

            // Wait 1ms
            Sleep (1)

            // Pull Up
            DWD2 = 0x02
        }

        Store(0, FLAG)
    }

    Method(_PS2, 0x0, NotSerialized) {}

    Method(_PS3, 0x0, NotSerialized)
    {
        Store(3, FLAG)
    }

    Method(_RST, 0x0, NotSerialized)
    {
        // TLMM GPIO_9 FPC_RESET
        OperationRegion (GI09, SystemMemory, 0x0F109000, 0x20)
        Field (GI09, DWordAcc, NoLock, Preserve)
        {
            DWD1,   32,
            DWD2,   32
        }

        // Pull Up
        DWD2 = 0x02

        // Wait 1ms
        Sleep (1)

        // Pull Down
        DWD2 = 0x01

        // Wait 5ms
        Sleep (5)

        // Pull Up
        DWD2 = 0x02

        // Wait 5ms
        Sleep (5)
    }
}