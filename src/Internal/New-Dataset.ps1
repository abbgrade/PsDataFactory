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
        [string] $FolderName,

        [Parameter()]
        $Structure,

        [Parameter()]
        $Schema
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

    if ( $Structure ) {
        $dataset.properties | Add-Member struct $Structure
    } elseif ( $Schema ) {
        $dataset.properties | Add-Member schema $Schema
    } else {
        $dataset.properties | Add-Member schema @()
    }

    if ( $FolderName ) {
        $dataset.properties | Add-Member folder ([PsCustomObject]@{
            name = $FolderName
        })
    }

    Write-Output $dataset
}
