# Synopsis
Remove an attribute binding from the FIM Portal schema.

# Syntax
`Remove-Binding [-AttributeName] <String> [[-ObjectType] <String>] [<CommonParameters>]`

# Description
Remove an attribute binding from the FIM Portal schema.

# Parameters

## AttributeName


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
Default value | Person
Accept pipeline input | false

# Examples
`Remove-Binding -AttributeName Visa`
