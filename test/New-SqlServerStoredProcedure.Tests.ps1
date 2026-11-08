#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-SqlServerStoredProcedure {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        }

        It 'creates activity with stored procedure expression' {
            # Arrange
            $activityName = 'MyAcitivity'

            # Act
            $activity = New-AdfSqlServerStoredProcedure -Name $activityName -ErrorAction Stop -LinkedServiceReference $LinkedServiceReference -StoredProcedureExpression usp_doit

            # Assert
            $activity.type | Should -Be 'SqlServerStoredProcedure'
            $activity.name | Should -Be $activityName
            $activity.typeProperties | Should -Not -BeNullOrEmpty
            $activity.typeProperties.storedProcedureName | Should -Not -BeNullOrEmpty
            $activity.typeProperties.storedProcedureName.type | Should -Be 'Expression'
            $activity.typeProperties.storedProcedureName.value | Should -Be 'usp_doit'
            $activity | Should -Not -BeNullOrEmpty
        }

        It 'creates activity with stored procedure name' {
            # Arrange
            $activityName = 'MyAcitivity'

            # Act
            $activity = New-AdfSqlServerStoredProcedure -Name $activityName -ErrorAction Stop -LinkedServiceReference $LinkedServiceReference -StoredProcedureName usp_doit

            # Assert
            $activity.type | Should -Be 'SqlServerStoredProcedure'
            $activity.name | Should -Be $activityName
            $activity.typeProperties | Should -Not -BeNullOrEmpty
            $activity.typeProperties.storedProcedureName | Should -Not -BeNullOrEmpty
            $activity.typeProperties.storedProcedureName | Should -Be 'usp_doit'
            $activity | Should -Not -BeNullOrEmpty
        }
    }
}
