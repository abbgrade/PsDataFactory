#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-Parameter {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        }

        It 'adds parameter to pipeline' {
            # Arrange
            $parameterName = 'MyParameter'

            # Act
            $Pipeline | Add-AdfParameter -Name $parameterName -Type MyType -ErrorAction Stop

            # Assert
            $Pipeline.properties.parameters.$parameterName.type | Should -Be 'MyType'
        }
    }
}
