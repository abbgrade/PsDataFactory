#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Import-Dataflow {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $DataflowPath = Join-Path $TestDrive 'MyDataflow.json'
            '{"name":"MyDataflow","properties":{}}' | Set-Content -Path $DataflowPath
        }

        It 'imports data flow from JSON file' {
            # Act
            $imported = Get-Item $DataflowPath | Import-AdfDataflow -ErrorAction Stop

            # Assert
            $imported | Should -Not -BeNullOrEmpty
            $imported.name | Should -Be 'MyDataflow'
        }
    }
}
