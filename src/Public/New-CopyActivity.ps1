<#
.SYNOPSIS
Creates a Copy activity for an Azure Data Factory pipeline.

.DESCRIPTION
Creates a Copy activity with the selected source and sink types, dataset references, and optional source, sink, staging, timeout, dependency, and translation settings. For an Azure Databricks Delta Lake source and Delimited Text sink, staging settings are required.

.OUTPUTS
System.Management.Automation.PSCustomObject. The Copy activity definition.

.EXAMPLE
New-AdfCopyActivity -Name 'CopyOrders' -Source $source -SourceType AzureSqlSource -Sink $sink -SinkType AzureSqlSink
Creates a Copy activity from an Azure SQL source to an Azure SQL sink.
#>
function New-CopyActivity {

    [CmdletBinding()]
    param (
        # The activity name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The source dataset reference.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Source,

        # The Copy activity source type.
        [Parameter( Mandatory )]
        [ValidateSet('AzureSqlSource', 'SqlSource', 'DelimitedTextSource', 'AzureDatabricksDeltaLakeSource')]
        $SourceType,

        # Optional additional source columns.
        [Parameter()]
        $AdditionalSourceColumns,

        # Optional timeout for the source query.
        [Parameter()]
        $SourceQueryTimeout,

        # The sink dataset reference.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Sink,

        # The Copy activity sink type.
        [Parameter( Mandatory )]
        [ValidateSet('AzureSqlSink', 'SqlSink', 'DelimitedTextSink', 'AzureDatabricksDeltaLakeSink')]
        $SinkType,

        # Optional sink store settings that define how data is written.
        [Parameter()]
        $SinkWriteBehavior,

        # When specified, enables the SQL writer table lock setting.
        [Parameter()]
        [switch] $SqlWriterUseTableLock,

        # The activity timeout. Defaults to 12 hours.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        # The activity dependencies. Defaults to an empty array.
        [Parameter()]
        $DependsOn = @(),

        # Optional column translator configuration.
        [Parameter()]
        $Translator,

        # Optional staging settings for the sink.
        [Parameter()]
        $SinkStagingSettings

    )

    if ($SourceType -eq 'AzureDatabricksDeltaLakeSource' -and $SinkType -eq 'DelimitedTextSink') {
        if (-not $SinkStagingSettings) {
            Write-Error "When SourceType is '$SourceType' and SinkType is '$SinkType', staging via 'SinkStagingSettings' must be enabled"
        }
    }

    $activity = New-Activity -Name $Name -Type Copy -Timeout:$Timeout -DependsOn:$DependsOn

    $activity.typeProperties | Add-Member source ([PSCustomObject] @{
            type              = $SourceType
            partitionOption   = 'None'
        })

    if ( $AdditionalSourceColumns ) {
        $activity.typeProperties.source | Add-Member additionalColumns $AdditionalSourceColumns
    }

    $activity.typeProperties | Add-Member sink ([PSCustomObject] @{
            type = $SinkType
        })

    if ($SinkStagingSettings) {
        $activity.typeProperties | Add-Member enableStaging $true
        $activity.typeProperties | Add-Member stagingSettings $SinkStagingSettings
    }
    else {
        $activity.typeProperties | Add-Member enableStaging $false
    }

    if ( $SourceQueryTimeout ) {
        $activity.typeProperties.source | Add-Member queryTimeout $SourceQueryTimeout
    }

    if ( $SinkWriteBehavior ) {
        $activity.typeProperties.sink | Add-Member storeSettings $SinkWriteBehavior
    }

    if ( $SqlWriterUseTableLock.IsPresent ) {
        $activity.typeProperties.sink | Add-Member sqlWriterUseTableLock $true
    }

    if ( $SinkType -eq 'AzureDatabricksDeltaLakeSink' ) {
        $activity.typeProperties.sink | Add-Member importSettings ([PSCustomObject] @{
            type = "AzureDatabricksDeltaLakeImportCommand"
        })
    }

    if ( $SourceType -eq 'AzureDatabricksDeltaLakeSource' ) {
        $activity.typeProperties.source | Add-Member exportSettings ([PSCustomObject] @{
            type = "AzureDatabricksDeltaLakeImportCommand"
        })
    }

    if ( $Translator ) {
        $activity.typeProperties | Add-Member translator $Translator
    }

    $activity | Add-Member inputs @(
        $Source
    )

    $activity | Add-Member outputs @(
        $Sink
    )

    Write-Output $activity
}
