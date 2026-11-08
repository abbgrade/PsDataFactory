#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Get-Dependency {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'returns dependencies for an activity' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityB' -PipelineName 'PipelineB'
            $predecessor = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'
            $activity | Add-AdfDependency -OnActivity $predecessor -Condition Succeeded

            # Act
            $dependencies = @($activity | Get-AdfDependency)

            # Assert
            $dependencies.Count | Should -Be 1
            $dependencies[0].activity | Should -Be 'ActivityA'
            $dependencies[0].dependencyConditions | Should -Contain 'Succeeded'
        }

        It 'returns no dependencies for an activity without dependencies' {
            # Arrange
            $activity = New-AdfPipelineActivity -Name 'ActivityA' -PipelineName 'PipelineA'

            # Act
            $dependencies = @($activity | Get-AdfDependency)

            # Assert
            $dependencies.Count | Should -Be 0
        }
    }
}
