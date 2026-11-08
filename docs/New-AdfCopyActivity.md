---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# New-AdfCopyActivity

## SYNOPSIS
Creates a Copy activity for an Azure Data Factory pipeline.

## SYNTAX

```
New-AdfCopyActivity [-Name] <String> [-Source] <PSObject> [-SourceType] <Object>
 [[-AdditionalSourceColumns] <Object>] [[-SourceQueryTimeout] <Object>] [-Sink] <PSObject> [-SinkType] <Object>
 [[-SinkWriteBehavior] <Object>] [-SqlWriterUseTableLock] [[-Timeout] <Object>] [[-DependsOn] <Object>]
 [[-Translator] <Object>] [[-SinkStagingSettings] <Object>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a Copy activity with the selected source and sink types, dataset references, and optional source, sink, staging, timeout, dependency, and translation settings.
For an Azure Databricks Delta Lake source and Delimited Text sink, staging settings are required.

## EXAMPLES

### EXAMPLE 1
```
New-AdfCopyActivity -Name 'CopyOrders' -Source $source -SourceType AzureSqlSource -Sink $sink -SinkType AzureSqlSink
Creates a Copy activity from an Azure SQL source to an Azure SQL sink.
```

## PARAMETERS

### -Name
The activity name.

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

### -Source
The source dataset reference.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceType
The Copy activity source type.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AdditionalSourceColumns
Optional additional source columns.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceQueryTimeout
Optional timeout for the source query.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sink
The sink dataset reference.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinkType
The Copy activity sink type.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinkWriteBehavior
Optional sink store settings that define how data is written.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SqlWriterUseTableLock
When specified, enables the SQL writer table lock setting.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
The activity timeout.
Defaults to 12 hours.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: 0.12:00:00
Accept pipeline input: False
Accept wildcard characters: False
```

### -DependsOn
The activity dependencies.
Defaults to an empty array.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 10
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### -Translator
Optional column translator configuration.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 11
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinkStagingSettings
Optional staging settings for the sink.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 12
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

### System.Management.Automation.PSCustomObject. The Copy activity definition.
## NOTES

## RELATED LINKS
