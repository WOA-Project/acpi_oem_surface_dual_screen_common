//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_biometrics_resources.asl
//
// Abstract:
//
//     Contains specific voltage and pin resources for the
//     Fingerprints AB FPC1020 Fingerprint Scanner over
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

Scope(\_SB_.PEP0)
{
    Method(FPMX)
    {
        Return(FPXX)
    }

    Name(FPXX,
    Package ()
    {
        Package()
        {
            "DEVICE", "\\_SB.FPS1",

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
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS10_B",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        1,                                          // Software enable - Enable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                },

                Package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    Package()
                    {
                        9,                              // Pin Number: GPIO_9
                        1,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        3,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },

                Package(){"DELAY", Package(){1}},

                Package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    Package()
                    {
                        9,                              // Pin Number: GPIO_9
                        0,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        1,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },

                Package(){"DELAY", Package(){5}},

                Package()
                {
                    "TLMMGPIO",                         // Identifier: PMIC GPIO. Top Level Mode Mux (TLMM)
                    Package()
                    {
                        9,                              // Pin Number: GPIO_9
                        1,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        3,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },

                Package(){"DELAY", Package(){5}},
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
                        9,                              // Pin Number: GPIO_9
                        0,                              // State / OutVal: 0 == Low, 1 == High
                        0,                              // Function Select: 0 == Generic I/O Pin, non-zero == Alternate Function
                        1,                              // Direction: 0 == Input, 1 == Output
                        1,                              // Pull Type: 0 == No Pull, 1 == Pull Down, 2 == Keeper, 3 == Pull Up
                        0,                              // Strength: 0 == 2 mA, 1 == 4 mA, 2 == 6 mA, 3 == 8 mA, 4 == 10 mA, 5 == 12 mA, 4 == 14 mA, 7 == 16 mA
                    },
                },

                Package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS10_B",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        0,                                          // Software enable - Disable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                },
            }
        }
    })
}
