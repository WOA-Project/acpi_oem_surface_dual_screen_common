//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_thermal_proxy.asl
//
// Abstract:
//
//     Contains device definitions for the Thermal Proxy SW Components.
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
// Microsoft Thermal Proxy
//
Device (TPXY)
{
    Name (_HID, "MSFTTPXY")
    Alias (\_SB.PSUB, _SUB)
    Name (_UID, 0)
    Name (_DEP, Package ()
    {
        \_SB.SEN2,
        \_SB.SEN3,
        \_SB.PMBM
    })

    Device(\_SB.TPXY.ANG0)
    {
        Name(_ADR, 0)
    }

    Device(\_SB.TPXY.RSC0)
    {
        Name(_ADR, 1)
    }

    Device(\_SB.TPXY.VTS0)
    {
        Name(_ADR, 2)
    }

    Name (_CRS, ResourceTemplate ()
    {
        // GPIO Pin is 121 and Virtual GPIO pin is 320.
        GpioInt(Edge, ActiveBoth, Shared, PullUp, 500, "\\_SB.GIO0", 0, ResourceConsumer, , ){320} // Main Hall Sensor IRQ
        GpioIo(Shared, PullUp, 500, 0, IoRestrictionInputOnly, "\\_SB.GIO0", 0, ResourceConsumer, , ){121} // Main Hall Sensor IO
        GpioIo(Shared, PullUp, 500, 0, IoRestrictionInputOnly, "\\_SB.GIO0", 0, ResourceConsumer, , ){81} // Secondary Hall Sensor IO
    })

    // _DSM - Device-Specific Method
    //
    // Arg0: UUID Unique function identifier
    // Arg1: Integer Revision ID – Will be 0
    // Arg2: Integer Function Index (0 = Return Supported Functions)
    // Arg3: Package Parameters
    //
    Function(_DSM,{BuffObj, IntObj},{BuffObj, IntObj, IntObj, PkgObj}){
        // Thermal Proxy interface identifier
        If ((Arg0 == ToUUID("60e802c9-29f4-479a-bd42-fa5cacc0a385"))) {
            // Function selector
            If (Arg2 == 0) {
                // Switch on the revision level
                If ((Arg1 == 0)) {
                    // Thermal Proxy v0 : Functions 0-4 inclusive are supported (0b00011111)
                    Return(Buffer() { 0x1F })
                }
            }
            If (Arg2 == 1) { // Sensor info
                // Switch on the revision level
                If (Arg1 == 0) {
                    Name(PBUF, Package(0x2D) {
                        "TXY0",
                        0,
                        0,

                        "BAT0",
                        1,
                        1,

                        "VTS0",
                        2,
                        2,
                    })
                    Return(PBUF)
                }
            }
            If (Arg2 == 2) { // Sensor count
                // Switch on the revision level
                If ((Arg1 == 0)) {
                    Name(CBUF, Package(0x01) { 0x03 })
                    Return(CBUF)
                }
            }
            If (Arg2 == 3) { // Vtemp Coefficients
                // Switch on the revision level
                If (Arg1 == 0) {
                    Name(VBUF, Package() {
                        3063,
                        31,
                        30,
                        42,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        0,
                        3,
                        3,
                        3,
                    })
                    Return(VBUF)
                }
            }
            If (Arg2 == 4) { // RsocCoefficients
                // Switch on the revision level
                If (Arg1 == 0) {
                    Name(RBUF, Package() {
                        50,
                        1,
                        25,
                        10
                    })
                    Return(RBUF)
                }
            } // Function

            // Unsupported function index
            Return (Buffer(){0x00});
        } // {60e802c9-29f4-479a-bd42-fa5cacc0a385}
        Else {
            Return (Buffer(){0x00});
        } // UUID
    } // _DSM
}