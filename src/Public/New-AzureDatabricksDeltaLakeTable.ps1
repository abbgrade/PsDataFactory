<#
.SYNOPSIS
Creates an Azure Databricks Delta Lake dataset definition.

.DESCRIPTION
Creates a dataset for a Delta Lake table, including its schema and table names, linked service reference, parameters, and folder settings.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/New-AdfAzureDatabricksDeltaLakeTable.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. The dataset definition.

.EXAMPLE
New-AdfAzureDatabricksDeltaLakeTable -Name 'Orders' -SchemaName 'sales' -TableName 'Orders'
Creates a dataset definition for the sales.Orders table.
#>
function New-AzureDatabricksDeltaLakeTable {

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

        # The Delta Lake schema name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $SchemaName,

        # The Delta Lake table name.
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
        -Parameters:$Parameters `
        -SchemaType 'schema'
}
