function Add-ColumnMapping {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory, ValueFromPipeline)]
        [PSCustomObject] $Translator,

        [Parameter(Mandatory, Position=0)]
        [string] $Source,

        [Parameter(Mandatory, Position=1)]
        [string] $Sink
    )
    process {
        $Translator.columnMappings | Add-Member $Source $Sink
    }
}
