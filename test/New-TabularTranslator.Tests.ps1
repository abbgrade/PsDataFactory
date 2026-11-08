#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-TabularTranslator {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'creates tabular translator' {
            # Act
            $translator = New-AdfTabularTranslator -ErrorAction Stop

            # Assert
            $translator.type | Should -Be 'TabularTranslator'
            $translator.PSObject.Properties.Name | Should -Contain 'columnMappings'
            @($translator.columnMappings.PSObject.Properties).Count | Should -Be 0
        }
    }
}
