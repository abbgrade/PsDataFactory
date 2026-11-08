<#
.SYNOPSIS
Adds a parameter definition to a pipeline.

.DESCRIPTION
Adds a parameter with the specified type to the pipeline's parameters collection.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Add-AdfParameter.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.EXAMPLE
$pipeline | Add-AdfParameter -Name 'Environment' -Type 'String'
Adds a String parameter named Environment.
#>
function Add-Parameter {

    [CmdletBinding()]
    param (
        # The pipeline to update.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline,

        # The parameter name.
        [Parameter( Mandatory, Position = 0 )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The parameter type.
        [Parameter( Mandatory, Position = 1 )]
        [ValidateNotNullOrEmpty()]
        [string] $Type
    )

    process {
        $Pipeline.properties.parameters | Add-Member $Name ([PSCustomObject]@{
                type = $Type
            })
    }
}
