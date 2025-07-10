#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Edit-Pipeline {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        $ActivityA = New-AdfPipelineActivity -Name A -PipelineName A
        $ActivityB = New-AdfPipelineActivity -Name B -PipelineName B
        $ActivityB | Add-AdfDependency -OnActivity $ActivityA -Condition Succeeded
        $Pipeline | Add-AdfActivity $ActivityB
        $Pipeline | Add-AdfActivity $ActivityA
    }

    It works {
        $Pipeline | Edit-AdfPipeline -Operation InvertDependencies
    }

    Context Imported {      

        BeforeEach {
            $Path = $Pipeline | Export-AdfPipeline -PipelinesDirectory $TestDrive -ErrorAction Stop
            $ImportedPipeline = $Path | Import-AdfPipeline
        }

        It works {
            $ImportedPipeline | Edit-AdfPipeline -Operation InvertDependencies
            $DependencyA = $ImportedPipeline | Get-AdfActivity -Name A | Get-AdfDependency
            $DependencyA | Should -Not -BeNullOrEmpty
            $DependencyA.Activity | Should -Be B
            $DependencyB = $ImportedPipeline | Get-AdfActivity -Name B | Get-AdfDependency
            $DependencyB | Should -BeNullOrEmpty
        }
    }
}
