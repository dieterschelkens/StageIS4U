# Synopsis
Update an attribute in the FIM Portal schema.

# Syntax
`Update-Attribute [-Name] <String> [-DisplayName] <String> [[-Description] <String>] [<CommonParameters>]`

# Description
Update an attribute in the FIM Portal schema.

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

# Examples
`Update-Attribute -Name Visa -DisplayName Visa -Description "Visa card number"`
