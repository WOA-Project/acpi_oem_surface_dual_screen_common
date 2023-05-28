//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_touch_resources.asl
//
// Abstract:
//
//     Contains specific voltage and pin resources for the
//     Microsoft Surface Digitizer (Codename "D6/G6") over SPI.
//     This digitizer implements version ~0.99 of the HID over SPI
//     specification and is flashed with specific firmware to work
//     on Surface Duo devices specifically. The digitizer exposes
//     both a fallback single touch hid descriptor on both sides
//     akin to old Intel Precise Touch and Pen hardware, as well
//     as a custom HEAT map hid descriptor requiring the use of a
//     custom Touch and Pen Processor loaded via HeatCore/ISM.
//     This digitizer predating the specification completion
//     notably lacks advanced power management features enabling
//     tap to wake in Windows 11 and later versions.
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

Scope(\_SB_.PEP0)
{
    Method(LPMX)
    {
        Return(LPXC)
    }

    Name(LPXC,
    Package ()
    {
        Package()
        {
            "DEVICE", "\\_SB.TSPI",

            Package()
            {
                "COMPONENT", 0,

                Package() {"FSTATE",  0},
            },

            Package()
            {
                "DSTATE", 0,

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO3_C",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        3008000,                       // Voltage is in micro volts
                        1,                             // force enable from software
                        4,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },

                Package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    Package()
                    {
                        23,                             // Pin Number: GPIO_23
                        1,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        0,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },

                Package(){"DELAY", Package(){1000}},

                Package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    Package()
                    {
                        8,                              // Pin Number: GPIO_8
                        1,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        0,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },
            },

            Package()
            {
                "DSTATE", 1
            },

            Package()
            {
                "DSTATE", 2
            },

            Package()
            {
                "DSTATE", 3,

                Package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    Package()
                    {
                        8,                              // Pin Number: GPIO_8
                        0,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        0,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },

                Package(){"DELAY", Package(){10}},

                Package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    Package()
                    {
                        23,                             // Pin Number: GPIO_23
                        0,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        0,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO3_C",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                }
            }
        }
    })
}
