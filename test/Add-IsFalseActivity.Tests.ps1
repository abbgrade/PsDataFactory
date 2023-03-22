#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-IsFalseActivity {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $IfCondition = New-AdfIfCondition -Name MyIfCondition -Expression '1=1'
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        $Activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity -LinkedServiceReference $LinkedServiceReference -StoredProcedureExpression usp_doit
    }

    It Works {
        $IfCondition | Add-AdfIsFalseActivity -Activity $Activity -ErrorAction Stop
    }
}
