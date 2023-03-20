#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-SqlServerStoredProcedure {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
    }

    It works {
        New-AdfSqlServerStoredProcedure -Name MyAcitivity -ErrorAction Stop
    }
}
