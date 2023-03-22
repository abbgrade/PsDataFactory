function Add-Column {

    [CmdletBinding()]
    param (
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Dataset,

        [Parameter( Mandatory, Position = 0, ParameterSetName='Properties' )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        [Parameter( Mandatory, Position = 1, ParameterSetName='Properties' )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        [Parameter( Mandatory, Position = 0, ParameterSetName='Column' )]
        [Microsoft.SqlServer.Dac.Model.TSqlObject] $Column
    )

    process {
        switch ( $PSCmdlet.ParameterSetName ) {
            Properties {
                $Dataset.properties.structure += [PSCustomObject]@{
                    name = $Name
                    type = $Type
                }
            }
            Column {
                $DataType = $Column | Get-DacDataType

                [string] $Type = switch ($DataType.Name) {
                    int {
                        'Int32'
                    }
                    smallint {
                        'Int16'
                    }
                    bigint {
                        'Int64'
                    }
                    tinyint {
                        'Int16'
                    }
                    varchar {
                        'String'
                    }
                    nvarchar {
                        'String'
                    }
                    char {
                        'String'
                    }
                    bit {
                        'Boolean'
                    }
                    uniqueidentifier {
                        'Guid'
                    }
                    float {
                        'Double'
                    }
                    datetime {
                        'DateTime'
                    }
                    Default {
                        Write-Error "$_ is not supported."
                    }
                }

                if ($Type) {
                    $Dataset | Add-Column -Name $Column.Name.Parts[2] -Type $Type
                }
            }
            Default {
                Write-Error "$_ is not supported."
            }
        }
    }
}
