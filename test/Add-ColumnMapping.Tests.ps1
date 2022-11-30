#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-ColumnMapping -Tag InstanceIndependent {
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Translator = New-AdfTabularTranslator
    }

    It Works {
        $Translator | Add-AdfColumnMapping -Source SourceColumn -Sink SinkColumn -ErrorAction Stop
    }
}
