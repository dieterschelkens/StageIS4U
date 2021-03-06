# Synopsis
Compares two arrays of MIM object type resources and sends the differences to Write-ToXmlFile

# Syntax
`Compare-MimObjects [-ObjsSource] <Array> [-ObjsDestination] <Array> [[-Anchor] <Array>] [-path] <String> [<CommonParameters>]`

# Description
Compares two arrays containing resources from source and target MIM-Setups. The objects that are references from other objects
get added immediatly without comparing for differences (these are needed for references in xml). 
Counters keep track of the found differences and new objects and give a summary to the user.
The final differences from new objects, different objects and referentials are send to Write-ToXmlFile to create
a delta configuration file used for importing.

# Parameters

## ObjsSource
Resources from the source a MIM-Setup. These objects are the ones that are imported if they are not found or different
against the target MIM-Setup.

Property | Value
--- | ---
Type | Array
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## ObjsDestination
Resources from the target MIM-Setup. These are used to find differences between the two resource arrays.

Property | Value
--- | ---
Type | Array
Required | true
Position | 2
Default value | 
Accept pipeline input | false

## Anchor
An anchor to uniquely identify objects. This parameter is also used for the delta configuration file as the anchor in the 
xml structure.

Property | Value
--- | ---
Type | Array
Required | false
Position | 3
Default value | @("Name")
Accept pipeline input | false

## path
Path to where ConfigurationDelta.xml will be saved.

Property | Value
--- | ---
Type | String
Required | true
Position | 4
Default value | 
Accept pipeline input | false

# Examples
