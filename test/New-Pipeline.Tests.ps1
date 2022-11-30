#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-Pipeline -Tag InstanceIndependent {
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    It Works {
        New-AdfPipeline -Name MyPipeline -Description Test -ErrorAction Stop
    }
}
