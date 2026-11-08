<#
.SYNOPSIS
Adds an activity to a pipeline.

.DESCRIPTION
Appends the supplied activity to the pipeline's activities collection. The pipeline can be supplied through the pipeline input.

.EXAMPLE
$pipeline | Add-AdfActivity -Activity $activity
Adds the activity to the pipeline.
#>
function Add-Activity {

    [CmdletBinding()]
    param (
        # The pipeline to update.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline,

        # The activity to append to the pipeline.
        [Parameter( Mandatory, Position = 0 )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity
    )

    process {
        $Pipeline.properties.activities += $Activity
    }
}
