# Synopsis
Get the Schema resources from both the source and target MIM-Setup (by Get-ObjectsFromXml or Get-ObjectsFromConfig).
Send the found resources to Compare-MimObjects.

# Syntax
`Compare-Schema [-Path] <String> [<CommonParameters>]`

# Description
Gets the Schema resources from the source (Get-ObjectsFromXml) and target MIM-Setup (Get-ObjectsFromConfig). 
Each object type in the Schema configuration calls (if found) the function Compare-MimObjects using the found objects of
the corresponding object type.

# Parameters

## Path
Path to where ConfigurationDelta.xml will be saved.

Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

# Examples
