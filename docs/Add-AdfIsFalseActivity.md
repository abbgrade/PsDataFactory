---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# Add-AdfIsFalseActivity

## SYNOPSIS
Adds an activity to the false branch of an If Condition activity.

## SYNTAX

```
Add-AdfIsFalseActivity -IfCondition <PSObject> [-Activity] <PSObject> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Appends the supplied activity to the If Condition activity's ifFalseActivities collection.

## EXAMPLES

### EXAMPLE 1
```
$ifCondition | Add-AdfIsFalseActivity -Activity $fallbackActivity
Adds the activity to the false branch.
```

## PARAMETERS

### -IfCondition
The If Condition activity to update.

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
The activity to add to the false branch.

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
