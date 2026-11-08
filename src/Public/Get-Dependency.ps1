<#
.SYNOPSIS
Retrieves the dependencies of a pipeline activity.

.DESCRIPTION
Returns the dependsOn collection from the specified pipeline activity, which contains all predecessor activities and their associated conditions.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Get-AdfDependency.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.EXAMPLE
$activity | Get-AdfDependency
Returns all dependencies configured for the activity.
#>
function Get-Dependency {

    [CmdletBinding()]
    param (
        # The pipeline activity from which to retrieve dependencies.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity
    )

    process {
        Write-Output $Activity.dependsOn
    }
}
