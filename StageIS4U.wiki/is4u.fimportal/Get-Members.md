# Synopsis
List all members of the given group or set.

# Syntax
`Get-Members [-ObjectID] <String> [[-ObjectType] <String>] [<CommonParameters>]`

# Description
List all members of the given group or set.

# Parameters

## ObjectID


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## ObjectType


Property | Value
--- | ---
Type | String
Required | false
Position | 2
Default value | Group
Accept pipeline input | false

# Examples
`Get-Members -ObjectID 7fb2b853-24f0-4498-9534-4e10589723c4`
`Get-Members -ObjectID 7fb2b853-24f0-4498-9534-4e10589723c4 -ObjectType Set`
