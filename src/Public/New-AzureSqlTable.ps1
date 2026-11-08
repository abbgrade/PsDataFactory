<#
.SYNOPSIS
Creates an Azure SQL table dataset definition.

.DESCRIPTION
Creates a dataset for an Azure SQL table, including its table name, linked service reference, parameters, and folder settings.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/New-AdfAzureSqlTable.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. The dataset definition.

.EXAMPLE
New-AdfAzureSqlTable -Name 'Customers' -TableName 'dbo.Customers'
Creates a dataset definition for the specified Azure SQL table.
#>
function New-AzureSqlTable {

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

        # The Azure SQL table name.
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
