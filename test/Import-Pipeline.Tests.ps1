#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Import-Pipeline {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        $Path = $Pipeline | Export-AdfPipeline -PipelinesDirectory $TestDrive -ErrorAction Stop
    }

    It works {
        $imported = $Path | Import-AdfPipeline
        $imported | Should -Not -BeNullOrEmpty
    }
}
