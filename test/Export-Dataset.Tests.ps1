#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Export-Dataset {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        $Dataset = New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
    }

    It works {
        $Path = $Dataset | Export-AdfDataset -DatasetsDirectory $TestDrive -ErrorAction Stop
        $Path | Should -Exist
    }
}
