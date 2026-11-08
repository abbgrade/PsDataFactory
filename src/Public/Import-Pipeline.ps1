<#
.SYNOPSIS
Imports a pipeline from a JSON file.

.DESCRIPTION
Reads the specified pipeline JSON file and converts its contents to a PowerShell object.

.OUTPUTS
System.Management.Automation.PSCustomObject. The imported pipeline object.

.EXAMPLE
Import-AdfPipeline -PipelinePath (Get-Item .\MyPipeline.json)
Reads the pipeline from the specified JSON file.
#>
function Import-Pipeline {

    [CmdletBinding()]
    param (
        # The existing pipeline JSON file to import. The path can be supplied through pipeline input.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateScript({ $_.Exists })]
        [System.IO.FileInfo] $PipelinePath
    )

    process {
        Get-Content -Raw -Path $PipelinePath | ConvertFrom-Json
    }
}
