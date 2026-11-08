<#
.SYNOPSIS
Creates a SQL Server table dataset definition.

.DESCRIPTION
Creates a dataset for a SQL Server table, including its table name, linked service reference, parameters, and folder settings.

.OUTPUTS
System.Management.Automation.PSCustomObject. The dataset definition.

.EXAMPLE
New-AdfSqlServerTable -Name 'Customers' -TableName 'dbo.Customers'
Creates a dataset definition for the specified SQL Server table.
#>
function New-SqlServerTable {

    [CmdletBinding()]
    param (
        # The dataset name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The linked service reference associated with the dataset.
        [Parameter()]
        [PSCustomObject] $LinkedServiceReference,

        # The dataset parameters. Defaults to an empty object.
        [Parameter()]
        [ValidateNotNull()]
        [PSCustomObject] $Parameters = @{},

        # The optional dataset folder name.
        [Parameter()]
        [string] $FolderName,

        # The SQL Server table name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $TableName
    )

    $TypeProperties = [PSCustomObject]@{
        tableName = $TableName
    }

    New-Dataset `
        -Name:$Name `
        -FolderName:$FolderName `
        -Type SqlServerTable `
        -TypeProperties $TypeProperties `
        -LinkedServiceReference:$LinkedServiceReference `
        -Parameters:$Parameters `
        -SchemaType 'structure'
}
