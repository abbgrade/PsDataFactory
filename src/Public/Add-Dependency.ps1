function Add-Dependency {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity,

        [Parameter( Mandatory )]
        $OnActivity,

        [Parameter( Mandatory )]
        $Condition

    )

    process {
        if ( -not $Activity.dependsOn ) {
            $Activity.dependsOn = @()
        } else {
            $Activity.dependsOn = @() + $Activity.dependsOn
        }

        $Activity.dependsOn += [PsCustomObject]@{
            activity = $OnActivity.Name
            dependencyConditions = @(
                $Condition
            )
        }
    }
}
