#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-LinkedServiceReference -Tag InstanceIndependent {
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    It works {
        New-AdfLinkedServiceReference -Name MyLinkedService -ErrorAction Stop
    }
}
