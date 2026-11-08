<#
.SYNOPSIS
Adds a column definition to a dataset structure.

.DESCRIPTION
Adds a named column and type to the dataset structure. Alternatively, accepts a SQL DAC model column and maps its data type to an Azure Data Factory type when that source type is supported.

.LINK
https://abbgrade.github.io/PsDataFactory/docs/Add-AdfColumn.html

.LINK
https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01

.EXAMPLE
$dataset | Add-AdfColumn -Name 'CustomerId' -Type 'Int32'
Adds a column definition to the dataset structure.
#>
function Add-Column {

    [CmdletBinding()]
    param (
        # The dataset whose structure is updated.
        [Parameter( Mandatory, ValueFromPipeline )]
        [ValidateNotNullOrEmpty()]
        [PsCustomObject] $Dataset,

        # The column name when using the Properties parameter set.
        [Parameter( Mandatory, Position = 0, ParameterSetName='Properties' )]
        [ValidateNotNullOrEmpty()]
        [string] $Name,

        # The Azure Data Factory column type when using the Properties parameter set.
        [Parameter( Mandatory, Position = 1, ParameterSetName='Properties' )]
        [ValidateNotNullOrEmpty()]
        [string] $Type,

        # A SQL DAC model column to map when using the Column parameter set.
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
