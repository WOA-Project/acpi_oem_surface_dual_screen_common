//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_power_monitors_resources.asl
//
// Abstract:
//
//     Contains specific voltage and pin resources for the
//     Analog Devices Four-Channel Power Accumulator MAX34417
//     Device built for Microsoft Surface. This device is only
//     present on Engineering Validation Boards and should not
//     be exposed to the user on later board revisions.
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
    Method(PMMX)
    {
        Return(PMXX)
    }

    Name(PMXX,
    Package ()
    {
        Package()
        {
            "DEVICE", "\\_SB.PA01",

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
                        "PPP_RESOURCE_ID_LDO10_C",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        3000000,                       // Voltage is in micro volts
                        1,                             // force enable from software
                        4,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },

                /*Package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        1,                                          // Software enable - Enable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                }*/
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

                /*Package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        0,                                          // Software enable - Disable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                },*/

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                }
            }
        },

        Package()
        {
            "DEVICE", "\\_SB.PA05",

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
                        "PPP_RESOURCE_ID_LDO10_C",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        3000000,                       // Voltage is in micro volts
                        1,                             // force enable from software
                        4,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },

                /*Package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        1,                                          // Software enable - Enable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                }*/
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

                /*Package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        0,                                          // Software enable - Disable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                },*/

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        0,                             // Voltage is in micro volts
                        0,                             // force enable from software
                        0,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                }
            }
        },

        Package()
        {
            "DEVICE", "\\_SB.PA07",

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
                        "PPP_RESOURCE_ID_LDO10_C",     // VREG ID
                        1,                             // Voltage Regulator type = LDO
                        3000000,                       // Voltage is in micro volts
                        1,                             // force enable from software
                        4,                             // power mode - Low Power Mode
                        0,                             // head room voltage
                    },
                },

                /*Package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        1,                                          // Software enable - Enable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                }*/
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

                /*Package()
                {
                    "PMICVREGVOTE", // PMICVREGVOTE resource
                    Package()
                    {
                        "PPP_RESOURCE_ID_SMPS4_A",                  // Resource ID
                        2,                                          // Voltage Regulator type = SMPS
                        1800000,                                    // 1.8V
                        0,                                          // Software enable - Disable
                        0,                                          // Software power mode - AUTO
                        0,                                          // Head room voltage
                    },
                },*/

                Package()
                {
                    "PMICVREGVOTE",
                    Package()
                    {
                        "PPP_RESOURCE_ID_LDO10_C",     // VREG ID
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