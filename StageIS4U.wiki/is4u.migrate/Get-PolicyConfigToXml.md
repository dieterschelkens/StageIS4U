# Synopsis
Collect Policy resources from the MIM-Setup and writes them to a xml file in CliXml format.

# Syntax
`Get-PolicyConfigToXml [[-xPathToSet] <String>] [<CommonParameters>]`

# Description
Collect Policy resources from the MIM-Setup and writes them to a xml file in CliXml format.
These xml files are used at the target MIM-Setup for importing the differences.

# Parameters

## xPathToSet
Xpath to a custom Set object in the MIM-Setup

Property | Value
--- | ---
Type | String
Required | false
Position | 1
Default value | 
Accept pipeline input | false

# Examples
