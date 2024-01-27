//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_fuel_gauges_thermal_zones.asl
//
// Abstract:
//
//     Contains device definitions for additional Thermal
//     Zones, required by the Andromeda Fueling Hardware.
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
// Temperature Sensor Interface for Fuel Gauge (R2)
//
Scope (\_SB.IC18)
{
    Name (FGTS, ResourceTemplate ()
    {
        I2CSerialBus(0x55, ControllerInitiated, 400000, AddressingMode7Bit, "\\_SB.IC18", 0, ResourceConsumer, , )
    })

    OperationRegion (ORFG, GenericSerialBus, 0, 0x0100)

    Field (ORFG, BufferAcc, NoLock, Preserve)
    {
        Connection (FGTS),
        AccessAs (BufferAcc, AttribWord),
        Offset (0x28),
        TMP1,   8
    }

    Field (ORFG, BufferAcc, NoLock, Preserve)
    {
        Connection (FGTS),
        AccessAs (BufferAcc, AttribWord),
        Offset (0x06),
        TMP2,   8
    }

    Name (AVBL, Zero)

    Method (_REG, 2, NotSerialized)
    {
        If ((Arg0 == 0x09))
        {
            ^AVBL = Arg1
        }
    }
}

//
// Temperature Sensor Interface for Fuel Gauge (C3)
//
Scope (\_SB.I2C2)
{
    Name (FGTS, ResourceTemplate ()
    {
        I2CSerialBus(0x55, ControllerInitiated, 400000, AddressingMode7Bit, "\\_SB.I2C2", 0, ResourceConsumer, , )
    })

    OperationRegion (ORFG, GenericSerialBus, 0, 0x0100)

    Field (ORFG, BufferAcc, NoLock, Preserve)
    {
        Connection (FGTS),
        AccessAs (BufferAcc, AttribWord),
        Offset (0x28),
        TMP1,   8
    }

    Name (AVBL, Zero)

    Field (ORFG, BufferAcc, NoLock, Preserve)
    {
        Connection (FGTS),
        AccessAs (BufferAcc, AttribWord),
        Offset (0x06),
        TMP2,   8
    }
}

Scope (\_SB)
{
    //
    // Thermal Zone for Fuel Gauge (R2) Internal
    //
    ThermalZone (FG1I)
    {
        Name (_DEP, Package ()
        {
            \_SB.IC18
        })

        Name (BFTS, Buffer (0x04)
        {
             0xFF
        })

        CreateByteField (BFTS, 0, STA1)
        CreateByteField (BFTS, 1, LEN1)
        CreateWordField (BFTS, 2, DATA)

        Method (_TMP, 0, Serialized)
        {
            If ((\_SB.IC18.AVBL == One))
            {
                BFTS = \_SB.IC18.TMP1
                Return (DATA)
            }

            Return (0x0AAC)
        }
    }

    //
    // Thermal Zone for Fuel Gauge (R2) External
    //
    ThermalZone (FG1E)
    {
        Name (_DEP, Package ()
        {
            \_SB.IC18
        })

        Name (BFTS, Buffer (0x04)
        {
             0xFF
        })

        CreateByteField (BFTS, Zero, STA1)
        CreateByteField (BFTS, One, LEN1)
        CreateWordField (BFTS, 0x02, DATA)

        Method (_TMP, 0, Serialized)
        {
            If ((\_SB.IC18.AVBL == One))
            {
                BFTS = \_SB.IC18.TMP2
                Return (DATA)
            }

            Return (2732)
        }
    }

    //
    // Thermal Zone for Fuel Gauge (C3) Internal
    //
    ThermalZone (FG2I)
    {
        Name (_DEP, Package ()
        {
            \_SB.I2C2
        })

        Name (BFTS, Buffer (0x04)
        {
             0xFF
        })

        CreateByteField (BFTS, 0, STA1)
        CreateByteField (BFTS, 1, LEN1)
        CreateWordField (BFTS, 2, DATA)

        Method (_TMP, 0, Serialized)
        {
            If ((\_SB.I2C2.AVBL == One))
            {
                BFTS = \_SB.I2C2.TMP1
                Return (DATA)
            }

            Return (2732)
        }
    }

    //
    // Thermal Zone for Fuel Gauge (C3) External
    //
    ThermalZone (FG2E)
    {
        Name (_DEP, Package ()
        {
            \_SB.I2C2
        })

        Name (BFTS, Buffer (0x04)
        {
             0xFF
        })

        CreateByteField (BFTS, 0, STA1)
        CreateByteField (BFTS, 1, LEN1)
        CreateWordField (BFTS, 2, DATA)

        Method (_TMP, 0, Serialized)
        {
            If ((\_SB.I2C2.AVBL == One))
            {
                BFTS = \_SB.I2C2.TMP2
                Return (DATA)
            }

            Return (2732)
        }
    }
}
