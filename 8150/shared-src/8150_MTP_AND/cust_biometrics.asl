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

    Device (QBT1)
    {
        Name (_HID, "QBT1000")

        Name (_DEP, Package()
        {
            \_SB_.TREE,
            \_SB_.SCM0
        })

        Method (_CRS, 0x0, NotSerialized)
        {
            Name (RBUF,
                ResourceTemplate ()
                {
                    // IPC GPIO
                    GpioInt(Edge, ActiveHigh, SharedAndWake, PullDown, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {118}

                    // Finger Detect GPIO
                    GpioInt(Edge, ActiveBoth, Exclusive, PullUp, 0, "\\_SB.PM01", 0 , ResourceConsumer, , ) {128}
                }
            )
            Return(RBUF)
        }
    }

    Device (FPC1)
    {
        Name (_HID, "FPC1020")

        Name (_DEP, Package()
        {
            \_SB_.TREE,
            \_SB_.SCM0
        })

        Method (_CRS, 0x0, NotSerialized)
        {
            Name (RBUF,
                ResourceTemplate ()
                {
                    // IPC IRQ
                    GpioInt(Edge, ActiveHigh, SharedAndWake, PullDown, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {118}

                    // Reset GPIO
                    GpioIo(Exclusive, PullDown, 0, 0, , "\\_SB.GIO0", ,) {95}
                }
            )
            Return(RBUF)
        }

        // PEP Proxy Support
        Name(PGID, Buffer(10) {"\\_SB.FPC1"})       // Device ID buffer - PGID (Pep given ID)

        Name (FLAG, 0x03)

        Name(DBUF, Buffer(DBFL) {})                 // Device ID buffer - PGID (Pep given ID)
        CreateByteField(DBUF, 0x0, STAT)            // STATUS 1 BYTE
                                                    // HIDDEN 1 BYTE (SIZE)
        CreateByteField(DBUF, 2, DVAL)              // Packet value, 1 BYTES Device Status
        CreateField(DBUF, 24, 160, DEID)            // Device ID, 20 BYTES (160 Bits)

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

                // TLMM GPIO_95 FPC_RESET
                OperationRegion(GI95, SystemMemory, 0x0395F000, 0x20)
                Field(GI95, DWordAcc, NoLock, Preserve)
                {
                    DWD1,   32,
                    DWD2,   32
                }

                // Pull Up
                DWD2 = 0x02

                // Wait 5ms
                Sleep (5)
            }

            Store(Buffer(ESNL){}, DEID)
            Store(0, DVAL)
            Store(PGID, DEID)
            If(\_SB.ABD.AVBL)
            {
                Store(DBUF, \_SB.PEP0.FLD0)
            }
            Store(0, FLAG)
        }

        Method(_PS2, 0x0, NotSerialized) {}

        Method(_PS3, 0x0, NotSerialized)
        {
            Store(Buffer(ESNL){}, DEID)
            Store(3, DVAL)
            Store(PGID, DEID)
            If(\_SB.ABD.AVBL)
            {
                Store(DBUF, \_SB.PEP0.FLD0)
            }
            Store(3, FLAG)
        }

        Method(_RST, 0x0, NotSerialized)
        {
            // TLMM GPIO_95 FPC_RESET
            OperationRegion (GI95, SystemMemory, 0x0395F000, 0x20)
            Field (GI95, DWordAcc, NoLock, Preserve)
            {
                DWD1,   32,
                DWD2,   32
            }

            // Pull Up
            DWD2 = 0x02

            // Wait 1ms
            Sleep (1)

            // Pull Down
            DWD2 = Zero

            // Wait 5ms
            Sleep (5)

            // Pull Up
            DWD2 = 0x02

            // Wait 5ms
            Sleep (5)
        }
    }