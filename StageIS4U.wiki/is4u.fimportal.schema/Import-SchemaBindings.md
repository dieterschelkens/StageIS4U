# Synopsis
Create new bindings based on data in given CSV file.

# Syntax
`Import-SchemaBindings [-CsvFile] <String> [<CommonParameters>]`

# Description
Create new bindings based on data in given CSV file.
All referenced attributes are assumed to exist already in the schema.

# Parameters

## CsvFile


Property | Value
--- | ---
Type | String
Required | true
Position | 1
Default value | 
Accept pipeline input | false

# Examples
`Import-SchemaBindings -CsvFile ".\SchemaBindings.csv"`
