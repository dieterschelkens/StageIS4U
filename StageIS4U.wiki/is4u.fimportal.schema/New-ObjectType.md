# Synopsis
Create a new object type in the FIM Portal schema.

# Syntax
`New-ObjectType [-Name] <String> [-DisplayName] <String> [-Description] <String> [<CommonParameters>]`

# Description
Create a new object type in the FIM Portal schema.

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
Required | true
Position | 3
Default value | 
Accept pipeline input | false

# Examples
`New-ObjectType -Name Department -DisplayName Department -Description Department`
