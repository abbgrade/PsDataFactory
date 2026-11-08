<#
.SYNOPSIS
Applies a supported edit operation to a pipeline.

.DESCRIPTION
Performs the requested operation on the pipeline. The supported operation, InvertDependencies, reverses the direction of dependencies between activities.

.EXAMPLE
$pipeline | Edit-AdfPipeline -Operation InvertDependencies
Reverses the pipeline's activity dependencies.
#>
function Edit-Pipeline {

    [CmdletBinding()]
    param (
        # The pipeline to edit.
        [Parameter( Mandatory, ValueFromPipeline )]
        $Pipeline,

        # The operation to perform. Currently supported value: InvertDependencies.
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
