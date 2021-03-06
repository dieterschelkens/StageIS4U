# Synopsis
Starts the migration of a MIM-Setup by either comparing certain configurations
or importing a setup in a different target MIM-Setup.

# Syntax
`Start-Migration [-All] [-CompareSchema] [-ComparePolicy] [-ComparePortal] [-ImportDelta] [<CommonParameters>]`

# Description
Call Start-Migration and Export-MIMSetupToXml from the IS4U.Migrate folder! 
The source MIM-Setup xml files are acquired by calling Export-MIMConfig in the source environment.
Start-Migration will serialize the target MIM setup resources to clixml and deserialize them
so they can be compared with the resources from the source xml files.
The differences that are found are writen to a Lithnet-format xml file, called ConfigurationDelta.xml.
When Start-Migration is called with -ImportDelta or -All, the FimDelta.exe program is 
called and the user can choose which resources get imported from the configuration delta.
The final (or total) configuration then gets imported in the target MIM-Setup.

# IMPORTANT
This module has been designed to only use Start-Migration and Export-MIMSetupToXml functions.
When other function are called there is no guarantee the desired effect will be accomplished.

# Parameters

## All


Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

## CompareSchema
This parameter has the same concept as ComparePolicy and ComparePortal:
The variable All will be set to false, this will cause to only compare the
configurations where the flags are called, in this case the Schema configuration.

Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

## ComparePolicy


Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

## ComparePortal


Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

## ImportDelta
When Start-Migration is called with a parameter other then -All no import will be executed. To ensure the differences get
imported in the target MIM-Setup call 'Start-Migration -ImportDelta'. This will use the created ConfigurationDelta.xml
from the chosen configurations, give the user the choice what will get imported and import them.

Property | Value
--- | ---
Type | SwitchParameter
Required | false
Position | named
Default value | False
Accept pipeline input | false

# Examples
`Start-Migration -All`
`Start-Migration -ComparePolicy`
`Start-Migration -ImportDelta`
