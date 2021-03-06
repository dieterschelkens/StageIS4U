# Synopsis
Writes an array of objects to a Lithnet format xml file.

# Syntax
`Write-ToXmlFile [-DifferenceObjects] <ArrayList> [-path] <String> [-Anchor] <Array> [<CommonParameters>]`

# Description
Writes the given array of objects to a xml file using a Lithnet format that Import-RmConfig can read and import.
ObjectID's from the resources are used as xml-references in the xml file. When more references are found, the
referenced objects are added to the global variable bindings. Objects from the variable bindings are written to the same
xml file used in this function so that references can be found.

# Parameters

## DifferenceObjects
Array of found resources that are different, new or referenced to

Property | Value
--- | ---
Type | ArrayList
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## path
Path to where ConfigurationDelta.xml will be saved.

Property | Value
--- | ---
Type | String
Required | true
Position | 2
Default value | 
Accept pipeline input | false

## Anchor
Anchor used for uniquely identifying objects.

Property | Value
--- | ---
Type | Array
Required | true
Position | 3
Default value | 
Accept pipeline input | false

# Examples
