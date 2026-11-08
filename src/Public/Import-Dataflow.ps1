function Import-Dataflow {
    <#
    .SYNOPSIS
    Imports a Data Factory data flow definition from a JSON file.

    .DESCRIPTION
    Reads a data flow definition from a JSON file and converts the JSON
    content to PowerShell objects.

    .LINK
    https://abbgrade.github.io/PsDataFactory/docs/Import-AdfDataflow.html

    .LINK
    https://learn.microsoft.com/en-us/rest/api/datafactory/?view=rest-datafactory-2018-06-01

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
