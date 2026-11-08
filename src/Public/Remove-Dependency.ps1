<#
.SYNOPSIS
Removes a dependency from a pipeline activity.

.DESCRIPTION
Removes the dependency on a specified predecessor activity from the given activity's dependsOn collection. If the activity has no remaining dependencies after removal, the dependsOn array is left empty.

.EXAMPLE
$activity | Remove-AdfDependency -OnActivity $predecessorActivity
Removes the dependency on the specified predecessor activity.
#>
function Remove-Dependency {

    [CmdletBinding()]
    param (
        # The pipeline activity from which to remove the dependency.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity,

        # The predecessor activity to remove as a dependency.
        [Parameter( Mandatory )]
        [PsCustomObject] $OnActivity
    )

    process {
        $Activity.dependsOn = $Activity.dependsOn | Where-Object activity -ne $OnActivity.Name
        
        if ( -not $Activity.dependsOn ) {
            $Activity.dependsOn = @()
        }
    }
}
