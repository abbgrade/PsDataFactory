function Add-IsFalseActivity {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $IfCondition,

        [Parameter( Mandatory, Position = 0 )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Activity
    )

    process {
        $IfCondition.typeProperties | Add-Member ifFalseActivities @() -ErrorAction SilentlyContinue
        $IfCondition.typeProperties.ifFalseActivities += $Activity
    }
}
