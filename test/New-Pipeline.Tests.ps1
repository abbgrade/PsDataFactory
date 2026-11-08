#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-Pipeline {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'creates pipeline with required name' {
            # Arrange
            $pipelineName = 'MyPipeline'

            # Act
            $pipeline = New-AdfPipeline -Name $pipelineName -ErrorAction Stop

            # Assert
            $pipeline | Should -Not -BeNullOrEmpty
            $pipeline.name | Should -Be $pipelineName
            @($pipeline.properties.activities).Count | Should -Be 0
            $pipeline.properties.annotations | Should -Contain 'THIS IS A GENERATED PIPELINE. CHANGES MAY BE OVERWRITTEN!'
        }

        It 'creates pipeline with description' {
            # Arrange
            $pipelineName = 'MyPipeline'

            # Act
            $pipeline = New-AdfPipeline -Name $pipelineName -Description Test -ErrorAction Stop

            # Assert
            $pipeline | Should -Not -BeNullOrEmpty
            $pipeline.name | Should -Be $pipelineName
            $pipeline.properties.description | Should -Be 'Test'
        }
    }
}
