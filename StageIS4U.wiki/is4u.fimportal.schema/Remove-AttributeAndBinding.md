# Synopsis
Remove an attribute, attribute binding, MPR-config, filter permission, ... from the FIM Portal schema.

# Syntax
`Remove-AttributeAndBinding [-Name] <String> [[-ObjectType] <String>] [<CommonParameters>]`

# Description
Remove an attribute, attribute binding, MPR-config, filter permission, ... from the FIM Portal schema.

# Parameters

## Name


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
`Remove-AttributeAndBinding -AttrName Visa`
