<#
.SYNOPSIS
Gets the annotations from a pipeline.

.DESCRIPTION
Returns each annotation configured on the pipeline as a separate string output.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Get-AdfAnnotation.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.String. One or more pipeline annotations.

.EXAMPLE
$pipeline | Get-AdfAnnotation
Returns each annotation as a separate string.
#>
function Get-Annotation {

    [CmdletBinding()]
    param (
        # The pipeline from which to retrieve annotations.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline
    )

    process {
        Write-Output $Pipeline.properties.annotations
    }
}
