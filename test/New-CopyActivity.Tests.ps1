#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-CopyActivity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    Context AzureDatabricks {

        BeforeEach {
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
            $Source = New-AdfAzureSqlTable -Name MySourceDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
            $Sink = New-AdfAzureSqlTable  -Name MySinkDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
        }

        It works {
            New-AdfCopyActivity -Name MyCopyActivity -Source $Source -SourceType AzureSqlSource -Sink $Sink -SinkType AzureSqlSink -ErrorAction Stop
        }

    }

    Context AzureDatabricks {

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


}
