#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-DatabricksPythonActivity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        }

        Context AzureDatabricks {
            It 'creates activity with Python file path' {
                # Arrange
                $activityName = 'MyPythonActivity'

                # Act
                $activity = New-AdfDatabricksPythonActivity -Name $activityName -PythonFilePath 'dbfs:/main.py' -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop

                # Assert
                $activity.name | Should -Be $activityName
                $activity.type | Should -Be 'DatabricksSparkPython'
                $activity.typeProperties.pythonFile | Should -Be 'dbfs:/main.py'
                @($activity.typeProperties.parameters).Count | Should -Be 0
                $activity.linkedServiceName | Should -Be $LinkedServiceReference
                $activity.policy.timeout | Should -Be '0.12:00:00'
            }
        }
    }
}
