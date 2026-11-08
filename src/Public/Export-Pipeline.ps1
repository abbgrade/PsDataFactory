<#
.SYNOPSIS
Exports a pipeline as a JSON file.

.DESCRIPTION
Serializes the pipeline to JSON and writes it to a file named after the pipeline in the existing destination directory. Outputs the resulting file path.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Export-AdfPipeline.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.IO.FileInfo. The path of the exported pipeline file.

.EXAMPLE
$pipeline | Export-AdfPipeline -PipelinesDirectory (Get-Item .\pipelines)
Writes the pipeline JSON file to the pipelines directory.
#>
function Export-Pipeline {

    [CmdletBinding()]
    param (
        # The pipeline to serialize.
        [Parameter( Mandatory, ValueFromPipeline )]
        $Pipeline,

        # The existing directory in which to write the pipeline JSON file.
        [Parameter( Mandatory )]
        [ValidateScript({ $_.Exists })]
        [System.IO.DirectoryInfo] $PipelinesDirectory
    )

    process {
        [System.IO.FileInfo] $PipelinePath = Join-Path $PipelinesDirectory.FullName "$( $Pipeline.name ).json"
        Write-Verbose "Write pipeline file $PipelinePath"
        $json = $Pipeline | ConvertTo-Json -Depth 10
        $json | Out-File -FilePath $PipelinePath -Encoding UTF8
        Write-Output $PipelinePath
    }
}
