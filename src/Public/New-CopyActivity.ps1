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
        [ValidateSet('AzureSqlSource', 'SqlSource', 'DelimitedTextSource')]
        $SourceType,

        [Parameter()]
        $SourceQueryTimeout, # = '02:00:00',

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Sink,

        [Parameter( Mandatory )]
        [ValidateSet('AzureSqlSink', 'SqlSink', 'DelimitedTextSource')]
        $SinkType,

        [Parameter()]
        $SinkWriteBehavior, # = 'insert',

        [Parameter()]
        [switch] $SqlWriterUseTableLock,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        [Parameter()]
        $DependsOn = @(),

        [Parameter()]
        $Translator
    )

    $activity = New-Activity -Name $Name -Type Copy -Timeout:$Timeout -DependsOn:$DependsOn

    $activity.typeProperties | Add-Member source ([PSCustomObject] @{
            type = $SourceType
        })

    $activity.typeProperties | Add-Member sink ([PSCustomObject] @{
            type = $SinkType
        })

    if ( $SourceQueryTimeout ) {
        $activity.typeProperties.source | Add-Member queryTimeout $SourceQueryTimeout
    }

    if ( $SinkWriteBehavior ) {
        $activity.typeProperties.sink | Add-Member writeBehavior $SinkWriteBehavior
    }

    if ( $SqlWriterUseTableLock.IsPresent ) {
        $activity.typeProperties.sink | Add-Member sqlWriterUseTableLock $true
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
