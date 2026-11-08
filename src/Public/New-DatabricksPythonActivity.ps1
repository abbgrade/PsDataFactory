<#
.SYNOPSIS
Creates an Azure Databricks Python activity.

.DESCRIPTION
Creates an activity that runs the specified Python file using the supplied Azure Databricks linked service.

.OUTPUTS
System.Management.Automation.PSCustomObject. The activity definition.

.EXAMPLE
New-AdfDatabricksPythonActivity -Name 'RunNotebookScript' -PythonFilePath 'dbfs:/main.py' -LinkedServiceReference $linkedService
Creates an activity that runs the specified Python file.
#>
function New-DatabricksPythonActivity {

    [CmdletBinding()]
    param (
        # The activity name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The activity timeout. Defaults to 12 hours.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        # The path of the Python file to run.
        [Parameter( Mandatory )]
        [string] $PythonFilePath,

        # The Azure Databricks linked service reference.
        [Parameter( Mandatory )]
        [PSCustomObject] $LinkedServiceReference,

        # The activity dependencies. Defaults to an empty array.
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
