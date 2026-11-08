---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/New-AdfAzureSqlTable.html
schema: 2.0.0
---

# New-AdfAzureSqlTable

## SYNOPSIS
Creates an Azure SQL table dataset definition.

## SYNTAX

```
New-AdfAzureSqlTable [-Name] <String> [[-LinkedServiceReference] <PSObject>] [[-Parameters] <PSObject>]
 [[-FolderName] <String>] [-TableName] <Object> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a dataset for an Azure SQL table, including its table name, linked service reference, parameters, and folder settings.

## EXAMPLES

### EXAMPLE 1
```
New-AdfAzureSqlTable -Name 'Customers' -TableName 'dbo.Customers'
Creates a dataset definition for the specified Azure SQL table.
```

## PARAMETERS

### -Name
The dataset name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkedServiceReference
The linked service reference associated with the dataset.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parameters
The dataset parameters.
Defaults to an empty object.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -FolderName
The optional dataset folder name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TableName
The Azure SQL table name.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### System.Management.Automation.PSCustomObject. The dataset definition.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/New-AdfAzureSqlTable.html](https://abbgrade.github.io/PsDataFactory/docs/New-AdfAzureSqlTable.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01)

