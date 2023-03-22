function Export-Pipeline {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        $Pipeline,

        [Parameter( Mandatory )]
        [ValidateScript({ $_.Exists })]
        [System.IO.DirectoryInfo] $PipelinesDirectory
    )

    process {
        $PipelinePath = "$( $PipelinesDirectory.FullName )\$( $Pipeline.name ).json"
        Write-Verbose "Write pipeline file $PipelinePath"
        $json = $Pipeline | ConvertTo-Json -Depth 10
        $json | Out-File -FilePath $PipelinePath -Encoding UTF8
        Write-Output $PipelinePath
    }
}
