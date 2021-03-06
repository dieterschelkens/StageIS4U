# Synopsis
Sets the Dcom permissions required for FIM SSPR.

# Syntax
`Set-DcomPermission [-Principal] <String> [-Computers] <Array> [<CommonParameters>]`

# Description
Sets the Dcom permissions required for FIM SSPR.
Written by Brad Turner (bturner@ensynch.com)
Blog: http://www.identitychaos.com
Inspired by Karl Mitschke's post:
http://unlockpowershell.wordpress.com/2009/11/20/script-remote-dcom-wmi-access-for-a-domain-user/

# Parameters

## Principal


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## Computers


Property | Value
--- | ---
Type | Array
Required | true
Position | 2
Default value | 
Accept pipeline input | false

# Examples
`Set-DcomPermission -Principal "DOMAIN\FIM PasswordSet" -Computers ('fimsyncprimary', 'fimsyncstandby')`
