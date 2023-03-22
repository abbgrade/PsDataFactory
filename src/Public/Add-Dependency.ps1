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
        $Activity.dependsOn += [PsCustomObject]@{
            activity = $OnActivity.Name
            dependencyConditions = @(
                $Condition
            )
        }
    }
}
