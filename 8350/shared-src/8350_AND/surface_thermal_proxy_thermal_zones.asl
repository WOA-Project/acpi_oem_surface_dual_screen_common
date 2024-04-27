//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_thermal_proxy_thermal_zones.asl
//
// Abstract:
//
//     Contains device definitions for additional Thermal
//     Zones, required by the Thermal Proxy SW Components.
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

Scope (\_SB)
{
    //
    // Thermal Zone for Battery Miniclass Thermal Proxy (Angle)
    //
    ThermalZone (ATP0)
    {
        Name (_TSN, "\\_SB.TPXY.ANG0")

        Name (_DEP, Package (0x1)
        {
            \_SB.TPXY.ANG0
        })

        Name (_TZD, Package ()
        {
            \_SB.PBM2
        })

        Name (_TC1, 10)
        Name (_TC2, 0)
        Name (_TSP, 600)

        Method (_PSV, 0, NotSerialized)
        {
            Return (3030)
        }
    }
}

//
// Thermal Zone for PEP (Rsoc)
//
ThermalZone (BTP0)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 100)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.PEP0
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 25)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3531)
    }
}

//
// Thermal Zone for GPU (Rsoc)
//
ThermalZone (BTG0)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 101)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.GPU0
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 30)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3581)
    }
}

//
// Thermal Zone for USB Type-C/PD Switch (Rsoc)
//
ThermalZone (BTU0)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 102)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.UCS0
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 15)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3531)
    }
}

//
// Thermal Zone for USB Type-C/PD Switch (Rsoc)
//
ThermalZone (BTU1)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 103)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.UCS0
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 5)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3631)
    }
}

//
// Thermal Zone for Camera AVStream Mini Driver (Rsoc)
//
ThermalZone (BTC0)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 104)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.GPU0.AVS0
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 15)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3531)
    }
}

//
// Thermal Zone for Camera AVStream Mini Driver (Rsoc)
//
ThermalZone (BTC1)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 105)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.GPU0.AVS0
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 5)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3631)
    }
}

//
// Thermal Zone for Surface Display Panel (Rsoc)
//
ThermalZone (BTD0)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 106)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.DISP
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 15)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3431)
    }
}

//
// Thermal Zone for Surface Display Panel (Rsoc)
//
ThermalZone (BTD1)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 107)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.DISP
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 5)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3631)
    }
}

//
// Thermal Zone for PEP (Vtemp)
//
ThermalZone (VMX5)
{
    Name (_TSN, "\\_SB.TPXY.VTS0")

    Name (_UID, 74)

    Name (_TZD, Package ()
    {
        \_SB.PEP0
    })

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.VTS0
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TSP, 50)
    Name (_TZP, 0)
    Name (_MTL, 25)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3211)
    }
}

//
// Thermal Zone for Big CPUs (Vtemp)
//
ThermalZone (VMX6)
{
    Name (_TSN, "\\_SB.TPXY.VTS0")

    Name (_UID, 75)

    Name (_TZD, Package (0x04)
    {
        \_SB.SYSM.CLUS.CPU4,
        \_SB.SYSM.CLUS.CPU5,
        \_SB.SYSM.CLUS.CPU6,
        \_SB.SYSM.CLUS.CPU7
    })

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.VTS0
    })

    Name (_TC1, 5)
    Name (_TC2, 3)
    Name (_TSP, 30)
    Name (_TZP, 0)
    Name (_MTL, 1)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3181)
    }
}

//
// Thermal Zone for Little CPUs (Vtemp)
//
ThermalZone (VMX7)
{
    Name (_TSN, "\\_SB.TPXY.VTS0")

    Name (_UID, 76)

    Name (_TZD, Package (0x04)
    {
        \_SB.SYSM.CLUS.CPU0,
        \_SB.SYSM.CLUS.CPU1,
        \_SB.SYSM.CLUS.CPU2,
        \_SB.SYSM.CLUS.CPU3
    })

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.VTS0
    })

    Name (_TC1, 5)
    Name (_TC2, 1)
    Name (_TSP, 30)
    Name (_TZP, 0)
    Name (_MTL, 30)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3201)
    }
}

//
// Thermal Zone for GPU (Vtemp)
//
ThermalZone (VMX8)
{
    Name (_TSN, "\\_SB.TPXY.VTS0")

    Name (_UID, 77)

    Name (_TZD, Package ()
    {
        \_SB.GPU0
    })

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.VTS0
    })

    Name (_TC1, 5)
    Name (_TC2, 2)
    Name (_TSP, 30)
    Name (_TZP, 0)
    Name (_MTL, 30)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3191)
    }
}

//
// Thermal Zone for Battery Miniclass (Vtemp)
//
ThermalZone (VMX9)
{
    Name (_TSN, "\\_SB.TPXY.VTS0")

    Name (_UID, 78)

    Name (_TZD, Package ()
    {
        \_SB.PMBM
    })

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.VTS0
    })

    Name (_TC1, 20)
    Name (_TC2, 5)
    Name (_TSP, 300)
    Name (_TZP, 0)
    Name (_MTL, 5)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3171)
    }
}

//
// Thermal Zone for Surface NFC Wireless Charging (Rsoc)
//
ThermalZone (WTU1)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 110)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.WLCN
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 25)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3431)
    }
}

//
// Thermal Zone for Surface NFC Wireless Charging (Rsoc)
//
ThermalZone (WTU0)
{
    Name (_TSN, "\\_SB.TPXY.RSC0")

    Name (_UID, 111)

    Name (_DEP, Package (0x1)
    {
        \_SB.TPXY.RSC0
    })

    Name (_TZD, Package ()
    {
        \_SB.WLCN
    })

    Name (_TC1, 10)
    Name (_TC2, 2)
    Name (_TZP, 0)
    Name (_TSP, 50)
    Name (_MTL, 5)

    Method (_PSV, 0, NotSerialized)
    {
        Return (3631)
    }
}