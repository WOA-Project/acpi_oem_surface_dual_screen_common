//
// LID Hall Effect Sensor
//
Device (LID0)
{
    Name (_HID, EisaId ("PNP0C0D"))
    Name (_UID, 0)
    Name (_STA, 0xf)
    Name (_DEP, Package () { \_SB.GIO0, \_SB.SCM0 })
    Method (_LID, 0, NotSerialized)
    {
        If ((\_SB.GIO0.GPH0 == 0))
        {
            Return (0)
        }
        Else
        {
            Return (1)
        }
    }
}