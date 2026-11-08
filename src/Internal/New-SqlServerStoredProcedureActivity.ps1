<#
.SYNOPSIS
Creates the base representation for a SQL Server stored procedure activity.

.DESCRIPTION
Constructs a SQL Server stored procedure activity object with its standard execution policy, empty dependencies, and user properties.

.OUTPUTS
System.Management.Automation.PSCustomObject. The activity representation.
#>
function New-SqlServerStoredProcedureActivity {

    [CmdletBinding()]
    param (
        # The name assigned to the activity.
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
