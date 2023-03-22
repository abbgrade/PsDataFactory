function Add-Variable {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Pipeline,

        [Parameter( Mandatory, Position = 0 )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory, Position = 1 )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        [Parameter()]
        [string] $DefaultValue
    )

    process {
        $Pipeline.properties.variables | Add-Member $Name ([PSCustomObject]@{
                type = $Type
            })

        if ( $DefaultValue ) {
            $Pipeline.properties.variables.$Name | Add-Member defaultValue $DefaultValue
        }
    }
}
