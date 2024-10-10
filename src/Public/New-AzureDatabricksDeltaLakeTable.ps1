function New-AzureDatabricksDeltaLakeTable {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter()]
        [PSCustomObject] $LinkedServiceReference,

        [Parameter()]
        [ValidateNotNull()]
        [PSCustomObject] $Parameters = @{},

        [Parameter()]
        [string] $FolderName,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $SchemaName,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $TableName
    )

    $TypeProperties = [PSCustomObject]@{
        database = $SchemaName
        table = $TableName
    }

    New-Dataset `
        -Name:$Name `
        -FolderName:$FolderName `
        -Type AzureDatabricksDeltaLakeDataset `
        -TypeProperties $TypeProperties `
        -LinkedServiceReference:$LinkedServiceReference `
        -Parameters:$Parameters
}
