# Synopsis
Create an XElement configuration for an RCDC Identity Picker.

# Syntax
`Get-RcdcIdentityPicker [-AttributeName] <String> [-ObjectType] <String> [[-Mode] <String>] [[-ColumnsToDisplay] <String>] [[-AttributesToSearch] <String>] [[-ListViewTitle] <String>] [[-PreviewTitle] <String>] [[-MainSearchScreenText] <String>] [<CommonParameters>]`

# Description
Create an XElement configuration for an RCDC Identity Picker.

# Parameters

## AttributeName


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

## ObjectType


Property | Value
--- | ---
Type | String
Required | true
Position | 2
Default value | 
Accept pipeline input | false

## Mode


Property | Value
--- | ---
Type | String
Required | false
Position | 3
Default value | SingleResult
Accept pipeline input | false

## ColumnsToDisplay


Property | Value
--- | ---
Type | String
Required | false
Position | 4
Default value | DisplayName, Description
Accept pipeline input | false

## AttributesToSearch


Property | Value
--- | ---
Type | String
Required | false
Position | 5
Default value | DisplayName, Description
Accept pipeline input | false

## ListViewTitle


Property | Value
--- | ---
Type | String
Required | false
Position | 6
Default value | ListViewTitle
Accept pipeline input | false

## PreviewTitle


Property | Value
--- | ---
Type | String
Required | false
Position | 7
Default value | PreviewTitle
Accept pipeline input | false

## MainSearchScreenText


Property | Value
--- | ---
Type | String
Required | false
Position | 8
Default value | MainSearchScreenText
Accept pipeline input | false

# Examples
`Get-RcdcIdentityPicker -AttributeName DepartmentReference -ObjectType Person`
