<#
.SYNOPSIS
Creates the common Azure Data Factory dataset representation.

.DESCRIPTION
Builds a dataset object with the supplied linked service, parameters, dataset type, and type-specific properties. Optionally adds an empty schema or structure collection and a folder name.

.OUTPUTS
System.Management.Automation.PSCustomObject. The dataset representation.
#>
function New-Dataset {

    [CmdletBinding()]
    param (
        # The name assigned to the dataset.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The linked service reference associated with the dataset.
        [Parameter( Mandatory )]
        [PSCustomObject] $LinkedServiceReference,

        # The Azure Data Factory dataset type.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        # The properties specific to the dataset type.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $TypeProperties,

        # The dataset parameters. Defaults to an empty object.
        [Parameter()]
        [ValidateNotNull()]
        [PSCustomObject] $Parameters = @{},

        # The optional name of the dataset folder.
        [Parameter()]
        [string] $FolderName,

        # The optional schema collection to add. Valid values are structure and schema.
        [Parameter()]
        [ValidateSet('structure', 'schema')]
        [string] $SchemaType
    )

    $dataset = [PsCustomObject] @{
        name = $Name
        properties = [PsCustomObject]@{
            linkedServiceName = $LinkedServiceReference
            parameters = $Parameters
            annotations = @(
                'THIS IS A GENERATED DATASET. CHANGES MAY BE OVERWRITTEN!'
            )
            type = $Type
            typeProperties = $TypeProperties
        }
        type = 'Microsoft.DataFactory/factories/datasets'
    }

    if ( $SchemaType ) {
        $dataset.properties | Add-Member $SchemaType @()
    }

    if ( $FolderName ) {
        $dataset.properties | Add-Member folder ([PsCustomObject]@{
            name = $FolderName
        })
    }

    Write-Output $dataset
}
