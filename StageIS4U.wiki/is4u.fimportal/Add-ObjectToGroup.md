# Synopsis
Add an object to the explicit members of a group.

# Syntax
`Add-ObjectToGroup [-DisplayName] <String> [-ObjectId] <UniqueIdentifier> [<CommonParameters>]`

# Description
Add an object to the explicit members of a group.

# Parameters

## DisplayName


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## ObjectId


Property | Value
--- | ---
Type | UniqueIdentifier
Required | true
Position | 2
Default value | 
Accept pipeline input | false

# Examples
`Add-ObjectToGroup -DisplayName Administrators -ObjectId 7fb2b853-24f0-4498-9534-4e10589723c4`
