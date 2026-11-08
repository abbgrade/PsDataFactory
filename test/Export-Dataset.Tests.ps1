#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Export-Dataset {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Dataset = New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
        }

        It 'exports dataset to file' {
            # Act
            $Path = $Dataset | Export-AdfDataset -DatasetsDirectory $TestDrive -ErrorAction Stop

            # Assert
            $Path | Should -Exist
            $Path.Name | Should -Be 'MyDataset.json'
            (Get-Content -Raw -Path $Path | ConvertFrom-Json).name | Should -Be $Dataset.name
        }
    }
}
