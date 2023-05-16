//
// Gemalto eSIM Firmware Update
//
Device (GMLT)
{
    Name (_HID, "GEM7001")
    Method (_STA, 0, NotSerialized)
    {
        Return (0x00)
    }
}