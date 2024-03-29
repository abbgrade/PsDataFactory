---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# New-AdfCopyActivity

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

```
New-AdfCopyActivity [-Name] <String> [-Source] <PSObject> [-SourceType] <Object>
 [[-SourceQueryTimeout] <Object>] [-Sink] <PSObject> [-SinkType] <Object> [[-SinkWriteBehavior] <Object>]
 [-SqlWriterUseTableLock] [[-Timeout] <Object>] [[-DependsOn] <Object>] [[-Translator] <Object>]
 [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -DependsOn
{{ Fill DependsOn Description }}

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

### -Name
{{ Fill Name Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Sink
{{ Fill Sink Description }}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinkType
{{ Fill SinkType Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: AzureSqlSink, SqlSink, DelimitedTextSource

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SinkWriteBehavior
{{ Fill SinkWriteBehavior Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Source
{{ Fill Source Description }}

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceQueryTimeout
{{ Fill SourceQueryTimeout Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SourceType
{{ Fill SourceType Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:
Accepted values: AzureSqlSource, SqlSource, DelimitedTextSource

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SqlWriterUseTableLock
{{ Fill SqlWriterUseTableLock Description }}

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Timeout
{{ Fill Timeout Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Translator
{{ Fill Translator Description }}

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 9
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
