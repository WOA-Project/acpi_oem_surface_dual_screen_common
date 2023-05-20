//
// Temperature Sensor Interface for SMB1380
//
Scope (\_SB.I2C2)
{
    Name (SMBC, ResourceTemplate ()
    {
        I2CSerialBus(0x44, ControllerInitiated, 400000, AddressingMode7Bit, "\\_SB.I2C2", 0, ResourceConsumer, , )
    })

    OperationRegion (SMBO, GenericSerialBus, 0x6000, 0x0500)

    Field (SMBO, BufferAcc, NoLock, Preserve)
    {
        Connection (SMBC),
        AccessAs (BufferAcc, AttribWord),
        Offset (0x236),
        TMP3,   16
    }

    Field (SMBO, BufferAcc, NoLock, Preserve)
    {
        Connection (SMBC),
        AccessAs (BufferAcc, AttribWord),
        Offset (0x436),
        TMP4,   16
    }
}

Scope (\_SB)
{
    Method (XCOM, 4, NotSerialized)
    {
        Local0 = (Arg0 - Arg1)
        Local0 -= 1
        Local0 = ~Local0
        Local1 = (Arg2 - Arg3)
        Local0 *= Local1
        Return (Local0)
    }

    Method (YCOM, 2, NotSerialized)
    {
        Local0 = (Arg0 - Arg1)
        Return (Local0)
    }

    Method (TCOM, 3, NotSerialized)
    {
        Local0 = (Arg0 % Arg1)
        If ((Local0 != 0))
        {
            Local0 = (2 * Arg0)
            Local0 += Arg1
            Local1 = (2 * Arg1)
            Local0 /= Local1
            Local0 = (Arg2 - Local0)
            If ((Arg2 < Local0))
            {
                Local0 -= 1
                Local0 = ~Local0
                Local0 *= 10
                Local0 = (2732 - Local0)
            }
            Else
            {
                Local0 *= 10   // Convert from kelvin to decikelvin
                Local0 += 2732 // 273.2C = 0K - Convert from Kelvin to Celsius
            }
        }
        Else
        {
            Local0 = (Arg0 / Arg1)
            Local0 = (Arg2 - Local0)
            If ((Arg2 < Local0))
            {
                Local0 -= 1
                Local0 = ~Local0
                Local0 *= 10
                Local0 = (2732 - Local0)
            }
            Else
            {
                Local0 *= 10   // Convert from kelvin to decikelvin
                Local0 += 2732 // 273.2C = 0K - Convert from Kelvin to Celsius
            }
        }
        Return (Local0) // Return temperature in deci C
    }

    Method (ATOK, 1, NotSerialized)
    {
        If ((Arg0 >= 989))
        {
            Local3 = 2432
        }
        ElseIf ((Arg0 >= 964))
        {
            Local0 = ~29                              // -29C
            Local1 = ~19                              // -19C
            Local2 = XCOM (Local0, Local1, Arg0, 964) // Temperature in Kelvin
            Local3 = YCOM (989, 964)                  // Modulus in Kelvin (T1 - T2), Maximum Tolerance
            Local3 = TCOM (Local2, Local3, Local1)    // Temperature in deci C
        }
        ElseIf ((Arg0 >= 927))
        {
            Local0 = ~19                              // -19C
            Local1 = ~9                               // -9C
            Local2 = XCOM (Local0, Local1, Arg0, 927)
            Local3 = YCOM (964, 927)
            Local3 = TCOM (Local2, Local3, Local1)
        }
        ElseIf ((Arg0 >= 876))
        {
            Local1 = ~9                               // -9C
            Local2 = XCOM (Local1, 0, Arg0, 876)
            Local3 = YCOM (927, 876)
            Local3 = TCOM (Local2, Local3, 0)
        }
        ElseIf ((Arg0 >= 811))
        {
            Local2 = XCOM (0, 10, Arg0, 811)
            Local3 = YCOM (876, 811)
            Local3 = TCOM (Local2, Local3, 10)
        }
        ElseIf ((Arg0 >= 732))
        {
            Local2 = XCOM (10, 20, Arg0, 732)
            Local3 = YCOM (811, 732)
            Local3 = TCOM (Local2, Local3, 20)
        }
        ElseIf ((Arg0 >= 645))
        {
            Local2 = XCOM (20, 30, Arg0, 645)
            Local3 = YCOM (732, 645)
            Local3 = TCOM (Local2, Local3, 30)
        }
        ElseIf ((Arg0 >= 600))
        {
            Local2 = XCOM (30, 35, Arg0, 600)
            Local3 = YCOM (645, 600)
            Local3 = TCOM (Local2, Local3, 35)
        }
        ElseIf ((Arg0 >= 555))
        {
            Local2 = XCOM (35, 40, Arg0, 555)
            Local3 = YCOM (600, 555)
            Local3 = TCOM (Local2, Local3, 40)
        }
        ElseIf ((Arg0 >= 511))
        {
            Local2 = XCOM (40, 45, Arg0, 511)
            Local3 = YCOM (555, 511)
            Local3 = TCOM (Local2, Local3, 45)
        }
        ElseIf ((Arg0 >= 468))
        {
            Local2 = XCOM (45, 50, Arg0, 468)
            Local3 = YCOM (511, 468)
            Local3 = TCOM (Local2, Local3, 50)
        }
        ElseIf ((Arg0 >= 427))
        {
            Local2 = XCOM (50, 55, Arg0, 427)
            Local3 = YCOM (468, 427)
            Local3 = TCOM (Local2, Local3, 55)
        }
        ElseIf ((Arg0 >= 388))
        {
            Local2 = XCOM (55, 60, Arg0, 388)
            Local3 = YCOM (427, 388)
            Local3 = TCOM (Local2, Local3, 60)
        }
        ElseIf ((Arg0 >= 352))
        {
            Local2 = XCOM (60, 65, Arg0, 352)
            Local3 = YCOM (388, 352)
            Local3 = TCOM (Local2, Local3, 65)
        }
        ElseIf ((Arg0 >= 319))
        {
            Local2 = XCOM (65, 70, Arg0, 319)
            Local3 = YCOM (352, 319)
            Local3 = TCOM (Local2, Local3, 70)
        }
        ElseIf ((Arg0 >= 288))
        {
            Local2 = XCOM (70, 75, Arg0, 288)
            Local3 = YCOM (319, 288)
            Local3 = TCOM (Local2, Local3, 75)
        }
        Else
        {
            Local3 = 2732 // 0 deci C
        }

        Return (Local3)
    }

    //
    // Thermal Zone for Charger (AUX_THERM)
    //
    ThermalZone (SMBA)
    {
        Name (_DEP, Package ()
        {
            \_SB.I2C2
        })

        Name (_CRT, 3291)
        Name (BFTS, Buffer (0x04)
        {
             0xFF
        })

        CreateByteField (BFTS, 0, STA1)
        CreateByteField (BFTS, 1, LEN1)
        CreateWordField (BFTS, 2, DATA)

        Method (_TMP, 0, Serialized)
        {
            If ((\_SB.I2C2.AVBL == One))
            {
                BFTS = \_SB.I2C2.TMP3
                Local0 = ATOK (DATA)
                Return (Local0)
            }

            Return (2732)
        }

        Name (_TSP, 50)

        Method (_PSV, 0, NotSerialized)
        {
            Return (3211)
        }
    }

    //
    // Thermal Zone for Charger (BATT_THERM)
    //
    ThermalZone (SMBI)
    {
        Name (_DEP, Package ()
        {
            \_SB.I2C2
        })

        Name (BFTS, Buffer (0x04)
        {
             0xFF
        })

        CreateByteField (BFTS, 0, STA1)
        CreateByteField (BFTS, 1, LEN1)
        CreateWordField (BFTS, 2, DATA)

        Method (_TMP, 0, Serialized)
        {
            If ((\_SB.I2C2.AVBL == One))
            {
                BFTS = \_SB.I2C2.TMP4
                If ((DATA != 0))
                {
                    Local0 = (284 - DATA)
                    If ((284 < DATA))
                    {
                        Local0 -= 1
                        Local0 = ~Local0
                        Local0 *= 130626
                        Local0 /= 10000
                        Local0 = (3002 - Local0)
                    }
                    Else
                    {
                        Local0 *= 130626
                        Local0 /= 10000
                        Local0 += 3002
                    }
                    Return (Local0)
                }
            }

            Return (2732)
        }
    }
}