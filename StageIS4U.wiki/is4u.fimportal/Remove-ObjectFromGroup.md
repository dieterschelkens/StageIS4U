# Synopsis
Remove an object from the explicit members of a group.

# Syntax
`Remove-ObjectFromGroup [-DisplayName] <String> [-ObjectId] <UniqueIdentifier> [<CommonParameters>]`

# Description
Remove an object from the explicit members of a group.

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
`Remove-ObjectFromGroup -DisplayName Administrators -ObjectId 7fb2b853-24f0-4498-9534-4e10589723c4`
