#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-AzureDatabricksDeltaLakeTable {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        }

        It 'creates Azure Databricks Delta Lake dataset' {
            # Act
            $dataset = New-AdfAzureDatabricksDeltaLakeTable -Name MyDataset -SchemaName MySchema -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop

            # Assert
            $dataset | Should -Not -BeNullOrEmpty
        }

        It 'includes schema property' {
            # Act
            $dataset = New-AdfAzureDatabricksDeltaLakeTable -Name MyDataset -SchemaName MySchema -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop

            # Assert
            $dataset.properties.PSobject.Properties.name -contains 'schema' | Should -BeTrue
        }
    }
}
