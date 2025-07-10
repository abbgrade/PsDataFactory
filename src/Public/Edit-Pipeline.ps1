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
                
                # select all dependencies
                $dependencies = $Pipeline | Get-Activity | ForEach-Object {
                    $Activity = $_
                    $Activity | Get-Dependency | ForEach-Object {
                        @{
                            Activity = $Activity
                            PredecessorActivity = ( $Pipeline | Get-Activity -Name $_.Activity )
                            DependencyConditions = $_.dependencyConditions
                        }
                    }
                }

                # replace dependencies
                $dependencies | ForEach-Object {
                    $_.Activity | Remove-Dependency -OnActivity $_.PredecessorActivity
                    $_.PredecessorActivity | Add-Dependency -OnActivity $_.Activity -Condition $_.DependencyConditions
                }
            }
            Default {
                Write-Error "Invalid Operation $Operation"
            }
        }
    }
}
