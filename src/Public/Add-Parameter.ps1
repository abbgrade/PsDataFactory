<#
.SYNOPSIS
Adds a parameter definition to a pipeline.

.DESCRIPTION
Adds a parameter with the specified type to the pipeline's parameters collection.

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
