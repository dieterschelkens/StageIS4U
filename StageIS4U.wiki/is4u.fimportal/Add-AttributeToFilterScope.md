# Synopsis
Adds an attribute to the filter scope.

# Syntax
`Add-AttributeToFilterScope [[-AttributeName] <String>] [[-AttributeId] <UniqueIdentifier>] [[-DisplayName] <String>] [<CommonParameters>]`

# Description
Adds an attribute to the filter scope.

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
`Add-AttributeToFilterScope -AttributeName Visa -DisplayName "Administrator Filter Permission"`
