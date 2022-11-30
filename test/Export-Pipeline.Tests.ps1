#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Export-Pipeline -Tag InstanceIndependent {
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
    }

    It works {
        $Path = $Pipeline | Export-AdfPipeline -PipelinesDirectory $TestDrive -ErrorAction Stop
        $Path | Should -Exist
    }
}
