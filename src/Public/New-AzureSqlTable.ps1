function New-AzureSqlTable {

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
        $TableName
    )

    $TypeProperties = [PSCustomObject]@{
        tableName = $TableName
    }

    New-Dataset `
        -Name:$Name `
        -FolderName:$FolderName `
        -Type AzureSqlTable `
        -TypeProperties $TypeProperties `
        -LinkedServiceReference:$LinkedServiceReference `
        -Parameters:$Parameters `
        -SchemaType 'structure'
}
