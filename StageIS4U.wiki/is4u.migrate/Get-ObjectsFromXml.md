# Synopsis
Retrieve resources from a xml file.

# Syntax
`Get-ObjectsFromXml [-xmlFilePath] <String> [<CommonParameters>]`

# Description
Retrieve resources from a xml file that has been created by Export-MimConfigToXml. This file contains
resources from a MIM-Setup that have been serialized and deserialized by using the CliXml format.

# Parameters

## xmlFilePath


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

# Examples
`Get-ObjectsFromXml -xmlFilePath "ConfigPortalUI.xml"`
