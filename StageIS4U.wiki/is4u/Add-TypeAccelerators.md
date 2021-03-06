# Synopsis
Add type accelerators for an assembly. Add a class name from this assembly to check
if the accelerators already exist.

# Syntax
`Add-TypeAccelerators [-AssemblyName] <String> [-Class] <String> [<CommonParameters>]`

# Description
Add type accelerators for an assembly. Add a class name from this assembly to check
if the accelerators already exist.

# Parameters

## AssemblyName
Name of the assembly

Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## Class
Name of the class to check for existing accelerators

Property | Value
--- | ---
Type | String
Required | true
Position | 2
Default value | 
Accept pipeline input | false

# Examples
`Add-TypeAccelerators -AssemblyName System.Xml.Linq -Class XElement`
