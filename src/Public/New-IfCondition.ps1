function New-IfCondition {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Expression,

        [Parameter()]
        $DependsOn = @()
    )

    $activity = New-Activity -Name $Name -Type IfCondition -DependsOn:$DependsOn

    $activity.typeProperties | Add-Member expression ([PSCustomObject]@{
        value = $Expression
        type = 'Expression'
    })

    Write-Output $activity
}
