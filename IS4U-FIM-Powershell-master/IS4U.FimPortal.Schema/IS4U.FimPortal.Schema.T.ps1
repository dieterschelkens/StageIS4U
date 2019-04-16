Import-Module IS4U.FimPortal.Schema
Class NewFimImportObject{
    [string]$ObjectType
    [string]$State
    [Hashtable]$Changes = @{}
    [bool]$ApplyNow
    [bool]$SkipDuplicateCheck
    [bool]$PassThru
    [Hashtable] $Anchor = @{}
   }
Describe "New-Attribute" {
    Context "Module Setup" {
        It "module file is ready to be loaded" {
            Get-Module -ListAvailable | Where-Object { $_.Name -eq 'IS4U.FimPortal.Schema' }
        }
    }

    Context "With parameters (Mandatory)" {
        Mock New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" -MockWith {$ObjectType, $State, $Changes}
        $test = New-Attribute -Name Visa -DisplayName Visa -Type String -Description Test -MultiValued "false"
        
        it "New-FimImportObject gets called" {
            Assert-MockCalled -CommandName New-FimImportObject -ModuleName "IS4U.FimPortal.Schema"
        }

        it "Parameters get saved into object (Name, DisplayName, Type (Mandatory)), (Description, Multivalued(Optional))" {
            Assert-MockCalled New-FimImportObject -ParameterFilter{
                $changes["Name"] -eq "Visa" -and $changes["DisplayName"] -eq "Visa" -and $changes["DataType"] -eq "String"
            } -ModuleName "IS4U.FimPortal.Schema"
        }

        it "Returns correct object" {
            $test[0] -eq "AttributeTypeDescription" -and $test[1] -eq "Create" -and $test[2]["Name"] -eq "Visa"| Should be $true
        }
    } 
}

Describe "Update-Attribute"{
    Context "With parameters"{
        Mock New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" -MockWith {$ObjectType, $State, $anchor, $changes, $ApplyNow}
        Mock Get-FimObjectID { New-Guid } -ModuleName "IS4U.FimPortal.Schema" 
        $result = Update-Attribute -Name Visum -DisplayName Visum -Description "Update test"
            it "Parameters get saved into object (Name, DisplayName, Description)"{
                Assert-MockCalled New-FimImportObject -ParameterFilter {
                    #To-Do anchor (result[2])
                    $ObjectType -eq "AttributeTypeDescription" -and $State -eq "put" -and $changes["DisplayName"] -eq "Visum" -and $result[2].Values -eq "Visum"
                } -ModuleName "IS4U.FimPortal.Schema"
            }

            it "Variable id gets filled and Update-Attribute Returns a Guid"{
                $result | Should -Not -BeNullOrEmpty
                $result[5].GetType() -eq [Guid] | Should be $true
            }
    }
}

Describe "Remove-Attribute"{
    Context "With parameter Name"{
        Mock Remove-FimObject -ModuleName "IS4U.FimPortal.Schema"
        Remove-Attribute -Name Visa

        It "Correct parameters go to Remove-FimObject" {
            Assert-MockCalled Remove-FimObject -ParameterFilter {
                $AnchorName -eq "Name"  -and $AnchorValue -eq "Visa" -And $ObjectType -eq "AttributeTypeDescription"
            } -ModuleName "IS4U.FimPortal.Schema"
        }
    }
}

