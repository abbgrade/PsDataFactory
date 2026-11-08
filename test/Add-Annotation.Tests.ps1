#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-Annotation {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'appends a single annotation to existing pipeline annotations' {
            # Arrange
            $pipeline = New-AdfPipeline -Name 'MyPipeline' -ErrorAction Stop
            $pipeline.properties.annotations = @('Existing')
            $annotation = 'Production'

            # Act
            $pipeline | Add-AdfAnnotation -Annotation $annotation -ErrorAction Stop

            # Assert
            $pipeline.properties.annotations.Count | Should -Be 2
            $pipeline.properties.annotations[0] | Should -Be 'Existing'
            $pipeline.properties.annotations[1] | Should -Be 'Production'
        }
    }
}
