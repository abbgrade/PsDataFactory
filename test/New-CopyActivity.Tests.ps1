#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-CopyActivity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -ErrorAction Stop
    }

    Context UnitTests -Tag UnitTest {
        Context SqlTableSource_SqlTableSink {

            BeforeEach {
                # Arrange
                $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
                $Source = New-AdfAzureSqlTable -Name MySourceDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
                $Sink = New-AdfAzureSqlTable  -Name MySinkDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
            }

            It 'creates copy activity for SQL table source and sink' {
                # Act
                $activity = New-AdfCopyActivity -Name MyCopyActivity -Source $Source -SourceType AzureSqlSource -Sink $Sink -SinkType AzureSqlSink -ErrorAction Stop

                # Assert
                $activity | Should -Not -BeNullOrEmpty
            }
        }

        Context SqlTableSource_DeltaTableSink {

            BeforeEach {
                # Arrange
                $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
                $Source = New-AdfAzureSqlTable -Name MySourceDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
                $Sink = New-AdfAzureDatabricksDeltaLakeTable -Name MySinkDataset -SchemaName MySchema -TableName MyTable -LinkedServiceReference $LinkedServiceReference
            }

            It 'has importSetting type' {
                # Act
                $copyActivity = New-AdfCopyActivity -Name MyCopyActivity -Source $Source -SourceType AzureSqlSource -Sink $Sink -SinkType AzureDatabricksDeltaLakeSink -ErrorAction Stop

                # Assert
                $copyActivity.typeProperties.sink.importSettings.type | Should -Be 'AzureDatabricksDeltaLakeImportCommand'
            }
        }

        Context DeltaTableSource_DelimitedTextSink {

            BeforeEach {
                # Arrange
                $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
                $Source = New-AdfAzureDatabricksDeltaLakeTable -Name MyDataset -SchemaName MySchema -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop
                $Sink = New-AdfDelimitedTextDataset `
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
            }

            It 'throws if SinkStagingSettings is missing' {
                # Act
                $copyActivityAction = {
                    New-AdfCopyActivity -Name MyCopyActivity `
                        -Source $Source -SourceType AzureDatabricksDeltaLakeSource `
                        -Sink $Sink -SinkType DelimitedTextSink `
                        -ErrorAction Stop
                }

                # Assert
                $copyActivityAction | Should -Throw 'When SourceType is ''AzureDatabricksDeltaLakeSource'' and SinkType is ''DelimitedTextSink'', staging via ''SinkStagingSettings'' must be enabled'
            }
        }
    }
}
