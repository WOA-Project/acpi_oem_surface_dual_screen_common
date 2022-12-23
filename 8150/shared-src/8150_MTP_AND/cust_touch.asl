//
// Copyright (c) 2021-2022 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     cust_touch.asl
//
// Abstract:
//
//     Contains device definitions for the Microsoft Surface
//     Digitizer (Codename "D5/G5") over SPI. This digitizer
//     implements version ~0.99 of the HID over SPI specification
//     and is flashed with specific firmware to work on Surface
//     Duo devices specifically. The digitizer exposes both a
//     fallback single touch hid descriptor on both sides akin
//     to old Intel Precise Touch and Pen hardware, as well
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

Scope (\_SB)
{
    Device (GTCH)
    {
        Name(_HID, "MSHW0235")  // _HID: Hardware ID
        Name(_CID, "PNP0C51")
        Name(_S0W, 0x02)
        Name(_HRV, 0x1)

        Name(_DEP, Package()
        {
            \_SB.GIO0,
            \_SB.SPI8
        })

        Method (_CRS, 0x0, NotSerialized)
        {
            Name (RBUF, ResourceTemplate ()
            {
                // SPI
                SPISerialBus(
                    0,                // DeviceSelection: chip-select, GPIO, or other line selection
                    ,                 // DeviceSelectionPolarity: defaults to PolarityLow (optional)
                    ,                 // WireMode: defaults to FourWireMode (optional)
                    8,                // DataBitLength
                    ,                 // SlaveMode: defaults to ControllerInitiated (optional)
                    25000000,         // ConnectionSpeed: in Hz
                    ClockPolarityLow, // ClockPolarity
                    ClockPhaseFirst,  // ClockPhase
                    "\\_SB.SPI8",     // ResourceSource: SPI bus controller name
                    ,                 // ResourceSourceIndex: defaults to 0 (optional)
                    ,                 // ResourceUsage: defaults to ResourceConsumer (optional)
                    ,                 // DescriptorName: creates name for offset of resource descriptor
                    )                 // VendorData

                // TOUCH_ASSERT
                GpioInt(Edge, ActiveHigh, ExclusiveAndWake, PullDown, 0, "\\_SB.GIO0", 0 , ResourceConsumer, , ) {3}

                // TOUCH_SLEEP
                GpioIo(Exclusive, PullDown, 0, 0, , "\\_SB.GIO0", ,) {1}
            })

            Return (RBUF)
        }

        // _DSM - Device-Specific Method
        //
        // Arg0: UUID Unique function identifier
        // Arg1: Integer Revision ID – Will be 3 for HidSpi V1
        // Arg2: Integer Function Index (0 = Return Supported Functions)
        // Arg3: Package Parameters
        //
        Function(_DSM,{BuffObj, IntObj},{BuffObj, IntObj, IntObj, PkgObj}){
            // HIDSPI UUID
            If(LEqual(Arg0,ToUUID("6E2AC436-0FCF-41AF-A265-B32A220DCFAB"))) {
                // Switch on the revision level
                switch(ToInteger(Arg1)) {
                    case (1) {
                        //
                        // Switch on the function index
                        //
                        switch(ToInteger(Arg2)) {
                            case(0) {
                                // HidSpi v0 : Functions 0-1 inclusive are supported (0b00000011)
                                Return(Buffer(One) { 0x03 })
                            }
                            case(1) {
                                Return (0x1)
                            }
                        }
                    }
                }
            }
            
            // Unsupported revision
            Return(Buffer(One) { 0x00 })
        }

        // PEP Proxy Support
        Name(PGID, Buffer(10) {"\\_SB.GTCH"})       // Device ID buffer - PGID (Pep given ID)

        Name (FLAG, 0x03)

        Name(DBUF, Buffer(DBFL) {})                 // Device ID buffer - PGID (Pep given ID)
        CreateByteField(DBUF, 0x0, STAT)            // STATUS 1 BYTE
                                                    // HIDDEN 1 BYTE (SIZE)
        CreateByteField(DBUF, 2, DVAL)              // Packet value, 1 BYTES Device Status
        CreateField(DBUF, 24, 160, DEID)            // Device ID, 20 BYTES (160 Bits)

        Method (_S1D, 0) { Return (3) }             // S1 => D3
        Method (_S2D, 0) { Return (3) }             // S2 => D3
        Method (_S3D, 0) { Return (3) }             // S3 => D3

        Method(_PS0, 0x0, NotSerialized)
        {
            // Are we in sleep state?
            If ((FLAG == 0x03))
            {
                // Wait 300ms
                Sleep(300)

                // TLMM GPIO_0 TOUCH_RESET
                OperationRegion(GI00, SystemMemory, 0x03D00000, 0x20)
                Field(GI00, DWordAcc, NoLock, Preserve)
                {
                    DWD1,   32,
                    DWD2,   32
                }

                // Pull Up
                DWD2 = 0x02

                // Wait 150ms
                Sleep(150)
            }

            Store(Buffer(ESNL){}, DEID)
            Store(0, DVAL)
            Store(PGID, DEID)
            If(\_SB.ABD.AVBL)
            {
                Store(DBUF, \_SB.PEP0.FLD0)
            }
            Store(0, FLAG)
        }

        Method(_PS2, 0x0, NotSerialized) {}

        Method(_PS3, 0x0, NotSerialized)
        {
            Store(Buffer(ESNL){}, DEID)
            Store(3, DVAL)
            Store(PGID, DEID)
            If(\_SB.ABD.AVBL)
            {
                Store(DBUF, \_SB.PEP0.FLD0)
            }
            Store(3, FLAG)
        }

        Method(_RST, 0x0, NotSerialized)
        {
            // TLMM GPIO_0 TOUCH_RESET
            OperationRegion (GI00, SystemMemory, 0x03D00000, 0x20)
            Field (GI00, DWordAcc, NoLock, Preserve)
            {
                DWD1,   32,
                DWD2,   32
            }

            // Pull Down
            DWD2 = Zero

            // Wait 300ms
            Sleep (300)

            // Pull Up
            DWD2 = 0x02
        }

        Device (TCOM)
        {
            Method(_ADR)
            {
                // 1 is always the address assigned for the Surface Touch Communications
                //
                Return(1)
            }
        }

        Device (PEN1)
        {
            Method(_ADR)
            {
                // 2 is always the address assigned for the Surface Touch Pen Processor (Right)
                //
                Return(2)
            }
        }

        Device (PEN2)
        {
            Method(_ADR)
            {
                // 3 is always the address assigned for the Surface Touch Pen Processor (Left)
                //
                Return(3)
            }
        }

        Device (DTUT)
        {
            Method(_ADR)
            {
                // 4 is always the address assigned for the Surface Digitizer Utility
                //
                Return(4)
            }
        }

        Device (PBLE)
        {
            Method(_ADR)
            {
                // 5 is always the address assigned for the Surface Pen BLE LC Adaptation Driver
                //
                Return(5)
            }
        }

        Device (PCFU)
        {
            Method(_ADR)
            {
                // 6 is always the address assigned for the Surface Pen Cfu Over Ble LC Connection
                //
                Return(6)
            }
        }

        Device (TCH1)
        {
            Method(_ADR)
            {
                // 7 is always the address assigned for the Surface Touch Screen Device (Right)
                //
                Return(7)
            }
        }

        Device (TCH2)
        {
            Method(_ADR)
            {
                // 8 is always the address assigned for the Surface Touch Screen Device (Left)
                //
                Return(8)
            }
        }
    }
}
