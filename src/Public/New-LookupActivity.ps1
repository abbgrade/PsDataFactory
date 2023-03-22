function New-LookupActivity {

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
        $SourceQueryTimeout,

        [Parameter()]
        [switch] $SqlWriterUseTableLock,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00'
    )

    $activity = New-Activity -Name $Name -Type Lookup -Timeout:$Timeout

    $activity.typeProperties | Add-Member source ([PSCustomObject] @{
            type = $SourceType
        })

    if ( $SourceQueryTimeout ) {
        $activity.typeProperties.source | Add-Member queryTimeout $SourceQueryTimeout
    }

    $activity.typeProperties | Add-Member dataset $Source

    Write-Output $activity
}
