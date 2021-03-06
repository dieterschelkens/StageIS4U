# Synopsis
Create a new attribute, attribute binding, MPR-config, filter permission, ... in the FIM Portal schema.

# Syntax
`New-AttributeAndBinding [-Name] <String> [-DisplayName] <String> [-Type] <String> [[-MultiValued] <String>] [[-ObjectType] <String>] [<CommonParameters>]`

# Description
Create a new attribute, attribute binding, MPR-config, filter permission, ... in the FIM Portal schema.

# Parameters

## Name


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## DisplayName


Property | Value
--- | ---
Type | String
Required | true
Position | 2
Default value | 
Accept pipeline input | false

## Type


Property | Value
--- | ---
Type | String
Required | true
Position | 3
Default value | 
Accept pipeline input | false

## MultiValued


Property | Value
--- | ---
Type | String
Required | false
Position | 4
Default value | False
Accept pipeline input | false

## ObjectType


Property | Value
--- | ---
Type | String
Required | false
Position | 5
Default value | Person
Accept pipeline input | false

# Examples
`New-AttributeAndBinding -AttrName Visa -DisplayName "Visa Card Number" -Type String`
