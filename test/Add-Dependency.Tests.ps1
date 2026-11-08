#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-Dependency {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'adds dependency with the specified condition' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $predecessor = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'

            # Act
            $activity | Add-AdfDependency -OnActivity $predecessor -Condition Succeeded

            # Assert
            $activity.dependsOn[0].activity | Should -Be 'ActivityA'
            $activity.dependsOn[0].dependencyConditions | Should -Contain 'Succeeded'
        }

        It 'preserves existing dependencies when adding another' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityC' -PipelineName 'PipelineC'
            $predecessorA = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'
            $predecessorB = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $activity | Add-AdfDependency -OnActivity $predecessorA -Condition Succeeded

            # Act
            $activity | Add-AdfDependency -OnActivity $predecessorB -Condition Failed

            # Assert
            $activity.dependsOn.Count | Should -Be 2
            $activity.dependsOn[0].activity | Should -Be 'ActivityA'
            $activity.dependsOn[1].activity | Should -Be 'ActivityB'
            $activity.dependsOn[1].dependencyConditions | Should -Contain 'Failed'
        }

        It 'adds multiple conditions to one dependency' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $predecessor = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'

            # Act
            $activity | Add-AdfDependency -OnActivity $predecessor -Condition Succeeded, Failed -ErrorAction Stop

            # Assert
            $activity.dependsOn.Count | Should -Be 1
            $activity.dependsOn[0].dependencyConditions.Count | Should -Be 2
            $activity.dependsOn[0].dependencyConditions[0] | Should -Be 'Succeeded'
            $activity.dependsOn[0].dependencyConditions[1] | Should -Be 'Failed'
        }

        It 'rejects an invalid condition in an array' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $predecessor = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'

            # Assert
            { $activity | Add-AdfDependency -OnActivity $predecessor -Condition Succeeded, Invalid -ErrorAction Stop } | Should -Throw
            $activity.dependsOn | Should -BeNullOrEmpty
        }
    }
}
