---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Get-AdfDependency.html
schema: 2.0.0
---

# Get-AdfDependency

## SYNOPSIS
Retrieves the dependencies of a pipeline activity.

## SYNTAX

```
Get-AdfDependency [-Activity] <PSObject> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns the dependsOn collection from the specified pipeline activity, which contains all predecessor activities and their associated conditions.

## EXAMPLES

### EXAMPLE 1
```
$activity | Get-AdfDependency
Returns all dependencies configured for the activity.
```

## PARAMETERS

### -Activity
The pipeline activity from which to retrieve dependencies.

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

[https://abbgrade.github.io/PsDataFactory/docs/Get-AdfDependency.html](https://abbgrade.github.io/PsDataFactory/docs/Get-AdfDependency.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

