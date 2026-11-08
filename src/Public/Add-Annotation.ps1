<#
.SYNOPSIS
Adds an annotation to a pipeline.

.DESCRIPTION
Appends the supplied annotation to the pipeline's existing annotations.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Add-AdfAnnotation.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.EXAMPLE
$pipeline | Add-AdfAnnotation -Annotation 'Production'
Appends the supplied annotation to the pipeline's annotations.
#>
function Add-Annotation {

    [CmdletBinding()]
    param (
        # The pipeline to update.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline,

        # The annotation to append to the pipeline.
        [Parameter( Mandatory )]
        [ValidateNotNull()]
        [string] $Annotation
    )

    process {
        $Pipeline.properties.annotations += $Annotation
    }
}
