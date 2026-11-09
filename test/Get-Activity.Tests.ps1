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
            $activities = $Pipeline | Get-AdfActivity -Name $activityName

            # Assert
            $activities.Count | Should -Be 1
            $activities[0].Name | Should -Be $activityName
        }

        It 'returns activities nested in If Condition branches when recurse is specified' {
            # Arrange
            $ifCondition = New-AdfIfCondition -Name 'OuterCondition' -Expression '1=1'
            $trueActivity = New-AdfPipelineActivity -Name 'TrueActivity' -PipelineName 'TruePipeline'
            $nestedCondition = New-AdfIfCondition -Name 'NestedCondition' -Expression '1=1'
            $nestedActivity = New-AdfPipelineActivity -Name 'NestedActivity' -PipelineName 'NestedPipeline'
            $nestedCondition.typeProperties | Add-Member -NotePropertyName ifFalseActivities -NotePropertyValue @($nestedActivity)
            $ifCondition.typeProperties | Add-Member -NotePropertyName ifTrueActivities -NotePropertyValue @($trueActivity)
            $ifCondition | Add-AdfIsFalseActivity -Activity $nestedCondition
            $Pipeline | Add-AdfActivity -Activity $ifCondition

            # Act
            $activities = $Pipeline | Get-AdfActivity -Recurse

            # Assert
            $activities.Count | Should -Be 6
            $activities.Name | Should -Contain 'OuterCondition'
            $activities.Name | Should -Contain 'TrueActivity'
            $activities.Name | Should -Contain 'NestedCondition'
            $activities.Name | Should -Contain 'NestedActivity'
        }

        It 'applies the name filter to recursively returned activities' {
            # Arrange
            $ifCondition = New-AdfIfCondition -Name 'OuterCondition' -Expression '1=1'
            $nestedActivity = New-AdfPipelineActivity -Name 'NestedActivity' -PipelineName 'NestedPipeline'
            $ifCondition.typeProperties | Add-Member -NotePropertyName ifTrueActivities -NotePropertyValue @($nestedActivity)
            $Pipeline | Add-AdfActivity -Activity $ifCondition

            # Act
            $activities = $Pipeline | Get-AdfActivity -Name 'NestedActivity' -Recurse

            # Assert
            $activities.Count | Should -Be 1
            $activities[0].Name | Should -Be 'NestedActivity'
        }
    }
}
