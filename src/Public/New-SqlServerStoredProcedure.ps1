<#
.SYNOPSIS
Creates a SQL Server stored procedure activity.

.DESCRIPTION
Creates an activity that invokes a stored procedure using the supplied linked service. Specify either a literal procedure name or an expression.

.OUTPUTS
System.Management.Automation.PSCustomObject. The stored procedure activity definition.

.EXAMPLE
New-AdfSqlServerStoredProcedure -Name 'RunProcedure' -LinkedServiceReference $linkedService -StoredProcedureName 'dbo.LoadData'
Creates an activity that invokes the specified stored procedure.
#>
function New-SqlServerStoredProcedure {

    [CmdletBinding()]
    param (
        # The activity name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The linked service reference used to connect to SQL Server.
        [Parameter( Mandatory )]
        [PSCustomObject] $LinkedServiceReference,

        # An expression that resolves to the stored procedure name. Used with the Expression parameter set.
        [Parameter( Mandatory, ParameterSetName='Expression' )]
        [string] $StoredProcedureExpression,

        # The literal stored procedure name. Used with the Name parameter set.
        [Parameter( Mandatory, ParameterSetName='Name' )]
        [string] $StoredProcedureName,

        # The activity timeout. Defaults to 12 hours.
        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        # The activity dependencies. Defaults to an empty array.
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
