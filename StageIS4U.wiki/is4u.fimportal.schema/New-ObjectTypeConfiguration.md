# Synopsis
Create a new object type configuration.

# Syntax
`New-ObjectTypeConfiguration [-ConfigFile] <String> [<CommonParameters>]`

# Description
Create a new object type based on the given config file.
This includes creating a new object type, a MPR, default attributes and bindings,
search scope, a navigation bar resource and configuring a synchronization fiter.

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
`New-ObjectTypeConfiguration -ConfigFile .\newObject.xml`
