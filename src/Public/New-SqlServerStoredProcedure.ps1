function New-SqlServerStoredProcedure {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [PSCustomObject] $LinkedServiceReference,

        [Parameter( Mandatory )]
        [string] $StoredProcedureExpression,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        [Parameter()]
        $DependsOn = @()
    )

    $activity = New-Activity -Name $Name -Type SqlServerStoredProcedure -Timeout:$Timeout -DependsOn:$DependsOn

    $activity.typeProperties | Add-Member storedProcedureName ([PSCustomObject] @{
        value = $StoredProcedureExpression
        type = 'Expression'
    })

    $activity | Add-Member linkedServiceName $LinkedServiceReference

    Write-Output $activity
}
