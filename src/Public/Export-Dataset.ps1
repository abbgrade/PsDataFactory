<#
.SYNOPSIS
Exports a dataset as a JSON file.

.DESCRIPTION
Serializes the dataset to JSON and writes it to a file named after the dataset in the existing destination directory. Outputs the resulting file path.

.OUTPUTS
System.IO.FileInfo. The path of the exported dataset file.

.EXAMPLE
$dataset | Export-AdfDataset -DatasetsDirectory (Get-Item .\datasets)
Writes the dataset JSON file to the datasets directory.
#>
function Export-Dataset {

    [CmdletBinding()]
    param (
        # The dataset to serialize.
        [Parameter( Mandatory, ValueFromPipeline )]
        $Dataset,

        # The existing directory in which to write the dataset JSON file.
        [Parameter( Mandatory )]
        [ValidateScript({ $_.Exists })]
        [System.IO.DirectoryInfo] $DatasetsDirectory
    )

    process {
        [System.IO.FileInfo] $DatasetPath = Join-Path $DatasetsDirectory "$( $Dataset.name ).json"
        Write-Verbose "Write dataset file $DatasetPath"
        $json = $Dataset | ConvertTo-Json -Depth 10
        $json | Out-File -FilePath $DatasetPath -Encoding UTF8
        Write-Output $DatasetPath
    }
}
