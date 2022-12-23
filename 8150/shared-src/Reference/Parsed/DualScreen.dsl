DefinitionBlock ("", "SSDT", 1, "MSFT", "RHPROXY", 0x00000001)
{
    External (_SB_.VMOD, DeviceObj)
    External (_SB_.VMOD.VMBS, DeviceObj)
    External (VMBS, DeviceObj)
    External (VMOD, DeviceObj)

    Scope (\_SB)
    {
        Device (CAB0)
        {
            Name (_HID, "PNP0000" /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
            Name (_CID, "PLD_CAB0")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_STR, Unicode ("Primary Front"))  // _STR: Description String
            Name (_PLD, Package (0x06)  // _PLD: Physical Location of Device
            {
                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "FRONT",
                        PLD_VerticalPosition   = "UPPER",
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
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BACK",
                        PLD_VerticalPosition   = "UPPER",
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
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x28,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "LEFT",
                        PLD_VerticalPosition   = "UPPER",
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
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x28,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "RIGHT",
                        PLD_VerticalPosition   = "UPPER",
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
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x28,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "TOP",
                        PLD_VerticalPosition   = "UPPER",
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
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x28,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BOTTOM",
                        PLD_VerticalPosition   = "UPPER",
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
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }
            })
        }

        Device (CAB1)
        {
            Name (_HID, "PNP0000" /* 8259-compatible Programmable Interrupt Controller */)  // _HID: Hardware ID
            Name (_CID, "PLD_CAB1")  // _CID: Compatible ID
            Name (_UID, 0x0C)  // _UID: Unique ID
            Name (_STR, Unicode ("Secondary Front"))  // _STR: Description String
            Name (_PLD, Package (0x06)  // _PLD: Physical Location of Device
            {
                Package (0x03)
                {
                    ToPLD (
                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "FRONT",
                        PLD_VerticalPosition   = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x1,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)
, 
                    ToUUID ("f01cfc40-3c75-4523-9e44-215cb154bda6") /* Unknown UUID */, 
                    Buffer (0x10)
                    {
                        /* 0000 */  0x41, 0x04, 0xC0, 0x01, 0xB4, 0x00, 0xB4, 0x00,  // A.......
                        /* 0008 */  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00   // ........
                    }
                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x0,
                        PLD_Green              = 0x0,
                        PLD_Blue               = 0x0,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BACK",
                        PLD_VerticalPosition   = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x1,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x28,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "LEFT",
                        PLD_VerticalPosition   = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x1,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x28,
                        PLD_Height             = 0x5F0,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "RIGHT",
                        PLD_VerticalPosition   = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x1,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x28,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "TOP",
                        PLD_VerticalPosition   = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x1,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }, 

                Package (One)
                {
                    ToPLD (0x14)
                    {

                        PLD_Revision           = 0x2,
                        PLD_IgnoreColor        = 0x0,
                        PLD_Red                = 0x5C,
                        PLD_Green              = 0x5C,
                        PLD_Blue               = 0x5C,
                        PLD_Width              = 0x384,
                        PLD_Height             = 0x28,
                        PLD_UserVisible        = 0x1,
                        PLD_Dock               = 0x0,
                        PLD_Lid                = 0x0,
                        PLD_Panel              = "BOTTOM",
                        PLD_VerticalPosition   = "UPPER",
                        PLD_HorizontalPosition = "LEFT",
                        PLD_Shape              = "VERTICALRECTANGLE",
                        PLD_GroupOrientation   = 0x0,
                        PLD_GroupToken         = 0x0,
                        PLD_GroupPosition      = 0x0,
                        PLD_Bay                = 0x0,
                        PLD_Ejectable          = 0x0,
                        PLD_EjectRequired      = 0x0,
                        PLD_CabinetNumber      = 0x1,
                        PLD_CardCageNumber     = 0x0,
                        PLD_Reference          = 0x1,
                        PLD_Rotation           = 0x0,
                        PLD_Order              = 0x0,
                        PLD_VerticalOffset     = 0x0,
                        PLD_HorizontalOffset   = 0x0)

                }
            })
        }

        Device (ACC1)
        {
            Name (_HID, "AccFakeV2")  // _HID: Hardware ID
            Name (_CID, "AccFake1")  // _CID: Compatible ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                ToPLD (0x14)
                {

                    PLD_Revision           = 0x2,
                    PLD_IgnoreColor        = 0x0,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x35C,
                    PLD_Height             = 0x474,
                    PLD_UserVisible        = 0x1,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
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
                    PLD_VerticalOffset     = 0xBE,
                    PLD_HorizontalOffset   = 0x1E)

            })
        }

        Device (ACC2)
        {
            Name (_HID, "AccFakeV2")  // _HID: Hardware ID
            Name (_CID, "AccFake2")  // _CID: Compatible ID
            Name (_UID, One)  // _UID: Unique ID
            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                ToPLD (0x14)
                {

                    PLD_Revision           = 0x2,
                    PLD_IgnoreColor        = 0x0,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x35C,
                    PLD_Height             = 0x474,
                    PLD_UserVisible        = 0x1,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x1,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0,
                    PLD_VerticalOffset     = 0xBE,
                    PLD_HorizontalOffset   = 0xA)

            })
        }

        Device (ALPH)
        {
            Name (_HID, "FakeHingeAngle")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                ToPLD (0x14)
                {

                    PLD_Revision           = 0x2,
                    PLD_IgnoreColor        = 0x0,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x35C,
                    PLD_Height             = 0x474,
                    PLD_UserVisible        = 0x1,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x1,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0,
                    PLD_VerticalOffset     = 0xBE,
                    PLD_HorizontalOffset   = 0xA)

            })
        }

        Device (GSTR)
        {
            Name (_HID, "GestureSensorFake")  // _HID: Hardware ID
            Name (_UID, Zero)  // _UID: Unique ID
            Name (_PLD, Package (One)  // _PLD: Physical Location of Device
            {
                ToPLD (0x14)
                {

                    PLD_Revision           = 0x2,
                    PLD_IgnoreColor        = 0x0,
                    PLD_Red                = 0x0,
                    PLD_Green              = 0x0,
                    PLD_Blue               = 0x0,
                    PLD_Width              = 0x35C,
                    PLD_Height             = 0x474,
                    PLD_UserVisible        = 0x1,
                    PLD_Dock               = 0x0,
                    PLD_Lid                = 0x0,
                    PLD_Panel              = "FRONT",
                    PLD_VerticalPosition   = "UPPER",
                    PLD_HorizontalPosition = "LEFT",
                    PLD_Shape              = "VERTICALRECTANGLE",
                    PLD_GroupOrientation   = 0x0,
                    PLD_GroupToken         = 0x0,
                    PLD_GroupPosition      = 0x0,
                    PLD_Bay                = 0x0,
                    PLD_Ejectable          = 0x0,
                    PLD_EjectRequired      = 0x0,
                    PLD_CabinetNumber      = 0x1,
                    PLD_CardCageNumber     = 0x0,
                    PLD_Reference          = 0x0,
                    PLD_Rotation           = 0x0,
                    PLD_Order              = 0x0,
                    PLD_VerticalOffset     = 0xBE,
                    PLD_HorizontalOffset   = 0xA)

            })
        }

        Scope (VMOD)
        {
            Scope (VMBS)
            {
                Device (HYVA)
                {
                    Name (_ADR, 0x5620E0C7)  // _ADR: Address
                    Device (MON0)
                    {
                        Name (_ADR, 0x00545648)  // _ADR: Address
                        Name (_PLD, Package (One)  // _PLD: Physical Location of Device
                        {
                            ToPLD (0x14)
                            {

                                PLD_Revision           = 0x2,
                                PLD_IgnoreColor        = 0x0,
                                PLD_Red                = 0x0,
                                PLD_Green              = 0x0,
                                PLD_Blue               = 0x0,
                                PLD_Width              = 0x35C,
                                PLD_Height             = 0x474,
                                PLD_UserVisible        = 0x1,
                                PLD_Dock               = 0x0,
                                PLD_Lid                = 0x0,
                                PLD_Panel              = "FRONT",
                                PLD_VerticalPosition   = "UPPER",
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
                                PLD_VerticalOffset     = 0xBE,
                                PLD_HorizontalOffset   = 0x1E)

                        })
                    }

                    Device (MON1)
                    {
                        Name (_ADR, One)  // _ADR: Address
                        Name (_PLD, Package (One)  // _PLD: Physical Location of Device
                        {
                            ToPLD (0x14)
                            {

                                PLD_Revision           = 0x2,
                                PLD_IgnoreColor        = 0x0,
                                PLD_Red                = 0x0,
                                PLD_Green              = 0x0,
                                PLD_Blue               = 0x0,
                                PLD_Width              = 0x35C,
                                PLD_Height             = 0x474,
                                PLD_UserVisible        = 0x1,
                                PLD_Dock               = 0x0,
                                PLD_Lid                = 0x0,
                                PLD_Panel              = "FRONT",
                                PLD_VerticalPosition   = "UPPER",
                                PLD_HorizontalPosition = "LEFT",
                                PLD_Shape              = "VERTICALRECTANGLE",
                                PLD_GroupOrientation   = 0x0,
                                PLD_GroupToken         = 0x0,
                                PLD_GroupPosition      = 0x0,
                                PLD_Bay                = 0x0,
                                PLD_Ejectable          = 0x0,
                                PLD_EjectRequired      = 0x0,
                                PLD_CabinetNumber      = 0x1,
                                PLD_CardCageNumber     = 0x0,
                                PLD_Reference          = 0x0,
                                PLD_Rotation           = 0x0,
                                PLD_Order              = 0x0,
                                PLD_VerticalOffset     = 0xBE,
                                PLD_HorizontalOffset   = 0xA)

                        })
                    }
                }
            }
        }
    }
}

