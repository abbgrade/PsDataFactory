#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-IfCondition {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    It Works {
        $IfCondition = New-AdfIfCondition -Name MyIfCondition -Expression '1=1' -ErrorAction Stop
    }
}
