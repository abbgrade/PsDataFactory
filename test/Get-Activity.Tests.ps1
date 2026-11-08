#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Get-Activity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Pipeline = New-AdfPipeline -Name 'MyPipeline' -Description 'Test'
            $ActivityA = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'
            $ActivityB = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $Pipeline | Add-AdfActivity -Activity $ActivityA
            $Pipeline | Add-AdfActivity -Activity $ActivityB
        }

        It 'returns all pipeline activities when no name is specified' {
            # Act
            $activities = @($Pipeline | Get-AdfActivity)

            # Assert
            $activities.Count | Should -Be 2
            $activities.Name | Should -Contain 'ActivityA'
            $activities.Name | Should -Contain 'ActivityB'
        }

        It 'returns only the activity matching the specified name' {
            # Arrange
            $activityName = 'ActivityB'

            # Act
            $activities = @($Pipeline | Get-AdfActivity -Name $activityName)

            # Assert
            $activities.Count | Should -Be 1
            $activities[0].Name | Should -Be $activityName
        }
    }
}
