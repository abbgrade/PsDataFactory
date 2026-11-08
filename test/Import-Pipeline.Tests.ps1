#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Import-Pipeline {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test -ErrorAction Stop
            $Path = $Pipeline | Export-AdfPipeline -PipelinesDirectory $TestDrive -ErrorAction Stop
        }

        It 'imports pipeline from exported file' {
            # Act
            $imported = $Path | Import-AdfPipeline -ErrorAction Stop

            # Assert
            $imported | Should -Not -BeNullOrEmpty
            $imported.name | Should -Be $Pipeline.name
        }
    }
}
