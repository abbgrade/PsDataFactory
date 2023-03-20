function New-TabularTranslator {
    
    [CmdletBinding()]
    param ()

    [PSCustomObject]@{
        type = 'TabularTranslator'
        columnMappings = [PSCustomObject]@{}
    }
}
