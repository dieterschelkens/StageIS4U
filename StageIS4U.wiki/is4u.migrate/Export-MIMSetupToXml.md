# Synopsis
Export the source resources from a MIM-Setup to xml files in a CliXml format.

# Syntax
`Export-MIMSetupToXml [[-XpathToSet] <String>] [<CommonParameters>]`

# Description
Export the source resources from a MIM-Setup to xml files in a CliXml format.
The created files are used with the function Start-Migration so resources can be compared
between the two setups.

# Parameters

## XpathToSet
Give the xpath to a custom Set object. This will be created in a seperate xml file to be 
imported in the target MIM-Setup

Property | Value
--- | ---
Type | String
Required | false
Position | 1
Default value | 
Accept pipeline input | false

# Examples
