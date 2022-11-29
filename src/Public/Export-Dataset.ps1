function Export-Dataset {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        $Dataset,

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
