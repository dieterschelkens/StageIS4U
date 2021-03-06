# Synopsis
Retrieve an object from the FIM portal.

# Syntax
`Get-FimObject [[-Value] <String>] [[-Attribute] <String>] [[-ObjectType] <String>] [[-Filter] <String>] [<CommonParameters>]`

# Description
Search for an object in the FIM portal and display his properties. This function searches Person objects
by AccountName by default. It is possible to provide another object type or search attribute 
by providing the Attribute and ObjectType parameters.

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
`Get-FimObject is4u.admin`
