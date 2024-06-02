//
// Copyright (c) 2021-2023 DuoWoA authors. All Rights Reserved.
//
// Module Name:
//
//     surface_additional_thermal_zones.asl
//
// Abstract:
//
//     Contains device definitions for additional Thermal
//     Zones, required by the Andromeda Hardware.
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
// Qualcomm ADC Temperature Monitor Device 1 (SYS_THERM1)
//
ThermalZone (AMX1)
{
    Name (_HID, "QCOM0563")
    Name (_UID, 20)
    Name(_TZD, Package (){\_SB.PEP0})
	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC1})
    }

    Name (_TC1, 2)
    Name (_TC2, 2)
    Name (_TSP, 10)
    Name (_MTL, 100)
    Method (_PSV, 0, NotSerialized)
    {
        Return (3111)
    }
}

//
// Qualcomm ADC Temperature Monitor Device 2 (SYS_THERM2)
//
ThermalZone (AMX2)
{
    Name (_HID, "QCOM0566")
    Name (_UID, 21)
    Name(_TZD, Package (){\_SB.PEP0})
	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC2})
    }

    Name (_TC1, 2)
    Name (_TC2, 2)
    Name (_TSP, 10)
    Name (_MTL, 100)
    Method (_PSV, 0, NotSerialized)
    {
        Return (3111)
    }
}

//
// Qualcomm ADC Temperature Monitor Device 3 (PA_THERM)
//
ThermalZone (AMX3)
{
    Name (_HID, "QCOM0564")
    Name (_UID, 22)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC1})
    }
}

//
// Qualcomm ADC Temperature Monitor Device 4 (PA_THERM1)
//
ThermalZone (AMX4)
{
    Name (_HID, "QCOM0568")
    Name (_UID, 23)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC2})
    }
}

//
// Qualcomm ADC Temperature Monitor Device 5 (SYS_THERM3)
//
ThermalZone (AMX5)
{
    Name (_HID, "QCOM0567")
    Name (_UID, 24)
    Name (_CRT, 3258)
    Name(_TZD, Package (){\_SB.PEP0})
	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC2})
    }
    Name (_TC1, 2)
    Name (_TC2, 2)
    Name (_TSP, 10)
    Name (_MTL, 100)
    Method (_PSV, 0, NotSerialized)
    {
        Return (3111)
    }
}

//
// Qualcomm ADC Temperature Monitor Device 6 (PMIC_THERM)
//
ThermalZone (PMOD)
{
    Name (_HID, "QCOM0562")
    Name (_UID, 29)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC2})
    }
}

//
// Qualcomm ADC Temperature Monitor Device 8 (PMIC_TEMP2)
//
ThermalZone (PMB1)
{
    Name (_HID, "QCOM0565")
    Name (_UID, 12)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC2})
    }
}

/*//
// Qualcomm ADC Temperature Monitor Device 9 (CHG_TEMP)
//
ThermalZone (PMB2)
{
    Name (_HID, "QCOM056A")
    Name (_UID, 13)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC1})
    }
}*/

/*//
// Qualcomm ADC Temperature Monitor Device 7 (SKIN_THERM)
//
ThermalZone (AUX)
{
    Name (_HID, "QCOM0568")
    Name (_UID, 14)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC1})
    }
}*/

//
// Qualcomm ADC Temperature Monitor Device 10 (SYS_THERM4)
//
ThermalZone (PML1)
{
    Name (_HID, "QCOM056A")
    Name (_UID, 30)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC3})
    }
}

/*//
// Qualcomm ADC Temperature Monitor Device 11 (SYS_THERM5)
//
ThermalZone (PML2)
{
    Name (_HID, "QCOM056B")
    Name (_UID, 30)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC3})
    }
}

//
// Qualcomm ADC Temperature Monitor Device 12 (SYS_THERM6)
//
ThermalZone (PMB3)
{
    Name (_HID, "QCOM05D9")
    Name (_UID, 31)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC2})
    }
}

//
// Qualcomm ADC Temperature Monitor Device 12 (SYS_THERM7)
//
ThermalZone (PMB4)
{
    Name (_HID, "QCOM05DA")
    Name (_UID, 32)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC2})
    }
}

//
// Qualcomm ADC Temperature Monitor Device 13 (SYS_THERM8)
//
ThermalZone (PML3)
{
    Name (_HID, "QCOM05DB")
    Name (_UID, 32)
    Name (_TZP, 300)

	Method(_DEP) {
        Return (Package() {\_SB.PEP0, \_SB.ADC3})
    }
}*/