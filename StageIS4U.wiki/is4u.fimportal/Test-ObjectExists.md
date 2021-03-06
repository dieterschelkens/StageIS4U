# Synopsis
Check if a given object exists in the FIM portal.

# Syntax
`Test-ObjectExists [[-Value] <String>] [[-Attribute] <String>] [[-ObjectType] <String>] [[-Filter] <String>] [<CommonParameters>]`

# Description
Check if a given object exists in the FIM portal.
Returns false if no or multiple matches are found.

# Parameters

## Value


Property | Value
--- | ---
Type | String
Required | false
Position | 1
Default value | 
Accept pipeline input | false

## Attribute


Property | Value
--- | ---
Type | String
Required | false
Position | 2
Default value | AccountName
Accept pipeline input | false

## ObjectType


Property | Value
--- | ---
Type | String
Required | false
Position | 3
Default value | Person
Accept pipeline input | false

## Filter


Property | Value
--- | ---
Type | String
Required | false
Position | 4
Default value | 
Accept pipeline input | false

# Examples
`Test-ObjectExists -Value is4u.admin -Attribute AccountName -ObjectType Person`
