//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_power_monitors.asl
//
// Abstract:
//
//     Contains device definitions for the Analog Devices
//     Four-Channel Power Accumulator MAX34417 Device built for
//     Microsoft Surface. This device is only present on
//     Engineering Validation Boards and should not be exposed
//     to the user on later board revisions.
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

//
// Power Meter Max34417
//
Device (PA00)
{
    Name (_HID, "MAX34417")
    Name (_CID, "MAX34417")
    Name (_UID, 0)
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF,
            ResourceTemplate ()
            {
                // I2C
                I2CSerialBus(
                    0x0010,
                    ControllerInitiated,
                    400000,
                    AddressingMode7Bit,
                    "\\_SB.I2C6",
                    ,
                    ,
                    ,
                    )
            }
        )
        Return(RBUF)
    }

    Method (_STA)
    {
        If (BDID >= 0x07)
        {
            Return (0x0)
        }
        Else
        {
            Return (0xf)
        }
    }

    // _DSM - Device-Specific Method
    //
    // Arg0: UUID Unique function identifier
    // Arg1: Integer Revision ID
    // Arg2: Integer Function Index (0 = Return Supported Functions)
    // Arg3: Package Parameters
    //
    Function(_DSM,{BuffObj, IntObj},{BuffObj, IntObj, IntObj, PkgObj}){
        If(LEqual(Arg0,ToUUID("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7"))) {
            //
            // Switch on the function index
            //
            switch(ToInteger(Arg2)) {
                case(0) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Return(Buffer(One) { 0x07 })
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(1) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(PBUF, Package() {
                                "VPH_PWR",
                                0x0A,
                                "VBUS",
                                0x0A,
                                "N/A",
                                0x64,
                                "SOC_APC0",
                                0x0A
                            })
                            Return(PBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(2) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(CBUF, Package() {
                                0x04
                            })
                            Return(CBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                default {
                    // Unsupported function index
                    return (Buffer() {0})
                }
            }
        }
        else {
            //
            // No functions are supported for this UUID.
            //
            return (Buffer() {0})
        }
    }
    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3
}

//
// Power Meter Max34417
//
Device (PA01)
{
    Name (_HID, "MAX34417")
    Name (_CID, "MAX34417")
    Name (_UID, 1)
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF,
            ResourceTemplate ()
            {
                // I2C
                I2CSerialBus(
                    0x0012,
                    ControllerInitiated,
                    400000,
                    AddressingMode7Bit,
                    "\\_SB.I2C6",
                    ,
                    ,
                    ,
                    )
            }
        )
        Return(RBUF)
    }

    Method (_STA)
    {
        If (BDID >= 0x07)
        {
            Return (0x0)
        }
        Else
        {
            Return (0xf)
        }
    }

    // _DSM - Device-Specific Method
    //
    // Arg0: UUID Unique function identifier
    // Arg1: Integer Revision ID
    // Arg2: Integer Function Index (0 = Return Supported Functions)
    // Arg3: Package Parameters
    //
    Function(_DSM,{BuffObj, IntObj},{BuffObj, IntObj, IntObj, PkgObj}){
        If(LEqual(Arg0,ToUUID("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7"))) {
            //
            // Switch on the function index
            //
            switch(ToInteger(Arg2)) {
                case(0) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Return(Buffer(One) { 0x07 })
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(1) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(PBUF, Package() {
                                "SOC_Graphics",
                                0x0A,
                                "DDR_HV",
                                0x0A,
                                "SOC_MM",
                                0x0A,
                                "SOC_MX",
                                0x0A
                            })
                            Return(PBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(2) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(CBUF, Package() {
                                0x04
                            })
                            Return(CBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                default {
                    // Unsupported function index
                    return (Buffer() {0})
                }
            }
        }
        else {
            //
            // No functions are supported for this UUID.
            //
            return (Buffer() {0})
        }
    }
    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3
}

//
// Power Meter Max34417
//
Device (PA03)
{
    Name (_HID, "MAX34417")
    Name (_CID, "MAX34417")
    Name (_UID, 3)
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF,
            ResourceTemplate ()
            {
                // I2C
                I2CSerialBus(
                    0x0016,
                    ControllerInitiated,
                    400000,
                    AddressingMode7Bit,
                    "\\_SB.I2C6",
                    ,
                    ,
                    ,
                    )
            }
        )
        Return(RBUF)
    }

    Method (_STA)
    {
        If (BDID >= 0x07)
        {
            Return (0x0)
        }
        Else
        {
            Return (0xf)
        }
    }

    // _DSM - Device-Specific Method
    //
    // Arg0: UUID Unique function identifier
    // Arg1: Integer Revision ID
    // Arg2: Integer Function Index (0 = Return Supported Functions)
    // Arg3: Package Parameters
    //
    Function(_DSM,{BuffObj, IntObj},{BuffObj, IntObj, IntObj, PkgObj}){
        If(LEqual(Arg0,ToUUID("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7"))) {
            //
            // Switch on the function index
            //
            switch(ToInteger(Arg2)) {
                case(0) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Return(Buffer(One) { 0x07 })
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(1) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(PBUF, Package() {
                                "DDR_LV",
                                0x64,
                                "DDR_VDD1",
                                0x64,
                                "SOC_CX",
                                0x0A,
                                "SOC_APC1",
                                0x0A
                            })
                            Return(PBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(2) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(CBUF, Package() {
                                0x04
                            })
                            Return(CBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                default {
                    // Unsupported function index
                    return (Buffer() {0})
                }
            }
        }
        else {
            //
            // No functions are supported for this UUID.
            //
            return (Buffer() {0})
        }
    }
    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3
}

//
// Power Meter Max34417
//
Device (PA05)
{
    Name (_HID, "MAX34417")
    Name (_CID, "MAX34417")
    Name (_UID, 5)
    Method (_CRS, 0x0, NotSerialized)
    {
        Name (RBUF,
            ResourceTemplate ()
            {
                // I2C
                I2CSerialBus(
                    0x001A,
                    ControllerInitiated,
                    400000,
                    AddressingMode7Bit,
                    "\\_SB.I2C6",
                    ,
                    ,
                    ,
                    )
            }
        )
        Return(RBUF)
    }

    Method (_STA)
    {
        If (BDID >= 0x07)
        {
            Return (0x0)
        }
        Else
        {
            Return (0xf)
        }
    }

    // _DSM - Device-Specific Method
    //
    // Arg0: UUID Unique function identifier
    // Arg1: Integer Revision ID
    // Arg2: Integer Function Index (0 = Return Supported Functions)
    // Arg3: Package Parameters
    //
    Function(_DSM,{BuffObj, IntObj},{BuffObj, IntObj, IntObj, PkgObj}){
        If(LEqual(Arg0,ToUUID("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7"))) {
            //
            // Switch on the function index
            //
            switch(ToInteger(Arg2)) {
                case(0) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Return(Buffer(One) { 0x07 })
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(1) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(PBUF, Package() {
                                "DISPLAY",
                                0x19,
                                "Touch_Sens1P8",
                                0x0A,
                                "Touch_Sens5V",
                                0x0A,
                                "C3Spkr_R2RcvrAmp",
                                0x0A
                            })
                            Return(PBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                case(2) {
                    switch(ToInteger(Arg1)) {
                        case (0) {
                            Name(CBUF, Package() {
                                0x04
                            })
                            Return(CBUF)
                        }
                        default {
                            Return(Buffer(One) { 0x00 })
                        }
                    }
                }
                default {
                    // Unsupported function index
                    return (Buffer() {0})
                }
            }
        }
        else {
            //
            // No functions are supported for this UUID.
            //
            return (Buffer() {0})
        }
    }
    Method (_S1D, 0) { Return (3) }             // S1 => D3
    Method (_S2D, 0) { Return (3) }             // S2 => D3
    Method (_S3D, 0) { Return (3) }             // S3 => D3
}