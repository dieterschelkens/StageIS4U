# Synopsis
Get default create RCDC configuration.

# Syntax
`Get-DefaultRcdc [-Caption] <String> [[-Xml] <String>] [-Create] [-Edit] [-View] [<CommonParameters>]`

# Description
Get default create RCDC configuration.

# Parameters

## Caption


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## Xml


Property | Value
--- | ---
Type | String
Required | false
Position | 2
Default value | 
Accept pipeline input | false

## Create


Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

## Edit


Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

## View


Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

# Examples
`Get-DefaultRcdc -Caption "Create Department" -Xml defaultCreate.xml`
