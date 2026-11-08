---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# Remove-AdfDependency

## SYNOPSIS
Removes a dependency from a pipeline activity.

## SYNTAX

```
Remove-AdfDependency [-Activity] <PSObject> [-OnActivity] <PSObject> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Removes the dependency on a specified predecessor activity from the given activity's dependsOn collection.
If the activity has no remaining dependencies after removal, the dependsOn array is left empty.

## EXAMPLES

### EXAMPLE 1
```
$activity | Remove-AdfDependency -OnActivity $predecessorActivity
Removes the dependency on the specified predecessor activity.
```

## PARAMETERS

### -Activity
The pipeline activity from which to remove the dependency.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -OnActivity
The predecessor activity to remove as a dependency.

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
