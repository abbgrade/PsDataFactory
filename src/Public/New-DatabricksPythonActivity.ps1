function New-DatabricksPythonActivity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        [Parameter( Mandatory )]
        [string] $PythonFilePath,

        [Parameter( Mandatory )]
        [PSCustomObject] $LinkedServiceReference,

        [Parameter()]
        $DependsOn = @()

    )

    $activity = New-Activity -Name $Name -Type DatabricksSparkPython -Timeout:$Timeout -DependsOn:$DependsOn

    $activity.typeProperties = ([PSCustomObject] @{
        pythonFile = $PythonFilePath
        parameters = @()
    })

    $activity | Add-Member linkedServiceName $LinkedServiceReference

    Write-Output $activity
}
