# Synopsis
Removes an attribute from the list of selected attributes in the scope of the management policy rule.

# Syntax
`Remove-AttributeFromMpr [-AttrName] <String> [-MprName] <String> [<CommonParameters>]`

# Description
Removes an attribute from the list of selected attributes in the scope of the management policy rule.

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
`Remove-AttributeFromMPR -AttrName Visa -MprName "Administration: Administrators can read and update Users"`
