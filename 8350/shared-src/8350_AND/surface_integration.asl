//
// Surface Integration
//
Device (WSID)
{
    Name (_HID, "MSHW0107")
    Method (_STA, 0, NotSerialized)
    {
        Return (0x0F)
    }
}