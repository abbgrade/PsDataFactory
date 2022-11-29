function New-LinkedServiceReference {
    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [string] $Name,

        [Parameter()]
        [PSCustomObject] $Parameters
    )

    $reference = [PSCustomObject]@{
        referenceName = $Name
        type = 'LinkedServiceReference'
    }

    if ( $Parameters ) {
        $reference | Add-Member parameters ($Parameters)
    }
    Write-Output $reference
}
