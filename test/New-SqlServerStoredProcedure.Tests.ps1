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
        $activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity -ErrorAction Stop -LinkedServiceReference $LinkedServiceReference -StoredProcedureExpression usp_doit
        $activity.type | Should -Be 'SqlServerStoredProcedure'
        $activity.name | Should -Be 'MyAcitivity'
        $activity.typeProperties | Should -Not -BeNullOrEmpty
        $activity.typeProperties.storedProcedureName | Should -Not -BeNullOrEmpty
        $activity.typeProperties.storedProcedureName.type | Should -Be 'Expression'
        $activity.typeProperties.storedProcedureName.value | Should -Be 'usp_doit'
        $activity | Should -Not -BeNullOrEmpty
    }

    It works-for-name {
        $activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity -ErrorAction Stop -LinkedServiceReference $LinkedServiceReference -StoredProcedureName usp_doit
        $activity.type | Should -Be 'SqlServerStoredProcedure'
        $activity.name | Should -Be 'MyAcitivity'
        $activity.typeProperties | Should -Not -BeNullOrEmpty
        $activity.typeProperties.storedProcedureName | Should -Not -BeNullOrEmpty
        $activity.typeProperties.storedProcedureName | Should -Be 'usp_doit'
        $activity | Should -Not -BeNullOrEmpty
    }
}
