#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-Column {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Dataset = New-AdfAzureSqlTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
        }

        It 'adds column to dataset' {
            # Arrange
            $columnName = 'MyColumn'

            # Act
            $Dataset | Add-AdfColumn -Name $columnName -Type MyType -ErrorAction Stop

            # Assert
            $Dataset.properties.structure | Where-Object name -EQ $columnName | Should -Not -BeNullOrEmpty
        }
    }
}
