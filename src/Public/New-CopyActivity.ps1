function New-CopyActivity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Source,

        [Parameter( Mandatory )]
        [ValidateSet('AzureSqlSource', 'SqlSource', 'DelimitedTextSource', 'AzureDatabricksDeltaLakeSink')]
        $SourceType,

        [Parameter()]
        $AdditionalSourceColumns,

        [Parameter()]
        $SourceQueryTimeout,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Sink,

        [Parameter( Mandatory )]
        [ValidateSet('AzureSqlSink', 'SqlSink', 'DelimitedTextSource', 'AzureDatabricksDeltaLakeSink')]
        $SinkType,

        [Parameter()]
        $SinkWriteBehavior,

        [Parameter()]
        [switch] $SqlWriterUseTableLock,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        [Parameter()]
        $DependsOn = @(),

        [Parameter()]
        $Translator,

        [Parameter()]
        $SinkStagingSettings

    )

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
        $activity.typeProperties.sink | Add-Member writeBehavior $SinkWriteBehavior
    }

    if ( $SqlWriterUseTableLock.IsPresent ) {
        $activity.typeProperties.sink | Add-Member sqlWriterUseTableLock $true
    }

    if ( $SinkType -eq 'AzureDatabricksDeltaLakeSink' ) {
        $activity.typeProperties.sink | Add-Member importSettings ([PSCustomObject] @{
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
