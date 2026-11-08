<#
.SYNOPSIS
Creates an Azure Data Factory pipeline definition.

.DESCRIPTION
Creates a pipeline object with its name, description, activities, parameters, variables, folder, and generated-pipeline annotation.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/New-AdfPipeline.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. The pipeline definition.

.EXAMPLE
New-AdfPipeline -Name 'DailyLoad' -Description 'Loads daily data'
Creates a pipeline definition with the specified name and description.
#>
function New-Pipeline {

    [CmdletBinding()]
    param (
        # The pipeline name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The optional pipeline description.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        [string] $Description,

        # The activities to include in the pipeline. Defaults to an empty array.
        [Parameter()]
        [ValidateNotNull()]
        [PsCustomObject[]] $Activities = @(),

        # The pipeline parameters. Defaults to an empty object.
        [Parameter()]
        [ValidateNotNull()]
        [PsCustomObject] $Parameters = @{},

        # The pipeline variables. Defaults to an empty object.
        [Parameter()]
        [ValidateNotNull()]
        [PsCustomObject] $Variables = @{},

        # The optional pipeline folder name.
        [Parameter()]
        [string] $FolderName
    )

    $pipeline = [PsCustomObject] @{
        name = $Name
        properties = [PsCustomObject]@{
            description = $Description
            activities = $Activities
            parameters = $Parameters
            variables = $Variables
            folder = [PsCustomObject]@{
                name = $FolderName
            }
            annotations = @(
                'THIS IS A GENERATED PIPELINE. CHANGES MAY BE OVERWRITTEN!'
            )
        }
    }

    Write-Output $pipeline
}
