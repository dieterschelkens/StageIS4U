# Synopsis
Delete an object.

# Syntax
`Remove-FimObject [-AnchorName] <String> [-AnchorValue] <String> [[-ObjectType] <String>] [<CommonParameters>]`

# Description
Delete an object given the object type, anchor attribute and anchor value.

# Parameters

## AnchorName


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## AnchorValue


Property | Value
--- | ---
Type | String
Required | true
Position | 2
Default value | 
Accept pipeline input | false

## ObjectType


Property | Value
--- | ---
Type | String
Required | false
Position | 3
Default value | Person
Accept pipeline input | false

# Examples
`Remove-FimObject -AnchorName AccountName -AnchorValue mickey.mouse -ObjectType Person`
