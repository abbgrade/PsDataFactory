<#
.SYNOPSIS
Gets activities from a pipeline.

.DESCRIPTION
Returns all activities in the pipeline, or only the activity whose name matches the supplied name. Use Recurse to include activities nested in If Condition branches.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Get-AdfActivity.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. One or more pipeline activities.

.EXAMPLE
$pipeline = New-AdfPipeline -Name 'MyPipeline'
$ifCondition = New-AdfIfCondition -Name 'IsReady' -Expression '1=1'
$activity = New-AdfPipelineActivity -Name 'CopyToArchive' -PipelineName 'ArchivePipeline'
$ifCondition.typeProperties | Add-Member -NotePropertyName ifTrueActivities -NotePropertyValue @($activity)
$pipeline | Add-AdfActivity -Activity $ifCondition
$pipeline | Get-AdfActivity -Recurse
Returns both the If Condition and its nested CopyToArchive activity.
#>
function Get-Activity {

    [CmdletBinding()]
    param (
        # The pipeline from which to retrieve activities.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline,

        # An optional activity name used to filter the results.
        [Parameter()]
        [string] $Name,

        # Include activities nested in If Condition branches.
        [Parameter()]
        [switch] $Recurse
    )

    process {
        $activitiesToVisit = [System.Collections.Generic.Stack[object]]::new()
        $activities = @($Pipeline.properties.activities)
        for ($index = $activities.Count - 1; $index -ge 0; $index--) {
            $activitiesToVisit.Push($activities[$index])
        }

        while ($activitiesToVisit.Count -gt 0) {
            $activity = $activitiesToVisit.Pop()
            if (-not $Name -or $activity.Name -eq $Name) {
                Write-Output $activity
            }

            if ($Recurse -and $activity.type -eq 'IfCondition') {
                $nestedActivities = @(
                    $activity.typeProperties.ifTrueActivities
                    $activity.typeProperties.ifFalseActivities
                ) | Where-Object { $null -ne $_ }

                for ($index = $nestedActivities.Count - 1; $index -ge 0; $index--) {
                    $activitiesToVisit.Push($nestedActivities[$index])
                }
            }
        }
    }
}
