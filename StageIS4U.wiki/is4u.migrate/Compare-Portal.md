# Synopsis
Get the Portal resources from both the source and target MIM-Setup (by Get-ObjectsFromXml or Get-ObjectsFromConfig).
Send the found resources to Compare-MimObjects.

# Syntax
`Compare-Portal [-path] <String> [<CommonParameters>]`

# Description
Gets the Portal resources from the source (Get-ObjectsFromXml) and target MIM-Setup (Get-ObjectsFromConfig). 
Each object type in the Portal configuration calls (if found) the function Compare-MimObjects using the found objects of
the corresponding object type.

# Parameters

## path
Path to where ConfigurationDelta.xml will be saved.

Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

# Examples
