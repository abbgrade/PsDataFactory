#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-Activity -Tag InstanceIndependent {
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        $Activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity
    }

    It works {
        $Pipeline | Add-AdfActivity -Activity $Activity -ErrorAction Stop
    }
}