Describe "New-Binding"{
    Mock New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $ObjectType, $State, $Changes, $ApplyNow, $SkipDuplicateCheck, $PassThru
    }
    Context "New-Binding with parameters, testing id returns without parameters from mock Get-FimObjectId"{
        Mock Get-FimObjectId { return New-Guid } -ModuleName "IS4U.FimPortal.Schema"
        $result = New-Binding -AttributeName "Visa" -DisplayName -"Visa card number"
        It "attrId and objId get id from Get-FimObjectId"{
            $result[2]["BoundAttributeType"].GetType() -eq [GUID]  | Should Be $true
        }
    }
    Context "New-Binding with parameters, mock return of Get-FimObjectId"{
        Mock Get-FimObjectId { return New-Guid } -ModuleName "IS4U.FimPortal.Schema" -MockWith {
            $ObjectType, $AttributeName, $AttributeValue
        }
        $result = New-Binding -AttributeName "Visa" -DisplayName -"Visa card number"
        It "attrId sends correct parameters (+ test hashtable changes gets filled)"{
            #$result[2]["BoundAttributeType"][0]
            #  ^Changes         ^=             ^ObjectType
            $result[2]["BoundAttributeType"][0] -eq "AttributeTypeDescription" | Should be $true
        }

        It "objId sends correct parameters (+ test hashtable changes gets filled)" {
            $result[2]["BoundObjectType"][0] -eq "ObjectTypeDescription" | Should be $true
        }

        It "New-Binding returns correct parameters (variable changes has been tested before)"{
            $result[0] | should be 'BindingDescription'
            $result[1] | should be 'Create'
        }
    }
}

Describe "Update-Binding"{
    Mock Get-FimObject -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $Filter, $attrId, $objId
    }
    Mock New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $ObjectType, $State, $Anchor, $Changes, $ApplyNow
    }
    Context "Update-Binding with parameters: testing id's that get returned from mock New-FimObjectId and binding/id gets filled"{
        Mock Get-FimObjectID { return "03dec533-dc80-45a8-a52e-45435aaa7c6e" } -ModuleName "IS4U.FimPortal.Schema"
        $result = Update-Binding -AttributeName Visa -DisplayName "Visa card"
        It "attrId and objId get id from Get-FimObjectId and binding gets correct parameters filled"{
            #$result[5] = $Anchor
            $result[5] | Should be "/BindingDescription[BoundAttributeType='03dec533-dc80-45a8-a52e-45435aaa7c6e' and BoundObjectType='03dec533-dc80-45a8-a52e-45435aaa7c6e']"
        }
    }

    Context "Update-Binding with parameters: testing variables get filled and returns"{
        Mock Get-FimObjectId -ModuleName "IS4U.FimPortal.Schema" -MockWith {
            $ObjectType, $AttributeName, $AttributeValue
        }
        Update-Binding -AttributeName Visa -DisplayName "Visa card"
        It "Get-FimObjectId gets the correct parameters for variable attrId"{
            Assert-MockCalled Get-FimObjectId -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $ObjectType -eq "AttributeTypeDescription" -and $AttributeName -eq "Name" -and $AttributeValue -eq "Visa"
            } -Times 1
        }
        It "Get-FimObjectId gets the correct parameters for variable objId"{
            Assert-MockCalled Get-FimObjectId -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $ObjectType -eq "ObjectTypeDescription" -and $AttributeName -eq "Name" -and $AttributeValue -eq "Person"
            } -Exactly 1
        }
        It "New-FimImportObject gets correct parameters"{
            #ObjectType BindingDescription -State Put -Anchor $anchor -Changes $changes -ApplyNow
            Assert-MockCalled New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $ObjectType -eq "BindingDescription"
                $State | Should be "Put"
                $Anchor | Should -BeNullOrEmpty
                $Changes["DisplayName"] | Should be "Visa card"
                $Changes["Description"] | Should -BeNullOrEmpty
            }
        }

        It "Update-Binding returns correct object"{
            #id.value testen?
        }
    }
}

