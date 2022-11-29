function New-Pipeline {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Description,

        [Parameter()]
        [ValidateNotNull()]
        [PsCustomObject[]] $Activities = @(),

        [Parameter()]
        [ValidateNotNull()]
        [PsCustomObject] $Parameters = @{},

        [Parameter()]
        [ValidateNotNull()]
        [PsCustomObject] $Variables = @{},

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
