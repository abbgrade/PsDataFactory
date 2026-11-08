<#
.SYNOPSIS
Creates a linked service reference.

.DESCRIPTION
Creates a reference object containing the linked service name and reference type, with optional parameters.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/New-AdfLinkedServiceReference.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/linked-services/create-or-update?view=rest-datafactory-2018-06-01

.OUTPUTS
System.Management.Automation.PSCustomObject. The linked service reference.

.EXAMPLE
New-AdfLinkedServiceReference -Name 'StorageLinkedService'
Creates a reference to the specified linked service.
#>
function New-LinkedServiceReference {
    
    [CmdletBinding()]
    param (
        # The linked service name.
        [Parameter( Mandatory )]
        [string] $Name,

        # Optional parameters to include in the reference.
        [Parameter()]
        [PSCustomObject] $Parameters
    )

    $reference = [PSCustomObject]@{
        referenceName = $Name
        type = 'LinkedServiceReference'
    }

    if ( $Parameters ) {
        $reference | Add-Member parameters ($Parameters)
    }

    Write-Output $reference
}
