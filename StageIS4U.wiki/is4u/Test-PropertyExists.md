# Synopsis
Test if a given property exists on a PSObject.

# Syntax
`Test-PropertyExists [-Object] <PSObject> [-Property] <String> [<CommonParameters>]`

# Description
Test if a given property exists on a PSObject. 
This is an equivalent of the check if($object.property) { ... }
But this check trhows errors when using strict mode, hence this method.
[Source: https://powershell.org/forums/topic/testing-for-property-existance]

# Parameters

## Object


Property | Value
--- | ---
Type | PSObject
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## Property


Property | Value
--- | ---
Type | String
Required | true
Position | 2
Default value | 
Accept pipeline input | false

# Examples
