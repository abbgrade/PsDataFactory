#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-AzureSqlTable {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
    }

    It works {
        New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop
    }

    It 'has property <structure>' {
        $dataset = New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop
        $dataset.properties.PSobject.Properties.name -contains "structure" | Should -BeTrue
    }
}
