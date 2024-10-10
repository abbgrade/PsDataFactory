function New-DelimitedTextDataset {

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
        [PSCustomObject] $Location,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $ColumnDelimiter,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [string] $EscapeChar,

        [Parameter( Mandatory )]
        [ValidateNotNullOrEmpty()]
        [bool] $FirstRowAsHeader,

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
        -Parameters:$Parameters
}
