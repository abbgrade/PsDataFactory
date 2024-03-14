function New-SqlServerStoredProcedure {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory )]
        [PSCustomObject] $LinkedServiceReference,

        [Parameter( Mandatory, ParameterSetName='Expression' )]
        [string] $StoredProcedureExpression,

        [Parameter( Mandatory, ParameterSetName='Name' )]
        [string] $StoredProcedureName,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        [Parameter()]
        $DependsOn = @()
    )

    $activity = New-Activity -Name $Name -Type SqlServerStoredProcedure -Timeout:$Timeout -DependsOn:$DependsOn

    switch ($PSCmdlet.ParameterSetName) {
        Name {
            $activity.typeProperties | Add-Member storedProcedureName $StoredProcedureName
        }
        Expression {
            $activity.typeProperties | Add-Member storedProcedureName ([PSCustomObject] @{
                value = $StoredProcedureExpression
                type = 'Expression'
            })
        }
        Default {
            Write-Error "Unsupported ParameterSet $_"
        }
    }

    $activity | Add-Member linkedServiceName $LinkedServiceReference

    Write-Output $activity
}
