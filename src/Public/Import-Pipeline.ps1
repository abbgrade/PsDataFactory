<#
.SYNOPSIS
Imports a pipeline from a JSON file.

.DESCRIPTION
Reads the specified pipeline JSON file and converts its contents to a PowerShell object.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Import-AdfPipeline.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

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
