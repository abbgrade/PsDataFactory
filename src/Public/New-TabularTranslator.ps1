<#
.SYNOPSIS
Creates an empty tabular translator.

.DESCRIPTION
Returns a translator object with type TabularTranslator and an empty columnMappings collection.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/New-AdfTabularTranslator.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01

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
