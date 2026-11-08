function Import-Dataflow {
    <#
    .SYNOPSIS
    Imports a Data Factory data flow definition from a JSON file.

    .DESCRIPTION
    Reads a data flow definition from a JSON file and converts the JSON
    content to PowerShell objects.

    .EXAMPLE
    Import-AdfDataflow -DataflowPath .\MyDataflow.json
    Imports the data flow definition from MyDataflow.json.

    .OUTPUTS
    System.Object
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
