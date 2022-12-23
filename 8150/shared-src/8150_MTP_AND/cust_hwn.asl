//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_hwn.asl
//
// Abstract:
//
//     Contains device definitions for the Dialog Semiconductors
//     DA7280 Vibration Motor Haptic Driver over I2C2
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


Name(HWNH, 1)

//
// HWN Haptics
//
Device (HWN1)
{
    Name (_HID, "DA7280")
    Name (_UID, 1)
    Alias(\_SB.PSUB, _SUB)

    Method (_STA)
    {
        if(LEqual(\_SB_.HWNH, 0)) {
            Return (0)
        }
        else {
            Return (0x0F)
        }
    }

    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF,
            ResourceTemplate ()
            {
                // I2C
                I2CSerialBus(
                    0x004A,
                    ControllerInitiated,
                    400000,
                    AddressingMode7Bit,
                    "\\_SB.I2C2",
                    ,
                    ,
                    ,
                    )

                // HAPTICS_ASSERT
                GpioInt(Edge, ActiveLow, ExclusiveAndWake, PullUp, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {42}
            }
        )
        Return(RBUF)
    }
}
