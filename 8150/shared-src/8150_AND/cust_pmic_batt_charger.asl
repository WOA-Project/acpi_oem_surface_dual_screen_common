//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_pmic_batt_charger.asl
//
// Abstract:
//
//     Contains device definitions for the Microsoft Surface
//     Charging Hardware Arbiter found on Surface Duo 1
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

Device(SCHG)
{
    Name (_HID, "SMB1380")

    Name (_DEP, Package()
    {
        \_SB_.BAT1,
        \_SB_.BAT2
    })

    Method (_CRS, 0x0, NotSerialized) {
        Name (RBUF, ResourceTemplate () {
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {527} // CELL_PACK1_DISC
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {524} // CELL_PACK2_DISC
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {530} // BYPASS_SHDN_N
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {529} // RSHARE_CTRL
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {520} // VREF_CTRL_1
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {521} // VREF_CTRL_2
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {522} // VREF_CTRL_3
            GpioIo(Exclusive, PullDown, 0, 0, IoRestrictionInputOnly, "\\_SB.PM01", ,) {523} // VREF_CTRL_4
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

    Method (BCLQ)
    {
        Name (CFG0,
        Package()
        {
            "CELL_PACK1_DISC",
            "CELL_PACK2_DISC",
            "BYPASS_SHDN_N",
            "RSHARE_CTRL",
            "VREF_CTRL_1",
            "VREF_CTRL_2",
            "VREF_CTRL_3",
            "VREF_CTRL_4"
        })
        Return (CFG0)
    }
}