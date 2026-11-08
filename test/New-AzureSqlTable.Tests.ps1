#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-AzureSqlTable {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        }

        It 'creates Azure SQL dataset' {
            # Act
            $dataset = New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop

            # Assert
            $dataset | Should -Not -BeNullOrEmpty
        }

        It 'includes structure property' {
            # Act
            $dataset = New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop

            # Assert
            $dataset.properties.PSobject.Properties.name -contains 'structure' | Should -BeTrue
        }
    }
}
