function Import-Pipeline {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateScript({ $_.Exists })]
        [System.IO.FileInfo] $PipelinePath
    )

    process {
        Get-Content -Raw -Path $PipelinePath | ConvertFrom-Json
    }
}
