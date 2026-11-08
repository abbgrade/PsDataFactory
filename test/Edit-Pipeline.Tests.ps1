#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Edit-Pipeline {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
            $ActivityA = New-AdfPipelineActivity -Name A -PipelineName A
            $ActivityB = New-AdfPipelineActivity -Name B -PipelineName B
            $ActivityB | Add-AdfDependency -OnActivity $ActivityA -Condition Succeeded
            $Pipeline | Add-AdfActivity $ActivityB
            $Pipeline | Add-AdfActivity $ActivityA
        }

        It 'inverts pipeline dependencies' {
            # Act
            $Pipeline | Edit-AdfPipeline -Operation InvertDependencies

            # Assert
            $DependencyA = $Pipeline | Get-AdfActivity -Name A | Get-AdfDependency
            $DependencyA.Activity | Should -Be B
            $DependencyB = $Pipeline | Get-AdfActivity -Name B | Get-AdfDependency
            $DependencyB | Should -BeNullOrEmpty
        }

        Context Imported {
            BeforeEach {
                # Arrange
                $Path = $Pipeline | Export-AdfPipeline -PipelinesDirectory $TestDrive -ErrorAction Stop
                $ImportedPipeline = $Path | Import-AdfPipeline -ErrorAction Stop
            }

            It 'inverts dependencies in imported pipeline' {
                # Act
                $ImportedPipeline | Edit-AdfPipeline -Operation InvertDependencies -ErrorAction Stop

                # Assert
                $DependencyA = $ImportedPipeline | Get-AdfActivity -Name A | Get-AdfDependency
                $DependencyA | Should -Not -BeNullOrEmpty
                $DependencyA.Activity | Should -Be B
                $DependencyB = $ImportedPipeline | Get-AdfActivity -Name B | Get-AdfDependency
                $DependencyB | Should -BeNullOrEmpty
            }
        }
    }
}
