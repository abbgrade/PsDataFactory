#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-Column -Tag InstanceIndependent {
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }
    BeforeEach {
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        $Dataset = New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
    }

    It works {
        $Dataset | Add-AdfColumn -Name MyColumn -Type MyType -ErrorAction Stop
    }
}
