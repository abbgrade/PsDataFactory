<#
.SYNOPSIS
Creates a delimited text dataset definition.

.DESCRIPTION
Creates a dataset definition for delimited text and configures its location and delimiter, escape, header, and quote settings.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/New-AdfDelimitedTextDataset.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. The dataset definition.

.EXAMPLE
New-AdfDelimitedTextDataset -Name 'InputFile' -Location $location -ColumnDelimiter ',' -EscapeChar '\' -FirstRowAsHeader $true -QuoteChar '"'
Creates a delimited text dataset definition.
#>
function New-DelimitedTextDataset {

    [CmdletBinding()]
    param (
        # The dataset name.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The linked service reference for the dataset.
        [Parameter()]
        [PSCustomObject] $LinkedServiceReference,

        # The dataset parameters. Defaults to an empty object.
        [Parameter()]
        [ValidateNotNull()]
        [PSCustomObject] $Parameters = @{},

        # The optional dataset folder name.
        [Parameter()]
        [string] $FolderName,

        # The location configuration for the delimited text data.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [PSCustomObject] $Location,

        # The character used to separate columns.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $ColumnDelimiter,

        # The escape character.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $EscapeChar,

        # Specifies whether the first row is treated as a header.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [bool] $FirstRowAsHeader,

        # The quote character.
        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $QuoteChar
    )

    $TypeProperties = [PSCustomObject]@{
        location = $Location
        columnDelimiter = $ColumnDelimiter
        escapeChar = $EscapeChar
        firstRowAsHeader = $FirstRowAsHeader
        quoteChar = $QuoteChar
    }

    New-Dataset `
        -Name:$Name `
        -FolderName:$FolderName `
        -Type DelimitedText `
        -TypeProperties $TypeProperties `
        -LinkedServiceReference:$LinkedServiceReference `
        -Parameters:$Parameters `
        -SchemaType 'schema'
}
