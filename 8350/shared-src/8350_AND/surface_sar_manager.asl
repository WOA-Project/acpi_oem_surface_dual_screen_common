//
// Surface Sar Manager
//
Device (SARP)
{
    Name (_HID, "MSHW0131")
    Name (_UID, 0)
    Name (_DEP, Package ()
    {
        \_SB.SEN2
    })
}