function New-SqlServerStoredProcedure {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter()]
        [ValidateNotNullOrEmpty()]
        $Timeout = '0.12:00:00',

        [Parameter()]
        $DependsOn = @()
    )

    $activity = New-Activity -Name $Name -Type Copy -Timeout:$Timeout -DependsOn:$DependsOn

    Write-Error 'New-SqlServerStoredProcedure is not implemented'

    Write-Output $activity
}
