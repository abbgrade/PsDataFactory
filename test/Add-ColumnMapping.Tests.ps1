#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Add-ColumnMapping {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Translator = New-AdfTabularTranslator
        }

        It 'adds column mapping to translator' {
            # Arrange
            $source = 'SourceColumn'
            $sink = 'SinkColumn'

            # Act
            $Translator | Add-AdfColumnMapping -Source $source -Sink $sink -ErrorAction Stop

            # Assert
            $Translator.columnMappings.$source | Should -Be $sink
        }
    }
}
