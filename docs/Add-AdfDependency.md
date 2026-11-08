---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Add-AdfDependency.html
schema: 2.0.0
---

# Add-AdfDependency

## SYNOPSIS
Adds a dependency to a pipeline activity.

## SYNTAX

```
Add-AdfDependency [-Activity] <PSObject> [-OnActivity] <PSObject> [-Condition] <String[]>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Adds a dependency on a predecessor activity to the specified activity's dependsOn collection.
Each dependency can specify one or more conditions.

## EXAMPLES

### EXAMPLE 1
```
$activity | Add-AdfDependency -OnActivity $predecessorActivity -Condition Succeeded
Adds a dependency that allows the activity to proceed when the predecessor succeeds.
```

## PARAMETERS

### -Activity
The pipeline activity to which the dependency will be added.

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
The predecessor activity to add as a dependency.

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

### -Condition
One or more conditions: Succeeded, Failed, Completed, or Skipped.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
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

[https://abbgrade.github.io/PsDataFactory/docs/Add-AdfDependency.html](https://abbgrade.github.io/PsDataFactory/docs/Add-AdfDependency.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

