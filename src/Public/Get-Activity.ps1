<#
.SYNOPSIS
Gets activities from a pipeline.

.DESCRIPTION
Returns all activities in the pipeline, or only the activity whose name matches the supplied name.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Get-AdfActivity.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. One or more pipeline activities.

.EXAMPLE
$pipeline | Get-AdfActivity -Name 'CopyToArchive'
Returns the named activity from the pipeline.
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
        [string] $Name
    )

    process {
        $Pipeline.properties.activities | Where-Object { -not $Name -or $_.Name -eq $Name } | Write-Output
    }
}
