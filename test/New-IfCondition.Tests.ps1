#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-IfCondition {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        It 'creates if condition with expression' {
            # Arrange
            $conditionName = 'MyIfCondition'

            # Act
            $ifCondition = New-AdfIfCondition -Name $conditionName -Expression '1=1' -ErrorAction Stop

            # Assert
            $ifCondition | Should -Not -BeNullOrEmpty
        }
    }
}
