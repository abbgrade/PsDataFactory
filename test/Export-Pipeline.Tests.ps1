#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe Export-Pipeline {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        }

        It 'exports pipeline to file' {
            # Act
            $Path = $Pipeline | Export-AdfPipeline -PipelinesDirectory $TestDrive -ErrorAction Stop

            # Assert
            $Path | Should -Exist
            $Path.Name | Should -Be 'MyPipeline.json'
            (Get-Content -Raw -Path $Path | ConvertFrom-Json).name | Should -Be $Pipeline.name
        }
    }
}
