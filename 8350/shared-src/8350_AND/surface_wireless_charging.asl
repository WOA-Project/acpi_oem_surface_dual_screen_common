//
// Copyright (c) 2021-2024 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_wireless_charging.asl
//
// Abstract:
//
//     Contains device definitions for the Surface Pen Wireless Charger.
//
// Environment:
//
//     Advanced Configuration and Power Interface (ACPI)
//
// Revision History:
//
//     2024-04-27 - @gus33000 - Initial revision
//
// License:
//
//     SPDX-License-Identifier: MIT
//

//
// Surface NFC Wireless Charging
//
Device (WLCN)
{
    Name (_UID, 0)
    Name (_HID, "MSHW0163")

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF, ResourceTemplate ()
        {
            /*I2CSerialBus(0x28, ControllerInitiated, 400000, AddressingMode7Bit, "\\_SB.I2C6", 0, ResourceConsumer, , )
            GpioInt(Edge, ActiveHigh, Exclusive, PullDown, 0, "\\_SB.GIO0", 0, ResourceConsumer, , ){28}*/
            GpioIo(Exclusive, PullNone, 0, 0, IoRestrictionOutputOnly, "\\_SB.GIO0", 0, ResourceConsumer, , ){39}
        })
        Return (RBUF)
    }

    // PEP Proxy Support
    Name(PGID, Buffer(10) {"\\_SB.WLCN"})       // Device ID buffer - PGID (Pep given ID)

    Name(DBUF, Buffer(DBFL) {})                 // Device ID buffer - PGID (Pep given ID)
    CreateByteField(DBUF, 0x0, STAT)            // STATUS 1 BYTE
                                                // HIDDEN 1 BYTE (SIZE)
    CreateByteField(DBUF, 2, DVAL)              // Packet value, 1 BYTES Device Status
    CreateField(DBUF, 24, 160, DEID)            // Device ID, 20 BYTES (160 Bits)

    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3

    Method (_PS0, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(0, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }

    Method (_PS3, 0x0, NotSerialized)
    {
        Store(Buffer(ESNL){}, DEID)
        Store(3, DVAL)
        Store(PGID, DEID)
        If(\_SB.ABD.AVBL)
        {
            Store(DBUF, \_SB.PEP0.FLD0)
        }
    }
}