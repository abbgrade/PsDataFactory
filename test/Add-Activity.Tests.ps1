#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe Add-Activity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        $Activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity -LinkedServiceReference $LinkedServiceReference -StoredProcedureExpression usp_doit
    }

    It works {
        $Pipeline | Add-AdfActivity -Activity $Activity -ErrorAction Stop
    }
}
