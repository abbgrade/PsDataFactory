<#
.SYNOPSIS
Adds an activity to the false branch of an If Condition activity.

.DESCRIPTION
Appends the supplied activity to the If Condition activity's ifFalseActivities collection.

.EXAMPLE
$ifCondition | Add-AdfIsFalseActivity -Activity $fallbackActivity
Adds the activity to the false branch.
#>
function Add-IsFalseActivity {

    [CmdletBinding()]
    param (
        # The If Condition activity to update.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $IfCondition,

        # The activity to add to the false branch.
        [Parameter( Mandatory, Position = 0 )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity
    )

    process {
        $IfCondition.typeProperties | Add-Member ifFalseActivities @() -ErrorAction SilentlyContinue
        $IfCondition.typeProperties.ifFalseActivities += $Activity
    }
}
