---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# New-AdfAzureDatabricksDeltaLakeTable

## SYNOPSIS
Creates an Azure Databricks Delta Lake dataset definition.

## SYNTAX

```
New-AdfAzureDatabricksDeltaLakeTable [-Name] <String> [[-LinkedServiceReference] <PSObject>]
 [[-Parameters] <PSObject>] [[-FolderName] <String>] [-SchemaName] <String> [-TableName] <String>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a dataset for a Delta Lake table, including its schema and table names, linked service reference, parameters, and folder settings.

## EXAMPLES

### EXAMPLE 1
```
New-AdfAzureDatabricksDeltaLakeTable -Name 'Orders' -SchemaName 'sales' -TableName 'Orders'
Creates a dataset definition for the sales.Orders table.
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

### -SchemaName
The Delta Lake schema name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -TableName
The Delta Lake table name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
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
