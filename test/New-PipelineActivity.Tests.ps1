#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-PipelineActivity {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'creates activity that waits for pipeline completion' {
            # Arrange
            $activityName = 'execute'

            # Act
            $activity = New-AdfPipelineActivity -Name $activityName -PipelineName MyOtherPipeline

            # Assert
            $activity.typeProperties.waitOnCompletion | Should -BeTrue
        }
    }
}