<#
.SYNOPSIS
Adds a dependency to a pipeline activity.

.DESCRIPTION
Adds a dependency on a predecessor activity to the specified activity's dependsOn collection. Each dependency can specify one or more conditions.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Add-AdfDependency.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.EXAMPLE
$activity | Add-AdfDependency -OnActivity $predecessorActivity -Condition Succeeded
Adds a dependency that allows the activity to proceed when the predecessor succeeds.
#>
function Add-Dependency {

    [CmdletBinding()]
    param (
        # The pipeline activity to which the dependency will be added.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity,

        # The predecessor activity to add as a dependency.
        [Parameter( Mandatory )]
        [PsCustomObject] $OnActivity,

        # One or more conditions: Succeeded, Failed, Completed, or Skipped.
        [Parameter( Mandatory )]
        [ValidateSet('Succeeded', 'Failed', 'Completed', 'Skipped')]
        [string[]] $Condition

    )

    process {
        if ( -not $Activity.dependsOn ) {
            $Activity.dependsOn = @()
        } else {
            $Activity.dependsOn = @() + $Activity.dependsOn
        }

        $Activity.dependsOn += [PsCustomObject]@{
            activity = $OnActivity.Name
            dependencyConditions = @(
                $Condition
            )
        }
    }
}
