function New-Dataset {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [PSCustomObject] $LinkedServiceReference,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $TypeProperties,

        [Parameter()]
        [ValidateNotNull()]
        [PSCustomObject] $Parameters = @{},

        [Parameter()]
        [string] $FolderName
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
            structure = @()
            typeProperties = $TypeProperties
            schema = @()
        }
        type = 'Microsoft.DataFactory/factories/datasets'
    }

    if ( $FolderName ) {
        $dataset.properties | Add-Member folder ([PsCustomObject]@{
            name = $FolderName
        })
    }

    Write-Output $dataset
}
