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
        }

        It 'creates pipeline with description' {
            # Arrange
            $pipelineName = 'MyPipeline'

            # Act
            $pipeline = New-AdfPipeline -Name $pipelineName -Description Test -ErrorAction Stop

            # Assert
            $pipeline | Should -Not -BeNullOrEmpty
        }
    }
}
