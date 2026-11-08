<#
.SYNOPSIS
Creates an If Condition activity.

.DESCRIPTION
Creates an If Condition activity with the specified expression and optional dependencies.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/New-AdfIfCondition.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. The If Condition activity definition.

.EXAMPLE
New-AdfIfCondition -Name 'IsReady' -Expression '@equals(variables(''ready''), true)'
Creates an If Condition activity with the specified expression.
#>
function New-IfCondition {

    [CmdletBinding()]
    param (
        # The activity name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The expression evaluated by the If Condition activity.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Expression,

        # The activity dependencies. Defaults to an empty array.
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
