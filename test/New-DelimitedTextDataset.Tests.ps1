#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-DelimitedTextDataset {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        BeforeEach {
            # Arrange
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        }

        It 'creates delimited text dataset' {
            # Arrange
            $datasetName = 'MyDataset'

            # Act
            $dataset = New-AdfDelimitedTextDataset `
                -Name $datasetName `
                -LinkedServiceReference $LinkedServiceReference `
                -Location ([PSCustomObject]@{
                    type = 'type'
                    folderPath = 'folderPath'
                    container = 'contain'
                }) `
                -ColumnDelimiter "`t" `
                -EscapeChar "`\" `
                -FirstRowAsHeader $true `
                -QuoteChar "`"" `
                -ErrorAction Stop

            # Assert
            $dataset | Should -Not -BeNullOrEmpty
        }

        It 'includes schema property' {
            # Act
            $dataset = New-AdfDelimitedTextDataset `
                -Name MyDataset `
                -LinkedServiceReference $LinkedServiceReference `
                -Location ([PSCustomObject]@{
                    type = 'type'
                    folderPath = 'folderPath'
                    container = 'contain'
                }) `
                -ColumnDelimiter "`t" `
                -EscapeChar "`\" `
                -FirstRowAsHeader $true `
                -QuoteChar "`"" `
                -ErrorAction Stop

            # Assert
            $dataset.properties.PSobject.Properties.name -contains 'schema' | Should -BeTrue
        }
    }
}
