function Get-Dependency {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity
    )

    process {
        Write-Output $Activity.dependsOn
    }
}
