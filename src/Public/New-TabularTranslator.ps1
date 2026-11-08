<#
.SYNOPSIS
Creates an empty tabular translator.

.DESCRIPTION
Returns a translator object with type TabularTranslator and an empty columnMappings collection.

.OUTPUTS
System.Management.Automation.PSCustomObject. The tabular translator.

.EXAMPLE
$translator = New-AdfTabularTranslator
Creates an empty tabular translator for subsequent column mappings.
#>
function New-TabularTranslator {
    
    [CmdletBinding()]
    param ()

    [PSCustomObject]@{
        type = 'TabularTranslator'
        columnMappings = [PSCustomObject]@{}
    }
}
