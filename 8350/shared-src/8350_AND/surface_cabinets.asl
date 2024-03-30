//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_cabinets.asl
//
// Abstract:
//
//     Contains Device Cabinet Definitions to inform the OS
//     about the specific Device Topology and enable specific
//     signature experiences for Dual Screen Hinged devices.
//
// Environment:
//
//     Advanced Configuration and Power Interface (ACPI)
//
// Revision History:
//
//     2022-12-23 - @gus33000 - Initial revision
//     2023-04-13 - @gus33000 - Updated PLD structures for various devices
//
// License:
//
//     SPDX-License-Identifier: MIT
//

Name(_PLD,
    Package(0x0C) {
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 0,
                    PLD_Green              = 0,
                    PLD_Blue               = 0,
                    PLD_Width              = 900,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 0,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x00, 0x00, 0x00, 0x84, 0x03, 0xF0, 0x05,
                0x21, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 0,
                    PLD_Green              = 0,
                    PLD_Blue               = 0,
                    PLD_Width              = 900,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "BACK",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 0,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x00, 0x00, 0x00, 0x84, 0x03, 0xF0, 0x05,
                0x29, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 40,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "LEFT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 0,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x28, 0x00, 0xF0, 0x05,
                0x11, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 40,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "RIGHT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 0,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x28, 0x00, 0xF0, 0x05,
                0x19, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 900,
                    PLD_Height             = 40,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "TOP",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 0,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x84, 0x03, 0x28, 0x00,
                0x01, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 900,
                    PLD_Height             = 40,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "BOTTOM",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 0,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x84, 0x03, 0x28, 0x00,
                0x09, 0x0C, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x03) {
            // ACPI_PLD_BUFFER
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 0,
                    PLD_Green              = 0,
                    PLD_Blue               = 0,
                    PLD_Width              = 900,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 1,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x00, 0x00, 0x00, 0x84, 0x03, 0xF0, 0x05,
                0x21, 0x0C, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            },
            // ACPI_PLD_JOINT_BUFFER_GUID
            Buffer(0x10) {
                0x40, 0xFC, 0x1C, 0xF0, 0x75, 0x3C, 0x23, 0x45,
                0x9E, 0x44, 0x21, 0x5C, 0xB1, 0x54, 0xBD, 0xA6
            },
            // ACPI_PLD_JOINT_BUFFER
            Buffer(0x10) {
                /*
                ToJNT (
                    JNT_Revision              = 1,
                    JNT_JointType             = "HINGE",
                    JNT_SourceEdge            = "LEFT",
                    JNT_TargetCabinetNumber   = 0,
                    JNT_TargetPanel           = "FRONT",
                    JNT_TargetEdge            = "RIGHT",
                    JNT_MovementOrientation   = "HORIZONTAL",
                    JNT_ForwardMovementRange  = 180,
                    JNT_BackwardMovementRange = 180,
                    JNT_HorizontalOffset      = 0,
                    JNT_VerticalOffset        = 0,
                    JNT_GapOffset             = 0,
                    JNT_Rotation              = "0 DEG")
                */
                0x41, 0x04, 0xC0, 0x01, 0xB4, 0x00, 0xB4, 0x00,
                0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 0,
                    PLD_Green              = 0,
                    PLD_Blue               = 0,
                    PLD_Width              = 900,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "BACK",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 1,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x00, 0x00, 0x00, 0x84, 0x03, 0xF0, 0x05,
                0x29, 0x0C, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 40,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "LEFT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 1,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x28, 0x00, 0xF0, 0x05,
                0x11, 0x0C, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 40,
                    PLD_Height             = 1520,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "RIGHT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 1,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x28, 0x00, 0xF0, 0x05,
                0x19, 0x0C, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 900,
                    PLD_Height             = 40,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "TOP",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 1,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x84, 0x03, 0x28, 0x00,
                0x01, 0x0C, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        },
        Package(0x1) {
            Buffer(0x14) {
                /*
                ToPLD (
                    PLD_Revision           = 2,
                    PLD_IgnoreColor        = 0,
                    PLD_Red                = 92,
                    PLD_Green              = 92,
                    PLD_Blue               = 92,
                    PLD_Width              = 900,
                    PLD_Height             = 40,
                    PLD_UserVisible        = 1,
                    PLD_Dock               = 0,
                    PLD_Lid                = 0,
                    PLD_Panel              = "BOTTOM",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0,
                    PLD_GroupToken         = 0,
                    PLD_GroupPosition      = 0,
                    PLD_Bay                = 0,
                    PLD_Ejectable          = 0,
                    PLD_EjectRequired      = 0,
                    PLD_CabinetNumber      = 1,
                    PLD_CardCageNumber     = 0,
                    PLD_Reference          = 1,
                    PLD_Rotation           = 0,
                    PLD_Order              = 0,
                    PLD_VerticalOffset     = 0,
                    PLD_HorizontalOffset   = 0)
                */
                0x02, 0x5C, 0x5C, 0x5C, 0x84, 0x03, 0x28, 0x00,
                0x09, 0x0C, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,
                0x00, 0x00, 0x00, 0x00
            }
        }
    })
