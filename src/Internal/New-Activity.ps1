<#
.SYNOPSIS
Creates the common base representation for an Azure Data Factory pipeline activity.

.DESCRIPTION
Builds an activity object with its name, type, dependencies, and standard userProperties and typeProperties collections. When a timeout is supplied, adds the default retry and security policy values alongside that timeout.

.OUTPUTS
System.Management.Automation.PSCustomObject. The activity representation.
#>
function New-Activity {

    [CmdletBinding()]
    param (
        # The name assigned to the activity.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The Azure Data Factory activity type.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        # The activity timeout. When omitted or empty, no policy object is added.
        [Parameter()]
        $Timeout,

        # The activity dependencies. Defaults to an empty array.
        [Parameter()]
        $DependsOn = @()
    )

    $activity = [PsCustomObject]@{
        name = $Name
        type = $Type
        dependsOn = $DependsOn
    }

    if ( $Timeout ) {
        $activity | Add-Member policy ([PsCustomObject]@{
            timeout = $Timeout
            retry = 3
            retryIntervalInSeconds = 30
            secureOutput = $false
            secureInput = $false
        })
    }

    $activity | Add-Member userProperties @()
    $activity | Add-Member typeProperties (New-Object PSCustomObject)

    Write-Output $activity
}
