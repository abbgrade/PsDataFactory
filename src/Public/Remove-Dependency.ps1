function Remove-Dependency {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity,

        [Parameter( Mandatory )]
        $OnActivity        
    )

    process {
        $Activity.dependsOn = $Activity.dependsOn | Where-Object activity -ne $OnActivity.Name
        if ( -not $Activity.dependsOn ) {
            $Activity.dependsOn = @()
        }
    }
}
