#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-LinkedServiceReference {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'creates linked service reference' {
            # Arrange
            $linkedServiceName = 'MyLinkedService'

            # Act
            $linkedService = New-AdfLinkedServiceReference -Name $linkedServiceName -ErrorAction Stop

            # Assert
            $linkedService | Should -Not -BeNullOrEmpty
        }
    }
}
