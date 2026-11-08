#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Remove-Dependency {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'removes only the dependency matching the predecessor activity' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityC' -PipelineName 'PipelineC'
            $predecessorA = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'
            $predecessorB = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $activity | Add-AdfDependency -OnActivity $predecessorA -Condition Succeeded
            $activity | Add-AdfDependency -OnActivity $predecessorB -Condition Failed

            # Act
            $activity | Remove-AdfDependency -OnActivity $predecessorA

            # Assert
            $activity.dependsOn.Count | Should -Be 1
            $activity.dependsOn[0].activity | Should -Be 'ActivityB'
        }

        It 'leaves an empty dependency array when the last dependency is removed' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $predecessor = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'
            $activity | Add-AdfDependency -OnActivity $predecessor -Condition Succeeded

            # Act
            $activity | Remove-AdfDependency -OnActivity $predecessor

            # Assert
            @($activity.dependsOn).Count | Should -Be 0
        }
    }
}
