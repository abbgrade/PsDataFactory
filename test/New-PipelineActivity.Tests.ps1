#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-PipelineActivity {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
    }

    It works {
        $activity = New-AdfPipelineActivity -Name execute -PipelineName MyOtherPipeline
        $activity.typeProperties.waitOnCompletion | Should -Be true
    }

}