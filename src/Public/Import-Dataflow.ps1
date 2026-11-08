function Import-Dataflow {
    <#
    .SYNOPSIS
    Imports a Data Factory data flow definition from a JSON file.

    .DESCRIPTION
    Reads a JSON file and converts its contents to a PowerShell object.

    .EXAMPLE
    Import-AdfDataflow -DataflowPath .\MyDataflow.json
    Imports the data flow definition from MyDataflow.json.
    #>

    [CmdletBinding()]
    param (
        # The JSON file containing the data flow definition.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateScript({ $_.Exists })]
        [System.IO.FileInfo] $DataflowPath
    )

    process {
        Get-Content -Raw -Path $DataflowPath | ConvertFrom-Json
    }
}
