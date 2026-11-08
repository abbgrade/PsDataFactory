#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-LookupActivity {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Source = New-AdfAzureSqlTable -Name MySourceDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
        }

        It 'creates lookup activity with Azure SQL source' {
            # Act
            $activity = New-AdfLookupActivity -Name MyAcitivity -Source $Source -SourceType AzureSqlSource -ErrorAction Stop

            # Assert
            $activity | Should -Not -BeNullOrEmpty
        }
    }
}
