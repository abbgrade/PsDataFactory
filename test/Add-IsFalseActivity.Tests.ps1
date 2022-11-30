#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-IsFalseActivity -Tag InstanceIndependent {
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $IfCondition = New-AdfIfCondition -Name MyIfCondition -Expression '1=1'
        $Activity = New-AdfSqlServerStoredProcedure -Name MyAcitivity
    }

    It Works {
        $IfCondition | Add-AdfIsFalseActivity -Activity $Activity -ErrorAction Stop
    }
}
