---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# Add-AdfActivity

## SYNOPSIS
Adds an activity to a pipeline.

## SYNTAX

```
Add-AdfActivity -Pipeline <PSObject> [-Activity] <PSObject> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Appends the supplied activity to the pipeline's activities collection.
The pipeline can be supplied through the pipeline input.

## EXAMPLES

### EXAMPLE 1
```
$pipeline | Add-AdfActivity -Activity $activity
Adds the activity to the pipeline.
```

## PARAMETERS

### -Pipeline
The pipeline to update.

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

### -Activity
The activity to append to the pipeline.

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
