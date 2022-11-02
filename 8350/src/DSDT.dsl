DefinitionBlock ("", "DSDT", 2, "QCOMM ", "SDM8350 ", 0x00000003)
{
    External (_SB_.AMSS._STA, IntObj)
    External (_SB_.DMMY, UnknownObj)
    External (_SB_.DPP0, IntObj)
    External (_SB_.DPP1, IntObj)
    External (_SB_.MPP0, IntObj)
    External (_SB_.MPP1, IntObj)
    External (_SB_.TZ13.TPSV, UnknownObj)
    External (_SB_.TZ13.TTC1, UnknownObj)
    External (_SB_.TZ13.TTC2, UnknownObj)
    External (_SB_.TZ13.TTSP, UnknownObj)

    Scope (\_SB)
    {
        Name (PSUB, "MTP08350")
        Name (SOID, 0xFFFFFFFF)
        Name (STOR, 0xABCABCAB)
        Name (SIDS, "899800000000000")
        Name (SIDV, 0xFFFFFFFF)
        Name (SVMJ, 0xFFFF)
        Name (SVMI, 0xFFFF)
        Name (SDFE, 0xFFFF)
        Name (SFES, "899800000000000")
        Name (SIDM, 0x0000000FFFFFFFFF)
        Name (SUFS, 0xFFFFFFFF)
        Name (PUS3, 0xFFFFFFFF)
        Name (SUS3, 0xFFFFFFFF)
        Name (SIDT, 0xFFFFFFFF)
        Name (SOSN, 0xAAAAAAAABBBBBBBB)
        Name (PLST, 0xFFFFFFFF)
        Name (EMUL, 0xFFFFFFFF)
        Name (SJTG, 0xFFFFFFFF)
        Name (RMTB, 0xAAAAAAAA)
        Name (RMTX, 0xBBBBBBBB)
        Name (RFMB, 0xCCCCCCCC)
        Name (RFMS, 0xDDDDDDDD)
        Name (RFAB, 0xEEEEEEEE)
        Name (RFAS, 0x77777777)
        Name (TCMA, 0xDEADBEEF)
        Name (TCML, 0xBEEFDEAD)
        Name (SOSI, 0xDEADBEEFFFFFFFFF)
        Name (PRP0, 0xFFFFFFFF)
        Name (PRP1, 0xFFFFFFFF)
        Name (PRP2, 0xFFFFFFFF)
        Name (PRP3, 0xFFFFFFFF)
        Name (PRP4, 0xFFFFFFFF)
        Name (PRP5, 0xFFFFFFFF)
        Name (PRP6, 0xFFFFFFFF)
        Device (UFS0)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((STOR == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_HID, "QCOM24A5")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Alias (\_SB.EMUL, EMUL)
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x01D84000,         // Address Base
                        0x0001C000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000129,
                    }
                })
                Return (RBUF) /* \_SB_.UFS0._CRS.RBUF */
            }

            Device (DEV0)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return (0x08)
                }

                Method (_RMV, 0, NotSerialized)  // _RMV: Removal Status
                {
                    Return (Zero)
                }
            }
        }

        Device (ABD)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_HID, "QCOM0427")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            OperationRegion (ROP1, GenericSerialBus, Zero, 0x0100)
            Name (AVBL, Zero)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x09))
                {
                    AVBL = Arg1
                }
            }
        }

        Name (ESNL, 0x14)
        Name (DBFL, 0x17)
        Device (PMIC)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.SPMI
            })
            Name (_HID, "QCOM1A2B")  // _HID: Hardware ID
            Name (_CID, "PNP0CA3")  // _CID: Compatible ID
            Alias (\_SB.PSUB, _SUB)
            Method (PMCF, 0, NotSerialized)
            {
                Name (CFG0, Package (0x0B)
                {
                    0x0A, 
                    Package (0x02)
                    {
                        Zero, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        One, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x02, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x03, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x04, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x05, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x10, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x10, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x10, 
                        0x10
                    }, 

                    Package (0x02)
                    {
                        0x10, 
                        0x10
                    }
                })
                Return (CFG0) /* \_SB_.PMIC.PMCF.CFG0 */
            }
        }

        Device (PML0)
        {
            Name (_HID, "QCOM1AD3")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.IC21
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0008, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.IC21",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    I2cSerialBusV2 (0x0009, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.IC21",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    I2cSerialBusV2 (0x000C, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.IC21",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    I2cSerialBusV2 (0x000D, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.IC21",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioIo (Exclusive, PullNone, 0x0000, 0x00C8, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0021
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x00C8, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0023
                        }
                })
                Return (RBUF) /* \_SB_.PML0._CRS.RBUF */
            }
        }

        Device (PM01)
        {
            Name (_HID, "QCOM1A2D")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, One)  // _UID: Unique ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMIC
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000201,
                    }
                })
                Return (RBUF) /* \_SB_.PM01._CRS.RBUF */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.PM01._DSM._T_0 */
                    If ((_T_0 == ToUUID ("4f248f40-d5e2-499f-834c-27758ea1cd3f") /* GPIO Controller */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                Return (Buffer (One)
                                {
                                     0x03                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Return (Package (0x02)
                                {
                                    0x07, 
                                    0x06
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }

                    Break
                }
            }
        }

        Device (PMAP)
        {
            Name (_HID, "QCOM1A2C")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PMIC, 
                \_SB.ABD, 
                \_SB.SCM0
            })
            Method (GEPT, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x04){})
                CreateByteField (BUFF, Zero, STAT)
                CreateWordField (BUFF, 0x02, DATA)
                DATA = 0x02
                Return (DATA) /* \_SB_.PMAP.GEPT.DATA */
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PMAP._CRS.RBUF */
            }
        }

        Device (PRTC)
        {
            Name (_HID, "ACPI000E" /* Time and Alarm Device */)  // _HID: Hardware ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                "\\_SB.PMAP"
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }

            Method (_GCP, 0, NotSerialized)  // _GCP: Get Capabilities
            {
                Return (0x04)
            }

            Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
            {
                Connection (
                    I2cSerialBusV2 (0x0002, ControllerInitiated, 0x00000000,
                        AddressingMode7Bit, "\\_SB.ABD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                ), 
                AccessAs (BufferAcc, AttribRawBytes (0x18)), 
                FLD0,   192
            }

            Method (_GRT, 0, NotSerialized)  // _GRT: Get Real Time
            {
                Name (BUFF, Buffer (0x1A){})
                CreateField (BUFF, 0x10, 0x80, TME1)
                CreateField (BUFF, 0x90, 0x20, ACT1)
                CreateField (BUFF, 0xB0, 0x20, ACW1)
                BUFF = FLD0 /* \_SB_.PRTC.FLD0 */
                Return (TME1) /* \_SB_.PRTC._GRT.TME1 */
            }

            Method (_SRT, 1, NotSerialized)  // _SRT: Set Real Time
            {
                Name (BUFF, Buffer (0x32){})
                CreateByteField (BUFF, Zero, STAT)
                CreateField (BUFF, 0x10, 0x80, TME1)
                CreateField (BUFF, 0x90, 0x20, ACT1)
                CreateField (BUFF, 0xB0, 0x20, ACW1)
                ACT1 = Zero
                TME1 = Arg0
                ACW1 = Zero
                BUFF = FLD0 = BUFF /* \_SB_.PRTC._SRT.BUFF */
                If ((STAT != Zero))
                {
                    Return (One)
                }

                Return (Zero)
            }
        }

        Device (PMBM)
        {
            Name (_HID, "QCOM1A2A")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMGK
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PMBM._CRS.RBUF */
            }
        }

        Device (BCL1)
        {
            Name (_HID, "QCOM1A77")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMIC
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveLow, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0108
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0109
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x010A
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x010B
                        }
                    GpioInt (Edge, ActiveLow, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0210
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0211
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0212
                        }
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0213
                        }
                })
                Return (RBUF) /* \_SB_.BCL1._CRS.RBUF */
            }

            Method (BCLQ, 0, NotSerialized)
            {
                Name (CFG0, Package (0x08)
                {
                    "PM3_BCLBIG_LVL0", 
                    "PM3_BCLBIG_LVL1", 
                    "PM3_BCLBIG_LVL2", 
                    "PM3_BCLBIG_BAN", 
                    "PM7_BCLBIG_LVL0", 
                    "PM7_BCLBIG_LVL1", 
                    "PM7_BCLBIG_LVL2", 
                    "PM7_BCLBIG_BAN"
                })
                Return (CFG0) /* \_SB_.BCL1.BCLQ.CFG0 */
            }
        }

        Device (PMGK)
        {
            Name (_HID, "QCOM1A8E")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.GLNK, 
                \_SB.ABD
            })
            Name (LKUP, Zero)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }

            Method (GEPT, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x04){})
                CreateByteField (BUFF, Zero, STAT)
                CreateWordField (BUFF, 0x02, DATA)
                DATA = 0x03
                Return (DATA) /* \_SB_.PMGK.GEPT.DATA */
            }

            Name (UBUF, Buffer (0x32){})
            CreateField (UBUF, Zero, 0x08, BSTA)
            CreateField (UBUF, 0x08, 0x08, BSIZ)
            CreateField (UBUF, 0x10, 0x10, BVER)
            CreateField (UBUF, 0x30, 0x20, BCCI)
            CreateField (UBUF, 0x50, 0x40, BCTL)
            CreateField (UBUF, 0x90, 0x80, BMGI)
            CreateField (UBUF, 0x0110, 0x80, BMGO)
            Method (USBN, 1, NotSerialized)
            {
                UBUF = UCSI /* \_SB_.PMGK.UCSI */
                \_SB.UCSI.VERS = BVER /* \_SB_.PMGK.BVER */
                \_SB.UCSI.MSGI = BMGI /* \_SB_.PMGK.BMGI */
                \_SB.UCSI.CCI = BCCI /* \_SB_.PMGK.BCCI */
                Notify (\_SB.UCSI, Arg0)
                Return (Zero)
            }

            Name (PBUF, Buffer (0x10){})
            CreateField (PBUF, Zero, 0x08, BPID)
            CreateField (PBUF, 0x08, 0x08, BORI)
            CreateField (PBUF, 0x10, 0x08, BMUX)
            CreateField (PBUF, 0x20, 0x10, BVID)
            CreateField (PBUF, 0x30, 0x10, BSID)
            CreateField (PBUF, 0x40, 0x08, BSSD)
            Method (UPAN, 1, NotSerialized)
            {
                PBUF = Arg0
                \_SB.UCS0.EINF = 0x02
                While (One)
                {
                    Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_0 = ToInteger (BPID)
                    If ((_T_0 == Zero))
                    {
                        \_SB.UCS0.EUPD |= One
                        \_SB.UCS0.ECC0 = BORI /* \_SB_.PMGK.BORI */
                        \_SB.UCS0.EMX0 = BMUX /* \_SB_.PMGK.BMUX */
                        \_SB.UCS0.EVI0 = BVID /* \_SB_.PMGK.BVID */
                        \_SB.UCS0.ESI0 = BSID /* \_SB_.PMGK.BSID */
                        \_SB.UCS0.ESV0 = BSSD /* \_SB_.PMGK.BSSD */
                        \_SB.UCS0.USBR ()
                        Break
                    }
                    ElseIf ((_T_0 == One))
                    {
                        \_SB.UCS0.EUPD |= 0x02
                        \_SB.UCS0.ECC1 = BORI /* \_SB_.PMGK.BORI */
                        \_SB.UCS0.EMX1 = BMUX /* \_SB_.PMGK.BMUX */
                        \_SB.UCS0.EVI1 = BVID /* \_SB_.PMGK.BVID */
                        \_SB.UCS0.ESI1 = BSID /* \_SB_.PMGK.BSID */
                        \_SB.UCS0.ESV1 = BSSD /* \_SB_.PMGK.BSSD */
                        \_SB.UCS0.USBR ()
                        Break
                    }

                    Break
                }

                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.PMGK._CRS.RBUF */
            }

            Method (LKST, 1, NotSerialized)
            {
                LKUP = Arg0
                Notify (\_SB.UCSI, Zero) // Bus Check
                Return (Zero)
            }

            Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
            {
                Connection (
                    I2cSerialBusV2 (0x0003, ControllerInitiated, 0x00000000,
                        AddressingMode7Bit, "\\_SB.ABD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                ), 
                AccessAs (BufferAcc, AttribRawBytes (0x30)), 
                UCSI,   384
            }
        }

        Device (PEP0)
        {
            Name (_HID, "QCOM1A17")  // _HID: Hardware ID
            Name (_CID, "PNP0D80" /* Windows-compatible System Power Management Controller */)  // _CID: Compatible ID
            Method (THTZ, 4, NotSerialized)
            {
                While (One)
                {
                    Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_0 = ToInteger (Arg0)
                    If ((_T_0 == One))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg3)
                            If ((_T_1 == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ1.TPSV = Arg1
                                    Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ1._PSV ())
                            }
                            ElseIf ((_T_1 == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ1.TTSP = Arg1
                                    Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ1._TSP ())
                            }
                            ElseIf ((_T_1 == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ1.TTC1 = Arg1
                                    Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ1._TC1 ())
                            }
                            ElseIf ((_T_1 == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ1.TTC2 = Arg1
                                    Notify (\_SB.TZ1, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ1._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x03))
                    {
                        While (One)
                        {
                            Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_2 = ToInteger (Arg3)
                            If ((_T_2 == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ3.TPSV = Arg1
                                    Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ3._PSV ())
                            }
                            ElseIf ((_T_2 == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ3.TTSP = Arg1
                                    Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ3._TSP ())
                            }
                            ElseIf ((_T_2 == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ3.TTC1 = Arg1
                                    Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ3._TC1 ())
                            }
                            ElseIf ((_T_2 == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ3.TTC2 = Arg1
                                    Notify (\_SB.TZ3, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ3._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x05))
                    {
                        While (One)
                        {
                            Name (_T_3, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_3 = ToInteger (Arg3)
                            If ((_T_3 == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ5.TPSV = Arg1
                                    Notify (\_SB.TZ5, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ5._PSV ())
                            }
                            ElseIf ((_T_3 == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ5.TTSP = Arg1
                                    Notify (\_SB.TZ5, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ5._TSP ())
                            }
                            ElseIf ((_T_3 == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ5.TTC1 = Arg1
                                    Notify (\_SB.TZ5, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ5._TC1 ())
                            }
                            ElseIf ((_T_3 == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ5.TTC2 = Arg1
                                    Notify (\_SB.TZ5, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ5._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x0B))
                    {
                        While (One)
                        {
                            Name (_T_4, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_4 = ToInteger (Arg3)
                            If ((_T_4 == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ11.TPSV = Arg1
                                    Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ11._PSV ())
                            }
                            ElseIf ((_T_4 == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ11.TTSP = Arg1
                                    Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ11._TSP ())
                            }
                            ElseIf ((_T_4 == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ11.TTC1 = Arg1
                                    Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ11._TC1 ())
                            }
                            ElseIf ((_T_4 == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ11.TTC2 = Arg1
                                    Notify (\_SB.TZ11, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ11._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x0D))
                    {
                        While (One)
                        {
                            Name (_T_5, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_5 = ToInteger (Arg3)
                            If ((_T_5 == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ13.TPSV = Arg1
                                    Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ13._PSV ())
                            }
                            ElseIf ((_T_5 == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ13.TTSP = Arg1
                                    Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ13._TSP)
                            }
                            ElseIf ((_T_5 == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ13.TTC1 = Arg1
                                    Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ13._TC1)
                            }
                            ElseIf ((_T_5 == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ13.TTC2 = Arg1
                                    Notify (\_SB.TZ13, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ13._TC2)
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x0E))
                    {
                        While (One)
                        {
                            Name (_T_6, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_6 = ToInteger (Arg3)
                            If ((_T_6 == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ14.TPSV = Arg1
                                    Notify (\_SB.TZ14, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ14._PSV ())
                            }
                            ElseIf ((_T_6 == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ14.TTSP = Arg1
                                    Notify (\_SB.TZ14, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ14._TFP ())
                            }
                            ElseIf ((_T_6 == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ14.TTC1 = Arg1
                                    Notify (\_SB.TZ14, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ14._TC1 ())
                            }
                            ElseIf ((_T_6 == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ14.TTC2 = Arg1
                                    Notify (\_SB.TZ14, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ14._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x0F))
                    {
                        While (One)
                        {
                            Name (_T_7, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_7 = ToInteger (Arg3)
                            If ((_T_7 == Zero))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ15._PSV ())
                            }
                            ElseIf ((_T_7 == 0x02))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ15._TSP)
                            }
                            ElseIf ((_T_7 == 0x03))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ15._TC1 ())
                            }
                            ElseIf ((_T_7 == 0x04))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ15._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x10))
                    {
                        While (One)
                        {
                            Name (_T_8, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_8 = ToInteger (Arg3)
                            If ((_T_8 == Zero))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ16._PSV ())
                            }
                            ElseIf ((_T_8 == One))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ16._CRT ())
                            }
                            ElseIf ((_T_8 == 0x02))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ16._TSP)
                            }
                            ElseIf ((_T_8 == 0x03))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ16._TC1 ())
                            }
                            ElseIf ((_T_8 == 0x04))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ16._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x11))
                    {
                        While (One)
                        {
                            Name (_T_9, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_9 = ToInteger (Arg3)
                            If ((_T_9 == Zero))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ17._PSV ())
                            }
                            ElseIf ((_T_9 == 0x02))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ17._TSP)
                            }
                            ElseIf ((_T_9 == 0x03))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ17._TC1 ())
                            }
                            ElseIf ((_T_9 == 0x04))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ17._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x12))
                    {
                        While (One)
                        {
                            Name (_T_A, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_A = ToInteger (Arg3)
                            If ((_T_A == Zero))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ18._PSV ())
                            }
                            ElseIf ((_T_A == 0x02))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ18._TSP)
                            }
                            ElseIf ((_T_A == 0x03))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ18._TC1 ())
                            }
                            ElseIf ((_T_A == 0x04))
                            {
                                If (Arg2)
                                {
                                    Return (0xFFFF)
                                }

                                Return (\_SB.TZ18._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x1F))
                    {
                        While (One)
                        {
                            Name (_T_B, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_B = ToInteger (Arg3)
                            If ((_T_B == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ31.TPSV = Arg1
                                    Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ31._PSV ())
                            }
                            ElseIf ((_T_B == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ31.TTSP = Arg1
                                    Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ31._TSP ())
                            }
                            ElseIf ((_T_B == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ31.TTC1 = Arg1
                                    Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ31._TC1 ())
                            }
                            ElseIf ((_T_B == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ31.TTC2 = Arg1
                                    Notify (\_SB.TZ31, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ31._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x20))
                    {
                        While (One)
                        {
                            Name (_T_C, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_C = ToInteger (Arg3)
                            If ((_T_C == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ32.TPSV = Arg1
                                    Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ32._PSV ())
                            }
                            ElseIf ((_T_C == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ32.TTSP = Arg1
                                    Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ32._TSP ())
                            }
                            ElseIf ((_T_C == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ32.TTC1 = Arg1
                                    Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ32._TC1 ())
                            }
                            ElseIf ((_T_C == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ32.TTC2 = Arg1
                                    Notify (\_SB.TZ32, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ32._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x21))
                    {
                        While (One)
                        {
                            Name (_T_D, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_D = ToInteger (Arg3)
                            If ((_T_D == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ33.TPSV = Arg1
                                    Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ33._PSV ())
                            }
                            ElseIf ((_T_D == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ33.TTSP = Arg1
                                    Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ33._TSP ())
                            }
                            ElseIf ((_T_D == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ33.TTC1 = Arg1
                                    Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ33._TC1 ())
                            }
                            ElseIf ((_T_D == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ33.TTC2 = Arg1
                                    Notify (\_SB.TZ33, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ33._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x22))
                    {
                        While (One)
                        {
                            Name (_T_E, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_E = ToInteger (Arg3)
                            If ((_T_E == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ34.TPSV = Arg1
                                    Notify (\_SB.TZ34, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ34._PSV ())
                            }
                            ElseIf ((_T_E == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ34.TTSP = Arg1
                                    Notify (\_SB.TZ34, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ34._TSP ())
                            }
                            ElseIf ((_T_E == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ34.TTC1 = Arg1
                                    Notify (\_SB.TZ34, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ34._TC1 ())
                            }
                            ElseIf ((_T_E == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ34.TTC2 = Arg1
                                    Notify (\_SB.TZ34, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ34._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x23))
                    {
                        While (One)
                        {
                            Name (_T_F, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_F = ToInteger (Arg3)
                            If ((_T_F == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ35.TPSV = Arg1
                                    Notify (\_SB.TZ35, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ35._PSV ())
                            }
                            ElseIf ((_T_F == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ35.TTSP = Arg1
                                    Notify (\_SB.TZ35, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ35._TSP ())
                            }
                            ElseIf ((_T_F == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ35.TTC1 = Arg1
                                    Notify (\_SB.TZ35, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ35._TC1 ())
                            }
                            ElseIf ((_T_F == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ35.TTC2 = Arg1
                                    Notify (\_SB.TZ35, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ35._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x24))
                    {
                        While (One)
                        {
                            Name (_T_G, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_G = ToInteger (Arg3)
                            If ((_T_G == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ36.TPSV = Arg1
                                    Notify (\_SB.TZ36, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ36._PSV ())
                            }
                            ElseIf ((_T_G == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ36.TTSP = Arg1
                                    Notify (\_SB.TZ36, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ36._TSP ())
                            }
                            ElseIf ((_T_G == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ36.TTC1 = Arg1
                                    Notify (\_SB.TZ36, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ36._TC1 ())
                            }
                            ElseIf ((_T_G == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ36.TTC2 = Arg1
                                    Notify (\_SB.TZ36, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ36._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x25))
                    {
                        While (One)
                        {
                            Name (_T_H, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_H = ToInteger (Arg3)
                            If ((_T_H == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ37.TPSV = Arg1
                                    Notify (\_SB.TZ37, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ37._PSV ())
                            }
                            ElseIf ((_T_H == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ37.TTSP = Arg1
                                    Notify (\_SB.TZ37, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ37._TSP ())
                            }
                            ElseIf ((_T_H == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ37.TTC1 = Arg1
                                    Notify (\_SB.TZ37, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ37._TC1 ())
                            }
                            ElseIf ((_T_H == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ37.TTC2 = Arg1
                                    Notify (\_SB.TZ37, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ37._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x26))
                    {
                        While (One)
                        {
                            Name (_T_I, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_I = ToInteger (Arg3)
                            If ((_T_I == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ38.TPSV = Arg1
                                    Notify (\_SB.TZ38, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ38._PSV ())
                            }
                            ElseIf ((_T_I == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ38.TTSP = Arg1
                                    Notify (\_SB.TZ38, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ38._TSP ())
                            }
                            ElseIf ((_T_I == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ38.TTC1 = Arg1
                                    Notify (\_SB.TZ38, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ38._TC1 ())
                            }
                            ElseIf ((_T_I == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ38.TTC2 = Arg1
                                    Notify (\_SB.TZ38, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ38._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    ElseIf ((_T_0 == 0x63))
                    {
                        While (One)
                        {
                            Name (_T_J, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_J = ToInteger (Arg3)
                            If ((_T_J == Zero))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ99.TPSV = Arg1
                                    Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ99._PSV ())
                            }
                            ElseIf ((_T_J == One))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ99.TCRT = Arg1
                                    Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ99._CRT ())
                            }
                            ElseIf ((_T_J == 0x02))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ99.TTSP = Arg1
                                    Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ99._TSP ())
                            }
                            ElseIf ((_T_J == 0x03))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ99.TTC1 = Arg1
                                    Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ99._TC1 ())
                            }
                            ElseIf ((_T_J == 0x04))
                            {
                                If (Arg2)
                                {
                                    \_SB.TZ99.TTC2 = Arg1
                                    Notify (\_SB.TZ99, 0x81) // Thermal Trip Point Change
                                }

                                Return (\_SB.TZ99._TC2 ())
                            }
                            Else
                            {
                                Return (0xFFFF)
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (0xFFFF)
                    }

                    Break
                }
            }

            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.IPCC
            })
            Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
            {
                If ((\_SB.PSUB == "MTP08350"))
                {
                    Return ("MTP08350")
                }
                ElseIf ((\_SB.PSUB == "QRD08350"))
                {
                    Return ("QRD08350")
                }
                ElseIf ((\_SB.PSUB == "CDP08350"))
                {
                    Return ("CDP08350")
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.PEP0._DSM._T_0 */
                    If ((_T_0 == ToUUID ("8d5ca34c-ae83-4a2a-9dd1-a74ffead548b") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = ToInteger (Arg2)
                            If ((_T_1 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_2 = ToInteger (Arg1)
                                    If ((_T_2 == Zero))
                                    {
                                        Return (0x7E)
                                    }

                                    Break
                                }

                                Return (Zero)
                            }
                            ElseIf ((_T_1 == One))
                            {
                                Name (SUBI, Package (0x05)
                                {
                                    Package (0x03)
                                    {
                                        "adsp", 
                                        One, 
                                        0x02
                                    }, 

                                    Package (0x03)
                                    {
                                        "slpi", 
                                        Zero, 
                                        0x03
                                    }, 

                                    Package (0x03)
                                    {
                                        "cdsp", 
                                        One, 
                                        0x04
                                    }, 

                                    Package (0x03)
                                    {
                                        "modem", 
                                        One, 
                                        0x05
                                    }, 

                                    Package (0x03)
                                    {
                                        "spss", 
                                        Zero, 
                                        0x06
                                    }
                                })
                                Return (SUBI) /* \_SB_.PEP0._DSM.SUBI */
                            }
                            ElseIf ((_T_1 == 0x02))
                            {
                                If (CondRefOf (\_SB.ADSP))
                                {
                                    If (CondRefOf (\_SB.ADSP._STA))
                                    {
                                        Return (\_SB.ADSP._STA ())
                                    }
                                    Else
                                    {
                                        Return (0x0F)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                            ElseIf ((_T_1 == 0x03))
                            {
                                If (CondRefOf (\_SB.SCSS))
                                {
                                    If (CondRefOf (\_SB.SCSS._STA))
                                    {
                                        Return (\_SB.SCSS._STA ())
                                    }
                                    Else
                                    {
                                        Return (0x0F)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                            ElseIf ((_T_1 == 0x04))
                            {
                                If (CondRefOf (\_SB.NSP0))
                                {
                                    If (CondRefOf (\_SB.NSP0._STA))
                                    {
                                        Return (\_SB.NSP0._STA ())
                                    }
                                    Else
                                    {
                                        Return (0x0F)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                            ElseIf ((_T_1 == 0x05))
                            {
                                If (CondRefOf (\_SB.AMSS))
                                {
                                    If (CondRefOf (\_SB.AMSS._STA))
                                    {
                                        Return (\_SB.AMSS._STA) /* External reference */
                                    }
                                    Else
                                    {
                                        Return (0x0F)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                            ElseIf ((_T_1 == 0x06))
                            {
                                If (CondRefOf (\_SB.SPSS))
                                {
                                    If (CondRefOf (\_SB.SPSS._STA))
                                    {
                                        Return (\_SB.SPSS._STA ())
                                    }
                                    Else
                                    {
                                        Return (0x0F)
                                    }
                                }
                                Else
                                {
                                    Return (Zero)
                                }
                            }
                            Else
                            {
                                Return (Zero)
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }

                    Break
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
                    {
                        0x0000021A,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
                    {
                        0x0000021C,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
                    {
                        0x0000021B,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, ExclusiveAndWake, ,, )
                    {
                        0x0000021D,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000025,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000003E,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000003F,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000033,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000265,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000010D,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000113,
                    }
                })
            }

            Field (\_SB.ABD.ROP1, BufferAcc, NoLock, Preserve)
            {
                Connection (
                    I2cSerialBusV2 (0x0001, ControllerInitiated, 0x00000000,
                        AddressingMode7Bit, "\\_SB.ABD",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                ), 
                AccessAs (BufferAcc, AttribRawBytes (0x15)), 
                FLD0,   168
            }

            Method (GEPT, 0, NotSerialized)
            {
                Name (BUFF, Buffer (0x04){})
                CreateByteField (BUFF, Zero, STAT)
                CreateWordField (BUFF, 0x02, DATA)
                DATA = One
                Return (DATA) /* \_SB_.PEP0.GEPT.DATA */
            }

            Name (ROST, Zero)
            Method (NPUR, 1, NotSerialized)
            {
                \_SB.AGR0._PUR [One] = Arg0
                Notify (\_SB.AGR0, 0x80) // Status Change
            }

            Method (INTR, 0, NotSerialized)
            {
                Name (RBUF, Package (0x18)
                {
                    0x02, 
                    One, 
                    0x03, 
                    One, 
                    0x06, 
                    0x17911008, 
                    One, 
                    Zero, 
                    0x86000000, 
                    0x00200000, 
                    Zero, 
                    Zero, 
                    0x0C300000, 
                    0x1000, 
                    Zero, 
                    Zero, 
                    0x01FD4000, 
                    0x08, 
                    Zero, 
                    Zero, 
                    0x17C0000C, 
                    Zero, 
                    Zero, 
                    Zero
                })
                Return (RBUF) /* \_SB_.PEP0.INTR.RBUF */
            }

            Method (STND, 0, NotSerialized)
            {
                Return (STNX) /* \_SB_.PEP0.STNX */
            }

            Name (STNX, Package (0x07)
            {
                "DMPO", 
                "DMPA", 
                "DMPB", 
                "DMDS", 
                "DMPL", 
                "XMPL", 
                "DMEP"
            })
            Method (CTPM, 0, NotSerialized)
            {
                Name (CTPN, Package (0x02)
                {
                    "CORE_TOPOLOGY", 
                    0x08
                })
                Return (CTPN) /* \_SB_.PEP0.CTPM.CTPN */
            }

            Name (DCVS, Zero)
            Method (PGDS, 0, NotSerialized)
            {
                Return (DCVS) /* \_SB_.PEP0.DCVS */
            }

            Name (PPPP, Package (0x43)
            {
                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS5_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS6_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS9_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS10_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS11_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS12_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS1_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS2_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS3_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS4_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS6_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS8_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS10_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS1_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS2_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_SMPS3_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO1_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO2_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO3_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO4_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO5_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO6_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO7_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO8_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO9_B"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO1_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO2_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO3_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO4_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO5_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO6_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO7_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO8_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO9_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO10_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO11_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO12_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO13_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO1_D"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO1_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO2_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO3_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO4_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO5_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO6_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO7_E"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO1_P"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO2_P"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO3_P"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO4_P"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO5_P"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO6_P"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO7_P"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO1_Q"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO2_Q"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO3_Q"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO4_Q"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO5_Q"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO6_Q"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_LDO7_Q"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK2_A"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_BBCLK3_A"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK1_A"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_CXO_BUFFERS_RFCLK2_A"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_BUCK_BOOST1_C"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_FIXED_VREG1"
                }, 

                Package (0x01)
                {
                    "PPP_RESOURCE_ID_FIXED_VREG2"
                }
            })
            Method (PPPM, 0, NotSerialized)
            {
                Return (PPPP) /* \_SB_.PEP0.PPPP */
            }

            Name (PRRP, Package (0x46)
            {
                "PPP_RESOURCE_ID_LDO1_P", 
                "PPP_RESOURCE_ID_SMPS12_B", 
                0x0012AD40, 
                0x0014C080, 
                0x0001D4C0, 
                "PPP_RESOURCE_ID_LDO2_P", 
                "PPP_RESOURCE_ID_SMPS12_B", 
                0x0012AD40, 
                0x0014C080, 
                0x000157C0, 
                "PPP_RESOURCE_ID_LDO3_P", 
                "PPP_RESOURCE_ID_BUCK_BOOST1_C", 
                0x002DE600, 
                0x003C6CC0, 
                0x00023280, 
                "PPP_RESOURCE_ID_LDO4_P", 
                "PPP_RESOURCE_ID_BUCK_BOOST1_C", 
                0x002DE600, 
                0x003C6CC0, 
                0x0001F400, 
                "PPP_RESOURCE_ID_LDO5_P", 
                "PPP_RESOURCE_ID_SMPS1_C", 
                0x001B7740, 
                0x001DC900, 
                0x00021340, 
                "PPP_RESOURCE_ID_LDO6_P", 
                "PPP_RESOURCE_ID_BUCK_BOOST1_C", 
                0x002DE600, 
                0x003C6CC0, 
                0x0001F400, 
                "PPP_RESOURCE_ID_LDO7_P", 
                "PPP_RESOURCE_ID_BUCK_BOOST1_C", 
                0x002DE600, 
                0x003C6CC0, 
                0x0004C2C0, 
                "PPP_RESOURCE_ID_LDO1_Q", 
                "PPP_RESOURCE_ID_SMPS12_B", 
                0x0012AD40, 
                0x0014C080, 
                0x0001D4C0, 
                "PPP_RESOURCE_ID_LDO2_Q", 
                "PPP_RESOURCE_ID_SMPS12_B", 
                0x0012AD40, 
                0x0014C080, 
                0x000157C0, 
                "PPP_RESOURCE_ID_LDO3_Q", 
                "PPP_RESOURCE_ID_SMPS1_C", 
                0x001B7740, 
                0x001DC900, 
                0x00021340, 
                "PPP_RESOURCE_ID_LDO4_Q", 
                "PPP_RESOURCE_ID_SMPS1_C", 
                0x001B7740, 
                0x001DC900, 
                0x00021340, 
                "PPP_RESOURCE_ID_LDO5_Q", 
                "PPP_RESOURCE_ID_BUCK_BOOST1_C", 
                0x002DE600, 
                0x003C6CC0, 
                0x00017700, 
                "PPP_RESOURCE_ID_LDO6_Q", 
                "PPP_RESOURCE_ID_BUCK_BOOST1_C", 
                0x002DE600, 
                0x003C6CC0, 
                0x00013880, 
                "PPP_RESOURCE_ID_LDO7_Q", 
                "PPP_RESOURCE_ID_BUCK_BOOST1_C", 
                0x002DE600, 
                0x003C6CC0, 
                0x00013880
            })
            Method (PPRR, 0, NotSerialized)
            {
                Return (PRRP) /* \_SB_.PEP0.PRRP */
            }

            Name (FPDP, Zero)
            Method (FPMD, 0, NotSerialized)
            {
                Return (FPDP) /* \_SB_.PEP0.FPDP */
            }

            Method (DPRF, 0, NotSerialized)
            {
                Return (\_SB.DPP0) /* External reference */
            }

            Method (DMRF, 0, NotSerialized)
            {
                Return (\_SB.DPP1) /* External reference */
            }

            Method (MPRF, 0, NotSerialized)
            {
                Return (\_SB.MPP0) /* External reference */
            }

            Method (MMRF, 0, NotSerialized)
            {
                Return (\_SB.MPP1) /* External reference */
            }
        }

        Scope (\_SB.PEP0)
        {
            Method (PEPH, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    "ACPI\\VEN_QCOM&DEV_1A17"
                })
            }
        }

        Scope (\_SB.PEP0)
        {
            Method (APMD, 0, NotSerialized)
            {
                Return (APCC) /* \_SB_.PEP0.APCC */
            }

            Name (APCC, Package (0x01)
            {
                Package (0x06)
                {
                    "DEVICE", 
                    "\\_SB.ADSP.ADCM.AUCD.QCRT", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x03)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_xo", 
                                0x80
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "DSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_xo", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x03)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_xo", 
                                Zero
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (PREL, 0, NotSerialized)
            {
                Name (PREX, Package (0x07)
                {
                    "DM0G", 
                    "DM7G", 
                    "DM8G", 
                    "DM9G", 
                    "DMKG", 
                    "DMLG", 
                    "DMMG"
                })
                Return (PREX) /* \_SB_.PEP0.PREL.PREX */
            }

            Method (G0MD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x04)
                    {
                        "DEVICE", 
                        0x82, 
                        "\\_SB.GPU0", 
                        Package (0x0B)
                        {
                            "COMPONENT", 
                            Zero, 
                            Package (0x03)
                            {
                                "FSTATE", 
                                Zero, 
                                Package (0x13)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "NPARESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/arc/client/rail_mmcx", 
                                            0x40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_edp3_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x03)
                                        {
                                            "mdss_0_disp_cc_mdss_core_gdsc", 
                                            One, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_pixel0_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_link_intf_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PRELOAD_FSTATE", 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x0C)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_pixel0_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx3_link_intf_clk", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x35A4E900, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.G0MD.GPCC */
            }

            Method (G7MD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x04)
                    {
                        "DEVICE", 
                        0x82, 
                        "\\_SB.GPU0", 
                        Package (0x0B)
                        {
                            "COMPONENT", 
                            0x07, 
                            Package (0x03)
                            {
                                "FSTATE", 
                                Zero, 
                                Package (0x11)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "NPARESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/arc/client/rail_mmcx", 
                                            0x40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x03)
                                        {
                                            "mdss_0_disp_cc_mdss_core_gdsc", 
                                            One, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_edp2_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx2_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx2_pixel0_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PRELOAD_FSTATE", 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x35A4E900, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx2_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx2_pixel0_clk", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.G7MD.GPCC */
            }

            Method (G8MD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x04)
                    {
                        "DEVICE", 
                        0x82, 
                        "\\_SB.GPU0", 
                        Package (0x0B)
                        {
                            "COMPONENT", 
                            0x08, 
                            Package (0x03)
                            {
                                "FSTATE", 
                                Zero, 
                                Package (0x10)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "NPARESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/arc/client/rail_mmcx", 
                                            0x40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_edp2_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x03)
                                        {
                                            "mdss_0_disp_cc_mdss_core_gdsc", 
                                            One, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx2_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PRELOAD_FSTATE", 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x35A4E900, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx2_aux_clk", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.G8MD.GPCC */
            }

            Method (G9MD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x04)
                    {
                        "DEVICE", 
                        0x82, 
                        "\\_SB.GPU0", 
                        Package (0x0C)
                        {
                            "COMPONENT", 
                            0x09, 
                            Package (0x03)
                            {
                                "FSTATE", 
                                Zero, 
                                Package (0x17)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "NPARESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/arc/client/rail_mmcx", 
                                            0x40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x03)
                                        {
                                            "mdss_0_disp_cc_mdss_core_gdsc", 
                                            One, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb3_prim_phy_pipe_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb4_eud_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb30_prim_sleep_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_edp0_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_top_edp0_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_pixel0_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_intf_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PRELOAD_FSTATE", 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x35A4E900, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x06)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_pixel0_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_intf_clk", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x05, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk", 
                                            0x02
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.G9MD.GPCC */
            }

            Method (GKMD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x04)
                    {
                        "DEVICE", 
                        0x82, 
                        "\\_SB.GPU0", 
                        Package (0x0C)
                        {
                            "COMPONENT", 
                            0x0A, 
                            Package (0x03)
                            {
                                "FSTATE", 
                                Zero, 
                                Package (0x17)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "NPARESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/arc/client/rail_mmcx", 
                                            0x40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x03)
                                        {
                                            "mdss_0_disp_cc_mdss_core_gdsc", 
                                            One, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb3_prim_phy_pipe_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb4_eud_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb30_prim_sleep_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_edp0_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_top_edp0_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_pixel1_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_intf_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PRELOAD_FSTATE", 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x35A4E900, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x06)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_pixel1_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_link_intf_clk", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x05, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx0_usb_router_link_intf_clk", 
                                            0x02
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.GKMD.GPCC */
            }

            Method (GLMD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x04)
                    {
                        "DEVICE", 
                        0x82, 
                        "\\_SB.GPU0", 
                        Package (0x0C)
                        {
                            "COMPONENT", 
                            0x0B, 
                            Package (0x03)
                            {
                                "FSTATE", 
                                Zero, 
                                Package (0x17)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "NPARESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/arc/client/rail_mmcx", 
                                            0x40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_edp1_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_top_edp1_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x03)
                                        {
                                            "mdss_0_disp_cc_mdss_core_gdsc", 
                                            One, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb3_sec_phy_pipe_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb4_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb30_sec_sleep_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_pixel0_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_intf_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PRELOAD_FSTATE", 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x35A4E900, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x06)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_pixel0_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_intf_clk", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x05, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk", 
                                            0x02
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.GLMD.GPCC */
            }

            Method (GMMD, 0, NotSerialized)
            {
                Name (GPCC, Package (0x01)
                {
                    Package (0x04)
                    {
                        "DEVICE", 
                        0x82, 
                        "\\_SB.GPU0", 
                        Package (0x0C)
                        {
                            "COMPONENT", 
                            0x0C, 
                            Package (0x03)
                            {
                                "FSTATE", 
                                Zero, 
                                Package (0x17)
                                {
                                    "EXIT", 
                                    Package (0x02)
                                    {
                                        "NPARESOURCE", 
                                        Package (0x03)
                                        {
                                            One, 
                                            "/arc/client/rail_mmcx", 
                                            0x40
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_xo_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "FOOTSWITCH", 
                                        Package (0x03)
                                        {
                                            "mdss_0_disp_cc_mdss_core_gdsc", 
                                            One, 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_ROTATOR", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x2FAF0800, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_hf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_disp_sf_axi_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb3_sec_phy_pipe_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb4_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_usb30_sec_sleep_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_top_edp1_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "gcc_edp1_phy_clkref_en", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_rscc_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_ahb_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_pixel1_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_intf_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }
                            }, 

                            Package (0x02)
                            {
                                "FSTATE", 
                                One
                            }, 

                            Package (0x02)
                            {
                                "INIT_FSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PRELOAD_FSTATE", 
                                One
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE", 
                                    Zero
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                One, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_APPSS_PROC", 
                                            "ICBID_SLAVE_DISPLAY_CFG", 
                                            0x023C3460, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x02, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            Zero, 
                                            0x77359400
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x03, 
                                Package (0x04)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MDP0", 
                                            "ICBID_SLAVE_MNOC_HF_MEM_NOC", 
                                            Zero, 
                                            Zero
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "BUSARB", 
                                        Package (0x05)
                                        {
                                            0x03, 
                                            "ICBID_MASTER_MNOC_HF_MEM_NOC", 
                                            "ICBID_SLAVE_EBI1", 
                                            0x35A4E900, 
                                            Zero
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x04, 
                                Package (0x06)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_pixel1_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_aux_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_clk", 
                                            One
                                        }
                                    }, 

                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_link_intf_clk", 
                                            One
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE_SET", 
                                0x05, 
                                Package (0x03)
                                {
                                    "PSTATE", 
                                    Zero, 
                                    Package (0x02)
                                    {
                                        "CLOCK", 
                                        Package (0x02)
                                        {
                                            "mdss_0_disp_cc_mdss_dptx1_usb_router_link_intf_clk", 
                                            0x02
                                        }
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PRELOAD_PSTATE", 
                                    Zero
                                }
                            }
                        }
                    }
                })
                Return (GPCC) /* \_SB_.PEP0.GMMD.GPCC */
            }
        }

        Scope (\_SB.PEP0)
        {
            Method (MPMD, 0, NotSerialized)
            {
                Return (MPCC) /* \_SB_.PEP0.MPCC */
            }

            Name (MPCC, Package (0x00){})
        }

        Scope (\_SB.PEP0)
        {
            Method (LPMD, 0, NotSerialized)
            {
                Return (LPCC) /* \_SB_.PEP0.LPCC */
            }

            Name (LPCC, Package (0x07)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.URS0", 
                    Package (0x05)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x08)
                {
                    "DEVICE", 
                    "\\_SB.URS0.USB0", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_sleep_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_pipe_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_aggre_usb3_prim_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_cfg_noc_usb3_prim_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_prim_phy_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_prim_phy_com_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_eud_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                0x0100
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_0", 
                                "ICBID_SLAVE_EBI1", 
                                0x28000000, 
                                0x28000000
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_0", 
                                0x0BEBC200, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_eud_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_0", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_0", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_eud_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_0", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_0", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x15)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_sleep_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x09, 
                                0x13
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_eud_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_0", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_0", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_gdsc", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_DSTATE", 
                        0x03
                    }
                }, 

                Package (0x08)
                {
                    "DEVICE", 
                    "\\_SB.URS0.UFN0", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_sleep_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_pipe_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_aggre_usb3_prim_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_cfg_noc_usb3_prim_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_prim_phy_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_prim_phy_com_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_eud_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                0x0100
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_0", 
                                "ICBID_SLAVE_EBI1", 
                                0x28000000, 
                                0x28000000
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_0", 
                                0x0BEBC200, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_eud_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_0", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_0", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x15)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_sleep_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_prim_master_clk", 
                                0x09, 
                                0x13
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_prim_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_prim_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_eud_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_0", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_0", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_prim_gdsc", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.URS1", 
                    Package (0x05)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x08)
                {
                    "DEVICE", 
                    "\\_SB.URS1.USB1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_sleep_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_pipe_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_aggre_usb3_sec_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_cfg_noc_usb3_sec_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_sec_phy_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_sec_phy_com_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                0x0100
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x28000000, 
                                0x28000000
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_1", 
                                0x0BEBC200, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x15)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_sleep_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x09, 
                                0x13
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_gdsc", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_DSTATE", 
                        0x03
                    }
                }, 

                Package (0x08)
                {
                    "DEVICE", 
                    "\\_SB.URS1.UFN1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_sleep_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_pipe_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_aggre_usb3_sec_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_cfg_noc_usb3_sec_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_sec_phy_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_sec_phy_com_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                0x0100
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_1", 
                                "ICBID_SLAVE_EBI1", 
                                0x28000000, 
                                0x28000000
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_1", 
                                0x0BEBC200, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x14)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x15)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_sleep_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_pipe_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_sec_master_clk", 
                                0x09, 
                                0x13
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_sec_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_sec_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb4_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_1", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_sec_gdsc", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_DSTATE", 
                        0x03
                    }
                }, 

                Package (0x08)
                {
                    "DEVICE", 
                    "\\_SB.USB2", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "PSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x1A)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_sleep_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_0_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_1_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_aggre_usb3_mp_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_cfg_noc_usb3_mp_axi_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x08, 
                                0xC8, 
                                0x09
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mp_mock_utmi_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_mp_phy_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb3_mp_phy_com_aux_clk", 
                                0x08, 
                                0x4B00, 
                                0x07
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp0_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp1_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs0_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs1_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs2_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs3_clkref_en", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                0x0100
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_MP", 
                                "ICBID_SLAVE_EBI1", 
                                0x28000000, 
                                0x28000000
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_MP", 
                                0x0BEBC200, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x1A)
                    {
                        "DSTATE", 
                        One, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_0_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_1_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_mp_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_mp_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp0_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp1_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs0_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs1_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs2_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs3_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_MP", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_MP", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x1A)
                    {
                        "DSTATE", 
                        0x02, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_0_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_1_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x09, 
                                0x12
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_mp_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_mp_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp0_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp1_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs0_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs1_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs2_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs3_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_MP", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_MP", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_gdsc", 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x1B)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_sleep_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_0_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_pipe_1_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x04)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x03, 
                                0x2580, 
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x03)
                            {
                                "gcc_usb30_mp_master_clk", 
                                0x09, 
                                0x13
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb3_mp_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_cfg_noc_usb3_mp_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_mock_utmi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp_phy_com_aux_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_north_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_aggre_usb_noc_south_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_sys_noc_usb_axi_clk", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp0_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb3_mp1_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs0_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs1_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs2_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "CLOCK", 
                            Package (0x02)
                            {
                                "gcc_usb2_hs3_clkref_en", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_USB3_MP", 
                                "ICBID_SLAVE_EBI1", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "BUSARB", 
                            Package (0x05)
                            {
                                0x03, 
                                "ICBID_MASTER_APPSS_PROC", 
                                "ICBID_SLAVE_USB3_MP", 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "FOOTSWITCH", 
                            Package (0x02)
                            {
                                "gcc_usb30_mp_gdsc", 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "NPARESOURCE", 
                            Package (0x03)
                            {
                                One, 
                                "/arc/client/rail_cx", 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "ABANDON_DSTATE", 
                        0x03
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (BPMD, 0, NotSerialized)
            {
                If ((STOR == One))
                {
                    Return (CPCC) /* \_SB_.PEP0.CPCC */
                }
                Else
                {
                    Return (FPCC) /* \_SB_.PEP0.FPCC */
                }
            }

            Method (SDMD, 0, NotSerialized)
            {
                Return (SDCC) /* \_SB_.PEP0.SDCC */
            }

            Name (CPCC, Package (0x01)
            {
                Package (0x06)
                {
                    "DEVICE", 
                    "\\_SB.UFS0", 
                    Package (0x07)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x05)
                        {
                            "FSTATE", 
                            Zero, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    One, 
                                    Zero
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    Zero
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "FSTATE", 
                            One, 
                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    0x02, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    One, 
                                    One
                                }
                            }, 

                            Package (0x02)
                            {
                                "PSTATE_ADJUST", 
                                Package (0x02)
                                {
                                    Zero, 
                                    One
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            Package (0x02)
                            {
                                "PSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PSTATE", 
                                One
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE_SET", 
                            One, 
                            Package (0x02)
                            {
                                "PSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PSTATE", 
                                One
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE_SET", 
                            0x02, 
                            Package (0x02)
                            {
                                "PSTATE", 
                                Zero
                            }, 

                            Package (0x02)
                            {
                                "PSTATE", 
                                One
                            }
                        }
                    }, 

                    Package (0x06)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x23
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x05)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                One
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "CRASHDUMP_DSTATE", 
                        Zero
                    }
                }
            })
            Name (FPCC, Package (0x01)
            {
                Package (0x06)
                {
                    "DEVICE", 
                    "\\_SB.UFS0", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "PRELOAD_DSTATE", 
                        0x03
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }
            })
            Name (SDCC, Package (0x01)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.SDC2", 
                    Package (0x09)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }, 

                        Package (0x19)
                        {
                            "PSTATE_SET", 
                            Zero, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x03, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x04, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x05, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x06, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x07, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x08, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x09, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0B, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0C, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0D, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0E, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x0F, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x10, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x11, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x12, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x13, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        One
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x14, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x15, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x16, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x17, 
                                Package (0x02)
                                {
                                    "DELAY", 
                                    Package (0x01)
                                    {
                                        0x23
                                    }
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "PSTATE_SET", 
                            One, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x02)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x08, 
                                        0x05F5E100, 
                                        0x02
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x04)
                                    {
                                        "gcc_sdcc2_apps_clk", 
                                        0x08, 
                                        0x0C0A4680, 
                                        0x02
                                    }
                                }
                            }
                        }, 

                        Package (0x05)
                        {
                            "PSTATE_SET", 
                            0x02, 
                            Package (0x03)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_2", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x17D78400, 
                                        0x0BEBC200
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_2", 
                                        "ICBID_SLAVE_EBI1", 
                                        0x0BEBC200, 
                                        0x05F5E100
                                    }
                                }
                            }, 

                            Package (0x03)
                            {
                                "PSTATE", 
                                0x02, 
                                Package (0x02)
                                {
                                    "BUSARB", 
                                    Package (0x05)
                                    {
                                        0x03, 
                                        "ICBID_MASTER_SDCC_2", 
                                        "ICBID_SLAVE_EBI1", 
                                        Zero, 
                                        Zero
                                    }
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE_SET", 
                            0x03, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        0x02
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        Zero
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        One, 
                                        One
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "PSTATE_ADJUST", 
                                    Package (0x02)
                                    {
                                        0x02, 
                                        One
                                    }
                                }
                            }
                        }, 

                        Package (0x04)
                        {
                            "PSTATE_SET", 
                            0x04, 
                            Package (0x04)
                            {
                                "PSTATE", 
                                Zero, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x02)
                                    {
                                        "gcc_sdcc2_ahb_clk", 
                                        One
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x02)
                                    {
                                        "gcc_sdcc2_at_clk", 
                                        One
                                    }
                                }
                            }, 

                            Package (0x04)
                            {
                                "PSTATE", 
                                One, 
                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x02)
                                    {
                                        "gcc_sdcc2_ahb_clk", 
                                        0x02
                                    }
                                }, 

                                Package (0x02)
                                {
                                    "CLOCK", 
                                    Package (0x02)
                                    {
                                        "gcc_sdcc2_at_clk", 
                                        0x02
                                    }
                                }
                            }
                        }
                    }, 

                    Package (0x06)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                0x16
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x04, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                0x02
                            }
                        }
                    }, 

                    Package (0x06)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x04, 
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                0x02, 
                                0x02
                            }
                        }, 

                        Package (0x02)
                        {
                            "PSTATE_ADJUST", 
                            Package (0x02)
                            {
                                Zero, 
                                0x17
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "CRASHDUMP_EXCEPTION", 
                        Package (0x02)
                        {
                            "EXECUTE_FUNCTION", 
                            Package (0x01)
                            {
                                "ExecuteOcdSdCardExceptions"
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "CRASHDUMP_DSTATE", 
                        Zero
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (PEMD, 0, NotSerialized)
            {
                Return (PEMC) /* \_SB_.PEP0.PEMC */
            }

            Name (PEMC, Package (0x0E)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI0", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI0.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI1.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI2", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI2.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI3", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI3.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI4", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI4.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI5", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI5.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI6", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PCI6.RP1", 
                    Package (0x04)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }, 

                        Package (0x02)
                        {
                            "FSTATE", 
                            One
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        Zero
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x03
                    }
                }
            })
        }

        Device (WLDS)
        {
            Name (_HID, "QCOM1AD0")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Scope (\_SB.PEP0)
        {
            Method (LPMX, 0, NotSerialized)
            {
                Return (LPXX) /* \_SB_.PEP0.LPXX */
            }

            Name (LPXX, Package (0x01)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.GTCH", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO3_C", 
                                One, 
                                0x002DE600, 
                                One, 
                                0x04, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x08, 
                                One, 
                                Zero, 
                                One, 
                                0x03, 
                                0x03
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x08, 
                                Zero, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO3_C", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (PMMX, 0, NotSerialized)
            {
                Return (PMXX) /* \_SB_.PEP0.PMXX */
            }

            Name (PMXX, Package (0x04)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PA00", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                0x002EE000, 
                                One, 
                                0x04, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PA01", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                0x002EE000, 
                                One, 
                                0x04, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PA03", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                0x002EE000, 
                                One, 
                                0x04, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }, 

                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.PA05", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                0x002EE000, 
                                One, 
                                0x04, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_LDO2_B", 
                                One, 
                                Zero, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            })
        }

        Scope (\_SB.PEP0)
        {
            Method (FPMX, 0, NotSerialized)
            {
                Return (FPXX) /* \_SB_.PEP0.FPXX */
            }

            Name (FPXX, Package (0x01)
            {
                Package (0x07)
                {
                    "DEVICE", 
                    "\\_SB.FPC1", 
                    Package (0x03)
                    {
                        "COMPONENT", 
                        Zero, 
                        Package (0x02)
                        {
                            "FSTATE", 
                            Zero
                        }
                    }, 

                    Package (0x09)
                    {
                        "DSTATE", 
                        Zero, 
                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                One, 
                                Zero, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x09, 
                                One, 
                                Zero, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                One
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x09, 
                                Zero, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x05
                            }
                        }, 

                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x09, 
                                One, 
                                Zero, 
                                One, 
                                0x03, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "DELAY", 
                            Package (0x01)
                            {
                                0x05
                            }
                        }
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        One
                    }, 

                    Package (0x02)
                    {
                        "DSTATE", 
                        0x02
                    }, 

                    Package (0x04)
                    {
                        "DSTATE", 
                        0x03, 
                        Package (0x02)
                        {
                            "TLMMGPIO", 
                            Package (0x06)
                            {
                                0x09, 
                                Zero, 
                                Zero, 
                                One, 
                                One, 
                                Zero
                            }
                        }, 

                        Package (0x02)
                        {
                            "PMICVREGVOTE", 
                            Package (0x06)
                            {
                                "PPP_RESOURCE_ID_SMPS10_B", 
                                0x02, 
                                0x001B7740, 
                                Zero, 
                                Zero, 
                                Zero
                            }
                        }
                    }
                }
            })
        }

        Device (BAM1)
        {
            Name (_HID, "QCOM1A0A")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, One)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x01DC4000,         // Address Base
                        0x00024000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000130,
                    }
                })
                Return (RBUF) /* \_SB_.BAM1._CRS.RBUF */
            }
        }

        Device (BAM5)
        {
            Name (_HID, "QCOM1A0A")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x03A84000,         // Address Base
                        0x00032000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000C4,
                    }
                })
                Return (RBUF) /* \_SB_.BAM5._CRS.RBUF */
            }
        }

        Device (BAMD)
        {
            Name (_HID, "QCOM1A0A")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x0D)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0A904000,         // Address Base
                        0x00017000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000034C,
                    }
                })
                Return (RBUF) /* \_SB_.BAMD._CRS.RBUF */
            }
        }

        Device (BAME)
        {
            Name (_HID, "QCOM1A0A")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x0E)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x06064000,         // Address Base
                        0x00015000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000C7,
                    }
                })
                Return (RBUF) /* \_SB_.BAME._CRS.RBUF */
            }
        }

        Device (BAMF)
        {
            Name (_HID, "QCOM1A0A")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x0F)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0A704000,         // Address Base
                        0x00017000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000347,
                    }
                })
                Return (RBUF) /* \_SB_.BAMF._CRS.RBUF */
            }
        }

        Device (UAR2)
        {
            Name (_HID, "QCOM1A16")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_0_SE_1"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00984000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000027A,
                    }
                    GpioInt (Edge, ActiveLow, Exclusive, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x000B
                        }
                })
                Return (RBUF) /* \_SB_.UAR2._CRS.RBUF */
            }
        }

        Device (UARD)
        {
            Name (_HID, "QCOM1A16")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_0_SE_3,DBG"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0098C000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000027C,
                    }
                    GpioInt (Edge, ActiveLow, Exclusive, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0013
                        }
                })
                Return (RBUF) /* \_SB_.UARD._CRS.RBUF */
            }
        }

        Device (SPI5)
        {
            Name (_HID, "QCOM1A0E")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QGP0, 
                \_SB.MMU0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_0_SE_4"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00990000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000027D,
                    }
                })
                Return (RBUF) /* \_SB_.SPI5._CRS.RBUF */
            }
        }

        Device (I2C6)
        {
            Name (_HID, "QCOM1A10")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x06)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_0_SE_5"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00994000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000027E,
                    }
                })
                Return (RBUF) /* \_SB_.I2C6._CRS.RBUF */
            }
        }

        Device (I2C9)
        {
            Name (_HID, "QCOM1A10")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x09)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_1_SE_0"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00A80000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000181,
                    }
                })
                Return (RBUF) /* \_SB_.I2C9._CRS.RBUF */
            }
        }

        Device (UR14)
        {
            Name (_HID, "QCOM1A16")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x0E)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_1_SE_5,4W,BT"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00A94000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000186,
                    }
                    GpioInt (Level, ActiveHigh, Exclusive, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0002
                        }
                })
                Return (RBUF) /* \_SB_.UR14._CRS.RBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (IC18)
        {
            Name (_HID, "QCOM1A10")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x12)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_2_SE_1"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00884000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000267,
                    }
                })
                Return (RBUF) /* \_SB_.IC18._CRS.RBUF */
            }
        }

        Device (SP20)
        {
            Name (_HID, "QCOM1A0E")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x14)  // _UID: Unique ID
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QGP2, 
                \_SB.MMU0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_2_SE_3"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0088C000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000269,
                    }
                })
                Return (RBUF) /* \_SB_.SP20._CRS.RBUF */
            }
        }

        Device (IC21)
        {
            Name (_HID, "QCOM1A10")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x15)  // _UID: Unique ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_STR, Unicode ("QUP_2_SE_4"))  // _STR: Description String
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00890000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000026A,
                    }
                })
                Return (RBUF) /* \_SB_.IC21._CRS.RBUF */
            }
        }

        Device (RPEN)
        {
            Name (_HID, "QCOM1AE1")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (PILC)
        {
            Name (_HID, "QCOM1AE0")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (CDI)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PILC, 
                \_SB.RPEN
            })
            Name (_HID, "QCOM1A2F")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (SCSS)
        {
            Name (_DEP, Package (0x07)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.PILC, 
                \_SB.GLNK, 
                \_SB.IPC0, 
                \_SB.RPEN, 
                \_SB.SSDD, 
                \_SB.ARPC
            })
            Name (_HID, "QCOM1A1F")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000C6,
                    }
                })
                Return (RBUF) /* \_SB_.SCSS._CRS.RBUF */
            }
        }

        Device (ADSP)
        {
            Name (_DEP, Package (0x07)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.PILC, 
                \_SB.GLNK, 
                \_SB.IPC0, 
                \_SB.RPEN, 
                \_SB.SSDD, 
                \_SB.ARPC
            })
            Name (_HID, "QCOM1A1B")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000206,
                    }
                })
                Return (RBUF) /* \_SB_.ADSP._CRS.RBUF */
            }

            Device (SLM1)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadWrite,
                            0x03AC0000,         // Address Base
                            0x0002C000,         // Address Length
                            )
                        Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                        {
                            0x000000C3,
                        }
                    })
                    Return (RBUF) /* \_SB_.ADSP.SLM1._CRS.RBUF */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }
            }

            Device (ADCM)
            {
                Alias (\_SB.PSUB, _SUB)
                Name (_ADR, One)  // _ADR: Address
                Name (_DEP, Package (0x02)  // _DEP: Dependencies
                {
                    \_SB.MMU0, 
                    \_SB.IMM0
                })
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (CHLD, 0, NotSerialized)
                {
                    Return (Package (0x01)
                    {
                        "ADCM\\QCOM1AC1"
                    })
                }

                Device (AUCD)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Alias (\_SB.PSUB, _SUB)
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                    {
                        Name (RBUF, ResourceTemplate ()
                        {
                            GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone,
                                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x006A
                                }
                            GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone,
                                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x00B2
                                }
                            GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone,
                                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x00B3
                                }
                            GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone,
                                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x0061
                                }
                            GpioIo (Exclusive, PullNone, 0x0000, 0x0640, IoRestrictionNone,
                                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x0062
                                }
                            GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000,
                                "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                                )
                                {   // Pin list
                                    0x0140
                                }
                            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                            {
                                0x000003DF,
                            }
                            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                            {
                                0x000000BB,
                            }
                            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                            {
                                0x000000CA,
                            }
                            Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                            {
                                0x000000CB,
                            }
                        })
                        Return (RBUF) /* \_SB_.ADSP.ADCM.AUCD._CRS.RBUF */
                    }

                    Method (CHLD, 0, NotSerialized)
                    {
                        Name (CH, Package (0x01)
                        {
                            "AUCD\\QCOM1A29"
                        })
                        Return (CH) /* \_SB_.ADSP.ADCM.AUCD.CHLD.CH__ */
                    }

                    Device (QCRT)
                    {
                        Method (_STA, 0, NotSerialized)  // _STA: Status
                        {
                            Return (0x0F)
                        }

                        Name (_ADR, Zero)  // _ADR: Address
                    }
                }
            }
        }

        Device (AMSS)
        {
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_DEP, Package (0x05)  // _DEP: Dependencies
            {
                \_SB.GLNK, 
                \_SB.PILC, 
                \_SB.RFS0, 
                \_SB.RPEN, 
                \_SB.SSDD
            })
            Name (_HID, "QCOM1A1C")  // _HID: Hardware ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000128,
                    }
                })
                Return (RBUF) /* \_SB_.AMSS._CRS.RBUF */
            }
        }

        Device (QSM)
        {
            Name (_HID, "QCOM1A1E")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.GLNK, 
                \_SB.IPC0, 
                \_SB.PILC, 
                \_SB.RPEN
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (SSDD)
        {
            Name (_HID, "QCOM1A20")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.GLNK, 
                \_SB.PDSR, 
                \_SB.TFTP
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (PDSR)
        {
            Name (_HID, "QCOM1ADF")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.GLNK, 
                \_SB.IPC0
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (NSP0)
        {
            Name (_DEP, Package (0x07)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.PILC, 
                \_SB.GLNK, 
                \_SB.IPC0, 
                \_SB.RPEN, 
                \_SB.SSDD, 
                \_SB.ARPC
            })
            Name (_HID, "QCOM1AB0")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000262,
                    }
                })
                Return (RBUF) /* \_SB_.NSP0._CRS.RBUF */
            }
        }

        Device (CSW0)
        {
            Name (_HID, "QCOM1AC3")  // _HID: Hardware ID
            Name (_CID, "QCOMFFE0")  // _CID: Compatible ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.NSP0, 
                \_SB.SBTD
            })
        }

        Device (SBTD)
        {
            Name (_HID, "QCOM1AE5")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (SPSS)
        {
            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.PILC, 
                \_SB.RPEN, 
                \_SB.GLNK
            })
            Name (_HID, "QCOM1A8D")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000180,
                    }
                    Memory32Fixed (ReadWrite,
                        0x01881028,         // Address Base
                        0x00000004,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x01881024,         // Address Base
                        0x00000004,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0188101C,         // Address Base
                        0x00000004,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0188103C,         // Address Base
                        0x00000004,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0188200C,         // Address Base
                        0x00000004,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.SPSS._CRS.RBUF */
            }
        }

        Device (TFTP)
        {
            Name (_HID, "QCOM1ADC")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.IPC0
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (QCSK)
        {
            Name (_HID, "QCOM1AAC")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Scope (\_SB.NSP0)
        {
            Name (_CID, "QCOMFFE7")  // _CID: Compatible ID
        }

        Device (LLC)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_HID, "QCOM1A83")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Alias (\_SB.SVMJ, _HRV)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x09600000,         // Address Base
                        0x00050000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0x01FC8088,         // Address Base
                        0x00000004,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000266,
                    }
                })
            }
        }

        Device (MMU0)
        {
            Name (_HID, "QCOM1A09")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Alias (\_SB.SVMJ, _HRV)
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x15000000,         // Address Base
                        0x00100000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000081,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000082,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000083,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000084,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000085,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000086,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000087,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000088,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000089,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000008A,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000008B,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000008C,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000008D,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000008E,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000008F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000090,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000091,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000092,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000093,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000094,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000095,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000096,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000D5,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000D6,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000D7,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000D8,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000D9,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000DA,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000DB,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000DC,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000DD,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000DE,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000DF,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000E0,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000015B,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000015C,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000015D,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000015E,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000015F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000160,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000161,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000162,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000163,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000164,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000165,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000166,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000167,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000168,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000169,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000016A,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000016B,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000016C,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000016D,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000016E,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000016F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000170,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000171,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000172,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000173,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000174,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000175,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000176,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000177,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000178,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000179,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001AB,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001AC,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001AD,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001AE,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001AF,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001B0,
                    }
                })
            }
        }

        Device (MMU1)
        {
            Name (_HID, "QCOM1A09")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Alias (\_SB.SVMJ, _HRV)
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x03DA0000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002C8,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002C9,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002CA,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002CB,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002CC,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002CD,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002CE,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002CF,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002D0,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002DF,
                    }
                })
            }
        }

        Device (IMM0)
        {
            Name (_HID, "QCOM1A8F")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (IMM1)
        {
            Name (_HID, "QCOM1A8F")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, One)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (DISP)
        {
            Name (_HID, "MSHW1004")  // _HID: Hardware ID
        }

        Device (GPU0)
        {
            Name (_HID, "QCOM1A36")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CLS, 0x0003000000000000)  // _CLS: Class Code
            Device (MON0)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PLD, Package (One)  // _PLD: Physical Location of Device
                {
                    Buffer (0x14)
                    {
                        /* 0000 */  0x02, 0xFF, 0x00, 0xFF, 0x7C, 0x0B, 0x94, 0x07,  // ....|...
                        /* 0008 */  0x41, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // A.......
                        /* 0010 */  0x1E, 0x00, 0x1E, 0x00                           // ....
                    }
                })
            }

            Device (MON1)
            {
                Method (_ADR, 0, NotSerialized)  // _ADR: Address
                {
                    Return (One)
                }

                Name (_PLD, Package (One)  // _PLD: Physical Location of Device
                {
                    Buffer (0x14)
                    {
                        /* 0000 */  0x02, 0xFF, 0x00, 0xFF, 0x7C, 0x0B, 0x94, 0x07,  // ....|...
                        /* 0008 */  0x61, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // a.......
                        /* 0010 */  0x1E, 0x00, 0x1E, 0x00                           // ....
                    }
                })
            }

            Name (_DEP, Package (0x0B)  // _DEP: Dependencies
            {
                \_SB.MMU0, 
                \_SB.MMU1, 
                \_SB.IMM0, 
                \_SB.IMM1, 
                \_SB.PEP0, 
                \_SB.PMIC, 
                \_SB.PILC, 
                \_SB.RPEN, 
                \_SB.TREE, 
                \_SB.SCM0, 
                \_SB.DISP
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (ABUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0AE00000,         // Address Base
                        0x00200000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x088E0000,         // Address Base
                        0x00034000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000073,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000375,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000036E,
                    }
                    Memory32Fixed (ReadWrite,
                        0x03D00000,         // Address Base
                        0x0003F010,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x03D60000,         // Address Base
                        0x0003F000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000014C,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000014D,
                    }
                    Memory32Fixed (ReadWrite,
                        0x0B290000,         // Address Base
                        0x00010000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0B490000,         // Address Base
                        0x00010000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x03D90000,         // Address Base
                        0x00009000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x03DE0000,         // Address Base
                        0x00010000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0C200000,         // Address Base
                        0x0000FFFF,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AA00000,         // Address Base
                        0x00200000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x000000CE,
                    }
                })
                Return (ABUF) /* \_SB_.GPU0._CRS.ABUF */
            }

            Method (RESI, 0, NotSerialized)
            {
                Name (AINF, Package (0x14)
                {
                    0x03, 
                    Zero, 
                    Package (0x03)
                    {
                        "RESOURCE", 
                        "MDP_REGS", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "DP_PHY_REGS", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "VSYNC_INTERRUPT", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "USB4_DP_AP_0_INTERRUPT", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "USB4_DP_AP_1_INTERRUPT", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GFX_REGS", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GFX_REG_CONT", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GFX_INTERRUPT", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GFX_LPAC_INTERRUPT", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GPU_PDC_SEQ_MEM", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GPU_PDC_REGS", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GPU_CC", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GPU_RSCC", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "GPU_RPMH_CPRF", 
                        "GRAPHICS"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "VIDEO_REGS", 
                        "VIDEO"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "VIDC_INTERRUPT", 
                        "VIDEO"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "DSI_PANEL_RESET", 
                        "DISPLAY"
                    }, 

                    Package (0x03)
                    {
                        "RESOURCE", 
                        "DSI_PANEL2_RESET", 
                        "DISPLAY"
                    }
                })
                Return (AINF) /* \_SB_.GPU0.RESI.AINF */
            }

            Method (_ROM, 3, NotSerialized)  // _ROM: Read-Only Memory
            {
                Name (PCFG, Buffer (0x13A3)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D,  // PanelNam
                    /* 0030 */  0x65, 0x3E, 0x53, 0x75, 0x72, 0x66, 0x61, 0x63,  // e>Surfac
                    /* 0038 */  0x65, 0x5F, 0x45, 0x6C, 0x67, 0x69, 0x6E, 0x5F,  // e_Elgin_
                    /* 0040 */  0x50, 0x72, 0x69, 0x6D, 0x61, 0x72, 0x79, 0x20,  // Primary 
                    /* 0048 */  0x4D, 0x50, 0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65,  // MP</Pane
                    /* 0050 */  0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E, 0x0A, 0x3C,  // lName>.<
                    /* 0058 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x44, 0x65, 0x73,  // PanelDes
                    /* 0060 */  0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E,  // cription
                    /* 0068 */  0x3E, 0x45, 0x6C, 0x67, 0x69, 0x6E, 0x20, 0x44,  // >Elgin D
                    /* 0070 */  0x53, 0x49, 0x20, 0x50, 0x72, 0x69, 0x6D, 0x61,  // SI Prima
                    /* 0078 */  0x72, 0x79, 0x20, 0x43, 0x6D, 0x64, 0x20, 0x4D,  // ry Cmd M
                    /* 0080 */  0x6F, 0x64, 0x65, 0x20, 0x41, 0x4D, 0x4F, 0x4C,  // ode AMOL
                    /* 0088 */  0x45, 0x44, 0x20, 0x50, 0x61, 0x6E, 0x65, 0x6C,  // ED Panel
                    /* 0090 */  0x20, 0x77, 0x69, 0x74, 0x68, 0x20, 0x44, 0x53,  //  with DS
                    /* 0098 */  0x43, 0x20, 0x4D, 0x50, 0x20, 0x28, 0x31, 0x33,  // C MP (13
                    /* 00A0 */  0x34, 0x34, 0x78, 0x31, 0x38, 0x39, 0x32, 0x20,  // 44x1892 
                    /* 00A8 */  0x32, 0x34, 0x62, 0x70, 0x70, 0x29, 0x3C, 0x2F,  // 24bpp)</
                    /* 00B0 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x44, 0x65, 0x73,  // PanelDes
                    /* 00B8 */  0x63, 0x72, 0x69, 0x70, 0x74, 0x69, 0x6F, 0x6E,  // cription
                    /* 00C0 */  0x3E, 0x0A, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70,  // >.<Group
                    /* 00C8 */  0x20, 0x69, 0x64, 0x3D, 0x27, 0x41, 0x63, 0x74,  //  id='Act
                    /* 00D0 */  0x69, 0x76, 0x65, 0x20, 0x54, 0x69, 0x6D, 0x69,  // ive Timi
                    /* 00D8 */  0x6E, 0x67, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ng'>.  <
                    /* 00E0 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 00E8 */  0x75, 0x72, 0x65, 0x49, 0x44, 0x3E, 0x30, 0x78,  // ureID>0x
                    /* 00F0 */  0x45, 0x34, 0x33, 0x30, 0x3C, 0x2F, 0x4D, 0x61,  // E430</Ma
                    /* 00F8 */  0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72,  // nufactur
                    /* 0100 */  0x65, 0x49, 0x44, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // eID>.  <
                    /* 0108 */  0x50, 0x72, 0x6F, 0x64, 0x75, 0x63, 0x74, 0x43,  // ProductC
                    /* 0110 */  0x6F, 0x64, 0x65, 0x3E, 0x30, 0x78, 0x41, 0x39,  // ode>0xA9
                    /* 0118 */  0x39, 0x30, 0x3C, 0x2F, 0x50, 0x72, 0x6F, 0x64,  // 90</Prod
                    /* 0120 */  0x75, 0x63, 0x74, 0x43, 0x6F, 0x64, 0x65, 0x3E,  // uctCode>
                    /* 0128 */  0x0A, 0x20, 0x20, 0x3C, 0x53, 0x65, 0x72, 0x69,  // .  <Seri
                    /* 0130 */  0x61, 0x6C, 0x4E, 0x75, 0x6D, 0x62, 0x65, 0x72,  // alNumber
                    /* 0138 */  0x3E, 0x30, 0x78, 0x30, 0x30, 0x30, 0x30, 0x30,  // >0x00000
                    /* 0140 */  0x31, 0x3C, 0x2F, 0x53, 0x65, 0x72, 0x69, 0x61,  // 1</Seria
                    /* 0148 */  0x6C, 0x4E, 0x75, 0x6D, 0x62, 0x65, 0x72, 0x3E,  // lNumber>
                    /* 0150 */  0x0A, 0x20, 0x20, 0x3C, 0x57, 0x65, 0x65, 0x6B,  // .  <Week
                    /* 0158 */  0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61,  // ofManufa
                    /* 0160 */  0x63, 0x74, 0x75, 0x72, 0x65, 0x3E, 0x30, 0x78,  // cture>0x
                    /* 0168 */  0x30, 0x31, 0x3C, 0x2F, 0x57, 0x65, 0x65, 0x6B,  // 01</Week
                    /* 0170 */  0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61,  // ofManufa
                    /* 0178 */  0x63, 0x74, 0x75, 0x72, 0x65, 0x3E, 0x0A, 0x20,  // cture>. 
                    /* 0180 */  0x20, 0x3C, 0x59, 0x65, 0x61, 0x72, 0x6F, 0x66,  //  <Yearof
                    /* 0188 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 0190 */  0x75, 0x72, 0x65, 0x3E, 0x30, 0x78, 0x31, 0x45,  // ure>0x1E
                    /* 0198 */  0x3C, 0x2F, 0x59, 0x65, 0x61, 0x72, 0x6F, 0x66,  // </Yearof
                    /* 01A0 */  0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63, 0x74,  // Manufact
                    /* 01A8 */  0x75, 0x72, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ure>.  <
                    /* 01B0 */  0x45, 0x44, 0x49, 0x44, 0x56, 0x65, 0x72, 0x73,  // EDIDVers
                    /* 01B8 */  0x69, 0x6F, 0x6E, 0x3E, 0x31, 0x3C, 0x2F, 0x45,  // ion>1</E
                    /* 01C0 */  0x44, 0x49, 0x44, 0x56, 0x65, 0x72, 0x73, 0x69,  // DIDVersi
                    /* 01C8 */  0x6F, 0x6E, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x45,  // on>.  <E
                    /* 01D0 */  0x44, 0x49, 0x44, 0x52, 0x65, 0x76, 0x69, 0x73,  // DIDRevis
                    /* 01D8 */  0x69, 0x6F, 0x6E, 0x3E, 0x34, 0x3C, 0x2F, 0x45,  // ion>4</E
                    /* 01E0 */  0x44, 0x49, 0x44, 0x52, 0x65, 0x76, 0x69, 0x73,  // DIDRevis
                    /* 01E8 */  0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ion>.  <
                    /* 01F0 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 01F8 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 0200 */  0x53, 0x69, 0x7A, 0x65, 0x3E, 0x30, 0x78, 0x30,  // Size>0x0
                    /* 0208 */  0x38, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A,  // 8</Horiz
                    /* 0210 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x63, 0x72,  // ontalScr
                    /* 0218 */  0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65, 0x3E,  // eenSize>
                    /* 0220 */  0x0A, 0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74,  // .  <Vert
                    /* 0228 */  0x69, 0x63, 0x61, 0x6C, 0x53, 0x63, 0x72, 0x65,  // icalScre
                    /* 0230 */  0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65, 0x3E, 0x30,  // enSize>0
                    /* 0238 */  0x78, 0x30, 0x42, 0x3C, 0x2F, 0x56, 0x65, 0x72,  // x0B</Ver
                    /* 0240 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x63, 0x72,  // ticalScr
                    /* 0248 */  0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65, 0x3E,  // eenSize>
                    /* 0250 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x69, 0x73, 0x70,  // .  <Disp
                    /* 0258 */  0x6C, 0x61, 0x79, 0x54, 0x72, 0x61, 0x6E, 0x73,  // layTrans
                    /* 0260 */  0x66, 0x65, 0x72, 0x43, 0x68, 0x61, 0x72, 0x61,  // ferChara
                    /* 0268 */  0x63, 0x74, 0x65, 0x72, 0x69, 0x73, 0x74, 0x69,  // cteristi
                    /* 0270 */  0x63, 0x73, 0x3E, 0x30, 0x78, 0x37, 0x38, 0x3C,  // cs>0x78<
                    /* 0278 */  0x2F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79,  // /Display
                    /* 0280 */  0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72,  // Transfer
                    /* 0288 */  0x43, 0x68, 0x61, 0x72, 0x61, 0x63, 0x74, 0x65,  // Characte
                    /* 0290 */  0x72, 0x69, 0x73, 0x74, 0x69, 0x63, 0x73, 0x3E,  // ristics>
                    /* 0298 */  0x0A, 0x20, 0x20, 0x3C, 0x46, 0x65, 0x61, 0x74,  // .  <Feat
                    /* 02A0 */  0x75, 0x72, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6F,  // ureSuppo
                    /* 02A8 */  0x72, 0x74, 0x3E, 0x30, 0x78, 0x32, 0x3C, 0x2F,  // rt>0x2</
                    /* 02B0 */  0x46, 0x65, 0x61, 0x74, 0x75, 0x72, 0x65, 0x53,  // FeatureS
                    /* 02B8 */  0x75, 0x70, 0x70, 0x6F, 0x72, 0x74, 0x3E, 0x0A,  // upport>.
                    /* 02C0 */  0x20, 0x20, 0x3C, 0x52, 0x65, 0x64, 0x2E, 0x47,  //   <Red.G
                    /* 02C8 */  0x72, 0x65, 0x65, 0x6E, 0x42, 0x69, 0x74, 0x73,  // reenBits
                    /* 02D0 */  0x3E, 0x30, 0x78, 0x41, 0x34, 0x3C, 0x2F, 0x52,  // >0xA4</R
                    /* 02D8 */  0x65, 0x64, 0x2E, 0x47, 0x72, 0x65, 0x65, 0x6E,  // ed.Green
                    /* 02E0 */  0x42, 0x69, 0x74, 0x73, 0x3E, 0x0A, 0x20, 0x20,  // Bits>.  
                    /* 02E8 */  0x3C, 0x42, 0x6C, 0x75, 0x65, 0x2E, 0x57, 0x68,  // <Blue.Wh
                    /* 02F0 */  0x69, 0x74, 0x65, 0x42, 0x69, 0x74, 0x73, 0x3E,  // iteBits>
                    /* 02F8 */  0x30, 0x78, 0x31, 0x35, 0x3C, 0x2F, 0x42, 0x6C,  // 0x15</Bl
                    /* 0300 */  0x75, 0x65, 0x2E, 0x57, 0x68, 0x69, 0x74, 0x65,  // ue.White
                    /* 0308 */  0x42, 0x69, 0x74, 0x73, 0x3E, 0x0A, 0x20, 0x20,  // Bits>.  
                    /* 0310 */  0x3C, 0x52, 0x65, 0x64, 0x58, 0x3E, 0x30, 0x78,  // <RedX>0x
                    /* 0318 */  0x39, 0x45, 0x3C, 0x2F, 0x52, 0x65, 0x64, 0x58,  // 9E</RedX
                    /* 0320 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x52, 0x65, 0x64,  // >.  <Red
                    /* 0328 */  0x59, 0x3E, 0x30, 0x78, 0x35, 0x35, 0x3C, 0x2F,  // Y>0x55</
                    /* 0330 */  0x52, 0x65, 0x64, 0x59, 0x3E, 0x0A, 0x20, 0x20,  // RedY>.  
                    /* 0338 */  0x3C, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x58, 0x3E,  // <GreenX>
                    /* 0340 */  0x30, 0x78, 0x34, 0x45, 0x3C, 0x2F, 0x47, 0x72,  // 0x4E</Gr
                    /* 0348 */  0x65, 0x65, 0x6E, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // eenX>.  
                    /* 0350 */  0x3C, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x59, 0x3E,  // <GreenY>
                    /* 0358 */  0x30, 0x78, 0x39, 0x42, 0x3C, 0x2F, 0x47, 0x72,  // 0x9B</Gr
                    /* 0360 */  0x65, 0x65, 0x6E, 0x59, 0x3E, 0x0A, 0x20, 0x20,  // eenY>.  
                    /* 0368 */  0x3C, 0x42, 0x6C, 0x75, 0x65, 0x58, 0x3E, 0x30,  // <BlueX>0
                    /* 0370 */  0x78, 0x32, 0x36, 0x3C, 0x2F, 0x42, 0x6C, 0x75,  // x26</Blu
                    /* 0378 */  0x65, 0x58, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x42,  // eX>.  <B
                    /* 0380 */  0x6C, 0x75, 0x65, 0x59, 0x3E, 0x30, 0x78, 0x30,  // lueY>0x0
                    /* 0388 */  0x46, 0x3C, 0x2F, 0x42, 0x6C, 0x75, 0x65, 0x59,  // F</BlueY
                    /* 0390 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x57, 0x68, 0x69,  // >.  <Whi
                    /* 0398 */  0x74, 0x65, 0x58, 0x3E, 0x30, 0x78, 0x35, 0x30,  // teX>0x50
                    /* 03A0 */  0x3C, 0x2F, 0x57, 0x68, 0x69, 0x74, 0x65, 0x58,  // </WhiteX
                    /* 03A8 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x57, 0x68, 0x69,  // >.  <Whi
                    /* 03B0 */  0x74, 0x65, 0x59, 0x3E, 0x30, 0x78, 0x35, 0x34,  // teY>0x54
                    /* 03B8 */  0x3C, 0x2F, 0x57, 0x68, 0x69, 0x74, 0x65, 0x59,  // </WhiteY
                    /* 03C0 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x45, 0x73, 0x74,  // >.  <Est
                    /* 03C8 */  0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65, 0x64,  // ablished
                    /* 03D0 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x49,  // TimingsI
                    /* 03D8 */  0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F, 0x45, 0x73,  // >0x0</Es
                    /* 03E0 */  0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65,  // tablishe
                    /* 03E8 */  0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73,  // dTimings
                    /* 03F0 */  0x49, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x45, 0x73,  // I>.  <Es
                    /* 03F8 */  0x74, 0x61, 0x62, 0x6C, 0x69, 0x73, 0x68, 0x65,  // tablishe
                    /* 0400 */  0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73,  // dTimings
                    /* 0408 */  0x49, 0x49, 0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F,  // II>0x0</
                    /* 0410 */  0x45, 0x73, 0x74, 0x61, 0x62, 0x6C, 0x69, 0x73,  // Establis
                    /* 0418 */  0x68, 0x65, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // hedTimin
                    /* 0420 */  0x67, 0x73, 0x49, 0x49, 0x3E, 0x0A, 0x20, 0x20,  // gsII>.  
                    /* 0428 */  0x3C, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63,  // <Manufac
                    /* 0430 */  0x74, 0x75, 0x72, 0x65, 0x73, 0x54, 0x69, 0x6D,  // turesTim
                    /* 0438 */  0x69, 0x6E, 0x67, 0x3E, 0x30, 0x78, 0x30, 0x3C,  // ing>0x0<
                    /* 0440 */  0x2F, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61, 0x63,  // /Manufac
                    /* 0448 */  0x74, 0x75, 0x72, 0x65, 0x73, 0x54, 0x69, 0x6D,  // turesTim
                    /* 0450 */  0x69, 0x6E, 0x67, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ing>.  <
                    /* 0458 */  0x53, 0x74, 0x61, 0x6E, 0x64, 0x61, 0x72, 0x64,  // Standard
                    /* 0460 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x31,  // Timings1
                    /* 0468 */  0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x53, 0x74,  // />.  <St
                    /* 0470 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 0478 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x32, 0x2F, 0x3E,  // mings2/>
                    /* 0480 */  0x0A, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  // .  <Stan
                    /* 0488 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 0490 */  0x6E, 0x67, 0x73, 0x33, 0x2F, 0x3E, 0x0A, 0x20,  // ngs3/>. 
                    /* 0498 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 04A0 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 04A8 */  0x73, 0x34, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // s4/>.  <
                    /* 04B0 */  0x53, 0x74, 0x61, 0x6E, 0x64, 0x61, 0x72, 0x64,  // Standard
                    /* 04B8 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x35,  // Timings5
                    /* 04C0 */  0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x53, 0x74,  // />.  <St
                    /* 04C8 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 04D0 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x36, 0x2F, 0x3E,  // mings6/>
                    /* 04D8 */  0x0A, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  // .  <Stan
                    /* 04E0 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 04E8 */  0x6E, 0x67, 0x73, 0x37, 0x2F, 0x3E, 0x0A, 0x20,  // ngs7/>. 
                    /* 04F0 */  0x20, 0x3C, 0x53, 0x69, 0x67, 0x6E, 0x61, 0x6C,  //  <Signal
                    /* 04F8 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x49, 0x6E,  // TimingIn
                    /* 0500 */  0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x2F,  // terface/
                    /* 0508 */  0x3E, 0x0A, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  // >.</Grou
                    /* 0510 */  0x70, 0x3E, 0x0A, 0x3C, 0x47, 0x72, 0x6F, 0x75,  // p>.<Grou
                    /* 0518 */  0x70, 0x20, 0x69, 0x64, 0x3D, 0x27, 0x44, 0x65,  // p id='De
                    /* 0520 */  0x74, 0x61, 0x69, 0x6C, 0x65, 0x64, 0x20, 0x54,  // tailed T
                    /* 0528 */  0x69, 0x6D, 0x69, 0x6E, 0x67, 0x27, 0x3E, 0x0A,  // iming'>.
                    /* 0530 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 0538 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x63, 0x72,  // ontalScr
                    /* 0540 */  0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65, 0x4D,  // eenSizeM
                    /* 0548 */  0x4D, 0x3E, 0x30, 0x78, 0x35, 0x35, 0x3C, 0x2F,  // M>0x55</
                    /* 0550 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 0558 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 0560 */  0x53, 0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x0A,  // SizeMM>.
                    /* 0568 */  0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69,  //   <Verti
                    /* 0570 */  0x63, 0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65,  // calScree
                    /* 0578 */  0x6E, 0x53, 0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E,  // nSizeMM>
                    /* 0580 */  0x30, 0x78, 0x37, 0x33, 0x3C, 0x2F, 0x56, 0x65,  // 0x73</Ve
                    /* 0588 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x63,  // rticalSc
                    /* 0590 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 0598 */  0x4D, 0x4D, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x48,  // MM>.  <H
                    /* 05A0 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 05A8 */  0x6C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // lVertica
                    /* 05B0 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 05B8 */  0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x30, 0x78,  // izeMM>0x
                    /* 05C0 */  0x30, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // 00</Hori
                    /* 05C8 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x56, 0x65,  // zontalVe
                    /* 05D0 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x63,  // rticalSc
                    /* 05D8 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 05E0 */  0x4D, 0x4D, 0x3E, 0x0A, 0x3C, 0x2F, 0x47, 0x72,  // MM>.</Gr
                    /* 05E8 */  0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C, 0x47, 0x72,  // oup>.<Gr
                    /* 05F0 */  0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27,  // oup id='
                    /* 05F8 */  0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x20, 0x54,  // Active T
                    /* 0600 */  0x69, 0x6D, 0x69, 0x6E, 0x67, 0x27, 0x3E, 0x0A,  // iming'>.
                    /* 0608 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 0610 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x41, 0x63, 0x74,  // ontalAct
                    /* 0618 */  0x69, 0x76, 0x65, 0x3E, 0x31, 0x33, 0x34, 0x34,  // ive>1344
                    /* 0620 */  0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F,  // </Horizo
                    /* 0628 */  0x6E, 0x74, 0x61, 0x6C, 0x41, 0x63, 0x74, 0x69,  // ntalActi
                    /* 0630 */  0x76, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x56,  // ve>.  <V
                    /* 0638 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x41,  // erticalA
                    /* 0640 */  0x63, 0x74, 0x69, 0x76, 0x65, 0x3E, 0x31, 0x38,  // ctive>18
                    /* 0648 */  0x39, 0x32, 0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74,  // 92</Vert
                    /* 0650 */  0x69, 0x63, 0x61, 0x6C, 0x41, 0x63, 0x74, 0x69,  // icalActi
                    /* 0658 */  0x76, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x48,  // ve>.  <H
                    /* 0660 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0668 */  0x6C, 0x4C, 0x65, 0x66, 0x74, 0x42, 0x6F, 0x72,  // lLeftBor
                    /* 0670 */  0x64, 0x65, 0x72, 0x3E, 0x30, 0x3C, 0x2F, 0x48,  // der>0</H
                    /* 0678 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0680 */  0x6C, 0x4C, 0x65, 0x66, 0x74, 0x42, 0x6F, 0x72,  // lLeftBor
                    /* 0688 */  0x64, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // der>.  <
                    /* 0690 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 0698 */  0x61, 0x6C, 0x52, 0x69, 0x67, 0x68, 0x74, 0x42,  // alRightB
                    /* 06A0 */  0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x30, 0x3C,  // order>0<
                    /* 06A8 */  0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E,  // /Horizon
                    /* 06B0 */  0x74, 0x61, 0x6C, 0x52, 0x69, 0x67, 0x68, 0x74,  // talRight
                    /* 06B8 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A,  // Border>.
                    /* 06C0 */  0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69,  //   <Verti
                    /* 06C8 */  0x63, 0x61, 0x6C, 0x54, 0x6F, 0x70, 0x42, 0x6F,  // calTopBo
                    /* 06D0 */  0x72, 0x64, 0x65, 0x72, 0x3E, 0x30, 0x3C, 0x2F,  // rder>0</
                    /* 06D8 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 06E0 */  0x54, 0x6F, 0x70, 0x42, 0x6F, 0x72, 0x64, 0x65,  // TopBorde
                    /* 06E8 */  0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x56, 0x65,  // r>.  <Ve
                    /* 06F0 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x42, 0x6F,  // rticalBo
                    /* 06F8 */  0x74, 0x74, 0x6F, 0x6D, 0x42, 0x6F, 0x72, 0x64,  // ttomBord
                    /* 0700 */  0x65, 0x72, 0x3E, 0x30, 0x3C, 0x2F, 0x56, 0x65,  // er>0</Ve
                    /* 0708 */  0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x42, 0x6F,  // rticalBo
                    /* 0710 */  0x74, 0x74, 0x6F, 0x6D, 0x42, 0x6F, 0x72, 0x64,  // ttomBord
                    /* 0718 */  0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x42,  // er>.  <B
                    /* 0720 */  0x6F, 0x72, 0x64, 0x65, 0x72, 0x43, 0x6F, 0x6C,  // orderCol
                    /* 0728 */  0x6F, 0x72, 0x3E, 0x30, 0x78, 0x30, 0x3C, 0x2F,  // or>0x0</
                    /* 0730 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x43, 0x6F,  // BorderCo
                    /* 0738 */  0x6C, 0x6F, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // lor>.  <
                    /* 0740 */  0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x44, 0x61,  // InvertDa
                    /* 0748 */  0x74, 0x61, 0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69,  // taPolari
                    /* 0750 */  0x74, 0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65,  // ty>False
                    /* 0758 */  0x3C, 0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74,  // </Invert
                    /* 0760 */  0x44, 0x61, 0x74, 0x61, 0x50, 0x6F, 0x6C, 0x61,  // DataPola
                    /* 0768 */  0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20,  // rity>.  
                    /* 0770 */  0x3C, 0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x56,  // <InvertV
                    /* 0778 */  0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61,  // syncPola
                    /* 0780 */  0x69, 0x72, 0x74, 0x79, 0x3E, 0x46, 0x61, 0x6C,  // irty>Fal
                    /* 0788 */  0x73, 0x65, 0x3C, 0x2F, 0x49, 0x6E, 0x76, 0x65,  // se</Inve
                    /* 0790 */  0x72, 0x74, 0x56, 0x73, 0x79, 0x6E, 0x63, 0x50,  // rtVsyncP
                    /* 0798 */  0x6F, 0x6C, 0x61, 0x69, 0x72, 0x74, 0x79, 0x3E,  // olairty>
                    /* 07A0 */  0x0A, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x76, 0x65,  // .  <Inve
                    /* 07A8 */  0x72, 0x74, 0x48, 0x73, 0x79, 0x6E, 0x63, 0x50,  // rtHsyncP
                    /* 07B0 */  0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E,  // olarity>
                    /* 07B8 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x49,  // False</I
                    /* 07C0 */  0x6E, 0x76, 0x65, 0x72, 0x74, 0x48, 0x73, 0x79,  // nvertHsy
                    /* 07C8 */  0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69,  // ncPolari
                    /* 07D0 */  0x74, 0x79, 0x3E, 0x0A, 0x3C, 0x2F, 0x47, 0x72,  // ty>.</Gr
                    /* 07D8 */  0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C, 0x47, 0x72,  // oup>.<Gr
                    /* 07E0 */  0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27,  // oup id='
                    /* 07E8 */  0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x20,  // Display 
                    /* 07F0 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 07F8 */  0x65, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x49,  // e'>.  <I
                    /* 0800 */  0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65,  // nterface
                    /* 0808 */  0x54, 0x79, 0x70, 0x65, 0x3E, 0x39, 0x3C, 0x2F,  // Type>9</
                    /* 0810 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 0818 */  0x65, 0x54, 0x79, 0x70, 0x65, 0x3E, 0x0A, 0x20,  // eType>. 
                    /* 0820 */  0x20, 0x3C, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  //  <Interf
                    /* 0828 */  0x61, 0x63, 0x65, 0x43, 0x6F, 0x6C, 0x6F, 0x72,  // aceColor
                    /* 0830 */  0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x3E, 0x33,  // Format>3
                    /* 0838 */  0x3C, 0x2F, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  // </Interf
                    /* 0840 */  0x61, 0x63, 0x65, 0x43, 0x6F, 0x6C, 0x6F, 0x72,  // aceColor
                    /* 0848 */  0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x3E, 0x0A,  // Format>.
                    /* 0850 */  0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E,  // </Group>
                    /* 0858 */  0x0A, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20,  // .<Group 
                    /* 0860 */  0x69, 0x64, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x20,  // id='DSI 
                    /* 0868 */  0x49, 0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63,  // Interfac
                    /* 0870 */  0x65, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // e'>.  <D
                    /* 0878 */  0x53, 0x49, 0x43, 0x68, 0x61, 0x6E, 0x6E, 0x65,  // SIChanne
                    /* 0880 */  0x6C, 0x49, 0x64, 0x3E, 0x32, 0x3C, 0x2F, 0x44,  // lId>2</D
                    /* 0888 */  0x53, 0x49, 0x43, 0x68, 0x61, 0x6E, 0x6E, 0x65,  // SIChanne
                    /* 0890 */  0x6C, 0x49, 0x64, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // lId>.  <
                    /* 0898 */  0x44, 0x53, 0x49, 0x56, 0x69, 0x72, 0x74, 0x75,  // DSIVirtu
                    /* 08A0 */  0x61, 0x6C, 0x49, 0x64, 0x3E, 0x30, 0x3C, 0x2F,  // alId>0</
                    /* 08A8 */  0x44, 0x53, 0x49, 0x56, 0x69, 0x72, 0x74, 0x75,  // DSIVirtu
                    /* 08B0 */  0x61, 0x6C, 0x49, 0x64, 0x3E, 0x0A, 0x20, 0x20,  // alId>.  
                    /* 08B8 */  0x3C, 0x44, 0x53, 0x49, 0x43, 0x6F, 0x6C, 0x6F,  // <DSIColo
                    /* 08C0 */  0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x3E,  // rFormat>
                    /* 08C8 */  0x33, 0x36, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x43,  // 36</DSIC
                    /* 08D0 */  0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72, 0x6D,  // olorForm
                    /* 08D8 */  0x61, 0x74, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // at>.  <D
                    /* 08E0 */  0x53, 0x49, 0x54, 0x72, 0x61, 0x66, 0x66, 0x69,  // SITraffi
                    /* 08E8 */  0x63, 0x4D, 0x6F, 0x64, 0x65, 0x3E, 0x31, 0x3C,  // cMode>1<
                    /* 08F0 */  0x2F, 0x44, 0x53, 0x49, 0x54, 0x72, 0x61, 0x66,  // /DSITraf
                    /* 08F8 */  0x66, 0x69, 0x63, 0x4D, 0x6F, 0x64, 0x65, 0x3E,  // ficMode>
                    /* 0900 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C,  // .  <DSIL
                    /* 0908 */  0x61, 0x6E, 0x65, 0x73, 0x3E, 0x34, 0x3C, 0x2F,  // anes>4</
                    /* 0910 */  0x44, 0x53, 0x49, 0x4C, 0x61, 0x6E, 0x65, 0x73,  // DSILanes
                    /* 0918 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 0920 */  0x48, 0x73, 0x61, 0x48, 0x73, 0x65, 0x41, 0x66,  // HsaHseAf
                    /* 0928 */  0x74, 0x65, 0x72, 0x56, 0x73, 0x56, 0x65, 0x3E,  // terVsVe>
                    /* 0930 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 0938 */  0x53, 0x49, 0x48, 0x73, 0x61, 0x48, 0x73, 0x65,  // SIHsaHse
                    /* 0940 */  0x41, 0x66, 0x74, 0x65, 0x72, 0x56, 0x73, 0x56,  // AfterVsV
                    /* 0948 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // e>.  <DS
                    /* 0950 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0958 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48,  // rModeInH
                    /* 0960 */  0x46, 0x50, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65,  // FP>False
                    /* 0968 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77,  // </DSILow
                    /* 0970 */  0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64,  // PowerMod
                    /* 0978 */  0x65, 0x49, 0x6E, 0x48, 0x46, 0x50, 0x3E, 0x0A,  // eInHFP>.
                    /* 0980 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F,  //   <DSILo
                    /* 0988 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0990 */  0x64, 0x65, 0x49, 0x6E, 0x48, 0x42, 0x50, 0x3E,  // deInHBP>
                    /* 0998 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 09A0 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 09A8 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 09B0 */  0x48, 0x42, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // HBP>.  <
                    /* 09B8 */  0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F,  // DSILowPo
                    /* 09C0 */  0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49,  // werModeI
                    /* 09C8 */  0x6E, 0x48, 0x53, 0x41, 0x3E, 0x46, 0x61, 0x6C,  // nHSA>Fal
                    /* 09D0 */  0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C,  // se</DSIL
                    /* 09D8 */  0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D,  // owPowerM
                    /* 09E0 */  0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x53, 0x41,  // odeInHSA
                    /* 09E8 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 09F0 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 09F8 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C,  // ModeInBL
                    /* 0A00 */  0x4C, 0x50, 0x45, 0x4F, 0x46, 0x3E, 0x54, 0x72,  // LPEOF>Tr
                    /* 0A08 */  0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C,  // ue</DSIL
                    /* 0A10 */  0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D,  // owPowerM
                    /* 0A18 */  0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C,  // odeInBLL
                    /* 0A20 */  0x50, 0x45, 0x4F, 0x46, 0x3E, 0x0A, 0x20, 0x20,  // PEOF>.  
                    /* 0A28 */  0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50,  // <DSILowP
                    /* 0A30 */  0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65,  // owerMode
                    /* 0A38 */  0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50, 0x3E, 0x54,  // InBLLP>T
                    /* 0A40 */  0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // rue</DSI
                    /* 0A48 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 0A50 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42, 0x4C,  // ModeInBL
                    /* 0A58 */  0x4C, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // LP>.  <D
                    /* 0A60 */  0x53, 0x49, 0x52, 0x65, 0x66, 0x72, 0x65, 0x73,  // SIRefres
                    /* 0A68 */  0x68, 0x52, 0x61, 0x74, 0x65, 0x3E, 0x30, 0x78,  // hRate>0x
                    /* 0A70 */  0x33, 0x43, 0x30, 0x30, 0x30, 0x30, 0x3C, 0x2F,  // 3C0000</
                    /* 0A78 */  0x44, 0x53, 0x49, 0x52, 0x65, 0x66, 0x72, 0x65,  // DSIRefre
                    /* 0A80 */  0x73, 0x68, 0x52, 0x61, 0x74, 0x65, 0x3E, 0x0A,  // shRate>.
                    /* 0A88 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x45, 0x6E,  //   <DSIEn
                    /* 0A90 */  0x61, 0x62, 0x6C, 0x65, 0x41, 0x75, 0x74, 0x6F,  // ableAuto
                    /* 0A98 */  0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x3E,  // Refresh>
                    /* 0AA0 */  0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // True</DS
                    /* 0AA8 */  0x49, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65, 0x41,  // IEnableA
                    /* 0AB0 */  0x75, 0x74, 0x6F, 0x52, 0x65, 0x66, 0x72, 0x65,  // utoRefre
                    /* 0AB8 */  0x73, 0x68, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // sh>.  <D
                    /* 0AC0 */  0x53, 0x49, 0x50, 0x68, 0x79, 0x44, 0x43, 0x44,  // SIPhyDCD
                    /* 0AC8 */  0x43, 0x4D, 0x6F, 0x64, 0x65, 0x3E, 0x46, 0x61,  // CMode>Fa
                    /* 0AD0 */  0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // lse</DSI
                    /* 0AD8 */  0x50, 0x68, 0x79, 0x44, 0x43, 0x44, 0x43, 0x4D,  // PhyDCDCM
                    /* 0AE0 */  0x6F, 0x64, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ode>.  <
                    /* 0AE8 */  0x44, 0x53, 0x49, 0x50, 0x61, 0x63, 0x6B, 0x65,  // DSIPacke
                    /* 0AF0 */  0x74, 0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65,  // tTransfe
                    /* 0AF8 */  0x72, 0x48, 0x53, 0x3E, 0x54, 0x72, 0x75, 0x65,  // rHS>True
                    /* 0B00 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x50, 0x61, 0x63,  // </DSIPac
                    /* 0B08 */  0x6B, 0x65, 0x74, 0x54, 0x72, 0x61, 0x6E, 0x73,  // ketTrans
                    /* 0B10 */  0x66, 0x65, 0x72, 0x48, 0x53, 0x3E, 0x0A, 0x20,  // ferHS>. 
                    /* 0B18 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x43, 0x6C, 0x6F,  //  <DSIClo
                    /* 0B20 */  0x63, 0x6B, 0x48, 0x53, 0x46, 0x6F, 0x72, 0x63,  // ckHSForc
                    /* 0B28 */  0x65, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74,  // eRequest
                    /* 0B30 */  0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x43,  // >1</DSIC
                    /* 0B38 */  0x6C, 0x6F, 0x63, 0x6B, 0x48, 0x53, 0x46, 0x6F,  // lockHSFo
                    /* 0B40 */  0x72, 0x63, 0x65, 0x52, 0x65, 0x71, 0x75, 0x65,  // rceReque
                    /* 0B48 */  0x73, 0x74, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // st>.  <D
                    /* 0B50 */  0x53, 0x49, 0x4C, 0x50, 0x31, 0x31, 0x41, 0x74,  // SILP11At
                    /* 0B58 */  0x49, 0x6E, 0x69, 0x74, 0x3E, 0x54, 0x72, 0x75,  // Init>Tru
                    /* 0B60 */  0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C, 0x50,  // e</DSILP
                    /* 0B68 */  0x31, 0x31, 0x41, 0x74, 0x49, 0x6E, 0x69, 0x74,  // 11AtInit
                    /* 0B70 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 0B78 */  0x46, 0x6F, 0x72, 0x63, 0x65, 0x43, 0x6D, 0x64,  // ForceCmd
                    /* 0B80 */  0x49, 0x6E, 0x56, 0x69, 0x64, 0x65, 0x6F, 0x48,  // InVideoH
                    /* 0B88 */  0x53, 0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F,  // S>True</
                    /* 0B90 */  0x44, 0x53, 0x49, 0x46, 0x6F, 0x72, 0x63, 0x65,  // DSIForce
                    /* 0B98 */  0x43, 0x6D, 0x64, 0x49, 0x6E, 0x56, 0x69, 0x64,  // CmdInVid
                    /* 0BA0 */  0x65, 0x6F, 0x48, 0x53, 0x3E, 0x0A, 0x20, 0x20,  // eoHS>.  
                    /* 0BA8 */  0x3C, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x45,  // <DSIDSCE
                    /* 0BB0 */  0x6E, 0x61, 0x62, 0x6C, 0x65, 0x3E, 0x54, 0x72,  // nable>Tr
                    /* 0BB8 */  0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x44,  // ue</DSID
                    /* 0BC0 */  0x53, 0x43, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65,  // SCEnable
                    /* 0BC8 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 0BD0 */  0x44, 0x53, 0x43, 0x4D, 0x61, 0x6A, 0x6F, 0x72,  // DSCMajor
                    /* 0BD8 */  0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x44,  // >1</DSID
                    /* 0BE0 */  0x53, 0x43, 0x4D, 0x61, 0x6A, 0x6F, 0x72, 0x3E,  // SCMajor>
                    /* 0BE8 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x44,  // .  <DSID
                    /* 0BF0 */  0x53, 0x43, 0x4D, 0x69, 0x6E, 0x6F, 0x72, 0x3E,  // SCMinor>
                    /* 0BF8 */  0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x44, 0x53,  // 1</DSIDS
                    /* 0C00 */  0x43, 0x4D, 0x69, 0x6E, 0x6F, 0x72, 0x3E, 0x0A,  // CMinor>.
                    /* 0C08 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x44, 0x53,  //   <DSIDS
                    /* 0C10 */  0x43, 0x53, 0x63, 0x72, 0x3E, 0x30, 0x3C, 0x2F,  // CScr>0</
                    /* 0C18 */  0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x53, 0x63,  // DSIDSCSc
                    /* 0C20 */  0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // r>.  <DS
                    /* 0C28 */  0x49, 0x44, 0x53, 0x43, 0x50, 0x72, 0x6F, 0x66,  // IDSCProf
                    /* 0C30 */  0x69, 0x6C, 0x65, 0x49, 0x44, 0x3E, 0x34, 0x3C,  // ileID>4<
                    /* 0C38 */  0x2F, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x50,  // /DSIDSCP
                    /* 0C40 */  0x72, 0x6F, 0x66, 0x69, 0x6C, 0x65, 0x49, 0x44,  // rofileID
                    /* 0C48 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 0C50 */  0x54, 0x45, 0x43, 0x68, 0x65, 0x63, 0x6B, 0x45,  // TECheckE
                    /* 0C58 */  0x6E, 0x61, 0x62, 0x6C, 0x65, 0x3E, 0x54, 0x72,  // nable>Tr
                    /* 0C60 */  0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x54,  // ue</DSIT
                    /* 0C68 */  0x45, 0x43, 0x68, 0x65, 0x63, 0x6B, 0x45, 0x6E,  // ECheckEn
                    /* 0C70 */  0x61, 0x62, 0x6C, 0x65, 0x3E, 0x0A, 0x20, 0x20,  // able>.  
                    /* 0C78 */  0x3C, 0x44, 0x53, 0x49, 0x54, 0x45, 0x55, 0x73,  // <DSITEUs
                    /* 0C80 */  0x69, 0x6E, 0x67, 0x44, 0x65, 0x64, 0x69, 0x63,  // ingDedic
                    /* 0C88 */  0x61, 0x74, 0x65, 0x64, 0x54, 0x45, 0x50, 0x69,  // atedTEPi
                    /* 0C90 */  0x6E, 0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F,  // n>True</
                    /* 0C98 */  0x44, 0x53, 0x49, 0x54, 0x45, 0x55, 0x73, 0x69,  // DSITEUsi
                    /* 0CA0 */  0x6E, 0x67, 0x44, 0x65, 0x64, 0x69, 0x63, 0x61,  // ngDedica
                    /* 0CA8 */  0x74, 0x65, 0x64, 0x54, 0x45, 0x50, 0x69, 0x6E,  // tedTEPin
                    /* 0CB0 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 0CB8 */  0x54, 0x45, 0x76, 0x53, 0x79, 0x6E, 0x63, 0x53,  // TEvSyncS
                    /* 0CC0 */  0x65, 0x6C, 0x65, 0x63, 0x74, 0x3E, 0x30, 0x3C,  // elect>0<
                    /* 0CC8 */  0x2F, 0x44, 0x53, 0x49, 0x54, 0x45, 0x76, 0x53,  // /DSITEvS
                    /* 0CD0 */  0x79, 0x6E, 0x63, 0x53, 0x65, 0x6C, 0x65, 0x63,  // yncSelec
                    /* 0CD8 */  0x74, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // t>.  <DS
                    /* 0CE0 */  0x49, 0x54, 0x45, 0x76, 0x53, 0x79, 0x6E, 0x63,  // ITEvSync
                    /* 0CE8 */  0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x6F, 0x73,  // StartPos
                    /* 0CF0 */  0x3E, 0x31, 0x38, 0x39, 0x32, 0x3C, 0x2F, 0x44,  // >1892</D
                    /* 0CF8 */  0x53, 0x49, 0x54, 0x45, 0x76, 0x53, 0x79, 0x6E,  // SITEvSyn
                    /* 0D00 */  0x63, 0x53, 0x74, 0x61, 0x72, 0x74, 0x50, 0x6F,  // cStartPo
                    /* 0D08 */  0x73, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // s>.  <DS
                    /* 0D10 */  0x49, 0x54, 0x45, 0x76, 0x53, 0x79, 0x6E, 0x63,  // ITEvSync
                    /* 0D18 */  0x49, 0x6E, 0x69, 0x74, 0x56, 0x61, 0x6C, 0x3E,  // InitVal>
                    /* 0D20 */  0x31, 0x38, 0x39, 0x32, 0x3C, 0x2F, 0x44, 0x53,  // 1892</DS
                    /* 0D28 */  0x49, 0x54, 0x45, 0x76, 0x53, 0x79, 0x6E, 0x63,  // ITEvSync
                    /* 0D30 */  0x49, 0x6E, 0x69, 0x74, 0x56, 0x61, 0x6C, 0x3E,  // InitVal>
                    /* 0D38 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x44,  // .  <DSID
                    /* 0D40 */  0x53, 0x43, 0x53, 0x6C, 0x69, 0x63, 0x65, 0x57,  // SCSliceW
                    /* 0D48 */  0x69, 0x64, 0x74, 0x68, 0x3E, 0x36, 0x37, 0x32,  // idth>672
                    /* 0D50 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43,  // </DSIDSC
                    /* 0D58 */  0x53, 0x6C, 0x69, 0x63, 0x65, 0x57, 0x69, 0x64,  // SliceWid
                    /* 0D60 */  0x74, 0x68, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // th>.  <D
                    /* 0D68 */  0x53, 0x49, 0x44, 0x53, 0x43, 0x53, 0x6C, 0x69,  // SIDSCSli
                    /* 0D70 */  0x63, 0x65, 0x48, 0x65, 0x69, 0x67, 0x68, 0x74,  // ceHeight
                    /* 0D78 */  0x3E, 0x39, 0x34, 0x36, 0x3C, 0x2F, 0x44, 0x53,  // >946</DS
                    /* 0D80 */  0x49, 0x44, 0x53, 0x43, 0x53, 0x6C, 0x69, 0x63,  // IDSCSlic
                    /* 0D88 */  0x65, 0x48, 0x65, 0x69, 0x67, 0x68, 0x74, 0x3E,  // eHeight>
                    /* 0D90 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x42,  // .  <DSIB
                    /* 0D98 */  0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46,  // itClockF
                    /* 0DA0 */  0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79,  // requency
                    /* 0DA8 */  0x3E, 0x37, 0x36, 0x30, 0x30, 0x30, 0x30, 0x30,  // >7600000
                    /* 0DB0 */  0x30, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x42,  // 00</DSIB
                    /* 0DB8 */  0x69, 0x74, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x46,  // itClockF
                    /* 0DC0 */  0x72, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x79,  // requency
                    /* 0DC8 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x69, 0x73,  // >.  <Dis
                    /* 0DD0 */  0x70, 0x6C, 0x61, 0x79, 0x50, 0x72, 0x69, 0x6D,  // playPrim
                    /* 0DD8 */  0x61, 0x72, 0x79, 0x46, 0x6C, 0x61, 0x67, 0x73,  // aryFlags
                    /* 0DE0 */  0x3E, 0x30, 0x78, 0x30, 0x30, 0x30, 0x30, 0x30,  // >0x00000
                    /* 0DE8 */  0x30, 0x30, 0x30, 0x3C, 0x2F, 0x44, 0x69, 0x73,  // 000</Dis
                    /* 0DF0 */  0x70, 0x6C, 0x61, 0x79, 0x50, 0x72, 0x69, 0x6D,  // playPrim
                    /* 0DF8 */  0x61, 0x72, 0x79, 0x46, 0x6C, 0x61, 0x67, 0x73,  // aryFlags
                    /* 0E00 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 0E08 */  0x4E, 0x75, 0x6C, 0x6C, 0x70, 0x61, 0x63, 0x6B,  // Nullpack
                    /* 0E10 */  0x65, 0x74, 0x49, 0x6E, 0x73, 0x65, 0x72, 0x74,  // etInsert
                    /* 0E18 */  0x69, 0x6F, 0x6E, 0x42, 0x79, 0x74, 0x65, 0x73,  // ionBytes
                    /* 0E20 */  0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4E,  // >1</DSIN
                    /* 0E28 */  0x75, 0x6C, 0x6C, 0x70, 0x61, 0x63, 0x6B, 0x65,  // ullpacke
                    /* 0E30 */  0x74, 0x49, 0x6E, 0x73, 0x65, 0x72, 0x74, 0x69,  // tInserti
                    /* 0E38 */  0x6F, 0x6E, 0x42, 0x79, 0x74, 0x65, 0x73, 0x3E,  // onBytes>
                    /* 0E40 */  0x0A, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70,  // .</Group
                    /* 0E48 */  0x3E, 0x0A, 0x3C, 0x44, 0x53, 0x49, 0x43, 0x6F,  // >.<DSICo
                    /* 0E50 */  0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x6C, 0x65, 0x72,  // ntroller
                    /* 0E58 */  0x4D, 0x61, 0x70, 0x70, 0x69, 0x6E, 0x67, 0x3E,  // Mapping>
                    /* 0E60 */  0x0A, 0x20, 0x20, 0x30, 0x30, 0x0A, 0x3C, 0x2F,  // .  00.</
                    /* 0E68 */  0x44, 0x53, 0x49, 0x43, 0x6F, 0x6E, 0x74, 0x72,  // DSIContr
                    /* 0E70 */  0x6F, 0x6C, 0x6C, 0x65, 0x72, 0x4D, 0x61, 0x70,  // ollerMap
                    /* 0E78 */  0x70, 0x69, 0x6E, 0x67, 0x3E, 0x0A, 0x3C, 0x44,  // ping>.<D
                    /* 0E80 */  0x53, 0x49, 0x49, 0x6E, 0x69, 0x74, 0x53, 0x65,  // SIInitSe
                    /* 0E88 */  0x71, 0x75, 0x65, 0x6E, 0x63, 0x65, 0x3E, 0x0A,  // quence>.
                    /* 0E90 */  0x20, 0x20, 0x33, 0x39, 0x20, 0x37, 0x46, 0x20,  //   39 7F 
                    /* 0E98 */  0x35, 0x41, 0x20, 0x35, 0x41, 0x0A, 0x09, 0x33,  // 5A 5A..3
                    /* 0EA0 */  0x39, 0x20, 0x46, 0x30, 0x20, 0x35, 0x41, 0x20,  // 9 F0 5A 
                    /* 0EA8 */  0x35, 0x41, 0x0A, 0x20, 0x20, 0x33, 0x39, 0x20,  // 5A.  39 
                    /* 0EB0 */  0x46, 0x31, 0x20, 0x35, 0x41, 0x20, 0x35, 0x41,  // F1 5A 5A
                    /* 0EB8 */  0x0A, 0x09, 0x33, 0x39, 0x20, 0x46, 0x32, 0x20,  // ..39 F2 
                    /* 0EC0 */  0x35, 0x41, 0x20, 0x35, 0x41, 0x0A, 0x09, 0x33,  // 5A 5A..3
                    /* 0EC8 */  0x39, 0x20, 0x45, 0x37, 0x20, 0x30, 0x30, 0x0A,  // 9 E7 00.
                    /* 0ED0 */  0x09, 0x31, 0x35, 0x20, 0x30, 0x32, 0x20, 0x30,  // .15 02 0
                    /* 0ED8 */  0x31, 0x0A, 0x09, 0x31, 0x35, 0x20, 0x35, 0x39,  // 1..15 59
                    /* 0EE0 */  0x20, 0x30, 0x30, 0x0A, 0x09, 0x33, 0x39, 0x20,  //  00..39 
                    /* 0EE8 */  0x32, 0x41, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 2A 00 00
                    /* 0EF0 */  0x20, 0x30, 0x35, 0x20, 0x33, 0x46, 0x0A, 0x20,  //  05 3F. 
                    /* 0EF8 */  0x20, 0x33, 0x39, 0x20, 0x32, 0x42, 0x20, 0x30,  //  39 2B 0
                    /* 0F00 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x37, 0x20,  // 0 00 07 
                    /* 0F08 */  0x36, 0x33, 0x0A, 0x09, 0x33, 0x39, 0x20, 0x35,  // 63..39 5
                    /* 0F10 */  0x31, 0x20, 0x30, 0x32, 0x20, 0x34, 0x44, 0x0A,  // 1 02 4D.
                    /* 0F18 */  0x09, 0x31, 0x35, 0x20, 0x35, 0x33, 0x20, 0x32,  // .15 53 2
                    /* 0F20 */  0x38, 0x0A, 0x09, 0x31, 0x35, 0x20, 0x35, 0x35,  // 8..15 55
                    /* 0F28 */  0x20, 0x30, 0x34, 0x0A, 0x09, 0x33, 0x39, 0x20,  //  04..39 
                    /* 0F30 */  0x35, 0x37, 0x20, 0x32, 0x30, 0x20, 0x30, 0x31,  // 57 20 01
                    /* 0F38 */  0x20, 0x30, 0x30, 0x20, 0x46, 0x38, 0x20, 0x46,  //  00 F8 F
                    /* 0F40 */  0x46, 0x20, 0x46, 0x30, 0x20, 0x30, 0x30, 0x0A,  // F F0 00.
                    /* 0F48 */  0x09, 0x33, 0x39, 0x20, 0x35, 0x38, 0x20, 0x30,  // .39 58 0
                    /* 0F50 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 0F58 */  0x46, 0x38, 0x20, 0x46, 0x46, 0x20, 0x46, 0x43,  // F8 FF FC
                    /* 0F60 */  0x0A, 0x09, 0x31, 0x35, 0x20, 0x37, 0x36, 0x20,  // ..15 76 
                    /* 0F68 */  0x30, 0x30, 0x0A, 0x20, 0x20, 0x30, 0x41, 0x20,  // 00.  0A 
                    /* 0F70 */  0x31, 0x31, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 11 00 00
                    /* 0F78 */  0x20, 0x38, 0x39, 0x20, 0x33, 0x30, 0x20, 0x38,  //  89 30 8
                    /* 0F80 */  0x30, 0x20, 0x30, 0x37, 0x20, 0x36, 0x34, 0x20,  // 0 07 64 
                    /* 0F88 */  0x30, 0x35, 0x20, 0x34, 0x30, 0x20, 0x30, 0x33,  // 05 40 03
                    /* 0F90 */  0x20, 0x42, 0x32, 0x20, 0x30, 0x32, 0x20, 0x41,  //  B2 02 A
                    /* 0F98 */  0x30, 0x20, 0x30, 0x32, 0x20, 0x41, 0x30, 0x20,  // 0 02 A0 
                    /* 0FA0 */  0x30, 0x32, 0x20, 0x30, 0x30, 0x20, 0x30, 0x32,  // 02 00 02
                    /* 0FA8 */  0x20, 0x35, 0x30, 0x20, 0x30, 0x30, 0x20, 0x32,  //  50 00 2
                    /* 0FB0 */  0x30, 0x20, 0x36, 0x35, 0x20, 0x32, 0x31, 0x20,  // 0 65 21 
                    /* 0FB8 */  0x30, 0x30, 0x20, 0x30, 0x39, 0x20, 0x30, 0x30,  // 00 09 00
                    /* 0FC0 */  0x20, 0x30, 0x43, 0x20, 0x30, 0x30, 0x20, 0x31,  //  0C 00 1
                    /* 0FC8 */  0x41, 0x20, 0x30, 0x30, 0x20, 0x31, 0x37, 0x20,  // A 00 17 
                    /* 0FD0 */  0x31, 0x38, 0x20, 0x30, 0x30, 0x20, 0x31, 0x30,  // 18 00 10
                    /* 0FD8 */  0x20, 0x46, 0x30, 0x20, 0x30, 0x33, 0x20, 0x30,  //  F0 03 0
                    /* 0FE0 */  0x43, 0x20, 0x32, 0x30, 0x20, 0x30, 0x30, 0x20,  // C 20 00 
                    /* 0FE8 */  0x30, 0x36, 0x20, 0x30, 0x42, 0x20, 0x30, 0x42,  // 06 0B 0B
                    /* 0FF0 */  0x20, 0x33, 0x33, 0x20, 0x30, 0x45, 0x20, 0x31,  //  33 0E 1
                    /* 0FF8 */  0x43, 0x20, 0x32, 0x41, 0x20, 0x33, 0x38, 0x20,  // C 2A 38 
                    /* 1000 */  0x34, 0x36, 0x20, 0x35, 0x34, 0x20, 0x36, 0x32,  // 46 54 62
                    /* 1008 */  0x20, 0x36, 0x39, 0x20, 0x37, 0x30, 0x20, 0x37,  //  69 70 7
                    /* 1010 */  0x37, 0x20, 0x37, 0x39, 0x20, 0x37, 0x42, 0x20,  // 7 79 7B 
                    /* 1018 */  0x37, 0x44, 0x20, 0x37, 0x45, 0x20, 0x30, 0x31,  // 7D 7E 01
                    /* 1020 */  0x20, 0x30, 0x32, 0x20, 0x30, 0x31, 0x20, 0x30,  //  02 01 0
                    /* 1028 */  0x30, 0x20, 0x30, 0x39, 0x20, 0x34, 0x30, 0x20,  // 0 09 40 
                    /* 1030 */  0x30, 0x39, 0x20, 0x42, 0x45, 0x20, 0x31, 0x39,  // 09 BE 19
                    /* 1038 */  0x20, 0x46, 0x43, 0x20, 0x31, 0x39, 0x20, 0x46,  //  FC 19 F
                    /* 1040 */  0x41, 0x20, 0x31, 0x39, 0x20, 0x46, 0x38, 0x20,  // A 19 F8 
                    /* 1048 */  0x31, 0x41, 0x20, 0x33, 0x38, 0x20, 0x31, 0x41,  // 1A 38 1A
                    /* 1050 */  0x20, 0x37, 0x38, 0x20, 0x31, 0x41, 0x20, 0x42,  //  78 1A B
                    /* 1058 */  0x36, 0x20, 0x32, 0x41, 0x20, 0x46, 0x36, 0x20,  // 6 2A F6 
                    /* 1060 */  0x32, 0x42, 0x20, 0x33, 0x34, 0x20, 0x32, 0x42,  // 2B 34 2B
                    /* 1068 */  0x20, 0x37, 0x34, 0x20, 0x33, 0x42, 0x20, 0x37,  //  74 3B 7
                    /* 1070 */  0x34, 0x20, 0x36, 0x42, 0x20, 0x46, 0x34, 0x20,  // 4 6B F4 
                    /* 1078 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 1080 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 1088 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 1090 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 1098 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10A0 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 10A8 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 10B0 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10B8 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 10C0 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 10C8 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10D0 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 10D8 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 10E0 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10E8 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x0A,  // 0 00 00.
                    /* 10F0 */  0x20, 0x20, 0x33, 0x39, 0x20, 0x37, 0x34, 0x20,  //   39 74 
                    /* 10F8 */  0x30, 0x35, 0x20, 0x30, 0x30, 0x20, 0x33, 0x34,  // 05 00 34
                    /* 1100 */  0x0A, 0x20, 0x20, 0x31, 0x35, 0x20, 0x33, 0x35,  // .  15 35
                    /* 1108 */  0x20, 0x30, 0x30, 0x0A, 0x20, 0x20, 0x33, 0x39,  //  00.  39
                    /* 1110 */  0x20, 0x34, 0x34, 0x20, 0x30, 0x30, 0x20, 0x30,  //  44 00 0
                    /* 1118 */  0x30, 0x0A, 0x09, 0x30, 0x35, 0x20, 0x31, 0x31,  // 0..05 11
                    /* 1120 */  0x0A, 0x09, 0x46, 0x46, 0x20, 0x38, 0x32, 0x0A,  // ..FF 82.
                    /* 1128 */  0x20, 0x20, 0x33, 0x39, 0x20, 0x45, 0x35, 0x20,  //   39 E5 
                    /* 1130 */  0x30, 0x30, 0x20, 0x32, 0x30, 0x0A, 0x20, 0x20,  // 00 20.  
                    /* 1138 */  0x31, 0x35, 0x20, 0x42, 0x30, 0x20, 0x30, 0x38,  // 15 B0 08
                    /* 1140 */  0x0A, 0x20, 0x20, 0x33, 0x39, 0x20, 0x45, 0x31,  // .  39 E1
                    /* 1148 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x34, 0x20, 0x35,  //  00 04 5
                    /* 1150 */  0x30, 0x0A, 0x20, 0x20, 0x31, 0x35, 0x20, 0x42,  // 0.  15 B
                    /* 1158 */  0x30, 0x20, 0x31, 0x30, 0x0A, 0x20, 0x20, 0x33,  // 0 10.  3
                    /* 1160 */  0x39, 0x20, 0x45, 0x31, 0x20, 0x30, 0x30, 0x20,  // 9 E1 00 
                    /* 1168 */  0x30, 0x30, 0x20, 0x36, 0x30, 0x0A, 0x20, 0x20,  // 00 60.  
                    /* 1170 */  0x33, 0x39, 0x20, 0x42, 0x30, 0x20, 0x30, 0x39,  // 39 B0 09
                    /* 1178 */  0x0A, 0x20, 0x20, 0x33, 0x39, 0x20, 0x45, 0x36,  // .  39 E6
                    /* 1180 */  0x20, 0x46, 0x30, 0x20, 0x30, 0x31, 0x20, 0x35,  //  F0 01 5
                    /* 1188 */  0x39, 0x20, 0x39, 0x32, 0x20, 0x37, 0x36, 0x20,  // 9 92 76 
                    /* 1190 */  0x30, 0x31, 0x20, 0x36, 0x38, 0x0A, 0x20, 0x20,  // 01 68.  
                    /* 1198 */  0x46, 0x46, 0x20, 0x38, 0x32, 0x0A, 0x3C, 0x2F,  // FF 82.</
                    /* 11A0 */  0x44, 0x53, 0x49, 0x49, 0x6E, 0x69, 0x74, 0x53,  // DSIInitS
                    /* 11A8 */  0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x65, 0x3E,  // equence>
                    /* 11B0 */  0x0A, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20,  // .<Group 
                    /* 11B8 */  0x69, 0x64, 0x3D, 0x27, 0x44, 0x53, 0x49, 0x20,  // id='DSI 
                    /* 11C0 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x20, 0x70,  // Timing p
                    /* 11C8 */  0x61, 0x72, 0x61, 0x6D, 0x65, 0x74, 0x65, 0x72,  // arameter
                    /* 11D0 */  0x73, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // s'>.  <D
                    /* 11D8 */  0x53, 0x49, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // SITiming
                    /* 11E0 */  0x48, 0x53, 0x50, 0x72, 0x65, 0x70, 0x61, 0x72,  // HSPrepar
                    /* 11E8 */  0x65, 0x4F, 0x76, 0x65, 0x72, 0x72, 0x69, 0x64,  // eOverrid
                    /* 11F0 */  0x65, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C,  // e>False<
                    /* 11F8 */  0x2F, 0x44, 0x53, 0x49, 0x54, 0x69, 0x6D, 0x69,  // /DSITimi
                    /* 1200 */  0x6E, 0x67, 0x48, 0x53, 0x50, 0x72, 0x65, 0x70,  // ngHSPrep
                    /* 1208 */  0x61, 0x72, 0x65, 0x4F, 0x76, 0x65, 0x72, 0x72,  // areOverr
                    /* 1210 */  0x69, 0x64, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ide>.  <
                    /* 1218 */  0x44, 0x53, 0x49, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // DSITimin
                    /* 1220 */  0x67, 0x48, 0x53, 0x50, 0x72, 0x65, 0x70, 0x61,  // gHSPrepa
                    /* 1228 */  0x72, 0x65, 0x56, 0x61, 0x6C, 0x75, 0x65, 0x3E,  // reValue>
                    /* 1230 */  0x32, 0x31, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x54,  // 21</DSIT
                    /* 1238 */  0x69, 0x6D, 0x69, 0x6E, 0x67, 0x48, 0x53, 0x50,  // imingHSP
                    /* 1240 */  0x72, 0x65, 0x70, 0x61, 0x72, 0x65, 0x56, 0x61,  // repareVa
                    /* 1248 */  0x6C, 0x75, 0x65, 0x3E, 0x0A, 0x3C, 0x2F, 0x47,  // lue>.</G
                    /* 1250 */  0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C, 0x44,  // roup>.<D
                    /* 1258 */  0x53, 0x49, 0x54, 0x65, 0x72, 0x6D, 0x53, 0x65,  // SITermSe
                    /* 1260 */  0x71, 0x75, 0x65, 0x6E, 0x63, 0x65, 0x3E, 0x0A,  // quence>.
                    /* 1268 */  0x20, 0x20, 0x30, 0x35, 0x20, 0x32, 0x38, 0x0A,  //   05 28.
                    /* 1270 */  0x20, 0x20, 0x30, 0x35, 0x20, 0x31, 0x30, 0x0A,  //   05 10.
                    /* 1278 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x54, 0x65, 0x72,  // </DSITer
                    /* 1280 */  0x6D, 0x53, 0x65, 0x71, 0x75, 0x65, 0x6E, 0x63,  // mSequenc
                    /* 1288 */  0x65, 0x3E, 0x0A, 0x3C, 0x44, 0x53, 0x49, 0x50,  // e>.<DSIP
                    /* 1290 */  0x6F, 0x73, 0x74, 0x49, 0x6E, 0x69, 0x74, 0x53,  // ostInitS
                    /* 1298 */  0x65, 0x71, 0x75, 0x65, 0x6E, 0x63, 0x65, 0x3E,  // equence>
                    /* 12A0 */  0x0A, 0x20, 0x20, 0x30, 0x35, 0x20, 0x32, 0x39,  // .  05 29
                    /* 12A8 */  0x0A, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x50, 0x6F,  // .</DSIPo
                    /* 12B0 */  0x73, 0x74, 0x49, 0x6E, 0x69, 0x74, 0x53, 0x65,  // stInitSe
                    /* 12B8 */  0x71, 0x75, 0x65, 0x6E, 0x63, 0x65, 0x3E, 0x0A,  // quence>.
                    /* 12C0 */  0x3C, 0x54, 0x4C, 0x4D, 0x4D, 0x47, 0x50, 0x49,  // <TLMMGPI
                    /* 12C8 */  0x4F, 0x44, 0x65, 0x66, 0x61, 0x75, 0x6C, 0x74,  // ODefault
                    /* 12D0 */  0x48, 0x69, 0x67, 0x68, 0x3E, 0x30, 0x78, 0x33,  // High>0x3
                    /* 12D8 */  0x32, 0x3C, 0x2F, 0x54, 0x4C, 0x4D, 0x4D, 0x47,  // 2</TLMMG
                    /* 12E0 */  0x50, 0x49, 0x4F, 0x44, 0x65, 0x66, 0x61, 0x75,  // PIODefau
                    /* 12E8 */  0x6C, 0x74, 0x48, 0x69, 0x67, 0x68, 0x3E, 0x0A,  // ltHigh>.
                    /* 12F0 */  0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69,  // <Group i
                    /* 12F8 */  0x64, 0x3D, 0x27, 0x42, 0x61, 0x63, 0x6B, 0x6C,  // d='Backl
                    /* 1300 */  0x69, 0x67, 0x68, 0x74, 0x20, 0x43, 0x6F, 0x6E,  // ight Con
                    /* 1308 */  0x66, 0x69, 0x67, 0x75, 0x72, 0x61, 0x74, 0x69,  // figurati
                    /* 1310 */  0x6F, 0x6E, 0x27, 0x3E, 0x0A, 0x20, 0x3C, 0x42,  // on'>. <B
                    /* 1318 */  0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68, 0x74,  // acklight
                    /* 1320 */  0x54, 0x79, 0x70, 0x65, 0x3E, 0x33, 0x3C, 0x2F,  // Type>3</
                    /* 1328 */  0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68,  // Backligh
                    /* 1330 */  0x74, 0x54, 0x79, 0x70, 0x65, 0x3E, 0x0A, 0x20,  // tType>. 
                    /* 1338 */  0x3C, 0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67,  // <Backlig
                    /* 1340 */  0x68, 0x74, 0x42, 0x69, 0x74, 0x57, 0x69, 0x64,  // htBitWid
                    /* 1348 */  0x74, 0x68, 0x3E, 0x31, 0x30, 0x3C, 0x2F, 0x42,  // th>10</B
                    /* 1350 */  0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68, 0x74,  // acklight
                    /* 1358 */  0x42, 0x69, 0x74, 0x57, 0x69, 0x64, 0x74, 0x68,  // BitWidth
                    /* 1360 */  0x3E, 0x0A, 0x20, 0x3C, 0x44, 0x69, 0x73, 0x70,  // >. <Disp
                    /* 1368 */  0x6C, 0x61, 0x79, 0x52, 0x65, 0x73, 0x65, 0x74,  // layReset
                    /* 1370 */  0x49, 0x6E, 0x66, 0x6F, 0x3E, 0x30, 0x20, 0x31,  // Info>0 1
                    /* 1378 */  0x30, 0x20, 0x31, 0x30, 0x30, 0x30, 0x20, 0x31,  // 0 1000 1
                    /* 1380 */  0x30, 0x30, 0x30, 0x30, 0x20, 0x30, 0x3C, 0x2F,  // 0000 0</
                    /* 1388 */  0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x52,  // DisplayR
                    /* 1390 */  0x65, 0x73, 0x65, 0x74, 0x49, 0x6E, 0x66, 0x6F,  // esetInfo
                    /* 1398 */  0x3E, 0x0A, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  // >.</Grou
                    /* 13A0 */  0x70, 0x3E, 0x00                                 // p>.
                })
                While (One)
                {
                    If (One)
                    {
                        Local2 = PCFG /* \_SB_.GPU0._ROM.PCFG */
                    }

                    Break
                }

                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0._ROM.RBUF */
            }

            Method (PGRT, 2, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.PGRT.RBUF */
            }

            Method (PBRT, 2, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.PBRT.RBUF */
            }

            Method (ROM2, 3, NotSerialized)
            {
                Name (PCFG, Buffer (0x13A8)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x50, 0x61, 0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D,  // PanelNam
                    /* 0030 */  0x65, 0x3E, 0x53, 0x75, 0x72, 0x66, 0x61, 0x63,  // e>Surfac
                    /* 0038 */  0x65, 0x5F, 0x45, 0x6C, 0x67, 0x69, 0x6E, 0x5F,  // e_Elgin_
                    /* 0040 */  0x53, 0x65, 0x63, 0x6F, 0x6E, 0x64, 0x61, 0x72,  // Secondar
                    /* 0048 */  0x79, 0x20, 0x4D, 0x50, 0x3C, 0x2F, 0x50, 0x61,  // y MP</Pa
                    /* 0050 */  0x6E, 0x65, 0x6C, 0x4E, 0x61, 0x6D, 0x65, 0x3E,  // nelName>
                    /* 0058 */  0x0A, 0x3C, 0x50, 0x61, 0x6E, 0x65, 0x6C, 0x44,  // .<PanelD
                    /* 0060 */  0x65, 0x73, 0x63, 0x72, 0x69, 0x70, 0x74, 0x69,  // escripti
                    /* 0068 */  0x6F, 0x6E, 0x3E, 0x45, 0x6C, 0x67, 0x69, 0x6E,  // on>Elgin
                    /* 0070 */  0x20, 0x44, 0x53, 0x49, 0x20, 0x53, 0x65, 0x63,  //  DSI Sec
                    /* 0078 */  0x6F, 0x6E, 0x64, 0x61, 0x72, 0x79, 0x20, 0x43,  // ondary C
                    /* 0080 */  0x6D, 0x64, 0x20, 0x4D, 0x6F, 0x64, 0x65, 0x20,  // md Mode 
                    /* 0088 */  0x41, 0x4D, 0x4F, 0x4C, 0x45, 0x44, 0x20, 0x50,  // AMOLED P
                    /* 0090 */  0x61, 0x6E, 0x65, 0x6C, 0x20, 0x77, 0x69, 0x74,  // anel wit
                    /* 0098 */  0x68, 0x20, 0x44, 0x53, 0x43, 0x20, 0x4D, 0x50,  // h DSC MP
                    /* 00A0 */  0x20, 0x28, 0x31, 0x33, 0x34, 0x34, 0x78, 0x31,  //  (1344x1
                    /* 00A8 */  0x38, 0x39, 0x36, 0x20, 0x32, 0x34, 0x62, 0x70,  // 896 24bp
                    /* 00B0 */  0x70, 0x29, 0x3C, 0x2F, 0x50, 0x61, 0x6E, 0x65,  // p)</Pane
                    /* 00B8 */  0x6C, 0x44, 0x65, 0x73, 0x63, 0x72, 0x69, 0x70,  // lDescrip
                    /* 00C0 */  0x74, 0x69, 0x6F, 0x6E, 0x3E, 0x0A, 0x3C, 0x47,  // tion>.<G
                    /* 00C8 */  0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D,  // roup id=
                    /* 00D0 */  0x27, 0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x20,  // 'Active 
                    /* 00D8 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x27, 0x3E,  // Timing'>
                    /* 00E0 */  0x0A, 0x20, 0x20, 0x3C, 0x4D, 0x61, 0x6E, 0x75,  // .  <Manu
                    /* 00E8 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x49,  // factureI
                    /* 00F0 */  0x44, 0x3E, 0x30, 0x78, 0x45, 0x34, 0x33, 0x30,  // D>0xE430
                    /* 00F8 */  0x3C, 0x2F, 0x4D, 0x61, 0x6E, 0x75, 0x66, 0x61,  // </Manufa
                    /* 0100 */  0x63, 0x74, 0x75, 0x72, 0x65, 0x49, 0x44, 0x3E,  // ctureID>
                    /* 0108 */  0x0A, 0x20, 0x20, 0x3C, 0x50, 0x72, 0x6F, 0x64,  // .  <Prod
                    /* 0110 */  0x75, 0x63, 0x74, 0x43, 0x6F, 0x64, 0x65, 0x3E,  // uctCode>
                    /* 0118 */  0x30, 0x78, 0x41, 0x39, 0x39, 0x30, 0x3C, 0x2F,  // 0xA990</
                    /* 0120 */  0x50, 0x72, 0x6F, 0x64, 0x75, 0x63, 0x74, 0x43,  // ProductC
                    /* 0128 */  0x6F, 0x64, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ode>.  <
                    /* 0130 */  0x53, 0x65, 0x72, 0x69, 0x61, 0x6C, 0x4E, 0x75,  // SerialNu
                    /* 0138 */  0x6D, 0x62, 0x65, 0x72, 0x3E, 0x30, 0x78, 0x30,  // mber>0x0
                    /* 0140 */  0x30, 0x30, 0x30, 0x30, 0x31, 0x3C, 0x2F, 0x53,  // 00001</S
                    /* 0148 */  0x65, 0x72, 0x69, 0x61, 0x6C, 0x4E, 0x75, 0x6D,  // erialNum
                    /* 0150 */  0x62, 0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ber>.  <
                    /* 0158 */  0x57, 0x65, 0x65, 0x6B, 0x6F, 0x66, 0x4D, 0x61,  // WeekofMa
                    /* 0160 */  0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72,  // nufactur
                    /* 0168 */  0x65, 0x3E, 0x30, 0x78, 0x30, 0x31, 0x3C, 0x2F,  // e>0x01</
                    /* 0170 */  0x57, 0x65, 0x65, 0x6B, 0x6F, 0x66, 0x4D, 0x61,  // WeekofMa
                    /* 0178 */  0x6E, 0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72,  // nufactur
                    /* 0180 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x59, 0x65,  // e>.  <Ye
                    /* 0188 */  0x61, 0x72, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // arofManu
                    /* 0190 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 0198 */  0x30, 0x78, 0x31, 0x45, 0x3C, 0x2F, 0x59, 0x65,  // 0x1E</Ye
                    /* 01A0 */  0x61, 0x72, 0x6F, 0x66, 0x4D, 0x61, 0x6E, 0x75,  // arofManu
                    /* 01A8 */  0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65, 0x3E,  // facture>
                    /* 01B0 */  0x0A, 0x20, 0x20, 0x3C, 0x45, 0x44, 0x49, 0x44,  // .  <EDID
                    /* 01B8 */  0x56, 0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3E,  // Version>
                    /* 01C0 */  0x31, 0x3C, 0x2F, 0x45, 0x44, 0x49, 0x44, 0x56,  // 1</EDIDV
                    /* 01C8 */  0x65, 0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3E, 0x0A,  // ersion>.
                    /* 01D0 */  0x20, 0x20, 0x3C, 0x45, 0x44, 0x49, 0x44, 0x52,  //   <EDIDR
                    /* 01D8 */  0x65, 0x76, 0x69, 0x73, 0x69, 0x6F, 0x6E, 0x3E,  // evision>
                    /* 01E0 */  0x34, 0x3C, 0x2F, 0x45, 0x44, 0x49, 0x44, 0x52,  // 4</EDIDR
                    /* 01E8 */  0x65, 0x76, 0x69, 0x73, 0x69, 0x6F, 0x6E, 0x3E,  // evision>
                    /* 01F0 */  0x0A, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  // .  <Hori
                    /* 01F8 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x63,  // zontalSc
                    /* 0200 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 0208 */  0x3E, 0x30, 0x78, 0x30, 0x38, 0x3C, 0x2F, 0x48,  // >0x08</H
                    /* 0210 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0218 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 0220 */  0x69, 0x7A, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ize>.  <
                    /* 0228 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0230 */  0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53, 0x69,  // ScreenSi
                    /* 0238 */  0x7A, 0x65, 0x3E, 0x30, 0x78, 0x30, 0x42, 0x3C,  // ze>0x0B<
                    /* 0240 */  0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61,  // /Vertica
                    /* 0248 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 0250 */  0x69, 0x7A, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ize>.  <
                    /* 0258 */  0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79, 0x54,  // DisplayT
                    /* 0260 */  0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72, 0x43,  // ransferC
                    /* 0268 */  0x68, 0x61, 0x72, 0x61, 0x63, 0x74, 0x65, 0x72,  // haracter
                    /* 0270 */  0x69, 0x73, 0x74, 0x69, 0x63, 0x73, 0x3E, 0x30,  // istics>0
                    /* 0278 */  0x78, 0x37, 0x38, 0x3C, 0x2F, 0x44, 0x69, 0x73,  // x78</Dis
                    /* 0280 */  0x70, 0x6C, 0x61, 0x79, 0x54, 0x72, 0x61, 0x6E,  // playTran
                    /* 0288 */  0x73, 0x66, 0x65, 0x72, 0x43, 0x68, 0x61, 0x72,  // sferChar
                    /* 0290 */  0x61, 0x63, 0x74, 0x65, 0x72, 0x69, 0x73, 0x74,  // acterist
                    /* 0298 */  0x69, 0x63, 0x73, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ics>.  <
                    /* 02A0 */  0x46, 0x65, 0x61, 0x74, 0x75, 0x72, 0x65, 0x53,  // FeatureS
                    /* 02A8 */  0x75, 0x70, 0x70, 0x6F, 0x72, 0x74, 0x3E, 0x30,  // upport>0
                    /* 02B0 */  0x78, 0x32, 0x3C, 0x2F, 0x46, 0x65, 0x61, 0x74,  // x2</Feat
                    /* 02B8 */  0x75, 0x72, 0x65, 0x53, 0x75, 0x70, 0x70, 0x6F,  // ureSuppo
                    /* 02C0 */  0x72, 0x74, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x52,  // rt>.  <R
                    /* 02C8 */  0x65, 0x64, 0x2E, 0x47, 0x72, 0x65, 0x65, 0x6E,  // ed.Green
                    /* 02D0 */  0x42, 0x69, 0x74, 0x73, 0x3E, 0x30, 0x78, 0x41,  // Bits>0xA
                    /* 02D8 */  0x34, 0x3C, 0x2F, 0x52, 0x65, 0x64, 0x2E, 0x47,  // 4</Red.G
                    /* 02E0 */  0x72, 0x65, 0x65, 0x6E, 0x42, 0x69, 0x74, 0x73,  // reenBits
                    /* 02E8 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75,  // >.  <Blu
                    /* 02F0 */  0x65, 0x2E, 0x57, 0x68, 0x69, 0x74, 0x65, 0x42,  // e.WhiteB
                    /* 02F8 */  0x69, 0x74, 0x73, 0x3E, 0x30, 0x78, 0x31, 0x35,  // its>0x15
                    /* 0300 */  0x3C, 0x2F, 0x42, 0x6C, 0x75, 0x65, 0x2E, 0x57,  // </Blue.W
                    /* 0308 */  0x68, 0x69, 0x74, 0x65, 0x42, 0x69, 0x74, 0x73,  // hiteBits
                    /* 0310 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x52, 0x65, 0x64,  // >.  <Red
                    /* 0318 */  0x58, 0x3E, 0x30, 0x78, 0x39, 0x45, 0x3C, 0x2F,  // X>0x9E</
                    /* 0320 */  0x52, 0x65, 0x64, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // RedX>.  
                    /* 0328 */  0x3C, 0x52, 0x65, 0x64, 0x59, 0x3E, 0x30, 0x78,  // <RedY>0x
                    /* 0330 */  0x35, 0x35, 0x3C, 0x2F, 0x52, 0x65, 0x64, 0x59,  // 55</RedY
                    /* 0338 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x65,  // >.  <Gre
                    /* 0340 */  0x65, 0x6E, 0x58, 0x3E, 0x30, 0x78, 0x34, 0x45,  // enX>0x4E
                    /* 0348 */  0x3C, 0x2F, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x58,  // </GreenX
                    /* 0350 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x47, 0x72, 0x65,  // >.  <Gre
                    /* 0358 */  0x65, 0x6E, 0x59, 0x3E, 0x30, 0x78, 0x39, 0x42,  // enY>0x9B
                    /* 0360 */  0x3C, 0x2F, 0x47, 0x72, 0x65, 0x65, 0x6E, 0x59,  // </GreenY
                    /* 0368 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75,  // >.  <Blu
                    /* 0370 */  0x65, 0x58, 0x3E, 0x30, 0x78, 0x32, 0x36, 0x3C,  // eX>0x26<
                    /* 0378 */  0x2F, 0x42, 0x6C, 0x75, 0x65, 0x58, 0x3E, 0x0A,  // /BlueX>.
                    /* 0380 */  0x20, 0x20, 0x3C, 0x42, 0x6C, 0x75, 0x65, 0x59,  //   <BlueY
                    /* 0388 */  0x3E, 0x30, 0x78, 0x30, 0x46, 0x3C, 0x2F, 0x42,  // >0x0F</B
                    /* 0390 */  0x6C, 0x75, 0x65, 0x59, 0x3E, 0x0A, 0x20, 0x20,  // lueY>.  
                    /* 0398 */  0x3C, 0x57, 0x68, 0x69, 0x74, 0x65, 0x58, 0x3E,  // <WhiteX>
                    /* 03A0 */  0x30, 0x78, 0x35, 0x30, 0x3C, 0x2F, 0x57, 0x68,  // 0x50</Wh
                    /* 03A8 */  0x69, 0x74, 0x65, 0x58, 0x3E, 0x0A, 0x20, 0x20,  // iteX>.  
                    /* 03B0 */  0x3C, 0x57, 0x68, 0x69, 0x74, 0x65, 0x59, 0x3E,  // <WhiteY>
                    /* 03B8 */  0x30, 0x78, 0x35, 0x34, 0x3C, 0x2F, 0x57, 0x68,  // 0x54</Wh
                    /* 03C0 */  0x69, 0x74, 0x65, 0x59, 0x3E, 0x0A, 0x20, 0x20,  // iteY>.  
                    /* 03C8 */  0x3C, 0x45, 0x73, 0x74, 0x61, 0x62, 0x6C, 0x69,  // <Establi
                    /* 03D0 */  0x73, 0x68, 0x65, 0x64, 0x54, 0x69, 0x6D, 0x69,  // shedTimi
                    /* 03D8 */  0x6E, 0x67, 0x73, 0x49, 0x3E, 0x30, 0x78, 0x30,  // ngsI>0x0
                    /* 03E0 */  0x3C, 0x2F, 0x45, 0x73, 0x74, 0x61, 0x62, 0x6C,  // </Establ
                    /* 03E8 */  0x69, 0x73, 0x68, 0x65, 0x64, 0x54, 0x69, 0x6D,  // ishedTim
                    /* 03F0 */  0x69, 0x6E, 0x67, 0x73, 0x49, 0x3E, 0x0A, 0x20,  // ingsI>. 
                    /* 03F8 */  0x20, 0x3C, 0x45, 0x73, 0x74, 0x61, 0x62, 0x6C,  //  <Establ
                    /* 0400 */  0x69, 0x73, 0x68, 0x65, 0x64, 0x54, 0x69, 0x6D,  // ishedTim
                    /* 0408 */  0x69, 0x6E, 0x67, 0x73, 0x49, 0x49, 0x3E, 0x30,  // ingsII>0
                    /* 0410 */  0x78, 0x30, 0x3C, 0x2F, 0x45, 0x73, 0x74, 0x61,  // x0</Esta
                    /* 0418 */  0x62, 0x6C, 0x69, 0x73, 0x68, 0x65, 0x64, 0x54,  // blishedT
                    /* 0420 */  0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x49, 0x49,  // imingsII
                    /* 0428 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x4D, 0x61, 0x6E,  // >.  <Man
                    /* 0430 */  0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65,  // ufacture
                    /* 0438 */  0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x3E,  // sTiming>
                    /* 0440 */  0x30, 0x78, 0x30, 0x3C, 0x2F, 0x4D, 0x61, 0x6E,  // 0x0</Man
                    /* 0448 */  0x75, 0x66, 0x61, 0x63, 0x74, 0x75, 0x72, 0x65,  // ufacture
                    /* 0450 */  0x73, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x3E,  // sTiming>
                    /* 0458 */  0x0A, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  // .  <Stan
                    /* 0460 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 0468 */  0x6E, 0x67, 0x73, 0x31, 0x2F, 0x3E, 0x0A, 0x20,  // ngs1/>. 
                    /* 0470 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 0478 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 0480 */  0x73, 0x32, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // s2/>.  <
                    /* 0488 */  0x53, 0x74, 0x61, 0x6E, 0x64, 0x61, 0x72, 0x64,  // Standard
                    /* 0490 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x33,  // Timings3
                    /* 0498 */  0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x53, 0x74,  // />.  <St
                    /* 04A0 */  0x61, 0x6E, 0x64, 0x61, 0x72, 0x64, 0x54, 0x69,  // andardTi
                    /* 04A8 */  0x6D, 0x69, 0x6E, 0x67, 0x73, 0x34, 0x2F, 0x3E,  // mings4/>
                    /* 04B0 */  0x0A, 0x20, 0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E,  // .  <Stan
                    /* 04B8 */  0x64, 0x61, 0x72, 0x64, 0x54, 0x69, 0x6D, 0x69,  // dardTimi
                    /* 04C0 */  0x6E, 0x67, 0x73, 0x35, 0x2F, 0x3E, 0x0A, 0x20,  // ngs5/>. 
                    /* 04C8 */  0x20, 0x3C, 0x53, 0x74, 0x61, 0x6E, 0x64, 0x61,  //  <Standa
                    /* 04D0 */  0x72, 0x64, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67,  // rdTiming
                    /* 04D8 */  0x73, 0x36, 0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // s6/>.  <
                    /* 04E0 */  0x53, 0x74, 0x61, 0x6E, 0x64, 0x61, 0x72, 0x64,  // Standard
                    /* 04E8 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x73, 0x37,  // Timings7
                    /* 04F0 */  0x2F, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x53, 0x69,  // />.  <Si
                    /* 04F8 */  0x67, 0x6E, 0x61, 0x6C, 0x54, 0x69, 0x6D, 0x69,  // gnalTimi
                    /* 0500 */  0x6E, 0x67, 0x49, 0x6E, 0x74, 0x65, 0x72, 0x66,  // ngInterf
                    /* 0508 */  0x61, 0x63, 0x65, 0x2F, 0x3E, 0x0A, 0x3C, 0x2F,  // ace/>.</
                    /* 0510 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C,  // Group>.<
                    /* 0518 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64,  // Group id
                    /* 0520 */  0x3D, 0x27, 0x44, 0x65, 0x74, 0x61, 0x69, 0x6C,  // ='Detail
                    /* 0528 */  0x65, 0x64, 0x20, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // ed Timin
                    /* 0530 */  0x67, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x48,  // g'>.  <H
                    /* 0538 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0540 */  0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E, 0x53,  // lScreenS
                    /* 0548 */  0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x30, 0x78,  // izeMM>0x
                    /* 0550 */  0x35, 0x35, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69,  // 55</Hori
                    /* 0558 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x53, 0x63,  // zontalSc
                    /* 0560 */  0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65,  // reenSize
                    /* 0568 */  0x4D, 0x4D, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x56,  // MM>.  <V
                    /* 0570 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x53,  // erticalS
                    /* 0578 */  0x63, 0x72, 0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A,  // creenSiz
                    /* 0580 */  0x65, 0x4D, 0x4D, 0x3E, 0x30, 0x78, 0x37, 0x33,  // eMM>0x73
                    /* 0588 */  0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // </Vertic
                    /* 0590 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 0598 */  0x53, 0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x0A,  // SizeMM>.
                    /* 05A0 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 05A8 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x56, 0x65, 0x72,  // ontalVer
                    /* 05B0 */  0x74, 0x69, 0x63, 0x61, 0x6C, 0x53, 0x63, 0x72,  // ticalScr
                    /* 05B8 */  0x65, 0x65, 0x6E, 0x53, 0x69, 0x7A, 0x65, 0x4D,  // eenSizeM
                    /* 05C0 */  0x4D, 0x3E, 0x30, 0x78, 0x30, 0x30, 0x3C, 0x2F,  // M>0x00</
                    /* 05C8 */  0x48, 0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74,  // Horizont
                    /* 05D0 */  0x61, 0x6C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // alVertic
                    /* 05D8 */  0x61, 0x6C, 0x53, 0x63, 0x72, 0x65, 0x65, 0x6E,  // alScreen
                    /* 05E0 */  0x53, 0x69, 0x7A, 0x65, 0x4D, 0x4D, 0x3E, 0x0A,  // SizeMM>.
                    /* 05E8 */  0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E,  // </Group>
                    /* 05F0 */  0x0A, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20,  // .<Group 
                    /* 05F8 */  0x69, 0x64, 0x3D, 0x27, 0x41, 0x63, 0x74, 0x69,  // id='Acti
                    /* 0600 */  0x76, 0x65, 0x20, 0x54, 0x69, 0x6D, 0x69, 0x6E,  // ve Timin
                    /* 0608 */  0x67, 0x27, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x48,  // g'>.  <H
                    /* 0610 */  0x6F, 0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61,  // orizonta
                    /* 0618 */  0x6C, 0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x3E,  // lActive>
                    /* 0620 */  0x31, 0x33, 0x34, 0x34, 0x3C, 0x2F, 0x48, 0x6F,  // 1344</Ho
                    /* 0628 */  0x72, 0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C,  // rizontal
                    /* 0630 */  0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A,  // Active>.
                    /* 0638 */  0x20, 0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69,  //   <Verti
                    /* 0640 */  0x63, 0x61, 0x6C, 0x41, 0x63, 0x74, 0x69, 0x76,  // calActiv
                    /* 0648 */  0x65, 0x3E, 0x31, 0x38, 0x39, 0x32, 0x3C, 0x2F,  // e>1892</
                    /* 0650 */  0x56, 0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C,  // Vertical
                    /* 0658 */  0x41, 0x63, 0x74, 0x69, 0x76, 0x65, 0x3E, 0x0A,  // Active>.
                    /* 0660 */  0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69, 0x7A,  //   <Horiz
                    /* 0668 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x4C, 0x65, 0x66,  // ontalLef
                    /* 0670 */  0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E,  // tBorder>
                    /* 0678 */  0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72, 0x69, 0x7A,  // 0</Horiz
                    /* 0680 */  0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x4C, 0x65, 0x66,  // ontalLef
                    /* 0688 */  0x74, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E,  // tBorder>
                    /* 0690 */  0x0A, 0x20, 0x20, 0x3C, 0x48, 0x6F, 0x72, 0x69,  // .  <Hori
                    /* 0698 */  0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x52, 0x69,  // zontalRi
                    /* 06A0 */  0x67, 0x68, 0x74, 0x42, 0x6F, 0x72, 0x64, 0x65,  // ghtBorde
                    /* 06A8 */  0x72, 0x3E, 0x30, 0x3C, 0x2F, 0x48, 0x6F, 0x72,  // r>0</Hor
                    /* 06B0 */  0x69, 0x7A, 0x6F, 0x6E, 0x74, 0x61, 0x6C, 0x52,  // izontalR
                    /* 06B8 */  0x69, 0x67, 0x68, 0x74, 0x42, 0x6F, 0x72, 0x64,  // ightBord
                    /* 06C0 */  0x65, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x56,  // er>.  <V
                    /* 06C8 */  0x65, 0x72, 0x74, 0x69, 0x63, 0x61, 0x6C, 0x54,  // erticalT
                    /* 06D0 */  0x6F, 0x70, 0x42, 0x6F, 0x72, 0x64, 0x65, 0x72,  // opBorder
                    /* 06D8 */  0x3E, 0x30, 0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74,  // >0</Vert
                    /* 06E0 */  0x69, 0x63, 0x61, 0x6C, 0x54, 0x6F, 0x70, 0x42,  // icalTopB
                    /* 06E8 */  0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A, 0x20,  // order>. 
                    /* 06F0 */  0x20, 0x3C, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  //  <Vertic
                    /* 06F8 */  0x61, 0x6C, 0x42, 0x6F, 0x74, 0x74, 0x6F, 0x6D,  // alBottom
                    /* 0700 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x30,  // Border>0
                    /* 0708 */  0x3C, 0x2F, 0x56, 0x65, 0x72, 0x74, 0x69, 0x63,  // </Vertic
                    /* 0710 */  0x61, 0x6C, 0x42, 0x6F, 0x74, 0x74, 0x6F, 0x6D,  // alBottom
                    /* 0718 */  0x42, 0x6F, 0x72, 0x64, 0x65, 0x72, 0x3E, 0x0A,  // Border>.
                    /* 0720 */  0x20, 0x20, 0x3C, 0x42, 0x6F, 0x72, 0x64, 0x65,  //   <Borde
                    /* 0728 */  0x72, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x3E, 0x30,  // rColor>0
                    /* 0730 */  0x78, 0x30, 0x3C, 0x2F, 0x42, 0x6F, 0x72, 0x64,  // x0</Bord
                    /* 0738 */  0x65, 0x72, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x3E,  // erColor>
                    /* 0740 */  0x0A, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x76, 0x65,  // .  <Inve
                    /* 0748 */  0x72, 0x74, 0x44, 0x61, 0x74, 0x61, 0x50, 0x6F,  // rtDataPo
                    /* 0750 */  0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x46,  // larity>F
                    /* 0758 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x49, 0x6E,  // alse</In
                    /* 0760 */  0x76, 0x65, 0x72, 0x74, 0x44, 0x61, 0x74, 0x61,  // vertData
                    /* 0768 */  0x50, 0x6F, 0x6C, 0x61, 0x72, 0x69, 0x74, 0x79,  // Polarity
                    /* 0770 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x49, 0x6E, 0x76,  // >.  <Inv
                    /* 0778 */  0x65, 0x72, 0x74, 0x56, 0x73, 0x79, 0x6E, 0x63,  // ertVsync
                    /* 0780 */  0x50, 0x6F, 0x6C, 0x61, 0x69, 0x72, 0x74, 0x79,  // Polairty
                    /* 0788 */  0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F,  // >False</
                    /* 0790 */  0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x56, 0x73,  // InvertVs
                    /* 0798 */  0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61, 0x69,  // yncPolai
                    /* 07A0 */  0x72, 0x74, 0x79, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // rty>.  <
                    /* 07A8 */  0x49, 0x6E, 0x76, 0x65, 0x72, 0x74, 0x48, 0x73,  // InvertHs
                    /* 07B0 */  0x79, 0x6E, 0x63, 0x50, 0x6F, 0x6C, 0x61, 0x72,  // yncPolar
                    /* 07B8 */  0x69, 0x74, 0x79, 0x3E, 0x46, 0x61, 0x6C, 0x73,  // ity>Fals
                    /* 07C0 */  0x65, 0x3C, 0x2F, 0x49, 0x6E, 0x76, 0x65, 0x72,  // e</Inver
                    /* 07C8 */  0x74, 0x48, 0x73, 0x79, 0x6E, 0x63, 0x50, 0x6F,  // tHsyncPo
                    /* 07D0 */  0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A,  // larity>.
                    /* 07D8 */  0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E,  // </Group>
                    /* 07E0 */  0x0A, 0x3C, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x20,  // .<Group 
                    /* 07E8 */  0x69, 0x64, 0x3D, 0x27, 0x44, 0x69, 0x73, 0x70,  // id='Disp
                    /* 07F0 */  0x6C, 0x61, 0x79, 0x20, 0x49, 0x6E, 0x74, 0x65,  // lay Inte
                    /* 07F8 */  0x72, 0x66, 0x61, 0x63, 0x65, 0x27, 0x3E, 0x0A,  // rface'>.
                    /* 0800 */  0x20, 0x20, 0x3C, 0x49, 0x6E, 0x74, 0x65, 0x72,  //   <Inter
                    /* 0808 */  0x66, 0x61, 0x63, 0x65, 0x54, 0x79, 0x70, 0x65,  // faceType
                    /* 0810 */  0x3E, 0x31, 0x31, 0x3C, 0x2F, 0x49, 0x6E, 0x74,  // >11</Int
                    /* 0818 */  0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x54, 0x79,  // erfaceTy
                    /* 0820 */  0x70, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x49,  // pe>.  <I
                    /* 0828 */  0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65,  // nterface
                    /* 0830 */  0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72,  // ColorFor
                    /* 0838 */  0x6D, 0x61, 0x74, 0x3E, 0x33, 0x3C, 0x2F, 0x49,  // mat>3</I
                    /* 0840 */  0x6E, 0x74, 0x65, 0x72, 0x66, 0x61, 0x63, 0x65,  // nterface
                    /* 0848 */  0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F, 0x72,  // ColorFor
                    /* 0850 */  0x6D, 0x61, 0x74, 0x3E, 0x0A, 0x3C, 0x2F, 0x47,  // mat>.</G
                    /* 0858 */  0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C, 0x47,  // roup>.<G
                    /* 0860 */  0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D,  // roup id=
                    /* 0868 */  0x27, 0x44, 0x53, 0x49, 0x20, 0x49, 0x6E, 0x74,  // 'DSI Int
                    /* 0870 */  0x65, 0x72, 0x66, 0x61, 0x63, 0x65, 0x27, 0x3E,  // erface'>
                    /* 0878 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x43,  // .  <DSIC
                    /* 0880 */  0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x49, 0x64,  // hannelId
                    /* 0888 */  0x3E, 0x32, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x43,  // >2</DSIC
                    /* 0890 */  0x68, 0x61, 0x6E, 0x6E, 0x65, 0x6C, 0x49, 0x64,  // hannelId
                    /* 0898 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 08A0 */  0x56, 0x69, 0x72, 0x74, 0x75, 0x61, 0x6C, 0x49,  // VirtualI
                    /* 08A8 */  0x64, 0x3E, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // d>0</DSI
                    /* 08B0 */  0x56, 0x69, 0x72, 0x74, 0x75, 0x61, 0x6C, 0x49,  // VirtualI
                    /* 08B8 */  0x64, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // d>.  <DS
                    /* 08C0 */  0x49, 0x43, 0x6F, 0x6C, 0x6F, 0x72, 0x46, 0x6F,  // IColorFo
                    /* 08C8 */  0x72, 0x6D, 0x61, 0x74, 0x3E, 0x33, 0x36, 0x3C,  // rmat>36<
                    /* 08D0 */  0x2F, 0x44, 0x53, 0x49, 0x43, 0x6F, 0x6C, 0x6F,  // /DSIColo
                    /* 08D8 */  0x72, 0x46, 0x6F, 0x72, 0x6D, 0x61, 0x74, 0x3E,  // rFormat>
                    /* 08E0 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x54,  // .  <DSIT
                    /* 08E8 */  0x72, 0x61, 0x66, 0x66, 0x69, 0x63, 0x4D, 0x6F,  // rafficMo
                    /* 08F0 */  0x64, 0x65, 0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53,  // de>1</DS
                    /* 08F8 */  0x49, 0x54, 0x72, 0x61, 0x66, 0x66, 0x69, 0x63,  // ITraffic
                    /* 0900 */  0x4D, 0x6F, 0x64, 0x65, 0x3E, 0x0A, 0x20, 0x20,  // Mode>.  
                    /* 0908 */  0x3C, 0x44, 0x53, 0x49, 0x4C, 0x61, 0x6E, 0x65,  // <DSILane
                    /* 0910 */  0x73, 0x3E, 0x34, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // s>4</DSI
                    /* 0918 */  0x4C, 0x61, 0x6E, 0x65, 0x73, 0x3E, 0x0A, 0x20,  // Lanes>. 
                    /* 0920 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x48, 0x73, 0x61,  //  <DSIHsa
                    /* 0928 */  0x48, 0x73, 0x65, 0x41, 0x66, 0x74, 0x65, 0x72,  // HseAfter
                    /* 0930 */  0x56, 0x73, 0x56, 0x65, 0x3E, 0x46, 0x61, 0x6C,  // VsVe>Fal
                    /* 0938 */  0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x48,  // se</DSIH
                    /* 0940 */  0x73, 0x61, 0x48, 0x73, 0x65, 0x41, 0x66, 0x74,  // saHseAft
                    /* 0948 */  0x65, 0x72, 0x56, 0x73, 0x56, 0x65, 0x3E, 0x0A,  // erVsVe>.
                    /* 0950 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F,  //   <DSILo
                    /* 0958 */  0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F,  // wPowerMo
                    /* 0960 */  0x64, 0x65, 0x49, 0x6E, 0x48, 0x46, 0x50, 0x3E,  // deInHFP>
                    /* 0968 */  0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44,  // False</D
                    /* 0970 */  0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77,  // SILowPow
                    /* 0978 */  0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E,  // erModeIn
                    /* 0980 */  0x48, 0x46, 0x50, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // HFP>.  <
                    /* 0988 */  0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F,  // DSILowPo
                    /* 0990 */  0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49,  // werModeI
                    /* 0998 */  0x6E, 0x48, 0x42, 0x50, 0x3E, 0x46, 0x61, 0x6C,  // nHBP>Fal
                    /* 09A0 */  0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C,  // se</DSIL
                    /* 09A8 */  0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D,  // owPowerM
                    /* 09B0 */  0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x42, 0x50,  // odeInHBP
                    /* 09B8 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 09C0 */  0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65, 0x72,  // LowPower
                    /* 09C8 */  0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x48, 0x53,  // ModeInHS
                    /* 09D0 */  0x41, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65, 0x3C,  // A>False<
                    /* 09D8 */  0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50,  // /DSILowP
                    /* 09E0 */  0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65,  // owerMode
                    /* 09E8 */  0x49, 0x6E, 0x48, 0x53, 0x41, 0x3E, 0x0A, 0x20,  // InHSA>. 
                    /* 09F0 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77,  //  <DSILow
                    /* 09F8 */  0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64,  // PowerMod
                    /* 0A00 */  0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50, 0x45,  // eInBLLPE
                    /* 0A08 */  0x4F, 0x46, 0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C,  // OF>True<
                    /* 0A10 */  0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77, 0x50,  // /DSILowP
                    /* 0A18 */  0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64, 0x65,  // owerMode
                    /* 0A20 */  0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50, 0x45, 0x4F,  // InBLLPEO
                    /* 0A28 */  0x46, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // F>.  <DS
                    /* 0A30 */  0x49, 0x4C, 0x6F, 0x77, 0x50, 0x6F, 0x77, 0x65,  // ILowPowe
                    /* 0A38 */  0x72, 0x4D, 0x6F, 0x64, 0x65, 0x49, 0x6E, 0x42,  // rModeInB
                    /* 0A40 */  0x4C, 0x4C, 0x50, 0x3E, 0x54, 0x72, 0x75, 0x65,  // LLP>True
                    /* 0A48 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x4C, 0x6F, 0x77,  // </DSILow
                    /* 0A50 */  0x50, 0x6F, 0x77, 0x65, 0x72, 0x4D, 0x6F, 0x64,  // PowerMod
                    /* 0A58 */  0x65, 0x49, 0x6E, 0x42, 0x4C, 0x4C, 0x50, 0x3E,  // eInBLLP>
                    /* 0A60 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x52,  // .  <DSIR
                    /* 0A68 */  0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x52, 0x61,  // efreshRa
                    /* 0A70 */  0x74, 0x65, 0x3E, 0x30, 0x78, 0x33, 0x43, 0x30,  // te>0x3C0
                    /* 0A78 */  0x30, 0x30, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // 000</DSI
                    /* 0A80 */  0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x52,  // RefreshR
                    /* 0A88 */  0x61, 0x74, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // ate>.  <
                    /* 0A90 */  0x44, 0x53, 0x49, 0x45, 0x6E, 0x61, 0x62, 0x6C,  // DSIEnabl
                    /* 0A98 */  0x65, 0x41, 0x75, 0x74, 0x6F, 0x52, 0x65, 0x66,  // eAutoRef
                    /* 0AA0 */  0x72, 0x65, 0x73, 0x68, 0x3E, 0x54, 0x72, 0x75,  // resh>Tru
                    /* 0AA8 */  0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x45, 0x6E,  // e</DSIEn
                    /* 0AB0 */  0x61, 0x62, 0x6C, 0x65, 0x41, 0x75, 0x74, 0x6F,  // ableAuto
                    /* 0AB8 */  0x52, 0x65, 0x66, 0x72, 0x65, 0x73, 0x68, 0x3E,  // Refresh>
                    /* 0AC0 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x50,  // .  <DSIP
                    /* 0AC8 */  0x68, 0x79, 0x44, 0x43, 0x44, 0x43, 0x4D, 0x6F,  // hyDCDCMo
                    /* 0AD0 */  0x64, 0x65, 0x3E, 0x46, 0x61, 0x6C, 0x73, 0x65,  // de>False
                    /* 0AD8 */  0x3C, 0x2F, 0x44, 0x53, 0x49, 0x50, 0x68, 0x79,  // </DSIPhy
                    /* 0AE0 */  0x44, 0x43, 0x44, 0x43, 0x4D, 0x6F, 0x64, 0x65,  // DCDCMode
                    /* 0AE8 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 0AF0 */  0x50, 0x61, 0x63, 0x6B, 0x65, 0x74, 0x54, 0x72,  // PacketTr
                    /* 0AF8 */  0x61, 0x6E, 0x73, 0x66, 0x65, 0x72, 0x48, 0x53,  // ansferHS
                    /* 0B00 */  0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44,  // >True</D
                    /* 0B08 */  0x53, 0x49, 0x50, 0x61, 0x63, 0x6B, 0x65, 0x74,  // SIPacket
                    /* 0B10 */  0x54, 0x72, 0x61, 0x6E, 0x73, 0x66, 0x65, 0x72,  // Transfer
                    /* 0B18 */  0x48, 0x53, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44,  // HS>.  <D
                    /* 0B20 */  0x53, 0x49, 0x43, 0x6C, 0x6F, 0x63, 0x6B, 0x48,  // SIClockH
                    /* 0B28 */  0x53, 0x46, 0x6F, 0x72, 0x63, 0x65, 0x52, 0x65,  // SForceRe
                    /* 0B30 */  0x71, 0x75, 0x65, 0x73, 0x74, 0x3E, 0x31, 0x3C,  // quest>1<
                    /* 0B38 */  0x2F, 0x44, 0x53, 0x49, 0x43, 0x6C, 0x6F, 0x63,  // /DSICloc
                    /* 0B40 */  0x6B, 0x48, 0x53, 0x46, 0x6F, 0x72, 0x63, 0x65,  // kHSForce
                    /* 0B48 */  0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x3E,  // Request>
                    /* 0B50 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x4C,  // .  <DSIL
                    /* 0B58 */  0x50, 0x31, 0x31, 0x41, 0x74, 0x49, 0x6E, 0x69,  // P11AtIni
                    /* 0B60 */  0x74, 0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C, 0x2F,  // t>True</
                    /* 0B68 */  0x44, 0x53, 0x49, 0x4C, 0x50, 0x31, 0x31, 0x41,  // DSILP11A
                    /* 0B70 */  0x74, 0x49, 0x6E, 0x69, 0x74, 0x3E, 0x0A, 0x20,  // tInit>. 
                    /* 0B78 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x46, 0x6F, 0x72,  //  <DSIFor
                    /* 0B80 */  0x63, 0x65, 0x43, 0x6D, 0x64, 0x49, 0x6E, 0x56,  // ceCmdInV
                    /* 0B88 */  0x69, 0x64, 0x65, 0x6F, 0x48, 0x53, 0x3E, 0x54,  // ideoHS>T
                    /* 0B90 */  0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // rue</DSI
                    /* 0B98 */  0x46, 0x6F, 0x72, 0x63, 0x65, 0x43, 0x6D, 0x64,  // ForceCmd
                    /* 0BA0 */  0x49, 0x6E, 0x56, 0x69, 0x64, 0x65, 0x6F, 0x48,  // InVideoH
                    /* 0BA8 */  0x53, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // S>.  <DS
                    /* 0BB0 */  0x49, 0x44, 0x53, 0x43, 0x45, 0x6E, 0x61, 0x62,  // IDSCEnab
                    /* 0BB8 */  0x6C, 0x65, 0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C,  // le>True<
                    /* 0BC0 */  0x2F, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x45,  // /DSIDSCE
                    /* 0BC8 */  0x6E, 0x61, 0x62, 0x6C, 0x65, 0x3E, 0x0A, 0x20,  // nable>. 
                    /* 0BD0 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43,  //  <DSIDSC
                    /* 0BD8 */  0x4D, 0x61, 0x6A, 0x6F, 0x72, 0x3E, 0x31, 0x3C,  // Major>1<
                    /* 0BE0 */  0x2F, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x4D,  // /DSIDSCM
                    /* 0BE8 */  0x61, 0x6A, 0x6F, 0x72, 0x3E, 0x0A, 0x20, 0x20,  // ajor>.  
                    /* 0BF0 */  0x3C, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x4D,  // <DSIDSCM
                    /* 0BF8 */  0x69, 0x6E, 0x6F, 0x72, 0x3E, 0x31, 0x3C, 0x2F,  // inor>1</
                    /* 0C00 */  0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x4D, 0x69,  // DSIDSCMi
                    /* 0C08 */  0x6E, 0x6F, 0x72, 0x3E, 0x0A, 0x20, 0x20, 0x3C,  // nor>.  <
                    /* 0C10 */  0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x53, 0x63,  // DSIDSCSc
                    /* 0C18 */  0x72, 0x3E, 0x30, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // r>0</DSI
                    /* 0C20 */  0x44, 0x53, 0x43, 0x53, 0x63, 0x72, 0x3E, 0x0A,  // DSCScr>.
                    /* 0C28 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x44, 0x53,  //   <DSIDS
                    /* 0C30 */  0x43, 0x50, 0x72, 0x6F, 0x66, 0x69, 0x6C, 0x65,  // CProfile
                    /* 0C38 */  0x49, 0x44, 0x3E, 0x34, 0x3C, 0x2F, 0x44, 0x53,  // ID>4</DS
                    /* 0C40 */  0x49, 0x44, 0x53, 0x43, 0x50, 0x72, 0x6F, 0x66,  // IDSCProf
                    /* 0C48 */  0x69, 0x6C, 0x65, 0x49, 0x44, 0x3E, 0x0A, 0x20,  // ileID>. 
                    /* 0C50 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x54, 0x45, 0x43,  //  <DSITEC
                    /* 0C58 */  0x68, 0x65, 0x63, 0x6B, 0x45, 0x6E, 0x61, 0x62,  // heckEnab
                    /* 0C60 */  0x6C, 0x65, 0x3E, 0x54, 0x72, 0x75, 0x65, 0x3C,  // le>True<
                    /* 0C68 */  0x2F, 0x44, 0x53, 0x49, 0x54, 0x45, 0x43, 0x68,  // /DSITECh
                    /* 0C70 */  0x65, 0x63, 0x6B, 0x45, 0x6E, 0x61, 0x62, 0x6C,  // eckEnabl
                    /* 0C78 */  0x65, 0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53,  // e>.  <DS
                    /* 0C80 */  0x49, 0x54, 0x45, 0x55, 0x73, 0x69, 0x6E, 0x67,  // ITEUsing
                    /* 0C88 */  0x44, 0x65, 0x64, 0x69, 0x63, 0x61, 0x74, 0x65,  // Dedicate
                    /* 0C90 */  0x64, 0x54, 0x45, 0x50, 0x69, 0x6E, 0x3E, 0x54,  // dTEPin>T
                    /* 0C98 */  0x72, 0x75, 0x65, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // rue</DSI
                    /* 0CA0 */  0x54, 0x45, 0x55, 0x73, 0x69, 0x6E, 0x67, 0x44,  // TEUsingD
                    /* 0CA8 */  0x65, 0x64, 0x69, 0x63, 0x61, 0x74, 0x65, 0x64,  // edicated
                    /* 0CB0 */  0x54, 0x45, 0x50, 0x69, 0x6E, 0x3E, 0x0A, 0x20,  // TEPin>. 
                    /* 0CB8 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x54, 0x45, 0x76,  //  <DSITEv
                    /* 0CC0 */  0x53, 0x79, 0x6E, 0x63, 0x53, 0x65, 0x6C, 0x65,  // SyncSele
                    /* 0CC8 */  0x63, 0x74, 0x3E, 0x31, 0x3C, 0x2F, 0x44, 0x53,  // ct>1</DS
                    /* 0CD0 */  0x49, 0x54, 0x45, 0x76, 0x53, 0x79, 0x6E, 0x63,  // ITEvSync
                    /* 0CD8 */  0x53, 0x65, 0x6C, 0x65, 0x63, 0x74, 0x3E, 0x0A,  // Select>.
                    /* 0CE0 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x54, 0x45,  //   <DSITE
                    /* 0CE8 */  0x76, 0x53, 0x79, 0x6E, 0x63, 0x53, 0x74, 0x61,  // vSyncSta
                    /* 0CF0 */  0x72, 0x74, 0x50, 0x6F, 0x73, 0x3E, 0x31, 0x38,  // rtPos>18
                    /* 0CF8 */  0x39, 0x32, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x54,  // 92</DSIT
                    /* 0D00 */  0x45, 0x76, 0x53, 0x79, 0x6E, 0x63, 0x53, 0x74,  // EvSyncSt
                    /* 0D08 */  0x61, 0x72, 0x74, 0x50, 0x6F, 0x73, 0x3E, 0x0A,  // artPos>.
                    /* 0D10 */  0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x54, 0x45,  //   <DSITE
                    /* 0D18 */  0x76, 0x53, 0x79, 0x6E, 0x63, 0x49, 0x6E, 0x69,  // vSyncIni
                    /* 0D20 */  0x74, 0x56, 0x61, 0x6C, 0x3E, 0x31, 0x38, 0x39,  // tVal>189
                    /* 0D28 */  0x32, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x54, 0x45,  // 2</DSITE
                    /* 0D30 */  0x76, 0x53, 0x79, 0x6E, 0x63, 0x49, 0x6E, 0x69,  // vSyncIni
                    /* 0D38 */  0x74, 0x56, 0x61, 0x6C, 0x3E, 0x0A, 0x20, 0x20,  // tVal>.  
                    /* 0D40 */  0x3C, 0x44, 0x53, 0x49, 0x44, 0x53, 0x43, 0x53,  // <DSIDSCS
                    /* 0D48 */  0x6C, 0x69, 0x63, 0x65, 0x57, 0x69, 0x64, 0x74,  // liceWidt
                    /* 0D50 */  0x68, 0x3E, 0x36, 0x37, 0x32, 0x3C, 0x2F, 0x44,  // h>672</D
                    /* 0D58 */  0x53, 0x49, 0x44, 0x53, 0x43, 0x53, 0x6C, 0x69,  // SIDSCSli
                    /* 0D60 */  0x63, 0x65, 0x57, 0x69, 0x64, 0x74, 0x68, 0x3E,  // ceWidth>
                    /* 0D68 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x44,  // .  <DSID
                    /* 0D70 */  0x53, 0x43, 0x53, 0x6C, 0x69, 0x63, 0x65, 0x48,  // SCSliceH
                    /* 0D78 */  0x65, 0x69, 0x67, 0x68, 0x74, 0x3E, 0x39, 0x34,  // eight>94
                    /* 0D80 */  0x36, 0x3C, 0x2F, 0x44, 0x53, 0x49, 0x44, 0x53,  // 6</DSIDS
                    /* 0D88 */  0x43, 0x53, 0x6C, 0x69, 0x63, 0x65, 0x48, 0x65,  // CSliceHe
                    /* 0D90 */  0x69, 0x67, 0x68, 0x74, 0x3E, 0x0A, 0x20, 0x20,  // ight>.  
                    /* 0D98 */  0x3C, 0x44, 0x53, 0x49, 0x42, 0x69, 0x74, 0x43,  // <DSIBitC
                    /* 0DA0 */  0x6C, 0x6F, 0x63, 0x6B, 0x46, 0x72, 0x65, 0x71,  // lockFreq
                    /* 0DA8 */  0x75, 0x65, 0x6E, 0x63, 0x79, 0x3E, 0x37, 0x36,  // uency>76
                    /* 0DB0 */  0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x3C,  // 0000000<
                    /* 0DB8 */  0x2F, 0x44, 0x53, 0x49, 0x42, 0x69, 0x74, 0x43,  // /DSIBitC
                    /* 0DC0 */  0x6C, 0x6F, 0x63, 0x6B, 0x46, 0x72, 0x65, 0x71,  // lockFreq
                    /* 0DC8 */  0x75, 0x65, 0x6E, 0x63, 0x79, 0x3E, 0x0A, 0x20,  // uency>. 
                    /* 0DD0 */  0x20, 0x3C, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61,  //  <Displa
                    /* 0DD8 */  0x79, 0x50, 0x72, 0x69, 0x6D, 0x61, 0x72, 0x79,  // yPrimary
                    /* 0DE0 */  0x46, 0x6C, 0x61, 0x67, 0x73, 0x3E, 0x30, 0x78,  // Flags>0x
                    /* 0DE8 */  0x30, 0x31, 0x30, 0x30, 0x30, 0x30, 0x30, 0x30,  // 01000000
                    /* 0DF0 */  0x3C, 0x2F, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61,  // </Displa
                    /* 0DF8 */  0x79, 0x50, 0x72, 0x69, 0x6D, 0x61, 0x72, 0x79,  // yPrimary
                    /* 0E00 */  0x46, 0x6C, 0x61, 0x67, 0x73, 0x3E, 0x0A, 0x20,  // Flags>. 
                    /* 0E08 */  0x20, 0x3C, 0x44, 0x53, 0x49, 0x4E, 0x75, 0x6C,  //  <DSINul
                    /* 0E10 */  0x6C, 0x70, 0x61, 0x63, 0x6B, 0x65, 0x74, 0x49,  // lpacketI
                    /* 0E18 */  0x6E, 0x73, 0x65, 0x72, 0x74, 0x69, 0x6F, 0x6E,  // nsertion
                    /* 0E20 */  0x42, 0x79, 0x74, 0x65, 0x73, 0x3E, 0x31, 0x3C,  // Bytes>1<
                    /* 0E28 */  0x2F, 0x44, 0x53, 0x49, 0x4E, 0x75, 0x6C, 0x6C,  // /DSINull
                    /* 0E30 */  0x70, 0x61, 0x63, 0x6B, 0x65, 0x74, 0x49, 0x6E,  // packetIn
                    /* 0E38 */  0x73, 0x65, 0x72, 0x74, 0x69, 0x6F, 0x6E, 0x42,  // sertionB
                    /* 0E40 */  0x79, 0x74, 0x65, 0x73, 0x3E, 0x0A, 0x3C, 0x2F,  // ytes>.</
                    /* 0E48 */  0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x0A, 0x3C,  // Group>.<
                    /* 0E50 */  0x44, 0x53, 0x49, 0x43, 0x6F, 0x6E, 0x74, 0x72,  // DSIContr
                    /* 0E58 */  0x6F, 0x6C, 0x6C, 0x65, 0x72, 0x4D, 0x61, 0x70,  // ollerMap
                    /* 0E60 */  0x70, 0x69, 0x6E, 0x67, 0x3E, 0x0A, 0x20, 0x20,  // ping>.  
                    /* 0E68 */  0x30, 0x31, 0x0A, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // 01.</DSI
                    /* 0E70 */  0x43, 0x6F, 0x6E, 0x74, 0x72, 0x6F, 0x6C, 0x6C,  // Controll
                    /* 0E78 */  0x65, 0x72, 0x4D, 0x61, 0x70, 0x70, 0x69, 0x6E,  // erMappin
                    /* 0E80 */  0x67, 0x3E, 0x0A, 0x3C, 0x44, 0x53, 0x49, 0x49,  // g>.<DSII
                    /* 0E88 */  0x6E, 0x69, 0x74, 0x53, 0x65, 0x71, 0x75, 0x65,  // nitSeque
                    /* 0E90 */  0x6E, 0x63, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x33,  // nce>.  3
                    /* 0E98 */  0x39, 0x20, 0x37, 0x46, 0x20, 0x35, 0x41, 0x20,  // 9 7F 5A 
                    /* 0EA0 */  0x35, 0x41, 0x0A, 0x09, 0x33, 0x39, 0x20, 0x46,  // 5A..39 F
                    /* 0EA8 */  0x30, 0x20, 0x35, 0x41, 0x20, 0x35, 0x41, 0x0A,  // 0 5A 5A.
                    /* 0EB0 */  0x20, 0x20, 0x33, 0x39, 0x20, 0x46, 0x31, 0x20,  //   39 F1 
                    /* 0EB8 */  0x35, 0x41, 0x20, 0x35, 0x41, 0x0A, 0x09, 0x33,  // 5A 5A..3
                    /* 0EC0 */  0x39, 0x20, 0x46, 0x32, 0x20, 0x35, 0x41, 0x20,  // 9 F2 5A 
                    /* 0EC8 */  0x35, 0x41, 0x0A, 0x09, 0x33, 0x39, 0x20, 0x45,  // 5A..39 E
                    /* 0ED0 */  0x37, 0x20, 0x30, 0x30, 0x0A, 0x09, 0x31, 0x35,  // 7 00..15
                    /* 0ED8 */  0x20, 0x30, 0x32, 0x20, 0x30, 0x31, 0x0A, 0x09,  //  02 01..
                    /* 0EE0 */  0x31, 0x35, 0x20, 0x35, 0x39, 0x20, 0x30, 0x30,  // 15 59 00
                    /* 0EE8 */  0x0A, 0x09, 0x33, 0x39, 0x20, 0x32, 0x41, 0x20,  // ..39 2A 
                    /* 0EF0 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x35,  // 00 00 05
                    /* 0EF8 */  0x20, 0x33, 0x46, 0x0A, 0x20, 0x20, 0x33, 0x39,  //  3F.  39
                    /* 0F00 */  0x20, 0x32, 0x42, 0x20, 0x30, 0x30, 0x20, 0x30,  //  2B 00 0
                    /* 0F08 */  0x30, 0x20, 0x30, 0x37, 0x20, 0x36, 0x33, 0x0A,  // 0 07 63.
                    /* 0F10 */  0x09, 0x33, 0x39, 0x20, 0x35, 0x31, 0x20, 0x30,  // .39 51 0
                    /* 0F18 */  0x32, 0x20, 0x34, 0x44, 0x0A, 0x09, 0x31, 0x35,  // 2 4D..15
                    /* 0F20 */  0x20, 0x35, 0x33, 0x20, 0x32, 0x38, 0x0A, 0x09,  //  53 28..
                    /* 0F28 */  0x31, 0x35, 0x20, 0x35, 0x35, 0x20, 0x30, 0x34,  // 15 55 04
                    /* 0F30 */  0x0A, 0x09, 0x33, 0x39, 0x20, 0x35, 0x37, 0x20,  // ..39 57 
                    /* 0F38 */  0x32, 0x30, 0x20, 0x30, 0x31, 0x20, 0x30, 0x30,  // 20 01 00
                    /* 0F40 */  0x20, 0x46, 0x38, 0x20, 0x46, 0x46, 0x20, 0x46,  //  F8 FF F
                    /* 0F48 */  0x30, 0x20, 0x30, 0x30, 0x0A, 0x09, 0x33, 0x39,  // 0 00..39
                    /* 0F50 */  0x20, 0x35, 0x38, 0x20, 0x30, 0x30, 0x20, 0x30,  //  58 00 0
                    /* 0F58 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x46, 0x38, 0x20,  // 0 00 F8 
                    /* 0F60 */  0x46, 0x46, 0x20, 0x46, 0x43, 0x0A, 0x09, 0x31,  // FF FC..1
                    /* 0F68 */  0x35, 0x20, 0x37, 0x36, 0x20, 0x30, 0x30, 0x0A,  // 5 76 00.
                    /* 0F70 */  0x20, 0x20, 0x30, 0x41, 0x20, 0x31, 0x31, 0x20,  //   0A 11 
                    /* 0F78 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x38, 0x39,  // 00 00 89
                    /* 0F80 */  0x20, 0x33, 0x30, 0x20, 0x38, 0x30, 0x20, 0x30,  //  30 80 0
                    /* 0F88 */  0x37, 0x20, 0x36, 0x34, 0x20, 0x30, 0x35, 0x20,  // 7 64 05 
                    /* 0F90 */  0x34, 0x30, 0x20, 0x30, 0x33, 0x20, 0x42, 0x32,  // 40 03 B2
                    /* 0F98 */  0x20, 0x30, 0x32, 0x20, 0x41, 0x30, 0x20, 0x30,  //  02 A0 0
                    /* 0FA0 */  0x32, 0x20, 0x41, 0x30, 0x20, 0x30, 0x32, 0x20,  // 2 A0 02 
                    /* 0FA8 */  0x30, 0x30, 0x20, 0x30, 0x32, 0x20, 0x35, 0x30,  // 00 02 50
                    /* 0FB0 */  0x20, 0x30, 0x30, 0x20, 0x32, 0x30, 0x20, 0x36,  //  00 20 6
                    /* 0FB8 */  0x35, 0x20, 0x32, 0x31, 0x20, 0x30, 0x30, 0x20,  // 5 21 00 
                    /* 0FC0 */  0x30, 0x39, 0x20, 0x30, 0x30, 0x20, 0x30, 0x43,  // 09 00 0C
                    /* 0FC8 */  0x20, 0x30, 0x30, 0x20, 0x31, 0x41, 0x20, 0x30,  //  00 1A 0
                    /* 0FD0 */  0x30, 0x20, 0x31, 0x37, 0x20, 0x31, 0x38, 0x20,  // 0 17 18 
                    /* 0FD8 */  0x30, 0x30, 0x20, 0x31, 0x30, 0x20, 0x46, 0x30,  // 00 10 F0
                    /* 0FE0 */  0x20, 0x30, 0x33, 0x20, 0x30, 0x43, 0x20, 0x32,  //  03 0C 2
                    /* 0FE8 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x36, 0x20,  // 0 00 06 
                    /* 0FF0 */  0x30, 0x42, 0x20, 0x30, 0x42, 0x20, 0x33, 0x33,  // 0B 0B 33
                    /* 0FF8 */  0x20, 0x30, 0x45, 0x20, 0x31, 0x43, 0x20, 0x32,  //  0E 1C 2
                    /* 1000 */  0x41, 0x20, 0x33, 0x38, 0x20, 0x34, 0x36, 0x20,  // A 38 46 
                    /* 1008 */  0x35, 0x34, 0x20, 0x36, 0x32, 0x20, 0x36, 0x39,  // 54 62 69
                    /* 1010 */  0x20, 0x37, 0x30, 0x20, 0x37, 0x37, 0x20, 0x37,  //  70 77 7
                    /* 1018 */  0x39, 0x20, 0x37, 0x42, 0x20, 0x37, 0x44, 0x20,  // 9 7B 7D 
                    /* 1020 */  0x37, 0x45, 0x20, 0x30, 0x31, 0x20, 0x30, 0x32,  // 7E 01 02
                    /* 1028 */  0x20, 0x30, 0x31, 0x20, 0x30, 0x30, 0x20, 0x30,  //  01 00 0
                    /* 1030 */  0x39, 0x20, 0x34, 0x30, 0x20, 0x30, 0x39, 0x20,  // 9 40 09 
                    /* 1038 */  0x42, 0x45, 0x20, 0x31, 0x39, 0x20, 0x46, 0x43,  // BE 19 FC
                    /* 1040 */  0x20, 0x31, 0x39, 0x20, 0x46, 0x41, 0x20, 0x31,  //  19 FA 1
                    /* 1048 */  0x39, 0x20, 0x46, 0x38, 0x20, 0x31, 0x41, 0x20,  // 9 F8 1A 
                    /* 1050 */  0x33, 0x38, 0x20, 0x31, 0x41, 0x20, 0x37, 0x38,  // 38 1A 78
                    /* 1058 */  0x20, 0x31, 0x41, 0x20, 0x42, 0x36, 0x20, 0x32,  //  1A B6 2
                    /* 1060 */  0x41, 0x20, 0x46, 0x36, 0x20, 0x32, 0x42, 0x20,  // A F6 2B 
                    /* 1068 */  0x33, 0x34, 0x20, 0x32, 0x42, 0x20, 0x37, 0x34,  // 34 2B 74
                    /* 1070 */  0x20, 0x33, 0x42, 0x20, 0x37, 0x34, 0x20, 0x36,  //  3B 74 6
                    /* 1078 */  0x42, 0x20, 0x46, 0x34, 0x20, 0x30, 0x30, 0x20,  // B F4 00 
                    /* 1080 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 1088 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 1090 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 1098 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 10A0 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10A8 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 10B0 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 10B8 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10C0 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 10C8 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 10D0 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10D8 */  0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 0 00 00 
                    /* 10E0 */  0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30,  // 00 00 00
                    /* 10E8 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20, 0x30,  //  00 00 0
                    /* 10F0 */  0x30, 0x20, 0x30, 0x30, 0x0A, 0x20, 0x20, 0x33,  // 0 00.  3
                    /* 10F8 */  0x39, 0x20, 0x37, 0x34, 0x20, 0x30, 0x35, 0x20,  // 9 74 05 
                    /* 1100 */  0x30, 0x30, 0x20, 0x33, 0x34, 0x0A, 0x20, 0x20,  // 00 34.  
                    /* 1108 */  0x31, 0x35, 0x20, 0x33, 0x35, 0x20, 0x30, 0x30,  // 15 35 00
                    /* 1110 */  0x0A, 0x20, 0x20, 0x33, 0x39, 0x20, 0x34, 0x34,  // .  39 44
                    /* 1118 */  0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x0A, 0x09,  //  00 00..
                    /* 1120 */  0x30, 0x35, 0x20, 0x31, 0x31, 0x0A, 0x09, 0x46,  // 05 11..F
                    /* 1128 */  0x46, 0x20, 0x38, 0x32, 0x0A, 0x20, 0x20, 0x33,  // F 82.  3
                    /* 1130 */  0x39, 0x20, 0x45, 0x35, 0x20, 0x30, 0x30, 0x20,  // 9 E5 00 
                    /* 1138 */  0x32, 0x30, 0x0A, 0x20, 0x20, 0x31, 0x35, 0x20,  // 20.  15 
                    /* 1140 */  0x42, 0x30, 0x20, 0x30, 0x38, 0x0A, 0x20, 0x20,  // B0 08.  
                    /* 1148 */  0x33, 0x39, 0x20, 0x45, 0x31, 0x20, 0x30, 0x30,  // 39 E1 00
                    /* 1150 */  0x20, 0x30, 0x34, 0x20, 0x35, 0x30, 0x0A, 0x20,  //  04 50. 
                    /* 1158 */  0x20, 0x31, 0x35, 0x20, 0x42, 0x30, 0x20, 0x31,  //  15 B0 1
                    /* 1160 */  0x30, 0x0A, 0x20, 0x20, 0x33, 0x39, 0x20, 0x45,  // 0.  39 E
                    /* 1168 */  0x31, 0x20, 0x30, 0x30, 0x20, 0x30, 0x30, 0x20,  // 1 00 00 
                    /* 1170 */  0x36, 0x30, 0x0A, 0x20, 0x20, 0x33, 0x39, 0x20,  // 60.  39 
                    /* 1178 */  0x42, 0x30, 0x20, 0x30, 0x39, 0x0A, 0x20, 0x20,  // B0 09.  
                    /* 1180 */  0x33, 0x39, 0x20, 0x45, 0x36, 0x20, 0x46, 0x30,  // 39 E6 F0
                    /* 1188 */  0x20, 0x30, 0x31, 0x20, 0x35, 0x39, 0x20, 0x39,  //  01 59 9
                    /* 1190 */  0x32, 0x20, 0x37, 0x36, 0x20, 0x30, 0x31, 0x20,  // 2 76 01 
                    /* 1198 */  0x36, 0x38, 0x0A, 0x20, 0x20, 0x46, 0x46, 0x20,  // 68.  FF 
                    /* 11A0 */  0x38, 0x32, 0x0A, 0x3C, 0x2F, 0x44, 0x53, 0x49,  // 82.</DSI
                    /* 11A8 */  0x49, 0x6E, 0x69, 0x74, 0x53, 0x65, 0x71, 0x75,  // InitSequ
                    /* 11B0 */  0x65, 0x6E, 0x63, 0x65, 0x3E, 0x0A, 0x3C, 0x47,  // ence>.<G
                    /* 11B8 */  0x72, 0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D,  // roup id=
                    /* 11C0 */  0x27, 0x44, 0x53, 0x49, 0x20, 0x54, 0x69, 0x6D,  // 'DSI Tim
                    /* 11C8 */  0x69, 0x6E, 0x67, 0x20, 0x70, 0x61, 0x72, 0x61,  // ing para
                    /* 11D0 */  0x6D, 0x65, 0x74, 0x65, 0x72, 0x73, 0x27, 0x3E,  // meters'>
                    /* 11D8 */  0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49, 0x54,  // .  <DSIT
                    /* 11E0 */  0x69, 0x6D, 0x69, 0x6E, 0x67, 0x48, 0x53, 0x50,  // imingHSP
                    /* 11E8 */  0x72, 0x65, 0x70, 0x61, 0x72, 0x65, 0x4F, 0x76,  // repareOv
                    /* 11F0 */  0x65, 0x72, 0x72, 0x69, 0x64, 0x65, 0x3E, 0x46,  // erride>F
                    /* 11F8 */  0x61, 0x6C, 0x73, 0x65, 0x3C, 0x2F, 0x44, 0x53,  // alse</DS
                    /* 1200 */  0x49, 0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x48,  // ITimingH
                    /* 1208 */  0x53, 0x50, 0x72, 0x65, 0x70, 0x61, 0x72, 0x65,  // SPrepare
                    /* 1210 */  0x4F, 0x76, 0x65, 0x72, 0x72, 0x69, 0x64, 0x65,  // Override
                    /* 1218 */  0x3E, 0x0A, 0x20, 0x20, 0x3C, 0x44, 0x53, 0x49,  // >.  <DSI
                    /* 1220 */  0x54, 0x69, 0x6D, 0x69, 0x6E, 0x67, 0x48, 0x53,  // TimingHS
                    /* 1228 */  0x50, 0x72, 0x65, 0x70, 0x61, 0x72, 0x65, 0x56,  // PrepareV
                    /* 1230 */  0x61, 0x6C, 0x75, 0x65, 0x3E, 0x32, 0x31, 0x3C,  // alue>21<
                    /* 1238 */  0x2F, 0x44, 0x53, 0x49, 0x54, 0x69, 0x6D, 0x69,  // /DSITimi
                    /* 1240 */  0x6E, 0x67, 0x48, 0x53, 0x50, 0x72, 0x65, 0x70,  // ngHSPrep
                    /* 1248 */  0x61, 0x72, 0x65, 0x56, 0x61, 0x6C, 0x75, 0x65,  // areValue
                    /* 1250 */  0x3E, 0x0A, 0x3C, 0x2F, 0x47, 0x72, 0x6F, 0x75,  // >.</Grou
                    /* 1258 */  0x70, 0x3E, 0x0A, 0x3C, 0x44, 0x53, 0x49, 0x54,  // p>.<DSIT
                    /* 1260 */  0x65, 0x72, 0x6D, 0x53, 0x65, 0x71, 0x75, 0x65,  // ermSeque
                    /* 1268 */  0x6E, 0x63, 0x65, 0x3E, 0x0A, 0x20, 0x20, 0x30,  // nce>.  0
                    /* 1270 */  0x35, 0x20, 0x32, 0x38, 0x0A, 0x20, 0x20, 0x30,  // 5 28.  0
                    /* 1278 */  0x35, 0x20, 0x31, 0x30, 0x0A, 0x3C, 0x2F, 0x44,  // 5 10.</D
                    /* 1280 */  0x53, 0x49, 0x54, 0x65, 0x72, 0x6D, 0x53, 0x65,  // SITermSe
                    /* 1288 */  0x71, 0x75, 0x65, 0x6E, 0x63, 0x65, 0x3E, 0x0A,  // quence>.
                    /* 1290 */  0x3C, 0x44, 0x53, 0x49, 0x50, 0x6F, 0x73, 0x74,  // <DSIPost
                    /* 1298 */  0x49, 0x6E, 0x69, 0x74, 0x53, 0x65, 0x71, 0x75,  // InitSequ
                    /* 12A0 */  0x65, 0x6E, 0x63, 0x65, 0x3E, 0x0A, 0x20, 0x20,  // ence>.  
                    /* 12A8 */  0x30, 0x35, 0x20, 0x32, 0x39, 0x0A, 0x3C, 0x2F,  // 05 29.</
                    /* 12B0 */  0x44, 0x53, 0x49, 0x50, 0x6F, 0x73, 0x74, 0x49,  // DSIPostI
                    /* 12B8 */  0x6E, 0x69, 0x74, 0x53, 0x65, 0x71, 0x75, 0x65,  // nitSeque
                    /* 12C0 */  0x6E, 0x63, 0x65, 0x3E, 0x0A, 0x3C, 0x54, 0x4C,  // nce>.<TL
                    /* 12C8 */  0x4D, 0x4D, 0x47, 0x50, 0x49, 0x4F, 0x44, 0x65,  // MMGPIODe
                    /* 12D0 */  0x66, 0x61, 0x75, 0x6C, 0x74, 0x48, 0x69, 0x67,  // faultHig
                    /* 12D8 */  0x68, 0x3E, 0x30, 0x78, 0x33, 0x32, 0x3C, 0x2F,  // h>0x32</
                    /* 12E0 */  0x54, 0x4C, 0x4D, 0x4D, 0x47, 0x50, 0x49, 0x4F,  // TLMMGPIO
                    /* 12E8 */  0x44, 0x65, 0x66, 0x61, 0x75, 0x6C, 0x74, 0x48,  // DefaultH
                    /* 12F0 */  0x69, 0x67, 0x68, 0x3E, 0x0A, 0x3C, 0x47, 0x72,  // igh>.<Gr
                    /* 12F8 */  0x6F, 0x75, 0x70, 0x20, 0x69, 0x64, 0x3D, 0x27,  // oup id='
                    /* 1300 */  0x42, 0x61, 0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68,  // Backligh
                    /* 1308 */  0x74, 0x20, 0x43, 0x6F, 0x6E, 0x66, 0x69, 0x67,  // t Config
                    /* 1310 */  0x75, 0x72, 0x61, 0x74, 0x69, 0x6F, 0x6E, 0x27,  // uration'
                    /* 1318 */  0x3E, 0x0A, 0x20, 0x3C, 0x42, 0x61, 0x63, 0x6B,  // >. <Back
                    /* 1320 */  0x6C, 0x69, 0x67, 0x68, 0x74, 0x54, 0x79, 0x70,  // lightTyp
                    /* 1328 */  0x65, 0x3E, 0x33, 0x3C, 0x2F, 0x42, 0x61, 0x63,  // e>3</Bac
                    /* 1330 */  0x6B, 0x6C, 0x69, 0x67, 0x68, 0x74, 0x54, 0x79,  // klightTy
                    /* 1338 */  0x70, 0x65, 0x3E, 0x0A, 0x20, 0x3C, 0x42, 0x61,  // pe>. <Ba
                    /* 1340 */  0x63, 0x6B, 0x6C, 0x69, 0x67, 0x68, 0x74, 0x42,  // cklightB
                    /* 1348 */  0x69, 0x74, 0x57, 0x69, 0x64, 0x74, 0x68, 0x3E,  // itWidth>
                    /* 1350 */  0x31, 0x30, 0x3C, 0x2F, 0x42, 0x61, 0x63, 0x6B,  // 10</Back
                    /* 1358 */  0x6C, 0x69, 0x67, 0x68, 0x74, 0x42, 0x69, 0x74,  // lightBit
                    /* 1360 */  0x57, 0x69, 0x64, 0x74, 0x68, 0x3E, 0x0A, 0x20,  // Width>. 
                    /* 1368 */  0x3C, 0x44, 0x69, 0x73, 0x70, 0x6C, 0x61, 0x79,  // <Display
                    /* 1370 */  0x52, 0x65, 0x73, 0x65, 0x74, 0x49, 0x6E, 0x66,  // ResetInf
                    /* 1378 */  0x6F, 0x3E, 0x30, 0x20, 0x31, 0x30, 0x20, 0x31,  // o>0 10 1
                    /* 1380 */  0x30, 0x30, 0x30, 0x20, 0x31, 0x30, 0x30, 0x30,  // 000 1000
                    /* 1388 */  0x30, 0x20, 0x30, 0x3C, 0x2F, 0x44, 0x69, 0x73,  // 0 0</Dis
                    /* 1390 */  0x70, 0x6C, 0x61, 0x79, 0x52, 0x65, 0x73, 0x65,  // playRese
                    /* 1398 */  0x74, 0x49, 0x6E, 0x66, 0x6F, 0x3E, 0x0A, 0x3C,  // tInfo>.<
                    /* 13A0 */  0x2F, 0x47, 0x72, 0x6F, 0x75, 0x70, 0x3E, 0x00   // /Group>.
                })
                While (One)
                {
                    If (One)
                    {
                        Local2 = PCFG /* \_SB_.GPU0.ROM2.PCFG */
                    }

                    Break
                }

                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0.ROM2.RBUF */
            }

            Method (GRT2, 2, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.GRT2.RBUF */
            }

            Method (BRT2, 2, NotSerialized)
            {
                Name (RBUF, Buffer (One)
                {
                     0x00                                             // .
                })
                Return (RBUF) /* \_SB_.GPU0.BRT2.RBUF */
            }

            Method (ROE1, 3, NotSerialized)
            {
                Name (PCFG, Buffer (0x45)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65,  // DPEnable
                    /* 0030 */  0x53, 0x53, 0x43, 0x3E, 0x31, 0x3C, 0x2F, 0x44,  // SSC>1</D
                    /* 0038 */  0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65, 0x53,  // PEnableS
                    /* 0040 */  0x53, 0x43, 0x3E, 0x0A, 0x00                     // SC>..
                })
                Local2 = PCFG /* \_SB_.GPU0.ROE1.PCFG */
                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0.ROE1.RBUF */
            }

            Method (ROE2, 3, NotSerialized)
            {
                Name (PCFG, Buffer (0x45)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65,  // DPEnable
                    /* 0030 */  0x53, 0x53, 0x43, 0x3E, 0x31, 0x3C, 0x2F, 0x44,  // SSC>1</D
                    /* 0038 */  0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65, 0x53,  // PEnableS
                    /* 0040 */  0x53, 0x43, 0x3E, 0x0A, 0x00                     // SC>..
                })
                Local2 = PCFG /* \_SB_.GPU0.ROE2.PCFG */
                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0.ROE2.RBUF */
            }

            Method (ROE3, 3, NotSerialized)
            {
                Name (PCFG, Buffer (0x66)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F, 0x6C,  // DPAUXPol
                    /* 0030 */  0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x30, 0x3C,  // arity>0<
                    /* 0038 */  0x2F, 0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F,  // /DPAUXPo
                    /* 0040 */  0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A,  // larity>.
                    /* 0048 */  0x3C, 0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C,  // <DPEnabl
                    /* 0050 */  0x65, 0x53, 0x53, 0x43, 0x3E, 0x31, 0x3C, 0x2F,  // eSSC>1</
                    /* 0058 */  0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65,  // DPEnable
                    /* 0060 */  0x53, 0x53, 0x43, 0x3E, 0x0A, 0x00               // SSC>..
                })
                Local2 = PCFG /* \_SB_.GPU0.ROE3.PCFG */
                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0.ROE3.RBUF */
            }

            Method (ROE4, 3, NotSerialized)
            {
                Name (PCFG, Buffer (0x66)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F, 0x6C,  // DPAUXPol
                    /* 0030 */  0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x30, 0x3C,  // arity>0<
                    /* 0038 */  0x2F, 0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F,  // /DPAUXPo
                    /* 0040 */  0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A,  // larity>.
                    /* 0048 */  0x3C, 0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C,  // <DPEnabl
                    /* 0050 */  0x65, 0x53, 0x53, 0x43, 0x3E, 0x31, 0x3C, 0x2F,  // eSSC>1</
                    /* 0058 */  0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65,  // DPEnable
                    /* 0060 */  0x53, 0x53, 0x43, 0x3E, 0x0A, 0x00               // SSC>..
                })
                Local2 = PCFG /* \_SB_.GPU0.ROE4.PCFG */
                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0.ROE4.RBUF */
            }

            Method (ROE5, 3, NotSerialized)
            {
                Name (PCFG, Buffer (0x66)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F, 0x6C,  // DPAUXPol
                    /* 0030 */  0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x30, 0x3C,  // arity>0<
                    /* 0038 */  0x2F, 0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F,  // /DPAUXPo
                    /* 0040 */  0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A,  // larity>.
                    /* 0048 */  0x3C, 0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C,  // <DPEnabl
                    /* 0050 */  0x65, 0x53, 0x53, 0x43, 0x3E, 0x31, 0x3C, 0x2F,  // eSSC>1</
                    /* 0058 */  0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65,  // DPEnable
                    /* 0060 */  0x53, 0x53, 0x43, 0x3E, 0x0A, 0x00               // SSC>..
                })
                Local2 = PCFG /* \_SB_.GPU0.ROE5.PCFG */
                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0.ROE5.RBUF */
            }

            Method (ROE6, 3, NotSerialized)
            {
                Name (PCFG, Buffer (0x66)
                {
                    /* 0000 */  0x3C, 0x3F, 0x78, 0x6D, 0x6C, 0x20, 0x76, 0x65,  // <?xml ve
                    /* 0008 */  0x72, 0x73, 0x69, 0x6F, 0x6E, 0x3D, 0x27, 0x31,  // rsion='1
                    /* 0010 */  0x2E, 0x30, 0x27, 0x20, 0x65, 0x6E, 0x63, 0x6F,  // .0' enco
                    /* 0018 */  0x64, 0x69, 0x6E, 0x67, 0x3D, 0x27, 0x75, 0x74,  // ding='ut
                    /* 0020 */  0x66, 0x2D, 0x38, 0x27, 0x3F, 0x3E, 0x0A, 0x3C,  // f-8'?>.<
                    /* 0028 */  0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F, 0x6C,  // DPAUXPol
                    /* 0030 */  0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x30, 0x3C,  // arity>0<
                    /* 0038 */  0x2F, 0x44, 0x50, 0x41, 0x55, 0x58, 0x50, 0x6F,  // /DPAUXPo
                    /* 0040 */  0x6C, 0x61, 0x72, 0x69, 0x74, 0x79, 0x3E, 0x0A,  // larity>.
                    /* 0048 */  0x3C, 0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C,  // <DPEnabl
                    /* 0050 */  0x65, 0x53, 0x53, 0x43, 0x3E, 0x31, 0x3C, 0x2F,  // eSSC>1</
                    /* 0058 */  0x44, 0x50, 0x45, 0x6E, 0x61, 0x62, 0x6C, 0x65,  // DPEnable
                    /* 0060 */  0x53, 0x53, 0x43, 0x3E, 0x0A, 0x00               // SSC>..
                })
                Local2 = PCFG /* \_SB_.GPU0.ROE6.PCFG */
                If ((Arg0 >= SizeOf (Local2)))
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
                Else
                {
                    Local0 = Arg0
                }

                If ((Arg1 > 0x1000))
                {
                    Local1 = 0x1000
                }
                Else
                {
                    Local1 = Arg1
                }

                If (((Local0 + Local1) > SizeOf (Local2)))
                {
                    Local1 = (SizeOf (Local2) - Local0)
                }

                CreateField (Local2, (0x08 * Local0), (0x08 * Local1), RBUF)
                Return (RBUF) /* \_SB_.GPU0.ROE6.RBUF */
            }

            Name (_DOD, Package (0x01)  // _DOD: Display Output Devices
            {
                0x00024321
            })
            Device (AVS0)
            {
                Name (_ADR, 0x00024321)  // _ADR: Address
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    })
                    Return (RBUF) /* \_SB_.GPU0.AVS0._CRS.RBUF */
                }

                Name (_DEP, Package (0x03)  // _DEP: Dependencies
                {
                    \_SB.MMU0, 
                    \_SB.IMM0, 
                    \_SB.VFE0
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_HRV, 0, NotSerialized)  // _HRV: Hardware Revision
            {
                Name (RESU, Zero)
                Name (TIER, Zero)
                Name (DREV, Zero)
                Name (FAMI, Zero)
                TIER = (\_SB.SIDT & 0x0F)
                DREV = ((\_SB.SJTG >> 0x1C) & 0x0F)
                DREV <<= 0x04
                If ((\_SB.SDFE == 0x69))
                {
                    FAMI = (0x03 << 0x0B)
                }

                RESU |= TIER /* \_SB_.GPU0._HRV.RESU */
                RESU |= DREV /* \_SB_.GPU0._HRV.RESU */
                RESU |= FAMI /* \_SB_.GPU0._HRV.RESU */
                Return (RESU) /* \_SB_.GPU0._HRV.RESU */
            }

            Method (CHDV, 0, NotSerialized)
            {
                Name (CHIF, Package (0x02)
                {
                    One, 
                    Package (0x07)
                    {
                        "CHILDDEV", 
                        Zero, 
                        0x00024321, 
                        "QCOM_AVStream_8350", 
                        Zero, 
                        "Qualcomm Camera AVStream Mini Driver", 
                        Package (0x04)
                        {
                            "COMPATIBLEIDS", 
                            0x02, 
                            "VEN_QCOM&DEV__AVSTREAM", 
                            "QCOM_AVSTREAM"
                        }
                    }
                })
                Return (CHIF) /* \_SB_.GPU0.CHDV.CHIF */
            }

            Name (LIDB, One)
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Return (LIDB) /* \_SB_.GPU0.LIDB */
            }
        }

        Device (SCM0)
        {
            Name (_HID, "QCOM04DD")  // _HID: Hardware ID
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (TLOG)
        {
            Name (_HID, "QCOM1AE4")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (TREE)
        {
            Name (_HID, "QCOM04DE")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0088
                        }
                    Memory32Fixed (ReadWrite,
                        0xDEADBEEF,         // Address Base
                        0xBEEFDEAD,         // Address Length
                        _Y00)
                })
                CreateDWordField (RBUF, \_SB.TREE._CRS._Y00._BAS, TGCA)  // _BAS: Base Address
                CreateDWordField (RBUF, \_SB.TREE._CRS._Y00._LEN, TGCL)  // _LEN: Length
                TGCA = \_SB.TCMA
                TGCL = \_SB.TCML
                Return (RBUF) /* \_SB_.TREE._CRS.RBUF */
            }
        }

        Device (SPMI)
        {
            Name (_HID, "QCOM1A0B")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_CID, "PNP0CA2")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0C400000,         // Address Base
                        0x02800000,         // Address Length
                        )
                })
                Return (RBUF) /* \_SB_.SPMI._CRS.RBUF */
            }

            Method (CONF, 0, NotSerialized)
            {
                Name (XBUF, Buffer (0x1A)
                {
                    /* 0000 */  0x00, 0x01, 0x01, 0x01, 0xFF, 0x00, 0x02, 0x00,  // ........
                    /* 0008 */  0x0A, 0x07, 0x04, 0x07, 0x01, 0xFF, 0x10, 0x01,  // ........
                    /* 0010 */  0x00, 0x01, 0x0C, 0x40, 0x00, 0x00, 0x02, 0x80,  // ...@....
                    /* 0018 */  0x00, 0x00                                       // ..
                })
                Return (XBUF) /* \_SB_.SPMI.CONF.XBUF */
            }
        }

        Device (GIO0)
        {
            Name (_HID, "QCOM1A0C")  // _HID: Hardware ID
            Name (_CID, "QCOMFFE3")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            OperationRegion (GPOR, GeneralPurposeIo, Zero, One)
            Field (\_SB.GIO0.GPOR, ByteAcc, NoLock, Preserve)
            {
                Connection (
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0026
                        }
                ), 
                LIDR,   1
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0F100000,         // Address Base
                        0x00300000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000F0,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000F0,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000F0,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000000F0,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x000002FC,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000228,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000111,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000112,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000012D,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000199,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002DC,
                    }
                })
                Return (RBUF) /* \_SB_.GIO0._CRS.RBUF */
            }

            Method (OFNI, 0, NotSerialized)
            {
                Name (RBUF, Buffer (0x02)
                {
                     0xCC, 0x00                                       // ..
                })
                Return (RBUF) /* \_SB_.GIO0.OFNI.RBUF */
            }

            Name (GABL, Zero)
            Method (_REG, 2, NotSerialized)  // _REG: Region Availability
            {
                If ((Arg0 == 0x08))
                {
                    GABL = Arg1
                }
            }

            Method (_AEI, 0, NotSerialized)  // _AEI: ACPI Event Interrupts
            {
                If ((\_SB.PLST == One))
                {
                    Name (RBFC, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0026
                            }
                    })
                    Return (RBFC) /* \_SB_.GIO0._AEI.RBFC */
                }
                Else
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveHigh, Exclusive, PullDown, 0x01F4,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0002
                            }
                        GpioInt (Edge, ActiveBoth, SharedAndWake, PullNone, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0026
                            }
                    })
                    Return (RBUF) /* \_SB_.GIO0._AEI.RBUF */
                }
            }

            Method (_E02, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=0x00-0xFF
            {
                If ((\_SB.PLST != One))
                {
                    Notify (\_SB.GPU0, 0x92) // Device-Specific
                }
            }

            Method (_E26, 0, NotSerialized)  // _Exx: Edge-Triggered GPE, xx=0x00-0xFF
            {
                \_SB.LID0.LIDB = \_SB.GIO0.LIDR
                \_SB.GPU0.LIDB = \_SB.GIO0.LIDR
                Notify (\_SB.LID0, 0x80) // Status Change
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("4f248f40-d5e2-499f-834c-27758ea1cd3f") /* GPIO Controller */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = Arg2
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x01)
                            {
                                0x0140
                            })
                        }
                        Else
                        {
                            BreakPoint
                        }

                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }

        Device (IPCC)
        {
            Name (_HID, "QCOM1AC2")  // _HID: Hardware ID
            Name (_CID, "QCOMFFE2")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000105,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000106,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000107,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000384,
                    }
                })
                Return (RBUF) /* \_SB_.IPCC._CRS.RBUF */
            }
        }

        Device (WWAN)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PM01
            })
            Name (_HID, "QCOM1ADA")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Alias (\_SB.PSUB, _SUB)
            Name (GMDM, ResourceTemplate ()
            {
                GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                    "\\_SB.PM01", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x014D
                    }
            })
            Name (GMDR, ResourceTemplate ()
            {
                GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                    "\\_SB.PM01", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0150
                    }
            })
            Name (GMDS, ResourceTemplate ()
            {
                GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                    "\\_SB.PM01", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0148
                    }
            })
            Scope (\_SB.PM01)
            {
                OperationRegion (MPON, GeneralPurposeIo, Zero, One)
                OperationRegion (PMDR, GeneralPurposeIo, Zero, One)
                OperationRegion (PMON, GeneralPurposeIo, Zero, One)
            }

            Field (\_SB.PM01.MPON, ByteAcc, NoLock, Preserve)
            {
                Connection (\_SB.WWAN.GMDM), 
                MPON,   1
            }

            Field (\_SB.PM01.PMDR, ByteAcc, NoLock, Preserve)
            {
                Connection (\_SB.WWAN.GMDR), 
                PMDR,   1
            }

            Field (\_SB.PM01.PMON, ByteAcc, NoLock, Preserve)
            {
                Connection (\_SB.WWAN.GMDS), 
                PMON,   1
            }

            Method (_MFF, 0, NotSerialized)
            {
                Debug = "Start SDX55 Power OFF Sequence"
                If (((\_SB.PSUB == "MTP08350") || (\_SB.PSUB == "QRD08350")))
                {
                    Sleep (0x0190)
                    Debug = "Set GPIO 6D to Low"
                    \_SB.WWAN.MPON = Zero
                    Debug = "Set GPIO 9D to Low"
                    \_SB.WWAN.PMDR = Zero
                    Sleep (0xD7)
                    Debug = "Set GPIO 1D to Low"
                    \_SB.WWAN.PMON = Zero
                    Sleep (One)
                }
                Else
                {
                    Debug = "SDX55 Power OFF not supported for this form factor"
                }

                Debug = "End SDX55 Power OFF Sequence"
            }

            Method (_MNF, 0, NotSerialized)
            {
                Debug = "Start SDX55 Power OFF Sequence with 3000 ms delay."
                If (((\_SB.PSUB == "MTP08350") || (\_SB.PSUB == "QRD08350")))
                {
                    Sleep (0x0190)
                    Debug = "Set GPIO 6D to Low"
                    \_SB.WWAN.MPON = Zero
                    Debug = "Set GPIO 9D to Low"
                    \_SB.WWAN.PMDR = Zero
                    Sleep (0x0BB8)
                    Debug = "Set GPIO 1D to Low"
                    \_SB.WWAN.PMON = Zero
                    Sleep (One)
                }
                Else
                {
                    Debug = "SDX55 Power OFF not supported for this form factor"
                }

                Debug = "End SDX55 Power OFF Sequence"
            }
        }

        Scope (\_SB.WWAN)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP4 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Device (PCI0)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QPPX
            })
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_SEG, Zero)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0xB5
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0xB6
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0xB7
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0xB8
                }
            })
            Method (_CCA, 0, NotSerialized)  // _CCA: Cache Coherency Attribute
            {
                Return (One)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP0 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x60300000,         // Address Base
                        0x01D00000,         // Address Length
                        )
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0001,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0002,             // Length
                        ,, )
                })
                Return (RBUF) /* \_SB_.PCI0._CRS.RBUF */
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x15
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x03                                       // ..
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    One
                                }, 

                                Package (0x03)
                                {
                                    Zero, 
                                    One, 
                                    One
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (Package (One)
                            {
                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Package (One)
                            {
                                Zero
                            })
                        }
                        ElseIf ((_T_0 == 0x04))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x05))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x06))
                        {
                            Return (Package (0x04)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x07))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x08))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                Zero, 
                                0xFFFFFFFF
                            })
                        }
                        Else
                        {
                        }

                        Break
                    }
                }
            }

            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.P0RR
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                \_SB.P0RR
            })
            Device (RP1)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.R0RR
                })
                Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    \_SB.R0RR
                })
                Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                {
                    \_SB.R0RR
                })
                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "HotPlugSupportInD3", 
                            One
                        }
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBF0, Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    })
                    Return (RBF0) /* \_SB_.PCI0.RP1_._CRS.RBF0 */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = ToInteger (Arg2)
                            If ((_T_0 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x01, 0x03                                       // ..
                                })
                            }
                            ElseIf ((_T_0 == 0x08))
                            {
                                Return (Package (One)
                                {
                                    One
                                })
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (Package (0x05)
                                {
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    Zero, 
                                    0xFFFFFFFF
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                }
            }
        }

        PowerResource (P0RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }

        PowerResource (R0RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
            }
        }

        Device (QPPX)
        {
            Name (_HID, "QCOM1A96")  // _HID: Hardware ID
            Name (_CID, "QCOMFFE4")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x005E
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x01, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x005E
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x008F
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x01, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0093
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x02, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0097
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x03, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0099
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x03, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x008D
                        }
                })
                Return (RBUF) /* \_SB_.QPPX._CRS.RBUF */
            }

            Method (_QPG, 0, Serialized)
            {
                Return (Package (0x07)
                {
                    One, 
                    One, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
            }

            Name (GWLE, ResourceTemplate ()
            {
                GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                    "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                    )
                    {   // Pin list
                        0x0060
                    }
            })
            Scope (\_SB.GIO0)
            {
                OperationRegion (WLEN, GeneralPurposeIo, Zero, One)
            }

            Field (\_SB.GIO0.WLEN, ByteAcc, NoLock, Preserve)
            {
                Connection (\_SB.QPPX.GWLE), 
                WLEN,   1
            }

            Method (_RST, 1, Serialized)  // _RST: Device Reset
            {
                While (One)
                {
                    Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    _T_0 = ToInteger (Arg0)
                    If ((_T_0 == Zero))
                    {
                        \_SB.QPPX.WLEN = Zero
                        Sleep (0x05)
                        \_SB.QPPX.WLEN = One
                    }
                    ElseIf ((_T_0 == One))
                    {
                        Debug = "SDX not supported yet"
                    }
                    Else
                    {
                        Debug = "Invalid PCIe port number passed to QPPX reset helper"
                    }

                    Break
                }
            }
        }

        Device (PCI1)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QPPX
            })
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_SEG, One)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0x64
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0x65
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0x66
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0x67
                }
            })
            Method (_CCA, 0, NotSerialized)  // _CCA: Cache Coherency Attribute
            {
                Return (One)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP1 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x40300000,         // Address Base
                        0x01D00000,         // Address Length
                        )
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0001,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0002,             // Length
                        ,, )
                })
                Return (RBUF) /* \_SB_.PCI1._CRS.RBUF */
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI1._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI1._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x15
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI1.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x03                                       // ..
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    One
                                }, 

                                Package (0x03)
                                {
                                    Zero, 
                                    One, 
                                    One
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (Package (One)
                            {
                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Package (One)
                            {
                                Zero
                            })
                        }
                        ElseIf ((_T_0 == 0x04))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x05))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x06))
                        {
                            Return (Package (0x04)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x07))
                        {
                            Return (Package (One)
                            {
                                0x02
                            })
                        }
                        ElseIf ((_T_0 == 0x08))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                Zero, 
                                0xFFFFFFFF
                            })
                        }
                        Else
                        {
                        }

                        Break
                    }
                }
            }

            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.P1RR
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                \_SB.P1RR
            })
            Device (RP1)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.R1RR
                })
                Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    \_SB.R1RR
                })
                Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                {
                    \_SB.R1RR
                })
                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "HotPlugSupportInD3", 
                            One
                        }
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, Buffer (0x02)
                    {
                         0x79, 0x00                                       // y.
                    })
                    Return (RBUF) /* \_SB_.PCI1.RP1_._CRS.RBUF */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = ToInteger (Arg2)
                            If ((_T_0 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x01, 0x03                                       // ..
                                })
                            }
                            ElseIf ((_T_0 == 0x08))
                            {
                                Return (Package (One)
                                {
                                    One
                                })
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (Package (0x05)
                                {
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    Zero, 
                                    0xFFFFFFFF
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                }
            }
        }

        PowerResource (P1RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }

        PowerResource (R1RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
            }
        }

        Device (PCI2)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QPPX
            })
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_SEG, 0x02)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0x46
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0x47
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0x48
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0x49
                }
            })
            Method (_CCA, 0, NotSerialized)  // _CCA: Cache Coherency Attribute
            {
                Return (One)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP2 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x3C300000,         // Address Base
                        0x01D00000,         // Address Length
                        )
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0001,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0002,             // Length
                        ,, )
                })
                Return (RBUF) /* \_SB_.PCI2._CRS.RBUF */
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI2._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI2._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x15
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI2.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x03                                       // ..
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    One
                                }, 

                                Package (0x03)
                                {
                                    Zero, 
                                    One, 
                                    One
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (Package (One)
                            {
                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Package (One)
                            {
                                Zero
                            })
                        }
                        ElseIf ((_T_0 == 0x04))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x05))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x06))
                        {
                            Return (Package (0x04)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x07))
                        {
                            Return (Package (One)
                            {
                                0x03
                            })
                        }
                        ElseIf ((_T_0 == 0x08))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                Zero, 
                                0xFFFFFFFF
                            })
                        }
                        Else
                        {
                        }

                        Break
                    }
                }
            }

            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.P2RR
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                \_SB.P2RR
            })
            Device (RP1)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.R2RR
                })
                Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    \_SB.R2RR
                })
                Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                {
                    \_SB.R2RR
                })
                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "HotPlugSupportInD3", 
                            One
                        }
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0180
                            }
                    })
                    Return (RBUF) /* \_SB_.PCI2.RP1_._CRS.RBUF */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = ToInteger (Arg2)
                            If ((_T_0 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x01, 0x03                                       // ..
                                })
                            }
                            ElseIf ((_T_0 == 0x08))
                            {
                                Return (Package (One)
                                {
                                    One
                                })
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (Package (0x05)
                                {
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    Zero, 
                                    0xFFFFFFFF
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                }
            }
        }

        PowerResource (P2RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }

        PowerResource (R2RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
            }
        }

        Device (PCI3)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QPPX
            })
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_SEG, 0x03)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0x38
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0x39
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0x3A
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0x3B
                }
            })
            Method (_CCA, 0, NotSerialized)  // _CCA: Cache Coherency Attribute
            {
                Return (One)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP3 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x38300000,         // Address Base
                        0x01D00000,         // Address Length
                        )
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0001,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0002,             // Length
                        ,, )
                })
                Return (RBUF) /* \_SB_.PCI3._CRS.RBUF */
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI3._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI3._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x15
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI3.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x03                                       // ..
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    One
                                }, 

                                Package (0x03)
                                {
                                    Zero, 
                                    One, 
                                    One
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (Package (One)
                            {
                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Package (One)
                            {
                                Zero
                            })
                        }
                        ElseIf ((_T_0 == 0x04))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x05))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x06))
                        {
                            Return (Package (0x04)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x07))
                        {
                            Return (Package (One)
                            {
                                0x04
                            })
                        }
                        ElseIf ((_T_0 == 0x08))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                Zero, 
                                0xFFFFFFFF
                            })
                        }
                        Else
                        {
                        }

                        Break
                    }
                }
            }

            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.P3RR
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                \_SB.P3RR
            })
            Device (RP1)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.R3RR
                })
                Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    \_SB.R3RR
                })
                Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                {
                    \_SB.R3RR
                })
                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "HotPlugSupportInD3", 
                            One
                        }
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x01C0
                            }
                    })
                    Return (RBUF) /* \_SB_.PCI3.RP1_._CRS.RBUF */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = ToInteger (Arg2)
                            If ((_T_0 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x01, 0x03                                       // ..
                                })
                            }
                            ElseIf ((_T_0 == 0x08))
                            {
                                Return (Package (One)
                                {
                                    One
                                })
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (Package (0x05)
                                {
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    Zero, 
                                    0xFFFFFFFF
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                }
            }
        }

        PowerResource (P3RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }

        PowerResource (R3RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
            }
        }

        Device (PCI4)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QPPX, 
                \_SB.WWAN
            })
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, 0x04)  // _UID: Unique ID
            Name (_SEG, 0x04)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0x51
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0x52
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0x53
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0x54
                }
            })
            Method (_CCA, 0, NotSerialized)  // _CCA: Cache Coherency Attribute
            {
                Return (One)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP4 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x34300000,         // Address Base
                        0x01D00000,         // Address Length
                        )
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0001,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0002,             // Length
                        ,, )
                })
                Return (RBUF) /* \_SB_.PCI4._CRS.RBUF */
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI4._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI4._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x15
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI4.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x03                                       // ..
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    One
                                }, 

                                Package (0x03)
                                {
                                    Zero, 
                                    One, 
                                    One
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (Package (One)
                            {
                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Package (One)
                            {
                                Zero
                            })
                        }
                        ElseIf ((_T_0 == 0x04))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x05))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x06))
                        {
                            Return (Package (0x04)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x07))
                        {
                            Return (Package (One)
                            {
                                0x05
                            })
                        }
                        ElseIf ((_T_0 == 0x08))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                Zero, 
                                0xFFFFFFFF
                            })
                        }
                        Else
                        {
                        }

                        Break
                    }
                }
            }

            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.P4RR
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                \_SB.P4RR
            })
            Device (RP1)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.R4RR
                })
                Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    \_SB.R4RR
                })
                Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                {
                    \_SB.R4RR
                })
                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "HotPlugSupportInD3", 
                            One
                        }
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0200
                            }
                    })
                    Return (RBUF) /* \_SB_.PCI4.RP1_._CRS.RBUF */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = ToInteger (Arg2)
                            If ((_T_0 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x01, 0x03                                       // ..
                                })
                            }
                            ElseIf ((_T_0 == 0x08))
                            {
                                Return (Package (One)
                                {
                                    One
                                })
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (Package (0x05)
                                {
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    Zero, 
                                    0xFFFFFFFF
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                }
            }
        }

        PowerResource (P4RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }

        PowerResource (R4RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
            }
        }

        Device (PCI5)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QPPX
            })
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, 0x05)  // _UID: Unique ID
            Name (_SEG, 0x05)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0x42
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0x43
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0x44
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0x45
                }
            })
            Method (_CCA, 0, NotSerialized)  // _CCA: Cache Coherency Attribute
            {
                Return (One)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP5 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x32300000,         // Address Base
                        0x01D00000,         // Address Length
                        )
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0001,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0002,             // Length
                        ,, )
                })
                Return (RBUF) /* \_SB_.PCI5._CRS.RBUF */
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI5._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI5._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x15
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI5.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x03                                       // ..
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    One
                                }, 

                                Package (0x03)
                                {
                                    Zero, 
                                    One, 
                                    One
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (Package (One)
                            {
                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Package (One)
                            {
                                Zero
                            })
                        }
                        ElseIf ((_T_0 == 0x04))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x05))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x06))
                        {
                            Return (Package (0x04)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x07))
                        {
                            Return (Package (One)
                            {
                                0x06
                            })
                        }
                        ElseIf ((_T_0 == 0x08))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                Zero, 
                                0xFFFFFFFF
                            })
                        }
                        Else
                        {
                        }

                        Break
                    }
                }
            }

            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.P5RR
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                \_SB.P5RR
            })
            Device (RP1)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.R5RR
                })
                Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    \_SB.R5RR
                })
                Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                {
                    \_SB.R5RR
                })
                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "HotPlugSupportInD3", 
                            One
                        }
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0240
                            }
                    })
                    Return (RBUF) /* \_SB_.PCI5.RP1_._CRS.RBUF */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = ToInteger (Arg2)
                            If ((_T_0 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x01, 0x03                                       // ..
                                })
                            }
                            ElseIf ((_T_0 == 0x08))
                            {
                                Return (Package (One)
                                {
                                    One
                                })
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (Package (0x05)
                                {
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    Zero, 
                                    0xFFFFFFFF
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                }
            }
        }

        PowerResource (P5RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }

        PowerResource (R5RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
            }
        }

        Device (PCI6)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.QPPX, 
                \_SB.IPC0
            })
            Name (_HID, EisaId ("PNP0A08") /* PCI Express Bus */)  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0A03") /* PCI Bus */)  // _CID: Compatible ID
            Name (_UID, 0x06)  // _UID: Unique ID
            Name (_SEG, 0x06)  // _SEG: PCI Segment
            Name (_BBN, Zero)  // _BBN: BIOS Bus Number
            Name (_PRT, Package (0x04)  // _PRT: PCI Routing Table
            {
                Package (0x04)
                {
                    0xFFFF, 
                    Zero, 
                    Zero, 
                    0x2A
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    One, 
                    Zero, 
                    0x2B
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x02, 
                    Zero, 
                    0x2C
                }, 

                Package (0x04)
                {
                    0xFFFF, 
                    0x03, 
                    Zero, 
                    0x2D
                }
            })
            Method (_CCA, 0, NotSerialized)  // _CCA: Cache Coherency Attribute
            {
                Return (One)
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((PRP6 == One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Method (_PSC, 0, NotSerialized)  // _PSC: Power State Current
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x30300000,         // Address Base
                        0x01D00000,         // Address Length
                        )
                    WordBusNumber (ResourceProducer, MinFixed, MaxFixed, PosDecode,
                        0x0000,             // Granularity
                        0x0000,             // Range Minimum
                        0x0001,             // Range Maximum
                        0x0000,             // Translation Offset
                        0x0002,             // Length
                        ,, )
                })
                Return (RBUF) /* \_SB_.PCI6._CRS.RBUF */
            }

            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_DSW, 3, NotSerialized)  // _DSW: Device Sleep Wake
            {
            }

            Method (_OSC, 4, NotSerialized)  // _OSC: Operating System Capabilities
            {
                If ((Arg0 == ToUUID ("33db4d5b-1ff7-401c-9657-7441c03dd766") /* PCI Host Bridge Device */))
                {
                    CreateDWordField (Arg3, Zero, CDW1)
                    CreateDWordField (Arg3, 0x04, CDW2)
                    CreateDWordField (Arg3, 0x08, CDW3)
                    SUPP = CDW2 /* \_SB_.PCI6._OSC.CDW2 */
                    CTRL = CDW3 /* \_SB_.PCI6._OSC.CDW3 */
                    If (((SUPP & 0x16) != 0x16))
                    {
                        CTRL &= 0x1E
                    }

                    CTRL &= 0x15
                    If ((Arg1 != One))
                    {
                        CDW1 |= 0x08
                    }

                    If ((CDW3 != CTRL))
                    {
                        CDW1 |= 0x10
                    }

                    CDW3 = CTRL /* \_SB_.PCI6.CTRL */
                    Return (Arg3)
                }
                Else
                {
                    CDW1 |= 0x04
                    Return (Arg3)
                }
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (0x02)
                            {
                                 0xFF, 0x03                                       // ..
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    One
                                }, 

                                Package (0x03)
                                {
                                    Zero, 
                                    One, 
                                    One
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (Package (One)
                            {
                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Package (One)
                            {
                                Zero
                            })
                        }
                        ElseIf ((_T_0 == 0x04))
                        {
                            Return (Package (0x02)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (0x04)
                                {
                                    One, 
                                    0x03, 
                                    Zero, 
                                    0x07
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x05))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x06))
                        {
                            Return (Package (0x04)
                            {
                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }, 

                                Package (One)
                                {
                                    Zero
                                }
                            })
                        }
                        ElseIf ((_T_0 == 0x07))
                        {
                            Return (Package (One)
                            {
                                0x07
                            })
                        }
                        ElseIf ((_T_0 == 0x08))
                        {
                            Return (Package (One)
                            {
                                One
                            })
                        }
                        ElseIf ((_T_0 == 0x09))
                        {
                            Return (Package (0x05)
                            {
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                0xFFFFFFFF, 
                                Zero, 
                                0xFFFFFFFF
                            })
                        }
                        Else
                        {
                        }

                        Break
                    }
                }
            }

            Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
            Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
            {
                \_SB.P6RR
            })
            Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
            {
                \_SB.P6RR
            })
            Device (RP1)
            {
                Method (_ADR, 0, Serialized)  // _ADR: Address
                {
                    Return (Zero)
                }

                Name (_PR0, Package (0x01)  // _PR0: Power Resources for D0
                {
                    \_SB.R6RR
                })
                Name (_PR3, Package (0x01)  // _PR3: Power Resources for D3hot
                {
                    \_SB.R6RR
                })
                Name (_PRR, Package (0x01)  // _PRR: Power Resource for Reset
                {
                    \_SB.R6RR
                })
                Name (_S0W, 0x04)  // _S0W: S0 Device Wake State
                Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
                {
                    ToUUID ("6211e2c0-58a3-4af3-90e1-927a4e0c55a4") /* Unknown UUID */, 
                    Package (0x01)
                    {
                        Package (0x02)
                        {
                            "HotPlugSupportInD3", 
                            One
                        }
                    }
                })
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        GpioInt (Edge, ActiveLow, ExclusiveAndWake, PullUp, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0280
                            }
                    })
                    Return (RBUF) /* \_SB_.PCI6.RP1_._CRS.RBUF */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = ToInteger (Arg2)
                            If ((_T_0 == Zero))
                            {
                                Return (Buffer (0x02)
                                {
                                     0x01, 0x03                                       // ..
                                })
                            }
                            ElseIf ((_T_0 == 0x08))
                            {
                                Return (Package (One)
                                {
                                    One
                                })
                            }
                            ElseIf ((_T_0 == 0x09))
                            {
                                Return (Package (0x05)
                                {
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    0xFFFFFFFF, 
                                    Zero, 
                                    0xFFFFFFFF
                                })
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                }
            }
        }

        PowerResource (P6RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }
        }

        PowerResource (R6RR, 0x05, 0x0000)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_ON, 0, NotSerialized)  // _ON_: Power On
            {
            }

            Method (_OFF, 0, NotSerialized)  // _OFF: Power Off
            {
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
            }
        }

        Device (IPC0)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.GLNK
            })
            Name (_HID, "QCOM1A0D")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (GLNK)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.IPCC, 
                \_SB.RPEN
            })
            Name (_HID, "QCOM1A84")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (ARPC)
        {
            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.MMU0, 
                \_SB.GLNK, 
                \_SB.SCM0, 
                \_SB.IMM0
            })
            Name (_HID, "QCOM1A5C")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (ARPD)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.ADSP, 
                \_SB.ARPC
            })
            Name (_HID, "QCOM1A82")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (RFS0)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.IPC0
            })
            Name (_HID, "QCOM1A15")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x88888888,         // Address Base
                        0x99999999,         // Address Length
                        _Y01)
                    Memory32Fixed (ReadWrite,
                        0x11111111,         // Address Base
                        0x22222222,         // Address Length
                        _Y02)
                    Memory32Fixed (ReadWrite,
                        0x33333333,         // Address Base
                        0x44444444,         // Address Length
                        _Y03)
                })
                CreateDWordField (RBUF, \_SB.RFS0._CRS._Y01._BAS, RMTA)  // _BAS: Base Address
                CreateDWordField (RBUF, \_SB.RFS0._CRS._Y01._LEN, RMTL)  // _LEN: Length
                CreateDWordField (RBUF, \_SB.RFS0._CRS._Y02._BAS, RFMA)  // _BAS: Base Address
                CreateDWordField (RBUF, \_SB.RFS0._CRS._Y02._LEN, RFML)  // _LEN: Length
                CreateDWordField (RBUF, \_SB.RFS0._CRS._Y03._BAS, RFAA)  // _BAS: Base Address
                CreateDWordField (RBUF, \_SB.RFS0._CRS._Y03._LEN, RFAL)  // _LEN: Length
                RMTA = \_SB.RMTB
                RMTL = \_SB.RMTX
                RFMA = \_SB.RFMB
                RFML = \_SB.RFMS
                RFAA = \_SB.RFAB
                RFAL = \_SB.RFAS
                Return (RBUF) /* \_SB_.RFS0._CRS.RBUF */
            }
        }

        Scope (\_SB.RFS0)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (IPA)
        {
            Name (_DEP, Package (0x06)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.RPEN, 
                \_SB.TREE, 
                \_SB.MMU0, 
                \_SB.GLNK, 
                \_SB.IPC0
            })
            Name (_HID, "QCOM1A6A")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x01E40000,         // Address Base
                        0x00060000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002AE,
                    }
                    Memory32Fixed (ReadWrite,
                        0x01E00000,         // Address Base
                        0x00030000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001D0,
                    }
                })
            }

            Device (NTAD)
            {
                Name (_ADR, One)  // _ADR: Address
            }
        }

        Scope (\_SB.IPA)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }
        }

        Device (QDIG)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.GLNK
            })
            Name (_HID, "QCOM1A13")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (SSM)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.GLNK, 
                \_SB.TREE
            })
            Name (_HID, "QCOM1A14")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }
        }

        Device (SYSM)
        {
            Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
            Name (_UID, 0x00100000)  // _UID: Unique ID
            Name (_LPI, Package (0x04)  // _LPI: Low Power Idle States
            {
                Zero, 
                0x01000000, 
                One, 
                Package (0x0A)
                {
                    0x251C, 
                    0x1770, 
                    One, 
                    0x20, 
                    Zero, 
                    Zero, 
                    0xC300, 
                    ResourceTemplate ()
                    {
                        Register (SystemMemory, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    ResourceTemplate ()
                    {
                        Register (SystemMemory, 
                            0x00,               // Bit Width
                            0x00,               // Bit Offset
                            0x0000000000000000, // Address
                            ,)
                    }, 

                    "platform.DRIPS"
                }
            })
            Device (CLUS)
            {
                Name (_HID, "ACPI0010" /* Processor Container Device */)  // _HID: Hardware ID
                Name (_UID, 0x10)  // _UID: Unique ID
                Name (_LPI, Package (0x05)  // _LPI: Low Power Idle States
                {
                    Zero, 
                    0x01000000, 
                    0x02, 
                    Package (0x0A)
                    {
                        0x170C, 
                        0x0BB8, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        0x20, 
                        ResourceTemplate ()
                        {
                            Register (SystemMemory, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (SystemMemory, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        "L3Cluster.D2"
                    }, 

                    Package (0x0A)
                    {
                        0x1770, 
                        0x0CE4, 
                        One, 
                        Zero, 
                        Zero, 
                        One, 
                        0x40, 
                        ResourceTemplate ()
                        {
                            Register (SystemMemory, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        ResourceTemplate ()
                        {
                            Register (SystemMemory, 
                                0x00,               // Bit Width
                                0x00,               // Bit Offset
                                0x0000000000000000, // Address
                                ,)
                        }, 

                        "L3Cluster.D4"
                    }
                })
                Device (CPU0)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, Zero)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold0.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold0.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F0A, 
                            0x035C, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold0.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x0F6E, 
                            0x038E, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold0.C4"
                        }
                    })
                }

                Device (CPU1)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, One)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold1.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold1.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F0A, 
                            0x035C, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold1.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x0F6E, 
                            0x038E, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold1.C4"
                        }
                    })
                }

                Device (CPU2)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, 0x02)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold2.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold2.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F0A, 
                            0x035C, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold2.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x0F6E, 
                            0x038E, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold2.C4"
                        }
                    })
                }

                Device (CPU3)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, 0x03)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold3.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold3.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F0A, 
                            0x035C, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold3.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x0F6E, 
                            0x038E, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoGold3.C4"
                        }
                    })
                }

                Device (CPU4)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, 0x04)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime0.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime0.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F96, 
                            0x03E8, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime0.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x118A, 
                            0x05DC, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime0.C4"
                        }
                    })
                }

                Device (CPU5)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, 0x05)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime1.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime1.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F96, 
                            0x03E8, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime1.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x118A, 
                            0x05DC, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime1.C4"
                        }
                    })
                }

                Device (CPU6)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, 0x06)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime2.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime2.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F96, 
                            0x03E8, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime2.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x118A, 
                            0x05DC, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime2.C4"
                        }
                    })
                }

                Device (CPU7)
                {
                    Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
                    Name (_UID, 0x07)  // _UID: Unique ID
                    Method (_STA, 0, NotSerialized)  // _STA: Status
                    {
                        Return (0x0F)
                    }

                    Name (_LPI, Package (0x07)  // _LPI: Low Power Idle States
                    {
                        Zero, 
                        Zero, 
                        0x04, 
                        Package (0x0A)
                        {
                            Zero, 
                            Zero, 
                            One, 
                            Zero, 
                            Zero, 
                            Zero, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x00000000FFFFFFFF, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime3.C1"
                        }, 

                        Package (0x0A)
                        {
                            0x0190, 
                            0x64, 
                            Zero, 
                            Zero, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000002, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime3.C2"
                        }, 

                        Package (0x0A)
                        {
                            0x0F96, 
                            0x03E8, 
                            One, 
                            One, 
                            Zero, 
                            One, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000003, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime3.C3"
                        }, 

                        Package (0x0A)
                        {
                            0x118A, 
                            0x05DC, 
                            One, 
                            One, 
                            Zero, 
                            0x02, 
                            ResourceTemplate ()
                            {
                                Register (FFixedHW, 
                                    0x20,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000040000004, // Address
                                    0x03,               // Access Size
                                    )
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            ResourceTemplate ()
                            {
                                Register (SystemMemory, 
                                    0x00,               // Bit Width
                                    0x00,               // Bit Offset
                                    0x0000000000000000, // Address
                                    ,)
                            }, 

                            "KryoPrime3.C4"
                        }
                    })
                }
            }
        }

        Device (GPS)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.GLNK
            })
            Name (_HID, "QCOM1A6C")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Scope (\_SB.GPS)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (QGP0)
        {
            Name (_HID, "QCOM1A88")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00904000,         // Address Base
                        0x00050000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000115,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000117,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000118,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000119,
                    }
                })
                Return (RBUF) /* \_SB_.QGP0._CRS.RBUF */
            }
        }

        Device (QGP1)
        {
            Name (_HID, "QCOM1A88")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, One)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00A04000,         // Address Base
                        0x00050000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000137,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000013C,
                    }
                })
                Return (RBUF) /* \_SB_.QGP1._CRS.RBUF */
            }
        }

        Device (QGP2)
        {
            Name (_HID, "QCOM1A88")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, 0x02)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00804000,         // Address Base
                        0x00050000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000026D,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000026F,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000270,
                    }
                })
                Return (RBUF) /* \_SB_.QGP2._CRS.RBUF */
            }
        }

        Device (CSEC)
        {
            Name (_HID, "QCOM1AA8")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (QWPP)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Name (_HID, "QCOM1A79")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x09000000,         // Address Base
                        0x00600000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x09680000,         // Address Base
                        0x00070000,         // Address Length
                        )
                })
            }
        }

        Device (SARM)
        {
            Name (_HID, "QCOM1AE2")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (SOCP)
        {
            Name (_HID, "QCOM1ADD")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Alias (\_SB.STOR, STOR)
        }

        Device (QDSS)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.MMU0
            })
            Name (_HID, "QCOM1A56")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Return (ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000012E,
                    }
                    Memory32Fixed (ReadWrite,
                        0x06000000,         // Address Base
                        0x0004A000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x16000000,         // Address Base
                        0x01000000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x07000000,         // Address Base
                        0x00A00000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000044,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000041,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000042,
                    }
                })
            }
        }

        Device (QCSP)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.GLNK, 
                \_SB.SOCP, 
                \_SB.SPSS
            })
            Name (_HID, "QCOM1A87")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Alias (\_SB.STOR, STOR)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (QCDB)
        {
            Name (_HID, "QCOM1ADE")  // _HID: Hardware ID
            Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
            {
                Return ("AGN00000")
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (SERB)
        {
            Name (_HID, "QCOM04B2")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (RMNT)
        {
            Name (_HID, "QCOM1A95")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (MBRG)
        {
            Name (_HID, "QCOM1A07")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (RMAT)
        {
            Name (_HID, "QCOM1A08")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (DPLB)
        {
            Name (_HID, "QCOM1A70")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (CCID)
        {
            Name (_HID, "QCOM1AA2")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (DSBY)
        {
            Name (_HID, "QCOM1ACD")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Scope (\_SB.SERB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((((\_SB.PLST == Zero) || (\_SB.PLST == 0x02)) || (\_SB.PLST == 0x03)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }

        Scope (\_SB.RMNT)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Scope (\_SB.MBRG)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Scope (\_SB.RMAT)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Scope (\_SB.DPLB)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (SSVC)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.IPC0, 
                \_SB.QDIG
            })
            Name (_HID, "QCOM1ADB")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_CID, "ACPIQCOM1ADB")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Scope (\_SB)
        {
            Device (WLTM)
            {
                Name (_HID, "QCOM1AD5")  // _HID: Hardware ID
                Name (_CID, "QCOMFFE0")  // _CID: Compatible ID
                Alias (\_SB.PSUB, _SUB)
                Name (_DEP, Package (0x02)  // _DEP: Dependencies
                {
                    \_SB.PCI0, 
                    \_SB.SBTD
                })
            }
        }

        Device (SSGS)
        {
            Name (_HID, "QCOM1AD8")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
        }

        Device (CAMP)
        {
            Name (_DEP, Package (0x05)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.PMIC, 
                \_SB.PML0, 
                \_SB.ARPC, 
                \_SB.NSP0
            })
            Name (_HID, "QCOM1A32")  // _HID: Hardware ID
            Name (_UID, 0x1B)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0AC40000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC22000,         // Address Base
                        0x0000B400,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC4A000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC4B000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC4C000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC4D000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001EC,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000012F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002AB,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002AA,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001EB,
                    }
                })
                Return (RBUF) /* \_SB_.CAMP._CRS.RBUF */
            }
        }

        Device (CAMS)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.MPCS
            })
            Name (_HID, "QCOM1A26")  // _HID: Hardware ID
            Name (_UID, 0x15)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (CAMF)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.MPCS
            })
            Name (_HID, "QCOM1A06")  // _HID: Hardware ID
            Name (_UID, 0x1A)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (CAMI)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.MPCS
            })
            Name (_HID, "QCOM1A99")  // _HID: Hardware ID
            Name (_UID, 0x1C)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (CAMT)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.MPCS
            })
            Name (_HID, "QCOM1ACE")  // _HID: Hardware ID
            Name (_UID, 0x1D)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (CAMU)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.MPCS
            })
            Name (_HID, "QCOM1ACF")  // _HID: Hardware ID
            Name (_UID, 0x1E)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (FLSH)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.CAMP
            })
            Name (_HID, "QCOM1A27")  // _HID: Hardware ID
            Name (_UID, 0x19)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.FLSH._CRS.RBUF */
            }
        }

        Device (MPCS)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.CAMP
            })
            Name (_HID, "QCOM1A98")  // _HID: Hardware ID
            Name (_UID, 0x18)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0AC65000,         // Address Base
                        0x00002000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC67000,         // Address Base
                        0x00002000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC5A000,         // Address Base
                        0x00002000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC5C000,         // Address Base
                        0x00002000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACF5000,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACF5200,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACF5400,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACF5600,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001FD,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001FE,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001FF,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001E0,
                    }
                })
                Return (RBUF) /* \_SB_.MPCS._CRS.RBUF */
            }
        }

        Device (JPGE)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.CAMP, 
                \_SB.MMU0
            })
            Name (_HID, "QCOM1A33")  // _HID: Hardware ID
            Name (_UID, 0x17)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0AC4E000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC52000,         // Address Base
                        0x00004000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001FA,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001FB,
                    }
                })
                Return (RBUF) /* \_SB_.JPGE._CRS.RBUF */
            }
        }

        Device (VFE0)
        {
            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.MMU0, 
                \_SB.PEP0, 
                \_SB.CAMP, 
                \_SB.GIO0
            })
            Name (_HID, "QCOM1A25")  // _HID: Hardware ID
            Name (_UID, 0x16)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x0AC00000,         // Address Base
                        0x00020000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC48000,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC48200,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC48400,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC48600,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC48800,         // Address Base
                        0x00000200,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0AC6B000,         // Address Base
                        0x00001000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0x0AC6F000,         // Address Base
                        0x00008000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0x0AC87000,         // Address Base
                        0x0000A000,         // Address Length
                        )
                    Memory32Fixed (ReadOnly,
                        0x0AC91000,         // Address Base
                        0x0000A000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACE0000,         // Address Base
                        0x00005000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACC4000,         // Address Base
                        0x00005000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACCB000,         // Address Base
                        0x00005000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACD2000,         // Address Base
                        0x00005000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x0ACD9000,         // Address Base
                        0x00005000,         // Address Length
                        )
                    Memory32Fixed (ReadWrite,
                        0x85200000,         // Address Base
                        0x00500000,         // Address Length
                        )
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001ED,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000013F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000360,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000031F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000031E,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001EF,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001F1,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001F3,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002A1,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000031C,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001F5,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000188,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000319,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000318,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001FC,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001F0,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001F2,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000002A0,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x0000031A,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x000001F4,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000187,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000317,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
                    {
                        0x00000316,
                    }
                    GpioInt (Edge, ActiveBoth, Shared, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0070
                        }
                })
                Return (RBUF) /* \_SB_.VFE0._CRS.RBUF */
            }
        }

        Device (SEN2)
        {
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.IPC0, 
                \_SB.SCSS, 
                \_SB.ARPC
            })
            Name (_HID, "QCOM1A93")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_CID, "QCOM1A67")  // _CID: Compatible ID
            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xA4, 0x0B, 0xBC, 0x07,  // ........
                    /* 0008 */  0x60, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00,  // `.......
                    /* 0010 */  0x0A, 0x00, 0x0A, 0x00                           // ....
                }
            })
        }

        Device (SEN3)
        {
            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.IPC0, 
                \_SB.SCSS, 
                \_SB.ARPC, 
                \_SB.SEN2
            })
            Name (_HID, "QCOM1A94")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_CID, "QCOM1A67")  // _CID: Compatible ID
            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xA4, 0x0B, 0xBC, 0x07,  // ........
                    /* 0008 */  0x40, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,  // @.......
                    /* 0010 */  0x0A, 0x00, 0x0A, 0x00                           // ....
                }
            })
        }

        Device (SEN4)
        {
            Name (_DEP, Package (0x04)  // _DEP: Dependencies
            {
                \_SB.IPC0, 
                \_SB.SCSS, 
                \_SB.ARPC, 
                \_SB.SEN3
            })
            Name (_HID, "QCOM1AD1")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_CID, "QCOM1A67")  // _CID: Compatible ID
        }

        Device (LID0)
        {
            Name (_HID, "PNP0C0D" /* Lid Device */)  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.GIO0, 
                \_SB.SCM0
            })
            Name (LIDB, One)
            Method (_LID, 0, NotSerialized)  // _LID: Lid Status
            {
                Return (LIDB) /* \_SB_.LID0.LIDB */
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If (\_SB.GIO0.GABL)
                {
                    \_SB.LID0.LIDB = \_SB.GIO0.LIDR
                    Notify (\_SB.LID0, 0x80) // Status Change
                }
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                If (\_SB.GIO0.GABL)
                {
                    \_SB.LID0.LIDB = \_SB.GIO0.LIDR
                    Notify (\_SB.LID0, 0x80) // Status Change
                }
            }
        }

        Method (PPID, 0, Serialized)
        {
            Return (Zero)
        }

        Name (HPDB, Zero)
        Name (HPDS, Buffer (One)
        {
             0x00                                             // .
        })
        Name (PINA, Zero)
        Name (DPPN, 0x0D)
        Name (CCST, Buffer (One)
        {
             0x02                                             // .
        })
        Name (PORT, Buffer (One)
        {
             0x02                                             // .
        })
        Name (HIRQ, Buffer (One)
        {
             0x00                                             // .
        })
        Name (USBC, Buffer (One)
        {
             0x0B                                             // .
        })
        Name (MUXC, Buffer (One)
        {
             0x00                                             // .
        })
        Device (URS0)
        {
            Name (_HID, "QCOM1A8B")  // _HID: Hardware ID
            Name (_CID, Package (0x02)  // _CID: Compatible ID
            {
                "PNP0CA1", 
                "QCOMFFE1"
            })
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_CCA, Zero)  // _CCA: Cache Coherency Attribute
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.UCS0
            })
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x0A600000,         // Address Base
                    0x000FFFFF,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }

            Device (USB0)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000343,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x00000344,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x0000028F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x0000020F,
                    }
                    Interrupt (ResourceConsumer, Edge, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x0000020E,
                    }
                })
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            One, 
                            0x09, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            ToPLD (
                                PLD_Revision           = 0x2,
                                PLD_IgnoreColor        = 0x1,
                                PLD_Red                = 0x0,
                                PLD_Green              = 0x0,
                                PLD_Blue               = 0x0,
                                PLD_Width              = 0x0,
                                PLD_Height             = 0x0,
                                PLD_UserVisible        = 0x1,
                                PLD_Dock               = 0x0,
                                PLD_Lid                = 0x0,
                                PLD_Panel              = "BACK",
                                PLD_VerticalPosition   = "CENTER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape              = "VERTICALRECTANGLE",
                                PLD_GroupOrientation   = 0x0,
                                PLD_GroupToken         = 0x0,
                                PLD_GroupPosition      = 0x0,
                                PLD_Bay                = 0x0,
                                PLD_Ejectable          = 0x0,
                                PLD_EjectRequired      = 0x0,
                                PLD_CabinetNumber      = 0x0,
                                PLD_CardCageNumber     = 0x0,
                                PLD_Reference          = 0x0,
                                PLD_Rotation           = 0x0,
                                PLD_Order              = 0x0,
                                PLD_VerticalOffset     = 0xFFFF,
                                PLD_HorizontalOffset   = 0xFFFF)

                        })
                    }
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    Return (0x0F)
                }

                Method (CCVL, 0, NotSerialized)
                {
                    Return (\_SB.UCS0.ECC0)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    While (One)
                    {
                        Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        {
                             0x00                                             // .
                        })
                        CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.URS0.USB0._DSM._T_0 */
                        If ((_T_0 == ToUUID ("ce2ee385-00e6-48cb-9f05-2edb927c4899") /* USB Controller */))
                        {
                            While (One)
                            {
                                Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                _T_1 = ToInteger (Arg2)
                                If ((_T_1 == Zero))
                                {
                                    While (One)
                                    {
                                        Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                        _T_2 = ToInteger (Arg1)
                                        If ((_T_2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x1D                                             // .
                                            })
                                            Break
                                        }
                                        Else
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x01                                             // .
                                            })
                                            Break
                                        }

                                        Break
                                    }

                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                    Break
                                }
                                ElseIf ((_T_1 == 0x02))
                                {
                                    Return (Zero)
                                    Break
                                }
                                ElseIf ((_T_1 == 0x03))
                                {
                                    Return (Zero)
                                    Break
                                }
                                ElseIf ((_T_1 == 0x04))
                                {
                                    Return (0x02)
                                    Break
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                    Break
                                }

                                Break
                            }
                        }
                        Else
                        {
                            Return (Buffer (One)
                            {
                                 0x00                                             // .
                            })
                            Break
                        }

                        Break
                    }
                }

                Method (PHYC, 0, NotSerialized)
                {
                    Name (CFG0, Package (0x00){})
                    Return (CFG0) /* \_SB_.URS0.USB0.PHYC.CFG0 */
                }
            }

            Device (UFN0)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
                Device (RHUB)
                {
                    Name (_ADR, Zero)  // _ADR: Address
                    Device (PRT1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                        {
                            One, 
                            0x09, 
                            Zero, 
                            Zero
                        })
                        Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                        {
                            ToPLD (
                                PLD_Revision           = 0x2,
                                PLD_IgnoreColor        = 0x1,
                                PLD_Red                = 0x0,
                                PLD_Green              = 0x0,
                                PLD_Blue               = 0x0,
                                PLD_Width              = 0x0,
                                PLD_Height             = 0x0,
                                PLD_UserVisible        = 0x1,
                                PLD_Dock               = 0x0,
                                PLD_Lid                = 0x0,
                                PLD_Panel              = "BACK",
                                PLD_VerticalPosition   = "CENTER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape              = "VERTICALRECTANGLE",
                                PLD_GroupOrientation   = 0x0,
                                PLD_GroupToken         = 0x0,
                                PLD_GroupPosition      = 0x0,
                                PLD_Bay                = 0x0,
                                PLD_Ejectable          = 0x0,
                                PLD_EjectRequired      = 0x0,
                                PLD_CabinetNumber      = 0x0,
                                PLD_CardCageNumber     = 0x0,
                                PLD_Reference          = 0x0,
                                PLD_Rotation           = 0x0,
                                PLD_Order              = 0x0,
                                PLD_VerticalOffset     = 0xFFFF,
                                PLD_HorizontalOffset   = 0xFFFF)

                        })
                    }
                }

                Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                {
                    Interrupt (ResourceConsumer, Level, ActiveHigh, Shared, ,, )
                    {
                        0x00000343,
                    }
                    Interrupt (ResourceConsumer, Level, ActiveHigh, SharedAndWake, ,, )
                    {
                        0x00000344,
                    }
                })
                Method (CCVL, 0, NotSerialized)
                {
                    Return (\_SB.UCS0.ECC0)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    While (One)
                    {
                        Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        {
                             0x00                                             // .
                        })
                        CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.URS0.UFN0._DSM._T_0 */
                        If ((_T_0 == ToUUID ("fe56cfeb-49d5-4378-a8a2-2978dbe54ad2") /* Unknown UUID */))
                        {
                            While (One)
                            {
                                Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                _T_1 = ToInteger (Arg2)
                                If ((_T_1 == Zero))
                                {
                                    While (One)
                                    {
                                        Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                        _T_2 = ToInteger (Arg1)
                                        If ((_T_2 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                            Break
                                        }
                                        Else
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x01                                             // .
                                            })
                                            Break
                                        }

                                        Break
                                    }

                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                    Break
                                }
                                ElseIf ((_T_1 == One))
                                {
                                    Return (0x20)
                                    Break
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                    Break
                                }

                                Break
                            }
                        }
                        ElseIf ((_T_0 == ToUUID ("18de299f-9476-4fc9-b43b-8aeb713ed751") /* Unknown UUID */))
                        {
                            While (One)
                            {
                                Name (_T_3, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                _T_3 = ToInteger (Arg2)
                                If ((_T_3 == Zero))
                                {
                                    While (One)
                                    {
                                        Name (_T_4, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                        _T_4 = ToInteger (Arg1)
                                        If ((_T_4 == Zero))
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x03                                             // .
                                            })
                                            Break
                                        }
                                        Else
                                        {
                                            Return (Buffer (One)
                                            {
                                                 0x01                                             // .
                                            })
                                            Break
                                        }

                                        Break
                                    }

                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                    Break
                                }
                                ElseIf ((_T_3 == One))
                                {
                                    Return (0x39)
                                    Break
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00                                             // .
                                    })
                                    Break
                                }

                                Break
                            }
                        }
                        Else
                        {
                            Return (Buffer (One)
                            {
                                 0x00                                             // .
                            })
                            Break
                        }

                        Break
                    }
                }

                Method (PHYC, 0, NotSerialized)
                {
                    Name (CFG0, Package (0x00){})
                    Return (CFG0) /* \_SB_.URS0.UFN0.PHYC.CFG0 */
                }
            }
        }

        Device (UCSI)
        {
            Name (_HID, EisaId ("USBC000"))  // _HID: Hardware ID
            Name (_CID, EisaId ("PNP0CA0"))  // _CID: Compatible ID
            Name (_UID, 0x03)  // _UID: Unique ID
            Name (_DDN, "USB Type-C")  // _DDN: DOS Device Name
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.ABD, 
                \_SB.PMGK, 
                \_SB.UCS0
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                VERS = 0x0100
                CCI = Zero
                MSGI = Zero
                If ((\_SB.PMGK.LKUP > Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Device (UCN0)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                {
                    ToPLD (
                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x1,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x0,
                        PLD_Height             = 0x0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BACK",
                        PLD_VerticalPosition   = "CENTER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x0,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x0,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0xFFFF,
                        PLD_HorizontalOffset   = 0xFFFF)

                })
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    One, 
                    0x09, 
                    Zero, 
                    Zero
                })
            }

            Device (UCN1)
            {
                Name (_ADR, One)  // _ADR: Address
                Name (_PLD, Package (0x01)  // _PLD: Physical Location of Device
                {
                    ToPLD (
                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x1,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x0,
                        PLD_Height             = 0x0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BACK",
                        PLD_VerticalPosition   = "CENTER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x1,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x0,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x0,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0xFFFF,
                        PLD_HorizontalOffset   = 0xFFFF)

                })
                Name (_UPC, Package (0x04)  // _UPC: USB Port Capabilities
                {
                    One, 
                    0x09, 
                    Zero, 
                    Zero
                })
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0x808A0000,         // Address Base
                    0x00000030,         // Address Length
                    )
            })
            OperationRegion (USBC, SystemMemory, 0x808A0000, 0x30)
            Field (USBC, ByteAcc, NoLock, Preserve)
            {
                VERS,   16, 
                RESV,   16, 
                CCI,    32, 
                CTRL,   64, 
                MSGI,   128, 
                MSGO,   128
            }

            Name (BUFF, Buffer (0x32){})
            CreateField (BUFF, Zero, 0x08, BSTA)
            CreateField (BUFF, 0x08, 0x08, BSIZ)
            CreateField (BUFF, 0x10, 0x10, BVER)
            CreateField (BUFF, 0x30, 0x20, BCCI)
            CreateField (BUFF, 0x50, 0x40, BCTL)
            CreateField (BUFF, 0x90, 0x80, BMGI)
            CreateField (BUFF, 0x0110, 0x80, BMGO)
            Method (OPMW, 0, NotSerialized)
            {
                BCTL = CTRL /* \_SB_.UCSI.CTRL */
                BMGO = MSGO /* \_SB_.UCSI.MSGO */
                \_SB.PMGK.UCSI = BUFF /* \_SB_.UCSI.BUFF */
                Return (Zero)
            }

            Method (OPMR, 0, NotSerialized)
            {
                BUFF = \_SB.PMGK.UCSI
                VERS = BVER /* \_SB_.UCSI.BVER */
                CCI = BCCI /* \_SB_.UCSI.BCCI */
                MSGI = BMGI /* \_SB_.UCSI.BMGI */
                Return (Zero)
            }

            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("6f8398c2-7ca4-11e4-ad36-631042b5008f") /* Unknown UUID */))
                {
                    While (One)
                    {
                        Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                        _T_0 = ToInteger (Arg2)
                        If ((_T_0 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x0F                                             // .
                            })
                        }
                        ElseIf ((_T_0 == One))
                        {
                            Return (OPMW ())
                        }
                        ElseIf ((_T_0 == 0x02))
                        {
                            Return (OPMR ())
                        }
                        ElseIf ((_T_0 == 0x03))
                        {
                            Return (Zero)
                        }

                        Break
                    }
                }
            }
        }

        Device (UCS0)
        {
            Name (_HID, "QCOM1AA4")  // _HID: Hardware ID
            Name (_CID, "QCOMFFE5")  // _CID: Compatible ID
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PEP0
            })
            Method (_SUB, 0, NotSerialized)  // _SUB: Subsystem ID
            {
                If (((\_SB.PSUB == "QRD08350") && (\_SB.PLST == 0x03)))
                {
                    Return ("QRDR8350")
                }
                Else
                {
                    Return (\_SB.PSUB)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (CRS0, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x808A0040,         // Address Base
                        0x00000020,         // Address Length
                        )
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A6
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A5
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A4
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A7
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0031
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0030
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x002F
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0032
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0065
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x001A
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x001B
                        }
                    I2cSerialBusV2 (0x0008, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.IC22",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    I2cSerialBusV2 (0x000C, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.IC22",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })
                Name (CRS1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x808A0040,         // Address Base
                        0x00000020,         // Address Length
                        )
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A6
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A5
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A4
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x00A7
                        }
                    GpioIo (Shared, PullNone, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0031
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0030
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x002F
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0032
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x0065
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x001A
                        }
                    GpioIo (Exclusive, PullUp, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x01
                        })
                        {   // Pin list
                            0x001B
                        }
                })
                If (((\_SB.PSUB == "QRD08350") && (\_SB.PLST == 0x03)))
                {
                    Return (CRS0) /* \_SB_.UCS0._CRS.CRS0 */
                }
                Else
                {
                    Return (CRS1) /* \_SB_.UCS0._CRS.CRS1 */
                }
            }

            OperationRegion (USBC, SystemMemory, 0x808A0040, 0x20)
            Field (USBC, ByteAcc, NoLock, Preserve)
            {
                INFO,   8, 
                UPDT,   8, 
                CCX0,   8, 
                MUX0,   8, 
                RES0,   8, 
                VID0,   16, 
                SID0,   16, 
                SVS0,   64, 
                CCX1,   8, 
                MUX1,   8, 
                RES1,   8, 
                VID1,   16, 
                SID1,   16, 
                SVS1,   64
            }

            Name (PORT, Buffer (0x20)
            {
                 0x02                                             // .
            })
            CreateByteField (PORT, Zero, EINF)
            CreateByteField (PORT, One, EUPD)
            CreateByteField (PORT, 0x02, ECC0)
            CreateByteField (PORT, 0x03, EMX0)
            CreateWordField (PORT, 0x05, EVI0)
            CreateWordField (PORT, 0x07, ESI0)
            CreateQWordField (PORT, 0x09, ESV0)
            CreateByteField (PORT, 0x11, ECC1)
            CreateByteField (PORT, 0x12, EMX1)
            CreateWordField (PORT, 0x14, EVI1)
            CreateWordField (PORT, 0x16, ESI1)
            CreateQWordField (PORT, 0x18, ESV1)
            Method (USBW, 0, NotSerialized)
            {
                EUPD = UPDT /* \_SB_.UCS0.UPDT */
                Notify (\_SB.PMGK, 0xF0) // Hardware-Specific
                Return (Zero)
            }

            Method (USBR, 0, NotSerialized)
            {
                INFO = EINF /* \_SB_.UCS0.EINF */
                UPDT = EUPD /* \_SB_.UCS0.EUPD */
                CCX0 = ECC0 /* \_SB_.UCS0.ECC0 */
                MUX0 = EMX0 /* \_SB_.UCS0.EMX0 */
                RES0 = Zero
                VID0 = EVI0 /* \_SB_.UCS0.EVI0 */
                SID0 = ESI0 /* \_SB_.UCS0.ESI0 */
                SVS0 = ESV0 /* \_SB_.UCS0.ESV0 */
                CCX1 = ECC1 /* \_SB_.UCS0.ECC1 */
                MUX1 = EMX1 /* \_SB_.UCS0.EMX1 */
                RES1 = Zero
                VID1 = EVI1 /* \_SB_.UCS0.EVI1 */
                SID1 = ESI1 /* \_SB_.UCS0.ESI1 */
                SVS1 = ESV1 /* \_SB_.UCS0.ESV1 */
                Notify (UCS0, 0xA0) // Device-Specific
                Return (Zero)
            }
        }

        Device (MPA)
        {
            Name (_HID, "QCOM04B4")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MPA1)
        {
            Name (_HID, "QCOM04B5")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBJ0)
        {
            Name (_HID, "QCOM04B6")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBJ1)
        {
            Name (_HID, "QCOM04B7")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBJ2)
        {
            Name (_HID, "QCOM04B8")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBJ3)
        {
            Name (_HID, "QCOM04B9")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBS0)
        {
            Name (_HID, "QCOM04BA")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBS1)
        {
            Name (_HID, "QCOM04BB")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBS2)
        {
            Name (_HID, "QCOM04BC")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBS3)
        {
            Name (_HID, "QCOM04BD")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MSKN)
        {
            Name (_HID, "QCOM04BE")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MJCT)
        {
            Name (_HID, "QCOM04BF")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (MBCL)
        {
            Name (_HID, "QCOM1AD4")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        ThermalZone (TZ51)
        {
            Name (_HID, "QCOM04C0")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MPA
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MPA
                })
            }
        }

        ThermalZone (TZ52)
        {
            Name (_HID, "QCOM04C1")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MPA1
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MPA1
                })
            }
        }

        ThermalZone (TZ53)
        {
            Name (_HID, "QCOM04C2")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MBJ0
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MBJ0
                })
            }
        }

        ThermalZone (TZ54)
        {
            Name (_HID, "QCOM04C3")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MBJ1
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MBJ1
                })
            }
        }

        ThermalZone (TZ55)
        {
            Name (_HID, "QCOM04C4")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MBJ2
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MBJ2
                })
            }
        }

        ThermalZone (TZ56)
        {
            Name (_HID, "QCOM04C5")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MBJ3
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MBJ3
                })
            }
        }

        ThermalZone (TZ60)
        {
            Name (_HID, "QCOM04CC")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MJCT
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MJCT
                })
            }
        }

        ThermalZone (TZ62)
        {
            Name (_HID, "QCOM04CB")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MJCT
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.MJCT
                })
            }
        }

        Device (AGR0)
        {
            Name (_HID, "ACPI000C" /* Processor Aggregator Device */)  // _HID: Hardware ID
            Name (_PUR, Package (0x02)  // _PUR: Processor Utilization Request
            {
                One, 
                Zero
            })
            Method (_OST, 3, NotSerialized)  // _OST: OSPM Status Indication
            {
                \_SB.PEP0.ROST = Arg2
            }
        }

        ThermalZone (TZ0)
        {
            Name (_HID, "QCOM1A58")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }

            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ0.TTSP)
            }
        }

        ThermalZone (TZ1)
        {
            Name (_HID, "QCOM1A58")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.PEP0
            })
            Name (TPSV, 0x0EC4)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ1.TPSV)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ1.TTC1)
            }

            Name (TTC2, One)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ1.TTC2)
            }

            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ1.TTSP)
            }

            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ2)
        {
            Name (_HID, "QCOM1A59")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }

            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ2.TTSP)
            }
        }

        ThermalZone (TZ3)
        {
            Name (_HID, "QCOM1A59")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.PEP0
            })
            Name (TPSV, 0x0EC4)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ3.TPSV)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ3.TTC1)
            }

            Name (TTC2, One)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ3.TTC2)
            }

            Name (TTSP, One)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ3.TTSP)
            }

            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ5)
        {
            Name (_HID, "QCOM1A91")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.GPU0
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ5.TPSV)
            }

            Name (TTC1, One)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ5.TTC1)
            }

            Name (TTC2, 0x02)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ5.TTC2)
            }

            Name (TTSP, 0x02)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ5.TTSP)
            }

            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ7)
        {
            Name (_HID, "QCOM1AC4")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }

            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ7.TTSP)
            }
        }

        ThermalZone (TZ8)
        {
            Name (_HID, "QCOM1AC5")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }

            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ8.TTSP)
            }
        }

        ThermalZone (TZ9)
        {
            Name (_HID, "QCOM1AC6")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }

            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ9.TTSP)
            }
        }

        ThermalZone (TZ11)
        {
            Name (_HID, "QCOM1ABF")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.CSW0
            })
            Name (TPSV, 0x0EC4)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ11.TPSV)
            }

            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ11.TTC1)
            }

            Name (TTC2, One)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ11.TTC2)
            }

            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ11.TTSP)
            }

            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ12)
        {
            Name (_HID, "QCOM1AC0")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (TTSP, 0x32)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ12.TTSP)
            }

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ13)
        {
            Name (_HID, "QCOM1A57")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x05)  // _TZD: Thermal Zone Devices
            {
                \_SB.GPU0, 
                \_SB.WLTM, 
                \_SB.PMBM, 
                \_SB.CSW0, 
                \_SB.MBCL
            })
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (0x0DCA)
            }

            Name (_TC1, One)  // _TC1: Thermal Constant 1
            Name (_TC2, 0x05)  // _TC2: Thermal Constant 2
            Name (_TSP, 0x14)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.BCL1
                })
            }
        }

        ThermalZone (TZ14)
        {
            Name (_HID, "QCOM1AD6")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.DMMY
            })
            Name (TPSV, 0x0DCA)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ14.TPSV)
            }

            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ14.TTC1)
            }

            Name (TTC2, One)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ14.TTC2)
            }

            Name (TTSP, 0x0F)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ14.TTSP)
            }

            Method (_TFP, 0, NotSerialized)  // _TFP: Thermal Fast Sampling Period
            {
                Return (\_SB.TZ14.TTSP)
            }

            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ15)
        {
            Name (_HID, "QCOM1AC8")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00C0
                        }
                })
                Return (RBUF) /* \_SB_.TZ15._CRS.RBUF */
            }

            Name (_TZD, Package (0x04)  // _TZD: Thermal Zone Devices
            {
                \_SB.SYSM.CLUS.CPU0, 
                \_SB.SYSM.CLUS.CPU1, 
                \_SB.SYSM.CLUS.CPU2, 
                \_SB.SYSM.CLUS.CPU3
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ15.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ15.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ15.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ15.TTC2)
            }

            Name (_TSP, One)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ15._DSM._T_0 */
                    If ((_T_0 == ToUUID ("c2d42c4b-e25e-471c-8a4e-290aac3a29a3") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = Arg2
                            If ((_T_1 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_2 = Arg1
                                    If ((_T_2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Break
                                }

                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                \_SB.TZ15.TPSV = DerefOf (Arg3 [Zero])
                                \_SB.TZ15.TCRT = DerefOf (Arg3 [One])
                                \_SB.TZ15.TTC2 = DerefOf (Arg3 [0x02])
                                \_SB.TZ15.TTC1 = Zero
                                Notify (\_SB.TZ15, 0x81) // Thermal Trip Point Change
                                Return (\_SB.TZ15.TPSV)
                            }
                            Else
                            {
                                Return (Zero)
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }

                    Break
                }
            }

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.PMIC
                })
            }
        }

        ThermalZone (TZ16)
        {
            Name (_HID, "QCOM1AC9")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0100
                        }
                })
                Return (RBUF) /* \_SB_.TZ16._CRS.RBUF */
            }

            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.GPU0
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ16.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ16.TCRT)
            }

            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ16.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ16.TTC2)
            }

            Name (_TSP, One)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ16._DSM._T_0 */
                    If ((_T_0 == ToUUID ("c2d42c4b-e25e-471c-8a4e-290aac3a29a3") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = Arg2
                            If ((_T_1 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_2 = Arg1
                                    If ((_T_2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Break
                                }

                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                \_SB.TZ16.TPSV = DerefOf (Arg3 [Zero])
                                \_SB.TZ16.TCRT = DerefOf (Arg3 [One])
                                \_SB.TZ16.TTC2 = DerefOf (Arg3 [0x02])
                                \_SB.TZ16.TTC1 = Zero
                                Notify (\_SB.TZ16, 0x81) // Thermal Trip Point Change
                                Return (\_SB.TZ16.TPSV)
                            }
                            Else
                            {
                                Return (Zero)
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }

                    Break
                }
            }

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.PMIC
                })
            }
        }

        ThermalZone (TZ17)
        {
            Name (_HID, "QCOM1ACA")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0140
                        }
                })
                Return (RBUF) /* \_SB_.TZ17._CRS.RBUF */
            }

            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.PEP0
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ17.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ17.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ17.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ17.TTC2)
            }

            Name (_TSP, One)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ17._DSM._T_0 */
                    If ((_T_0 == ToUUID ("c2d42c4b-e25e-471c-8a4e-290aac3a29a3") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = Arg2
                            If ((_T_1 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_2 = Arg1
                                    If ((_T_2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Break
                                }

                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                \_SB.TZ17.TPSV = DerefOf (Arg3 [Zero])
                                \_SB.TZ17.TCRT = DerefOf (Arg3 [One])
                                \_SB.TZ17.TTC2 = DerefOf (Arg3 [0x02])
                                \_SB.TZ17.TTC1 = Zero
                                Notify (\_SB.TZ17, 0x81) // Thermal Trip Point Change
                                Return (\_SB.TZ17.TPSV)
                            }
                            Else
                            {
                                Return (Zero)
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }

                    Break
                }
            }

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.PMIC
                })
            }
        }

        ThermalZone (TZ18)
        {
            Name (_HID, "QCOM1ACB")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0180
                        }
                })
                Return (RBUF) /* \_SB_.TZ18._CRS.RBUF */
            }

            Name (_TZD, Package (0x02)  // _TZD: Thermal Zone Devices
            {
                \_SB.WLTM, 
                \_SB.CSW0
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ18.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ18.TCRT)
            }

            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ18.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ18.TTC2)
            }

            Name (_TSP, One)  // _TSP: Thermal Sampling Period
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                While (One)
                {
                    Name (_T_0, Buffer (0x01)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                    {
                         0x00                                             // .
                    })
                    CopyObject (ToBuffer (Arg0), _T_0) /* \_SB_.TZ18._DSM._T_0 */
                    If ((_T_0 == ToUUID ("c2d42c4b-e25e-471c-8a4e-290aac3a29a3") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_1 = Arg2
                            If ((_T_1 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_2 = Arg1
                                    If ((_T_2 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }

                                    Break
                                }

                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }
                            ElseIf ((_T_1 == One))
                            {
                                \_SB.TZ18.TPSV = DerefOf (Arg3 [Zero])
                                \_SB.TZ18.TCRT = DerefOf (Arg3 [One])
                                \_SB.TZ18.TTC2 = DerefOf (Arg3 [0x02])
                                \_SB.TZ18.TTC1 = Zero
                                Notify (\_SB.TZ18, 0x81) // Thermal Trip Point Change
                                Return (\_SB.TZ18.TPSV)
                            }
                            Else
                            {
                                Return (Zero)
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Zero)
                    }

                    Break
                }
            }

            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.PMIC
                })
            }
        }

        ThermalZone (TZ20)
        {
            Name (_HID, "QCOM1AD7")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_TZD, Package (0x03)  // _TZD: Thermal Zone Devices
            {
                \_SB.PEP0, 
                \_SB.GPU0, 
                \_SB.CSW0
            })
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ99)
        {
            Name (_HID, "QCOM1A5A")  // _HID: Hardware ID
            Name (_UID, 0x64)  // _UID: Unique ID
            Name (_TZD, Package (0x0E)  // _TZD: Thermal Zone Devices
            {
                \_SB.SYSM.CLUS.CPU0, 
                \_SB.SYSM.CLUS.CPU1, 
                \_SB.SYSM.CLUS.CPU2, 
                \_SB.SYSM.CLUS.CPU3, 
                \_SB.SYSM.CLUS.CPU4, 
                \_SB.SYSM.CLUS.CPU5, 
                \_SB.SYSM.CLUS.CPU6, 
                \_SB.SYSM.CLUS.CPU7, 
                \_SB.PEP0, 
                \_SB.GPU0.MON0, 
                \_SB.GPU0, 
                \_SB.WLTM, 
                \_SB.PMBM, 
                \_SB.CSW0
            })
            Name (TPSV, 0x0EC4)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ99.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ99.TCRT)
            }

            Name (TTC1, 0x04)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ99.TTC1)
            }

            Name (TTC2, 0x03)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ99.TTC2)
            }

            Name (TTSP, 0x0A)
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ99.TTSP)
            }

            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x01)
                {
                    \_SB.PEP0
                })
            }
        }

        ThermalZone (TZ31)
        {
            Name (_HID, "QCOM1A5D")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.ADC1
                })
            }

            Name (_TZD, Package (0x09)  // _TZD: Thermal Zone Devices
            {
                \_SB.SYSM.CLUS.CPU0, 
                \_SB.SYSM.CLUS.CPU1, 
                \_SB.SYSM.CLUS.CPU2, 
                \_SB.SYSM.CLUS.CPU3, 
                \_SB.SYSM.CLUS.CPU4, 
                \_SB.SYSM.CLUS.CPU5, 
                \_SB.SYSM.CLUS.CPU6, 
                \_SB.SYSM.CLUS.CPU7, 
                \_SB.GPU0
            })
            Name (TPSV, 0x0CD0)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ31.TPSV)
            }

            Name (TCRT, 0x0EF6)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ31.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, 0x04)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ31.TTC1)
            }

            Name (TTC2, 0x03)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ31.TTC2)
            }

            Name (TTSP, 0x1E)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ31.TTSP)
            }
        }

        ThermalZone (TZ32)
        {
            Name (_HID, "QCOM1A5E")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.ADC1
                })
            }

            Name (_TZD, Package (0x09)  // _TZD: Thermal Zone Devices
            {
                \_SB.SYSM.CLUS.CPU0, 
                \_SB.SYSM.CLUS.CPU1, 
                \_SB.SYSM.CLUS.CPU2, 
                \_SB.SYSM.CLUS.CPU3, 
                \_SB.SYSM.CLUS.CPU4, 
                \_SB.SYSM.CLUS.CPU5, 
                \_SB.SYSM.CLUS.CPU6, 
                \_SB.SYSM.CLUS.CPU7, 
                \_SB.GPU0
            })
            Name (TPSV, 0x0D02)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ32.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ32.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, 0x04)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ32.TTC1)
            }

            Name (TTC2, 0x03)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ32.TTC2)
            }

            Name (TTSP, 0x28)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ32.TTSP)
            }
        }

        ThermalZone (TZ33)
        {
            Name (_HID, "QCOM1A5F")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.ADC1
                })
            }

            Name (_TZD, Package (0x02)  // _TZD: Thermal Zone Devices
            {
                \_SB.PEP0, 
                \_SB.GPU0
            })
            Name (TPSV, 0x0E2E)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ33.TPSV)
            }

            Name (TCRT, 0x0EF6)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ33.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ33.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ33.TTC2)
            }

            Name (TTSP, 0x32)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ33.TTSP)
            }
        }

        ThermalZone (TZ34)
        {
            Name (_HID, "QCOM1A60")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.ADC1
                })
            }

            Name (_TZD, Package (0x02)  // _TZD: Thermal Zone Devices
            {
                \_SB.PEP0, 
                \_SB.GPU0
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ34.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ34.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ34.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ34.TTC2)
            }

            Name (TTSP, 0x1E)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ34.TTSP)
            }
        }

        ThermalZone (TZ35)
        {
            Name (_HID, "QCOM1A61")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.ADC1
                })
            }

            Name (_TZD, Package (0x02)  // _TZD: Thermal Zone Devices
            {
                \_SB.WLTM, 
                \_SB.MSKN
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ35.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ35.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ35.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ35.TTC2)
            }

            Name (TTSP, 0x28)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ35.TTSP)
            }
        }

        ThermalZone (TZ36)
        {
            Name (_HID, "QCOM04C6")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.MBS0
                })
            }

            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MBS0
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ36.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ36.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ36.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ36.TTC2)
            }

            Name (TTSP, 0x32)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ36.TTSP)
            }
        }

        ThermalZone (TZ37)
        {
            Name (_HID, "QCOM04C7")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.MBS1
                })
            }

            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MBS1
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ37.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ37.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ37.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ37.TTC2)
            }

            Name (TTSP, 0x28)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ37.TTSP)
            }
        }

        ThermalZone (TZ38)
        {
            Name (_HID, "QCOM04C8")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
            {
                Return (Package (0x02)
                {
                    \_SB.PEP0, 
                    \_SB.MBS2
                })
            }

            Name (_TZD, Package (0x01)  // _TZD: Thermal Zone Devices
            {
                \_SB.MBS2
            })
            Name (TPSV, 0x0E60)
            Method (_PSV, 0, NotSerialized)  // _PSV: Passive Temperature
            {
                Return (\_SB.TZ38.TPSV)
            }

            Name (TCRT, 0x0F28)
            Method (_CRT, 0, NotSerialized)  // _CRT: Critical Temperature
            {
                Return (\_SB.TZ38.TCRT)
            }

            Name (_MTL, 0x14)  // _MTL: Minimum Throttle Limit
            Name (TTC1, Zero)
            Method (_TC1, 0, NotSerialized)  // _TC1: Thermal Constant 1
            {
                Return (\_SB.TZ38.TTC1)
            }

            Name (TTC2, 0x14)
            Method (_TC2, 0, NotSerialized)  // _TC2: Thermal Constant 2
            {
                Return (\_SB.TZ38.TTC2)
            }

            Name (TTSP, 0x32)
            Name (_TZP, Zero)  // _TZP: Thermal Zone Polling
            Method (_TSP, 0, NotSerialized)  // _TSP: Thermal Sampling Period
            {
                Return (\_SB.TZ38.TTSP)
            }
        }

        Name (HWNH, One)
        Device (HWN1)
        {
            Name (_HID, "QCOM1A69")  // _HID: Hardware ID
            Name (_UID, One)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((\_SB.HWNH == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.PMIC
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, Buffer (0x02)
                {
                     0x79, 0x00                                       // y.
                })
                Return (RBUF) /* \_SB_.HWN1._CRS.RBUF */
            }

            Method (HAPI, 0, NotSerialized)
            {
                Name (CFG0, Package (0x03)
                {
                    One, 
                    One, 
                    One
                })
                Return (CFG0) /* \_SB_.HWN1.HAPI.CFG0 */
            }

            Method (HAPC, 0, NotSerialized)
            {
                Name (CFG0, Package (0x16)
                {
                    Zero, 
                    0x0984, 
                    Zero, 
                    One, 
                    One, 
                    One, 
                    One, 
                    Zero, 
                    0x04, 
                    One, 
                    0x03, 
                    0x14, 
                    One, 
                    0x03, 
                    Zero, 
                    Zero, 
                    0x06, 
                    Zero, 
                    Zero, 
                    0x0535, 
                    0x03, 
                    One
                })
                Return (CFG0) /* \_SB_.HWN1.HAPC.CFG0 */
            }
        }

        Scope (\_SB)
        {
            Device (GTCH)
            {
                Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
                {
                    Return ("MSHW0274")
                }

                Name (_CID, "PNP0C51")  // _CID: Compatible ID
                Name (_S0W, 0x02)  // _S0W: S0 Device Wake State
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        SpiSerialBusV2 (0x0000, PolarityLow, FourWireMode, 0x08,
                            ControllerInitiated, 0x01E84800, ClockPolarityLow,
                            ClockPhaseFirst, "\\_SB.SPI5",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                        GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullDown, 0x0000,
                            "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                            )
                            {   // Pin list
                                0x0054
                            }
                    })
                    Return (RBUF) /* \_SB_.GTCH._CRS.RBUF */
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("6e2ac436-0fcf-41af-a265-b32a220dcfab") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_0, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_0 = Arg2
                            If ((_T_0 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_1, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_1 = ToInteger (Arg1)
                                    If ((_T_1 == One))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x03                                             // .
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_0 == One))
                            {
                                Return (One)
                            }
                            Else
                            {
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                Name (PGID, Buffer (0x0A)
                {
                    "\\_SB.GTCH"
                })
                Name (FLAG, 0x03)
                Name (DBUF, Buffer (DBFL){})
                CreateByteField (DBUF, Zero, STAT)
                CreateByteField (DBUF, 0x02, DVAL)
                CreateField (DBUF, 0x18, 0xA0, DEID)
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (0x03)
                }

                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                {
                    Return (0x03)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    If ((FLAG == 0x03))
                    {
                        Sleep (0x012C)
                        OperationRegion (GI08, SystemMemory, 0x0F108000, 0x20)
                        Field (GI08, DWordAcc, NoLock, Preserve)
                        {
                            DWD1,   32, 
                            DWD2,   32
                        }

                        DWD2 = 0x02
                        Sleep (0x96)
                    }

                    DEID = Buffer (ESNL){}
                    DVAL = Zero
                    DEID = PGID /* \_SB_.GTCH.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.GTCH.DBUF */
                    }

                    FLAG = Zero
                }

                Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
                {
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    DEID = Buffer (ESNL){}
                    DVAL = 0x03
                    DEID = PGID /* \_SB_.GTCH.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.GTCH.DBUF */
                    }

                    FLAG = 0x03
                }

                Method (_RST, 0, NotSerialized)  // _RST: Device Reset
                {
                    OperationRegion (GI08, SystemMemory, 0x0F108000, 0x20)
                    Field (GI08, DWordAcc, NoLock, Preserve)
                    {
                        DWD1,   32, 
                        DWD2,   32
                    }

                    DWD2 = Zero
                    Sleep (0x012C)
                    DWD2 = 0x02
                }
            }
        }

        Scope (\_SB.I2C6)
        {
            Device (PA00)
            {
                Name (_HID, "MAX34417")  // _HID: Hardware ID
                Name (_CID, "MAX34417")  // _CID: Compatible ID
                Name (_UID, Zero)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x0010, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.I2C6",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                    Return (RBUF) /* \_SB_.I2C6.PA00._CRS.RBUF */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((BDID >= 0x07))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_2, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_2 = Arg2
                            If ((_T_2 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_3, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_3 = ToInteger (Arg1)
                                    If ((_T_3 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x07                                             // .
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_2 == One))
                            {
                                While (One)
                                {
                                    Name (_T_4, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_4 = ToInteger (Arg1)
                                    If ((_T_4 == Zero))
                                    {
                                        Name (PBUF, Package (0x08)
                                        {
                                            "VPH_PWR", 
                                            0x0A, 
                                            "VBUS", 
                                            0x0A, 
                                            "N/A", 
                                            0x64, 
                                            "SOC_APC0", 
                                            0x0A
                                        })
                                        Return (PBUF) /* \_SB_.I2C6.PA00._DSM.PBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_2 == 0x02))
                            {
                                While (One)
                                {
                                    Name (_T_5, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_5 = ToInteger (Arg1)
                                    If ((_T_5 == Zero))
                                    {
                                        Name (CBUF, Package (0x01)
                                        {
                                            0x04
                                        })
                                        Return (CBUF) /* \_SB_.I2C6.PA00._DSM.CBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                Name (PGID, Buffer (0x0A)
                {
                    "\\_SB.PA01"
                })
                Name (DBUF, Buffer (DBFL){})
                CreateByteField (DBUF, Zero, STAT)
                CreateByteField (DBUF, 0x02, DVAL)
                CreateField (DBUF, 0x18, 0xA0, DEID)
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (0x03)
                }

                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                {
                    Return (0x03)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    DEID = Buffer (ESNL){}
                    DVAL = Zero
                    DEID = PGID /* \_SB_.I2C6.PA00.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA00.DBUF */
                    }
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    DEID = Buffer (ESNL){}
                    DVAL = 0x03
                    DEID = PGID /* \_SB_.I2C6.PA00.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA00.DBUF */
                    }
                }
            }

            Device (PA01)
            {
                Name (_HID, "MAX34417")  // _HID: Hardware ID
                Name (_CID, "MAX34417")  // _CID: Compatible ID
                Name (_UID, One)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x0012, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.I2C6",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                    Return (RBUF) /* \_SB_.I2C6.PA01._CRS.RBUF */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((BDID >= 0x07))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_6, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_6 = Arg2
                            If ((_T_6 == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_7, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_7 = ToInteger (Arg1)
                                    If ((_T_7 == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x07                                             // .
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_6 == One))
                            {
                                While (One)
                                {
                                    Name (_T_8, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_8 = ToInteger (Arg1)
                                    If ((_T_8 == Zero))
                                    {
                                        Name (PBUF, Package (0x08)
                                        {
                                            "SOC_Graphics", 
                                            0x0A, 
                                            "DDR_HV", 
                                            0x0A, 
                                            "SOC_MM", 
                                            0x0A, 
                                            "SOC_MX", 
                                            0x0A
                                        })
                                        Return (PBUF) /* \_SB_.I2C6.PA01._DSM.PBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_6 == 0x02))
                            {
                                While (One)
                                {
                                    Name (_T_9, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_9 = ToInteger (Arg1)
                                    If ((_T_9 == Zero))
                                    {
                                        Name (CBUF, Package (0x01)
                                        {
                                            0x04
                                        })
                                        Return (CBUF) /* \_SB_.I2C6.PA01._DSM.CBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                Name (PGID, Buffer (0x0A)
                {
                    "\\_SB.PA01"
                })
                Name (DBUF, Buffer (DBFL){})
                CreateByteField (DBUF, Zero, STAT)
                CreateByteField (DBUF, 0x02, DVAL)
                CreateField (DBUF, 0x18, 0xA0, DEID)
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (0x03)
                }

                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                {
                    Return (0x03)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    DEID = Buffer (ESNL){}
                    DVAL = Zero
                    DEID = PGID /* \_SB_.I2C6.PA01.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA01.DBUF */
                    }
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    DEID = Buffer (ESNL){}
                    DVAL = 0x03
                    DEID = PGID /* \_SB_.I2C6.PA01.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA01.DBUF */
                    }
                }
            }

            Device (PA03)
            {
                Name (_HID, "MAX34417")  // _HID: Hardware ID
                Name (_CID, "MAX34417")  // _CID: Compatible ID
                Name (_UID, 0x03)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x0016, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.I2C6",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                    Return (RBUF) /* \_SB_.I2C6.PA03._CRS.RBUF */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((BDID >= 0x07))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_A, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_A = Arg2
                            If ((_T_A == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_B, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_B = ToInteger (Arg1)
                                    If ((_T_B == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x07                                             // .
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_A == One))
                            {
                                While (One)
                                {
                                    Name (_T_C, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_C = ToInteger (Arg1)
                                    If ((_T_C == Zero))
                                    {
                                        Name (PBUF, Package (0x08)
                                        {
                                            "DDR_LV", 
                                            0x64, 
                                            "DDR_VDD1", 
                                            0x64, 
                                            "SOC_CX", 
                                            0x0A, 
                                            "SOC_APC1", 
                                            0x0A
                                        })
                                        Return (PBUF) /* \_SB_.I2C6.PA03._DSM.PBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_A == 0x02))
                            {
                                While (One)
                                {
                                    Name (_T_D, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_D = ToInteger (Arg1)
                                    If ((_T_D == Zero))
                                    {
                                        Name (CBUF, Package (0x01)
                                        {
                                            0x04
                                        })
                                        Return (CBUF) /* \_SB_.I2C6.PA03._DSM.CBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                Name (PGID, Buffer (0x0A)
                {
                    "\\_SB.PA01"
                })
                Name (DBUF, Buffer (DBFL){})
                CreateByteField (DBUF, Zero, STAT)
                CreateByteField (DBUF, 0x02, DVAL)
                CreateField (DBUF, 0x18, 0xA0, DEID)
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (0x03)
                }

                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                {
                    Return (0x03)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    DEID = Buffer (ESNL){}
                    DVAL = Zero
                    DEID = PGID /* \_SB_.I2C6.PA03.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA03.DBUF */
                    }
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    DEID = Buffer (ESNL){}
                    DVAL = 0x03
                    DEID = PGID /* \_SB_.I2C6.PA03.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA03.DBUF */
                    }
                }
            }

            Device (PA05)
            {
                Name (_HID, "MAX34417")  // _HID: Hardware ID
                Name (_CID, "MAX34417")  // _CID: Compatible ID
                Name (_UID, 0x05)  // _UID: Unique ID
                Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
                {
                    Name (RBUF, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x001A, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.I2C6",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                    Return (RBUF) /* \_SB_.I2C6.PA05._CRS.RBUF */
                }

                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If ((BDID >= 0x07))
                    {
                        Return (Zero)
                    }

                    Return (0x0F)
                }

                Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
                {
                    If ((Arg0 == ToUUID ("4993a436-e1ac-4dc7-b4f8-46a5008fb9e7") /* Unknown UUID */))
                    {
                        While (One)
                        {
                            Name (_T_E, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                            _T_E = Arg2
                            If ((_T_E == Zero))
                            {
                                While (One)
                                {
                                    Name (_T_F, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_F = ToInteger (Arg1)
                                    If ((_T_F == Zero))
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x07                                             // .
                                        })
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_E == One))
                            {
                                While (One)
                                {
                                    Name (_T_G, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_G = ToInteger (Arg1)
                                    If ((_T_G == Zero))
                                    {
                                        Name (PBUF, Package (0x08)
                                        {
                                            "DISPLAY", 
                                            0x19, 
                                            "Touch_Sens1P8", 
                                            0x0A, 
                                            "Touch_Sens5V", 
                                            0x0A, 
                                            "C3Spkr_R2RcvrAmp", 
                                            0x0A
                                        })
                                        Return (PBUF) /* \_SB_.I2C6.PA05._DSM.PBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            ElseIf ((_T_E == 0x02))
                            {
                                While (One)
                                {
                                    Name (_T_H, 0x00)  // _T_x: Emitted by ASL Compiler, x=0-9, A-Z
                                    _T_H = ToInteger (Arg1)
                                    If ((_T_H == Zero))
                                    {
                                        Name (CBUF, Package (0x01)
                                        {
                                            0x04
                                        })
                                        Return (CBUF) /* \_SB_.I2C6.PA05._DSM.CBUF */
                                    }
                                    Else
                                    {
                                        Return (Buffer (One)
                                        {
                                             0x00                                             // .
                                        })
                                    }

                                    Break
                                }
                            }
                            Else
                            {
                                Return (Buffer (One)
                                {
                                     0x00                                             // .
                                })
                            }

                            Break
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }

                Name (PGID, Buffer (0x0A)
                {
                    "\\_SB.PA05"
                })
                Name (DBUF, Buffer (DBFL){})
                CreateByteField (DBUF, Zero, STAT)
                CreateByteField (DBUF, 0x02, DVAL)
                CreateField (DBUF, 0x18, 0xA0, DEID)
                Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                {
                    Return (0x03)
                }

                Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                {
                    Return (0x03)
                }

                Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                {
                    Return (0x03)
                }

                Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
                {
                    DEID = Buffer (ESNL){}
                    DVAL = Zero
                    DEID = PGID /* \_SB_.I2C6.PA05.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA05.DBUF */
                    }
                }

                Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
                {
                    DEID = Buffer (ESNL){}
                    DVAL = 0x03
                    DEID = PGID /* \_SB_.I2C6.PA05.PGID */
                    If (\_SB.ABD.AVBL)
                    {
                        \_SB.PEP0.FLD0 = DBUF /* \_SB_.I2C6.PA05.DBUF */
                    }
                }
            }
        }

        Device (BTNS)
        {
            Name (_HID, "ACPI0011" /* Generic Buttons Device */)  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_UID, Zero)  // _UID: Unique ID
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveBoth, ExclusiveAndWake, PullDown, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0007
                        }
                    GpioInt (Edge, ActiveBoth, Exclusive, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00C6
                        }
                    GpioInt (Edge, ActiveBoth, Exclusive, PullDown, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0006
                        }
                })
                Return (RBUF) /* \_SB_.BTNS._CRS.RBUF */
            }

            Name (_DSD, Package (0x02)  // _DSD: Device-Specific Data
            {
                ToUUID ("fa6bd625-9ce8-470d-a2c7-b3ca36c4282e") /* Generic Buttons Device */, 
                Package (0x04)
                {
                    Package (0x05)
                    {
                        Zero, 
                        One, 
                        Zero, 
                        One, 
                        0x0D
                    }, 

                    Package (0x05)
                    {
                        One, 
                        Zero, 
                        One, 
                        One, 
                        0x81
                    }, 

                    Package (0x05)
                    {
                        One, 
                        One, 
                        One, 
                        0x0C, 
                        0xE9
                    }, 

                    Package (0x05)
                    {
                        One, 
                        0x02, 
                        One, 
                        0x0C, 
                        0xEA
                    }
                }
            })
        }

        Device (RVRM)
        {
            Name (_HID, "QCOM1AF8")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (DBUS)
        {
            Name (_HID, "QCOM1AFF")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Method (CHLD, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    Package (0x04)
                    {
                        "DBUS\\QCOM1AF0", 
                        Zero, 
                        0x09, 
                        0x09
                    }
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0B)
            }
        }

        Device (NRCX)
        {
            Name (_HID, "QCOM1AF6")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (PSAU)
        {
            Name (_HID, "QCOM1AF1")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Scope (\_SB.RVRM)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Scope (\_SB.CCID)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (QDCI)
        {
            Name (_DEP, Package (One)  // _DEP: Dependencies
            {
                \_SB.GLNK
            })
            Name (_HID, "QCOM1A12")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
        }

        Device (BTH0)
        {
            Name (_HID, "QCOM1A6B")  // _HID: Hardware ID
            Alias (\_SB.PSUB, _SUB)
            Name (_DEP, Package (0x03)  // _DEP: Dependencies
            {
                \_SB.PEP0, 
                \_SB.PMIC, 
                \_SB.UR14
            })
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                Zero, 
                Zero
            })
            Name (_S4W, 0x02)  // _S4W: S4 Device Wake State
            Name (_S0W, 0x02)  // _S0W: S0 Device Wake State
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (PBUF, ResourceTemplate ()
                {
                    UartSerialBusV2 (0x0001C200, DataBitsEight, StopBitsOne,
                        0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                        0x0020, 0x0020, "\\_SB.UR14",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                    GpioIo (Exclusive, PullDown, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0041
                        }
                })
                Return (PBUF) /* \_SB_.BTH0._CRS.PBUF */
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }

        Device (ADC1)
        {
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.SPMI, 
                \_SB.PMIC
            })
            Name (_HID, "QCOM1A11")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Alias (\_SB.PSUB, _SUB)
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (INTB, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x02
                        })
                        {   // Pin list
                            0x0020
                        }
                    GpioInt (Edge, ActiveHigh, ExclusiveAndWake, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        RawDataBuffer (0x01)  // Vendor Data
                        {
                            0x02
                        })
                        {   // Pin list
                            0x0028
                        }
                })
                Name (NAM, Buffer (0x0A)
                {
                    "\\_SB.SPMI"
                })
                Name (VUSR, Buffer (0x0C)
                {
                    /* 0000 */  0x8E, 0x13, 0x00, 0x01, 0x00, 0xC1, 0x02, 0x00,  // ........
                    /* 0008 */  0x31, 0x01, 0x00, 0x00                           // 1...
                })
                Name (VBTM, Buffer (0x0C)
                {
                    /* 0000 */  0x8E, 0x13, 0x00, 0x01, 0x00, 0xC1, 0x02, 0x00,  // ........
                    /* 0008 */  0x34, 0x01, 0x00, 0x00                           // 4...
                })
                Concatenate (VUSR, NAM, Local1)
                Concatenate (VBTM, NAM, Local2)
                Concatenate (Local1, Local2, Local3)
                Concatenate (Local3, INTB, Local0)
                Return (Local0)
            }
        }

        Device (FPC1)
        {
            Name (_HID, "FPC1020")  // _HID: Hardware ID
            Name (_DEP, Package (0x02)  // _DEP: Dependencies
            {
                \_SB.TREE, 
                \_SB.SCM0
            })
            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveHigh, SharedAndWake, PullDown, 0x0000,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x001B
                        }
                    GpioIo (Exclusive, PullDown, 0x0000, 0x0000, IoRestrictionNone,
                        "\\_SB.GIO0", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0009
                        }
                })
                Return (RBUF) /* \_SB_.FPC1._CRS.RBUF */
            }

            Name (PGID, Buffer (0x0A)
            {
                "\\_SB.FPC1"
            })
            Name (FLAG, 0x03)
            Name (DBUF, Buffer (DBFL){})
            CreateByteField (DBUF, Zero, STAT)
            CreateByteField (DBUF, 0x02, DVAL)
            CreateField (DBUF, 0x18, 0xA0, DEID)
            Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
            {
                Return (0x03)
            }

            Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
            {
                Return (0x03)
            }

            Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
            {
                Return (0x03)
            }

            Method (_PS0, 0, NotSerialized)  // _PS0: Power State 0
            {
                If ((FLAG == 0x03))
                {
                    Sleep (0x012C)
                    OperationRegion (GI09, SystemMemory, 0x0F109000, 0x20)
                    Field (GI09, DWordAcc, NoLock, Preserve)
                    {
                        DWD1,   32, 
                        DWD2,   32
                    }

                    DWD2 = 0x02
                    Sleep (0x05)
                }

                DEID = Buffer (ESNL){}
                DVAL = Zero
                DEID = PGID /* \_SB_.FPC1.PGID */
                If (\_SB.ABD.AVBL)
                {
                    \_SB.PEP0.FLD0 = DBUF /* \_SB_.FPC1.DBUF */
                }

                FLAG = Zero
            }

            Method (_PS2, 0, NotSerialized)  // _PS2: Power State 2
            {
            }

            Method (_PS3, 0, NotSerialized)  // _PS3: Power State 3
            {
                DEID = Buffer (ESNL){}
                DVAL = 0x03
                DEID = PGID /* \_SB_.FPC1.PGID */
                If (\_SB.ABD.AVBL)
                {
                    \_SB.PEP0.FLD0 = DBUF /* \_SB_.FPC1.DBUF */
                }

                FLAG = 0x03
            }

            Method (_RST, 0, NotSerialized)  // _RST: Device Reset
            {
                OperationRegion (GI09, SystemMemory, 0x0F109000, 0x20)
                Field (GI09, DWordAcc, NoLock, Preserve)
                {
                    DWD1,   32, 
                    DWD2,   32
                }

                DWD2 = 0x02
                Sleep (One)
                DWD2 = Zero
                Sleep (0x05)
                DWD2 = 0x02
                Sleep (0x05)
            }
        }
    }

    Scope (\_SB)
    {
        Device (WSLT)
        {
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return ("MSHW0005")
            }

            Name (_CID, "PNP0C60" /* Display Sensor Device */)  // _CID: Compatible ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (0x0F)
            }
        }
    }

    Scope (\_SB)
    {
        Device (SHPS)
        {
            Name (_HID, "MSHW0153")  // _HID: Hardware ID
            Method (_STA, 0, Serialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("5515a847-ed55-4b27-8352-cd320e10360a") /* Unknown UUID */))
                {
                    If ((ToInteger (Arg1) == One))
                    {
                        If ((ToInteger (Arg2) == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x41                                             // A
                            })
                        }

                        If ((ToInteger (Arg2) == 0x06))
                        {
                            Local0 = 0x0E
                            Return (Local0)
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }
        }
    }

    Scope (\_SB)
    {
        Device (WSID)
        {
            Name (_HID, "MSHW0273")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("a653cdf4-476c-44fb-b366-a73cedf6e14c") /* Unknown UUID */))
                {
                    If ((Arg1 == Zero))
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x09                                             // .
                            })
                        }

                        If ((Arg2 == 0x03))
                        {
                            Return (OCEL) /* \OCEL */
                        }

                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    ThermalZone (TPOL)
    {
        Name (_HID, "MSHW0187")  // _HID: Hardware ID
        Name (_UID, One)  // _UID: Unique ID
        Method (_DEP, 0, NotSerialized)  // _DEP: Dependencies
        {
            Return (Package (One)
            {
                \_SB.PEP0
            })
        }

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            Return (0x0F)
        }

        Method (INPS, 0, NotSerialized)
        {
            Name (CFG0, Package (0x02)
            {
                "\\_SB.TZ2", 
                "\\_SB.TZ5"
            })
            Return (CFG0) /* \TPOL.INPS.CFG0 */
        }

        Method (OPTS, 0, NotSerialized)
        {
            Name (CFG0, Package (0x05)
            {
                "\\_SB.SYSM.CLUS.CPU4", 
                "\\_SB.SYSM.CLUS.CPU5", 
                "\\_SB.SYSM.CLUS.CPU6", 
                "\\_SB.SYSM.CLUS.CPU7", 
                "\\_SB.GPU0"
            })
            Return (CFG0) /* \TPOL.OPTS.CFG0 */
        }
    }

    Scope (\_SB)
    {
        Device (MSBT)
        {
            Name (_DEP, Package (0x01)  // _DEP: Dependencies
            {
                \_SB.PM01
            })
            Method (_HID, 0, NotSerialized)  // _HID: Hardware ID
            {
                Return ("MSHW0040")
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                Return (Zero)
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (RBUF, ResourceTemplate ()
                {
                    GpioInt (Edge, ActiveBoth, SharedAndWake, PullDown, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0007
                        }
                    GpioIo (Shared, PullDown, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0007
                        }
                    GpioInt (Edge, ActiveBoth, Shared, PullUp, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00C6
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x00C6
                        }
                    GpioInt (Edge, ActiveBoth, Shared, PullDown, 0x0000,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0006
                        }
                    GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionInputOnly,
                        "\\_SB.PM01", 0x00, ResourceConsumer, ,
                        )
                        {   // Pin list
                            0x0006
                        }
                })
                Return (RBUF) /* \_SB_.MSBT._CRS.RBUF */
            }

            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If ((Arg0 == ToUUID ("6fd05c69-cde3-49f4-95ed-ab1665498035") /* Unknown UUID */))
                {
                    If ((Arg1 == One))
                    {
                        If ((Arg2 == Zero))
                        {
                            Return (Buffer (One)
                            {
                                 0x0F                                             // .
                            })
                        }

                        If ((Arg2 == One)){}
                        If ((Arg2 == 0x02))
                        {
                            Local0 = 0x06
                            Return (Local0)
                        }

                        If ((Arg2 == 0x03))
                        {
                            Return (Buffer (One)
                            {
                                 0x0C                                             // .
                            })
                        }
                        Else
                        {
                            Return (Buffer (One)
                            {
                                 0xFF                                             // .
                            })
                        }
                    }
                    Else
                    {
                        Return (Buffer (One)
                        {
                             0x00                                             // .
                        })
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00                                             // .
                    })
                }
            }
        }
    }

    Scope (\_SB)
    {
        Name (_PLD, Package (0x12)  // _PLD: Physical Location of Device
        {
            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0xD0, 0x07,  // ........
                    /* 0008 */  0x41, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // A.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0xD0, 0x07,  // ........
                    /* 0008 */  0x49, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // I.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x3C, 0x00,  // ......<.
                    /* 0008 */  0x51, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // Q.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xD0, 0x07, 0x3C, 0x00,  // ......<.
                    /* 0008 */  0x59, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // Y.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x3C, 0x00,  // ......<.
                    /* 0008 */  0x61, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // a.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x3C, 0x00,  // ......<.
                    /* 0008 */  0x69, 0x0D, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00,  // i.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x01, 0x00,  // ........
                    /* 0008 */  0x41, 0x0D, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,  // A.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x01, 0x00,  // ........
                    /* 0008 */  0x49, 0x0D, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,  // I.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0xE8, 0x03,  // ........
                    /* 0008 */  0x51, 0x0D, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,  // Q.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0xE8, 0x03,  // ........
                    /* 0008 */  0x59, 0x0D, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,  // Y.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (0x03)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0xE8, 0x03,  // ........
                    /* 0008 */  0x61, 0x0D, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,  // a.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }, 

                ToUUID ("f01cfc40-3c75-4523-9e44-215cb154bda6") /* Unknown UUID */, 
                Buffer (0x10)
                {
                    /* 0000 */  0x41, 0x02, 0x00, 0x80, 0x5A, 0x00, 0x5A, 0x00,  // A...Z.Z.
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0xE8, 0x03,  // ........
                    /* 0008 */  0x69, 0x0D, 0x00, 0x00, 0x04, 0x00, 0x04, 0x00,  // i.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x3C, 0x00,  // ......<.
                    /* 0008 */  0x41, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x04, 0x00,  // A.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0x3C, 0x00,  // ......<.
                    /* 0008 */  0x49, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x04, 0x00,  // I.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0x3C, 0x00, 0xD0, 0x07,  // ....<...
                    /* 0008 */  0x51, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x04, 0x00,  // Q.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0x3C, 0x00, 0xD0, 0x07,  // ....<...
                    /* 0008 */  0x59, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x04, 0x00,  // Y.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }, 

            Package (0x03)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0xD0, 0x07,  // ........
                    /* 0008 */  0x61, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x04, 0x00,  // a.......
                    /* 0010 */  0xE8, 0x03, 0x00, 0x00                           // ....
                }, 

                ToUUID ("f01cfc40-3c75-4523-9e44-215cb154bda6") /* Unknown UUID */, 
                Buffer (0x10)
                {
                    /* 0000 */  0x41, 0x12, 0x50, 0x80, 0xB4, 0x00, 0x00, 0x00,  // A.P.....
                    /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                }
            }, 

            Package (One)
            {
                Buffer (0x14)
                {
                    /* 0000 */  0x02, 0x00, 0x00, 0x00, 0xB8, 0x0B, 0xD0, 0x07,  // ........
                    /* 0008 */  0x69, 0x0D, 0x00, 0x00, 0x08, 0x00, 0x04, 0x00,  // i.......
                    /* 0010 */  0xFF, 0xFF, 0xFF, 0xFF                           // ....
                }
            }
        })
    }

    OperationRegion (XBLH, SystemMemory, 0xE3400000, 0x1000)
    Field (XBLH, AnyAcc, NoLock, Preserve)
    {
        BDID,   8, 
        BTPS,   8, 
        HWIR,   8, 
        ISCM,   8, 
        ISAM,   8, 
        PMRR,   8, 
        TFWV,   128, 
        OCEL,   16, 
        IRAM,   8, 
        RDID,   24, 
        FUTR,   8, 
        PPBK,   3408, 
        PSD1,   1024, 
        PSD5,   1024
    }
}

