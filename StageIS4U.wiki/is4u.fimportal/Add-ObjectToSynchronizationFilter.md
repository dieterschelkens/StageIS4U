# Synopsis
Adds an object type to the synchronization filter.

# Syntax
`Add-ObjectToSynchronizationFilter [-ObjectId] <UniqueIdentifier> [[-DisplayName] <String>] [<CommonParameters>]`

# Description
Adds an object type to the synchronization filter.

# Parameters

## ObjectId


Property | Value
--- | ---
Type | UniqueIdentifier
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## DisplayName


Property | Value
--- | ---
Type | String
Required | false
Position | 2
Default value | Synchronization Filter
Accept pipeline input | false

# Examples
`[UniqueIdentifier] $objectTypeId = New-ObjectType -Name Department -DisplayName Department -Description Department`
