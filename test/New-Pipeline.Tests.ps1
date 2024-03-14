#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-Pipeline {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    It Works-with-minimum-parameters {
        New-AdfPipeline -Name MyPipeline -ErrorAction Stop
    }

    It Works {
        New-AdfPipeline -Name MyPipeline -Description Test -ErrorAction Stop
    }
}
