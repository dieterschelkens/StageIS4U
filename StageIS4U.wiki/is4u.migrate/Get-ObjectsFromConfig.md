# Synopsis
Gets the resources from the MIM-Setup that correspond to the given object type, serialize and
deserialize these resources and return them.

# Syntax
`Get-ObjectsFromConfig [-ObjectType] <String> [<CommonParameters>]`

# Description
Gets the resources from the MIM-Setup that correspond to the given object type.
The read-only members of the resources get stripped as they can not be imported in a target MIM-Setup.
The updated resources then get serialized and deserialized so that they are the same when comparing.
The final resources are then returned.

# Parameters

## ObjectType
Object type of a type of resource in the MIM-Setup.

Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

# Examples
`Get-ObjectsFromConfig -ObjectType AttributeTypeDescription`
