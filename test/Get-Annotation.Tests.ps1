#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Get-Annotation {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'returns each pipeline annotation as a separate output' {
            # Arrange
            $pipeline = New-AdfPipeline -Name 'MyPipeline' -ErrorAction Stop
            $pipeline.properties.annotations = @('Production', 'Daily')

            # Act
            $annotations = $pipeline | Get-AdfAnnotation -ErrorAction Stop

            # Assert
            $annotations.Count | Should -Be 2
            $annotations[0].GetType().Name | Should -Be 'String'
            $annotations[0] | Should -Be 'Production'
            $annotations[1].GetType().Name | Should -Be 'String'
            $annotations[1] | Should -Be 'Daily'
        }

        It 'returns no annotations when the pipeline has none' {
            # Arrange
            $pipeline = New-AdfPipeline -Name 'MyPipeline' -ErrorAction Stop
            $pipeline.properties.annotations = @()

            # Act
            $annotations = $pipeline | Get-AdfAnnotation -ErrorAction Stop

            # Assert
            $annotations.Count | Should -Be 0
        }
    }
}
