#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-IsFalseActivity {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $IfCondition = New-AdfIfCondition -Name MyIfCondition -Expression '1=1'
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity -LinkedServiceReference $LinkedServiceReference -StoredProcedureExpression usp_doit
        }

        It 'adds activity to false branch' {
            # Act
            $IfCondition | Add-AdfIsFalseActivity -Activity $Activity -ErrorAction Stop

            # Assert
            $IfCondition.typeProperties.ifFalseActivities | Should -Contain $Activity
        }
    }
}
