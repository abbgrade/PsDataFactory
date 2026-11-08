#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-Activity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity -LinkedServiceReference $LinkedServiceReference -StoredProcedureExpression usp_doit
        }

        It 'adds activity to pipeline' {
            # Act
            $Pipeline | Add-AdfActivity -Activity $Activity -ErrorAction Stop

            # Assert
            $Pipeline.properties.activities | Should -Contain $Activity
        }
    }
}
