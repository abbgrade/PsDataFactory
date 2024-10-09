function New-PipelineActivity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [string] $PipelineName,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

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