function Get-Activity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline,

        [Parameter()]
        [string] $Name
    )

    process {
        $Pipeline.properties.activities | Where-Object { -not $Name -or $_.Name -eq $Name } | Write-Output
    }
}
