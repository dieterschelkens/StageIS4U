# Prerequisites

Before calling any function from the IS4U.Migrate module, make sure your powershell directory is set to 
**\IS4U-FIM-Powershell-master\IS4U.Migrate**.
This will ensure that files that are exported to this folder are always correctly opened when comparing or starting a migration.

The Lithnet module is required. If Lithnet is not installed the module will start an installation of Lithnet. 
If you want to install Lithnet yourself, the installer can be found at the [Lithnet installation guide](https://github.com/lithnet/resourcemanagement-powershell/wiki/installing-the-module).
For more information about Lithnet visit [Lithnet page on GitHub](https://github.com/lithnet/resourcemanagement-powershell).

# Exporting the MIM configuration

## Exporting all configurations

To export all resources from a MIM-Setup environment, call [Export-MimSetupToXml](Export-MIMSetupToXml) from the IS4U.Migrate folder.
This will retreive all objects from every object type that are found in the MIM-Setup. All objects from every specific object type that were found are serialized to CliXml and written to a xml file. Every xml file gets its own custom name, depending on what object type was retrieved.

> Example: AttributeTypeDescription objects are written to a ConfigAttributes.xml file in a CliXml format.

## Exporting certain configurations

If you only want to export a certain configuration you can call the following functions while in the IS4U.Migrate folder:
  * [Get-SchemaConfigToXml](Get-SchemaConfigToXml): This function will only export Schema configuration objects (in this case: AttributeTypeDescription, ObjectTypeDescription, BindingDescription and Constantspecifier objects) to xml files.
  * [Get-PolicyConfigToXml](Get-PolicyConfigToXml): This function will only export Policy configuration objects to xml files
  * [Get-PortalConfigToXml](Get-PortalConfigToXml): This function will only export Portal configuration objects to xml files

**Be aware that only the found xml files will be used with Start-Migration to compare and import resources. Any references that objects have towards other objects (that have not been exported) can be missing!**

# Comparing and importing

**Required: Xml files that contain resources from a MIM-Setup environment.**

There are two ways to import a configuration in a MIM-Setup.
* [Start-Migration](Start-Migration) -All:
```powershell
Start-Migration -All
```
All found objects are compared with the found objects from the target MIM-Setup. Found differences or new objects are written to a ConfigurationDelta.xml file. The created file can be altered to only import chosen resources (saved as ConfigurationDelta2.xml). this delta in xml will then immediatly be imported to the target MIM-Setup.

* [Start-Migration](Start-Migration) -ImportDelta:
```powershell
Start-Migration -CompareSchema
Start-Migration -ComparePortal
Start-Migration -ImportDelta
```
When calling Start-Migration with ImportDelta, Start-Migration will search if a ConfigurationDelta.xml file exists. This can only be created by either calling Start-Migration with -All or with -CompareSchema, -ComparePolicy or/and -ComparePortal. 
If you want to alter the created ConfigurationDelta.xml you can call the function Start-FimDelta and select the folder where ConfigurationDelta.xml is saved. When you call Start-Migration -ImportDelta after the Start-fimDelta, the ConfigurationDelta2.xml file (that contains chosen resources) will instead be imported.