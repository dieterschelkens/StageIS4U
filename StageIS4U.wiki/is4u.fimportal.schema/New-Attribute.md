# Synopsis
Create a new attribute in the FIM Portal schema.

# Syntax
`New-Attribute [-Name] <String> [-DisplayName] <String> [[-Description] <String>] [-Type] <String> [[-MultiValued] <String>] [<CommonParameters>]`

# Description
Create a new attribute in the FIM Portal schema.

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

## Description


Property | Value
--- | ---
Type | String
Required | false
Position | 3
Default value | 
Accept pipeline input | false

## Type


Property | Value
--- | ---
Type | String
Required | true
Position | 4
Default value | 
Accept pipeline input | false

## MultiValued


Property | Value
--- | ---
Type | String
Required | false
Position | 5
Default value | False
Accept pipeline input | false

# Examples
`New-Attribute -Name Visa -DisplayName Visa -Type String -MultiValued "False"`
