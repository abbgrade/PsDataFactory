#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-SqlServerStoredProcedure {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
    }

    It works-for-expression {
        New-AdfSqlServerStoredProcedure -Name MyAcitivity -ErrorAction Stop -LinkedServiceReference $LinkedServiceReference -StoredProcedureExpression usp_doit
    }

    It works-for-name {
        New-AdfSqlServerStoredProcedure -Name MyAcitivity -ErrorAction Stop -LinkedServiceReference $LinkedServiceReference -StoredProcedureName usp_doit
    }
}
