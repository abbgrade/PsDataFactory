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
            $activity.type | Should -Be 'Lookup'
            $activity.typeProperties.source.type | Should -Be 'AzureSqlSource'
            $activity.typeProperties.dataset | Should -Be $Source
            $activity.policy.timeout | Should -Be '0.12:00:00'
        }

        It 'includes a source query timeout when specified' {
            # Act
            $activity = New-AdfLookupActivity -Name MyActivity -Source $Source -SourceType AzureSqlSource -SourceQueryTimeout '00:05:00' -ErrorAction Stop

            # Assert
            $activity.typeProperties.source.queryTimeout | Should -Be '00:05:00'
        }
    }
}
