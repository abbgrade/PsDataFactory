function New-SqlServerStoredProcedureActivity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [string] $Name
    )

    $activity = [PSCustomObject]@{
        name = $Name
        type = 'SqlServerStoredProcedure'
        dependsOn = @()
        policy = [PsCustomObject]@{
            timeout = '0.12:00:00'
            retry = 3
            retryIntervalInSeconds = 30
            secureOutput = $false
            secureInput = $false
        }
        userProperties = @()
        typeProperties = [PsCustomObject]@{
            storedProcedureName = $procedure.FullName
        }
    }

    Write-Output $activity
}
