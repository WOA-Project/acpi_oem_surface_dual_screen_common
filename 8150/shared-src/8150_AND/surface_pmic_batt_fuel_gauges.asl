//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_pmic_batt_fuel_gauges.asl
//
// Abstract:
//
//     Contains device definitions for the Texas Instruments
//     BQ27742 Fuel Gauges over IC18 and I2C2 with
//     Microsoft own Manufacturer Data Block firmware
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

// Fuel Gauge (R2)
// Right Panel
// Battery 1: A3HTA022H
//            1ICP3/50/50
//            2.89Wh
//            3.83V
//            755mAh (Rated)
Device(BAT1)
{
    Name (_HID, "BQ27742")
    Name (_UID, 1)

    Name (_DEP, Package()
    {
        \_SB_.IC18
    })

    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
            I2CSerialBus(0x55,, 100000, AddressingMode7Bit, "\\_SB.IC18",,,,)
        })
        Return (RBUF)
    }

    Method (_STA)
    {
        if(LEqual(BATP, 0)) {
            Return (0)
        }
        else {
            Return (0x0F)
        }
    }
}

// Fuel Gauge (C3)
// Left Panel
// Battery 2: A3HTA024H
//            1ICP3/71/98
//            10.37Wh
//            3.83V
//            2707mAh (Rated)
Device(BAT2)
{
    Name (_HID, "BQ27742")
    Name (_UID, 2)

    Name (_DEP, Package()
    {
        \_SB_.I2C2
    })

    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
            I2CSerialBus(0x55,, 100000, AddressingMode7Bit, "\\_SB.I2C2",,,,)
        })
        Return (RBUF)
    }

    Method (_STA)
    {
        if(LEqual(BATP, 0)) {
            Return (0)
        }
        else {
            Return (0x0F)
        }
    }
}