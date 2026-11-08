#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-Variable {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        }

        It 'adds variable to pipeline' {
            # Arrange
            $variableName = 'MyVariable'

            # Act
            $Pipeline | Add-AdfVariable -Name $variableName -Type MyType -ErrorAction Stop

            # Assert
            $Pipeline.properties.variables.$variableName.type | Should -Be 'MyType'
        }

        It 'adds a non-empty default value to the variable' {
            # Act
            $Pipeline | Add-AdfVariable -Name 'DefaultedVariable' -Type 'String' -DefaultValue 'ready' -ErrorAction Stop

            # Assert
            $Pipeline.properties.variables.DefaultedVariable.type | Should -Be 'String'
            $Pipeline.properties.variables.DefaultedVariable.defaultValue | Should -Be 'ready'
        }
    }
}
