<#
.SYNOPSIS
Adds a dependency to a pipeline activity.

.DESCRIPTION
Adds a dependency on a predecessor activity to the specified activity's dependsOn collection. Multiple dependencies can be added to the same activity, each with its own condition (Succeeded, Failed, Completed, or Skipped).

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

        # The condition under which the activity should proceed. Valid values are Succeeded, Failed, Completed, and Skipped.
        [Parameter( Mandatory )]
        [ValidateSet('Succeeded', 'Failed', 'Completed', 'Skipped')]
        [string] $Condition

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