Describe "Remove-Binding"{
    Mock Get-FimObject -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $Filter, $attrId, $objId
    }
    Mock Remove-FimObject  -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $AnchorName, $AnchorValue, $ObjectType
    }
    Context "Remove-Binding with parameters: testing id's that get returned from mock New-FimObjectId"{
        Mock Get-FimObjectId { return "03dec533-dc80-45a8-a52e-45435aaa7c6e" } -ModuleName "IS4U.FimPortal.Schema"
        $result = Remove-Binding -AttributeName Visa
        It "attrId and objId get id from Get-FimObjectId and binding gets correct parameters filled"{
            $result[1] | Should be "/BindingDescription[BoundAttributeType='03dec533-dc80-45a8-a52e-45435aaa7c6e' and BoundObjectType='03dec533-dc80-45a8-a52e-45435aaa7c6e']"
        }
    }

    Context "Remove-Binding with parameters: testing correct variables get filled and send"{
        Mock Get-FimObjectId -ModuleName "IS4U.FimPortal.Schema" -MockWith {
            $ObjectType, $AttributeName, $AttributeValue
        }
        Remove-Binding -AttributeName Visa
        It "Get-FimObjectId gets the correct parameters for variable attrId"{
            Assert-MockCalled Get-FimObjectId -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $ObjectType -eq "AttributeTypeDescription" -and $AttributeName -eq "Name" -and $AttributeValue -eq "Visa"
            } -Exactly 1
        }
        It "Get-FimObjectId gets the correct parameters for variable objId"{
            Assert-MockCalled Get-FimObjectId -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $ObjectType -eq "ObjectTypeDescription" -and $AttributeName -eq "Name" -and $AttributeValue -eq "Person"
            } -Exactly 1
        }
        It "Remove-FimObject sends correct parameters" {
            Assert-MockCalled Remove-FimObject -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AnchorName -eq "ObjectId" -and $ObjectType -eq "BindingDescription"
                $AnchorValue | Should be "/BindingDescription[BoundAttributeType='AttributeTypeDescription Name Visa' and BoundObjectType='ObjectTypeDescription Name Person']"
            }
        }
    }
}

Describe "New-AttributeAndBinding"{
    Mock New-Binding -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $AttributeName, $DisplayName, $ObjectType
    }
    Mock Add-AttributeToMPR -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $AttrName, $MprName
    }
    Mock Add-AttributeToFilterScope -ModuleName "IS4U.FimPortal.Schema" -MockWith {
        $AttributeId, $DisplayName
    }
    Mock New-Attribute { return New-Guid } -ModuleName "IS4U.FimPortal.Schema"
    Context "With parameters Name, DisplayName and Type to New-AttributeAndBinding"{
        New-AttributeAndBinding -Name Visa -DisplayName "Visa Card Number" -Type String
        It "New-Attribute sends correct parameters for variable attrId" {
            Assert-MockCalled New-Attribute -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $Name -eq "Visa" -and $DisplayName -eq "Visa Card Number" -and $type -eq "String"
            }
        }
        It "New-Attribute returns an UniqueIdentifier type variable to attrId, this gets send with correct DisplayName to Add-AttributeToFilterScope" {
            Assert-MockCalled Add-AttributeToFilterScope -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttributeId.GetType() -eq [Microsoft.ResourceManagement.WebServices.UniqueIdentifier]
                $DisplayName | Should be "Administrator Filter Permission"
            }
        }
        It "Add-AttributeToMPR gets called twice" {
            Assert-MockCalled Add-AttributeToMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa"
            } -Exactly 2
        }
        It "Default variable ObjectType (='Person') gives correct parameters to Add-AttributeToMPR first time" {
            Assert-MockCalled Add-AttributeToMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa" -and $MprName -eq "Administration: Administrators can read and update Users"
            } -Exactly 1
        }
        It "Default variable ObjectType (='Person') gives correct parameters to Add-AttributeToMPR second time" {
            Assert-MockCalled Add-AttributeToMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa" -and $MprName -eq "Synchronization: Synchronization account controls users it synchronizes"
            } -Exactly 1
        }
    }
    Context "With parameters Name, DisplayName, Type AND ObjectType ('Group') to New-AttributeAndBinding" {
        New-AttributeAndBinding -Name Visa -DisplayName "Visa Card Number" -Type String -ObjectType Group
        It "Add-AttributeToMPR gets called twice" {
            Assert-MockCalled Add-AttributeToMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa"
            } -Exactly 2
        }
        It "Variable ObjectType (='Group') gives correct parameters to Add-AttributeToMPR first time" {
            Assert-MockCalled Add-AttributeToMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa" -and $MprName -eq "Group management: Group administrators can update group resources"
            } -Exactly 1
        }
        It "Variable ObjectType (='Group') gives correct parameters to Add-AttributeToMPR second time" {
            Assert-MockCalled Add-AttributeToMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa" -and $MprName -eq "Synchronization: Synchronization account controls group resources it synchronizes"
            } -Exactly 1
        }
    }
}

