# Synopsis
Set the object sid of a given portal user to the correct value.

# Syntax
`Set-ObjectSid [-AccountName] <String> [[-Domain] <String>] [<CommonParameters>]`

# Description
Set the object sid of a given portal user to the correct value.

# Parameters

## AccountName


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## Domain


Property | Value
--- | ---
Type | String
Required | false
Position | 2
Default value | 
Accept pipeline input | false

# Examples
`Set-ObjectSid -AccountName mim.installer -Domain IS4U`
