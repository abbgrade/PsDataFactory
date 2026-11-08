<#
.SYNOPSIS
Adds a source-to-sink column mapping to a tabular translator.

.DESCRIPTION
Adds an entry to the translator's columnMappings collection, using the supplied source and sink column names.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Add-AdfColumnMapping.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

.EXAMPLE
$translator | Add-AdfColumnMapping -Source 'sourceId' -Sink 'targetId'
Maps the source column to the named sink column.
#>
function Add-ColumnMapping {

    [CmdletBinding()]
    param (
        # The tabular translator to update.
        [Parameter(Mandatory, ValueFromPipeline)]
        [PSCustomObject] $Translator,

        # The source column name.
        [Parameter(Mandatory, Position=0)]
        [string] $Source,

        # The sink column name.
        [Parameter(Mandatory, Position=1)]
        [string] $Sink
    )
    
    process {
        $Translator.columnMappings | Add-Member $Source $Sink
    }
}
