<#
.SYNOPSIS
Creates a new Azure Data Factory pipeline activity that executes another pipeline.

.DESCRIPTION
Creates and configures an ExecutePipeline activity that invokes another pipeline.

.EXAMPLE
New-AdfPipelineActivity -Name 'ExecuteChildPipeline' -PipelineName 'ChildPipelineName'
Creates an activity that invokes the specified child pipeline.
#>
function New-PipelineActivity {

    [CmdletBinding()]
    param (
        # The name of the pipeline activity.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The name of the pipeline that this activity will execute.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $PipelineName,

        # The timeout duration for the activity. Defaults to 12 hours.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        # The activity dependencies. Defaults to an empty array.
        [Parameter()]
        $DependsOn = @()
    )

    $activity = New-Activity -Name $Name -Type ExecutePipeline -Timeout:$Timeout -DependsOn:$DependsOn

    $activity.typeProperties | Add-Member pipeline ([PSCustomObject] @{
        referenceName = $PipelineName
        type          = 'PipelineReference'
    })

    $activity.typeProperties | Add-Member waitOnCompletion 'true'

    Write-Output $activity

}
