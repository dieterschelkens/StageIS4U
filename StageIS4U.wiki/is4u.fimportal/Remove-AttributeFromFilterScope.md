# Synopsis
Removes an attribute from the filter scope.

# Syntax
`Remove-AttributeFromFilterScope [[-AttributeName] <String>] [[-AttributeId] <UniqueIdentifier>] [[-DisplayName] <String>] [<CommonParameters>]`

# Description
Removes an attribute from the filter scope.

# Parameters

## AttributeName


Property | Value
--- | ---
Type | String
Required | false
Position | 1
Default value | 
Accept pipeline input | false

## AttributeId


Property | Value
--- | ---
Type | UniqueIdentifier
Required | false
Position | 2
Default value | 
Accept pipeline input | false

## DisplayName


Property | Value
--- | ---
Type | String
Required | false
Position | 3
Default value | Administrator Filter Permission
Accept pipeline input | false

# Examples
`Remove-AttributeFromFilterScope -AttributeName Visa -DisplayName "Administrator Filter Permission"`
