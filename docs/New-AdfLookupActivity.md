---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/New-AdfLookupActivity.html
schema: 2.0.0
---

# New-AdfLookupActivity

## SYNOPSIS
Creates a Lookup activity.

## SYNTAX

```
New-AdfLookupActivity [-Name] <String> [-Source] <PSObject> [-SourceType] <Object>
 [[-SourceQueryTimeout] <Object>] [-SqlWriterUseTableLock] [[-Timeout] <Object>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a Lookup activity that reads from the supplied dataset using one of the supported source types.

## EXAMPLES

### EXAMPLE 1
```
New-AdfLookupActivity -Name 'FindOrder' -Source $dataset -SourceType AzureSqlSource
Creates a Lookup activity for an Azure SQL source.
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
The dataset reference used by the activity.

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
The Lookup source type.

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

### -SourceQueryTimeout
Optional timeout for the source query.

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

### -SqlWriterUseTableLock
The SQL writer table-lock switch parameter.

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
Position: 5
Default value: 0.12:00:00
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

### System.Management.Automation.PSCustomObject. The Lookup activity definition.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/New-AdfLookupActivity.html](https://abbgrade.github.io/PsDataFactory/docs/New-AdfLookupActivity.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

