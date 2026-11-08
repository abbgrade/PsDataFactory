<#
.SYNOPSIS
Adds a variable definition to a pipeline.

.DESCRIPTION
Adds a variable with the specified type to the pipeline's variables collection. If a non-empty default value is provided, it is added to the variable definition.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Add-AdfVariable.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.EXAMPLE
$pipeline | Add-AdfVariable -Name 'RecordCount' -Type 'Int'
Adds an Int variable named RecordCount.
#>
function Add-Variable {

    [CmdletBinding()]
    param (
        # The pipeline to update.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline,

        # The variable name.
        [Parameter( Mandatory, Position = 0 )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The variable type.
        [Parameter( Mandatory, Position = 1 )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        # An optional default value for the variable.
        [Parameter()]
        [string] $DefaultValue
    )

    process {
        $Pipeline.properties.variables | Add-Member $Name ([PSCustomObject]@{
                type = $Type
            })

        if ( $DefaultValue ) {
            $Pipeline.properties.variables.$Name | Add-Member defaultValue $DefaultValue
        }
    }
}
