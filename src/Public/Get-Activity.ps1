function Get-Activity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline
    )

    process {
        Write-Output $Pipeline.properties.activities
    }
}
