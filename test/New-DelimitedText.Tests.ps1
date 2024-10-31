#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-DelimitedText {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
    }

    It works {
        New-AdfDelimitedTextDataset `
            -Name MyDataset `
            -LinkedServiceReference $LinkedServiceReference `
            -Location ([PSCustomObject]@{
                type = "type"
                folderPath = "folderPath"
                container = "contain"
            }) `
            -ColumnDelimiter "`t" `
            -EscapeChar "`\" `
            -FirstRowAsHeader $true `
            -QuoteChar "`"" `
            -ErrorAction Stop
    }

    It 'has property <schema>' {
        $dataset = New-AdfDelimitedTextDataset `
            -Name MyDataset `
            -LinkedServiceReference $LinkedServiceReference `
            -Location ([PSCustomObject]@{
                type = "type"
                folderPath = "folderPath"
                container = "contain"
            }) `
            -ColumnDelimiter "`t" `
            -EscapeChar "`\" `
            -FirstRowAsHeader $true `
            -QuoteChar "`"" `
            -ErrorAction Stop
        $dataset.properties.PSobject.Properties.name -contains "schema" | Should -BeTrue
    }
}
