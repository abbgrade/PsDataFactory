<#
.SYNOPSIS
Creates a Lookup activity.

.DESCRIPTION
Creates a Lookup activity that reads from the supplied dataset using one of the supported source types.

.OUTPUTS
System.Management.Automation.PSCustomObject. The Lookup activity definition.

.EXAMPLE
New-AdfLookupActivity -Name 'FindOrder' -Source $dataset -SourceType AzureSqlSource
Creates a Lookup activity for an Azure SQL source.
#>
function New-LookupActivity {

    [CmdletBinding()]
    param (
        # The activity name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The dataset reference used by the activity.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Source,

        # The Lookup source type.
        [Parameter( Mandatory )]
        [ValidateSet('AzureSqlSource', 'SqlSource', 'DelimitedTextSource')]
        $SourceType,

        # Optional timeout for the source query.
        [Parameter()]
        $SourceQueryTimeout,

        # The SQL writer table-lock switch parameter.
        [Parameter()]
        [switch] $SqlWriterUseTableLock,

        # The activity timeout. Defaults to 12 hours.
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