Describe "Remove-AttributeAndBinding" {
    Mock Remove-AttributeFromMPR -ModuleName "IS4U.FimPortal.Schema"
    Mock Remove-AttributeFromFilterScope -ModuleName "IS4U.FimPortal.Schema"
    Mock Remove-Binding -ModuleName "IS4U.FimPortal.Schema"
    Mock Remove-Attribute -ModuleName "IS4U.FimPortal.Schema"
    Context "With parameters Name" {
        Remove-AttributeAndBinding -Name Visa
        It "Default ObjectType ('Person') ensures Remove-AttributeFromMPR gets called two times"{
            Assert-MockCalled Remove-AttributeFromMPR -ModuleName "IS4U.FimPortal.Schema" -Exactly 2
        }
        It "Remove-AttributeFromMPR gets correct parameters first call" {
            Assert-MockCalled Remove-AttributeFromMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa" -and $MprName -eq "Administration: Administrators can read and update Users"
            } -Exactly 1
        }
        It "Remove-AttributeFromMPR gets correct parameters second call" {
            Assert-MockCalled Remove-AttributeFromMPR -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttrName -eq "Visa" -and $MprName -eq "Synchronization: Synchronization account controls users it synchronizes"
            } -Exactly 1
        }
        It "Remove-AttributeFromFilterScope sends correct parameters" {
            Assert-MockCalled Remove-AttributeFromFilterScope -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttributeName -eq "Visa" -and $DisplayName -eq "Administrator Filter Permission"
            }
        }
        It "Remove-Binding sends correct parameters"{
            Assert-MockCalled Remove-Binding -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttributeName -eq "Visa" -and $ObjectType -eq "Person"
            }
        } 
        It "Remove-Attribute sends correct parameters"{
            Assert-MockCalled Remove-Attribute -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $Name -eq "Visa"
            }
        }
    }
    Context "With parameters Name AND ObjectType ('Group')" {
        Remove-AttributeAndBinding -Name Visa -ObjectType Group
        It "Remove-AttributeFromMPR gets called 0 times" {
            Assert-MockCalled Remove-AttributeFromMPR -ModuleName "IS4U.FimPortal.Schema" -Exactly 0
        }
        It "Remove-Binding sends correct parameters" {
            Assert-MockCalled Remove-Binding -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AttributeName -eq "Visa" -and $ObjectType -eq "Group"
            }
        }
    }
}
Describe "Import-SchemaAttributesAndBindings (and Import-SchemaBindings)" {
    Mock New-AttributeAndBinding -ModuleName "IS4U.FimPortal.Schema"
    Context "With PesterTesting.csv file"{
        Import-SchemaAttributesAndBindings -CsvFile ".\PesterTesting.csv"
        It "New-AttributeAndBinding gets called 3 times (3 records in csv)" {
            Assert-MockCalled New-AttributeAndBinding -ModuleName "IS4U.FimPortal.Schema" -Exactly 3
        }
        It "New-AttributeAndBinding gets correct parameters (from first record)" {
            Assert-MockCalled New-AttributeAndBinding -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $Name -eq "BirthDay" -and $DisplayName -eq "Birth date" -and $Type -eq "DateTime" -and $MultiValued -eq "false" -and $ObjectType -eq "Person"
            } -Exactly 1
        }
        It "New-AttributeAndBinding gets correct parameters (from third record)" {
            Assert-MockCalled New-AttributeAndBinding -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $Name -eq "RoleDistributionList" -and $DisplayName -eq "Role gets a distribution list" -and $Type -eq "Boolean" -and $MultiValued -eq "false" -and $ObjectType -eq "Group"
            } -Exactly 1
        }
    }
}
Describe "New-ObjectType" {
    Mock New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" 
    Mock Get-FimObjectID {return New-Guid} -ModuleName "IS4U.FimPortal.Schema"
    Context "With parameters" {
        $result = New-ObjectType -Name Department -DisplayName Department -Description Department
        It "New-FimImportObject gets correct parameters" {
            Assert-MockCalled New-FimImportObject -ModuleName "IS4U.FimPortal.Schema"  -ParameterFilter {
                $ObjectType -eq "ObjectTypeDescription"
                $State | Should be "Create"
                $Changes["DisplayName"] | Should be "Department"
                $Changes["Name"] | Should be "Department"
                $Changes["Description"] | Should be "Department"
            }
        }
        It "Get-FimObjectID gets correct parameters" {
            Assert-MockCalled Get-FimObjectID -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $ObjectType -eq "ObjectTypeDescription"
                $AttributeName | Should be "Name"
                $AttributeValue | Should be "Department"
            }
        }
        It "Get-FimObjectID/New-ObjectType returns a GUID" {
            $result.GetType() -eq [guid] | Should be $True
        }
    }
}
Describe "Update-ObjectType" {
    Mock Get-FimObjectID {New-Guid} -ModuleName "IS4U.FimPortal.Schema" 
    Context "With parameters, Get-FimObjectId returns a GUID" {
        Mock New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" 
        $result = Update-ObjectType -Name Department -DisplayName Department -Description Department
        It "New-FimImportObject gets correct parameters" {
            Assert-MockCalled New-FimImportObject -ModuleName "IS4U.FimPortal.Schema"  -ParameterFilter {
                $ObjectType -eq "ObjectTypeDescription"
                $State | Should be "Put"
                $Changes["DisplayName"] | Should be "Department"
                $Changes["Description"] | Should be "Department"
                #$Anchor["Name"] | Should be "Department"
            }
        }
        It "Get-FimObjectID gets correct parameters" {
            Assert-MockCalled Get-FimObjectID -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $ObjectType -eq "ObjectTypeDescription"
                $AttributeName | Should be "Name"
                $AttributeValue | Should be "Department"
            }
        }
        It "Get-FimObjectID/New-ObjectType returns a GUID" {
            $result.GetType() -eq [guid] | Should be $True
        }
    }
    Context "With parameters, Get-FimObjectId returns its parameters" {
        Mock New-FimImportObject -ModuleName "IS4U.FimPortal.Schema" -MockWith {
            $ObjectType, $State, $Anchor, $Changes, $ApplyNow
        }
        $result = Update-ObjectType -Name Department -DisplayName Department -Description Department
        #Anchor = $result[2]["Name"]
        It "Correct variable Anchor gets send"{
            $result[2]["Name"] -eq "Department" | Should be $true
        }
    }
}

Describe "Remove-ObjectType" {
    Mock Remove-FimObject -ModuleName "IS4U.FimPortal.Schema"
    Context "With parameters" {
        Remove-ObjectType -Name Department
        It "Remove-FimObject gets correct parameters" {
            Assert-MockCalled Remove-FimObject -ModuleName "IS4U.FimPortal.Schema" -ParameterFilter {
                $AnchorName -eq "Name" -and $ObjectType -eq "ObjectTypeDescription"
                $AnchorValue | Should be "Department"
            }
        } 
    }
}


#Set-ExecutionPolicy -Scope Process Unrestricted