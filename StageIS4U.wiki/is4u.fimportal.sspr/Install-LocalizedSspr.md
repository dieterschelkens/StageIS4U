# Synopsis
Installs a Q&A SSPR configuration for other languages than the default based on the configuration in
workflow "Password Reset AuthN Workflow".

# Syntax
`Install-LocalizedSspr [-ConfigFile] <String> [<CommonParameters>]`

# Description
Installs a Q&A SSPR configuration for other languages than the default based on the configuration in
workflow "Password Reset AuthN Workflow".
More detailed configuration info is delivered by an xml configuration file.

# Parameters

## ConfigFile


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

# Examples
`Install-LocalizedSspr -ConfigFile .\sspr.xml`
