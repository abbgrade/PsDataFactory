---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# Add-AdfColumn

## SYNOPSIS
Adds a column definition to a dataset structure.

## SYNTAX

### Properties
```
Add-AdfColumn -Dataset <PSObject> [-Name] <String> [-Type] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

### Column
```
Add-AdfColumn -Dataset <PSObject> [-Column] <TSqlObject> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Adds a named column and type to the dataset structure.
Alternatively, accepts a SQL DAC model column and maps its data type to an Azure Data Factory type when that source type is supported.

## EXAMPLES

### EXAMPLE 1
```
$dataset | Add-AdfColumn -Name 'CustomerId' -Type 'Int32'
Adds a column definition to the dataset structure.
```

## PARAMETERS

### -Dataset
The dataset whose structure is updated.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
The column name when using the Properties parameter set.

```yaml
Type: String
Parameter Sets: Properties
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
The Azure Data Factory column type when using the Properties parameter set.

```yaml
Type: String
Parameter Sets: Properties
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Column
A SQL DAC model column to map when using the Column parameter set.

```yaml
Type: TSqlObject
Parameter Sets: Column
Aliases:

Required: True
Position: 1
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

## NOTES

## RELATED LINKS
