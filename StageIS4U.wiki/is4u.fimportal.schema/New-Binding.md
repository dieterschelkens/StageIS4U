# Synopsis
Create a new attribute binding in the FIM Portal schema.

# Syntax
`New-Binding [-AttributeName] <String> [-DisplayName] <String> [[-Description] <String>] [[-Required] <String>] [[-ObjectType] <String>] [<CommonParameters>]`

# Description
Create a new attribute binding in the FIM Portal schema.

# Parameters

## AttributeName


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

## Description


Property | Value
--- | ---
Type | String
Required | false
Position | 3
Default value | 
Accept pipeline input | false

## Required


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
`New-Binding -AttributeName Visa -DisplayName "Visa Card Number"`
`New-Binding -AttributeName Visa -DisplayName "Visa Card Number" -Required $False -ObjectType Person`
