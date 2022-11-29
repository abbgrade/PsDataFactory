function New-Activity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        [Parameter()]
        $Timeout,

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
