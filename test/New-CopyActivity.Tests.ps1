#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-CopyActivity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    Context SqlTableSource_SqlTableSink {

        BeforeEach {
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Source = New-AdfAzureSqlTable -Name MySourceDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
            $Sink = New-AdfAzureSqlTable  -Name MySinkDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
        }

        It works {
            New-AdfCopyActivity -Name MyCopyActivity -Source $Source -SourceType AzureSqlSource -Sink $Sink -SinkType AzureSqlSink -ErrorAction Stop
        }

    }

    Context SqlTableSource_DeltaTableSink {

        BeforeEach {
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Source = New-AdfAzureSqlTable -Name MySourceDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
            $Sink = New-AdfAzureDatabricksDeltaLakeTable -Name MySinkDataset -SchemaName MySchema -TableName MyTable -LinkedServiceReference $LinkedServiceReference
        }

        It 'has importSetting type' {
            $CopyActivity = New-AdfCopyActivity -Name MyCopyActivity -Source $Source -SourceType AzureSqlSource -Sink $Sink -SinkType AzureDatabricksDeltaLakeSink -ErrorAction Stop
            $CopyActivity.typeProperties.sink.importSettings.type | Should -Be 'AzureDatabricksDeltaLakeImportCommand'
        }

    }

    Context DeltaTableSource_DelimitedTextSink {

        BeforeEach {
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Source = New-AdfAzureDatabricksDeltaLakeTable -Name MyDataset -SchemaName MySchema -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop
            $Sink = New-AdfDelimitedTextDataset `
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

        It 'throws if SinkStagingSettings is missing' {
            {
                New-AdfCopyActivity -Name MyCopyActivity `
                    -Source $Source -SourceType AzureDatabricksDeltaLakeSource `
                    -Sink $Sink -SinkType DelimitedTextSink `
                    -ErrorAction Stop
            } | Should -Throw "When SourceType is 'AzureDatabricksDeltaLakeSource' and SinkType is 'DelimitedTextSink', staging via 'SinkStagingSettings' must be enabled"
        }

    }


}
