function Edit-Pipeline {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        $Pipeline,

        [Parameter( Mandatory )]
        [ValidateSet( 'InvertDependencies' )]
        [string] $Operation
    )

    process {
        switch ($Operation) {
            InvertDependencies {
                $Pipeline | Get-Activity | ForEach-Object {
                    $Activity = $_
                    $Activity | Get-Dependency | ForEach-Object {
                        $PredecessorActivity = $Pipeline | Get-Activity -Name $_.Activity
                        $PredecessorActivity | Add-Dependency -OnActivity $Activity -Condition $_.dependencyConditions
                        $Activity | Remove-Dependency -OnActivity $PredecessorActivity
                    }
                }
            }
            Default {
                Write-Error "Invalid Operation $Operation"
            }
        }
    }
}
