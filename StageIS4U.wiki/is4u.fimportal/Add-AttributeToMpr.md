# Synopsis
Adds an attribute to the list of selected attributes in the scope of the management policy rule.

# Syntax
`Add-AttributeToMpr [-AttrName] <String> [-MprName] <String> [<CommonParameters>]`

# Description
Adds an attribute to the list of selected attributes in the scope of the management policy rule.

# Parameters

## AttrName


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## MprName


Property | Value
--- | ---
Type | String
Required | true
Position | 2
Default value | 
Accept pipeline input | false

# Examples
`Add-AttributeToMPR -AttrName Visa -MprName "Administration: Administrators can read and update Users"`
