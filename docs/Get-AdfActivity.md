---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Get-AdfActivity.html
schema: 2.0.0
---

# Get-AdfActivity

## SYNOPSIS
Gets activities from a pipeline.

## SYNTAX

```
Get-AdfActivity [-Pipeline] <PSObject> [[-Name] <String>] [-Recurse] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Returns all activities in the pipeline, or only the activity whose name matches the supplied name.
Use Recurse to include activities nested in If Condition branches.

## EXAMPLES

### EXAMPLE 1
```
$pipeline = New-AdfPipeline -Name 'MyPipeline'
$ifCondition = New-AdfIfCondition -Name 'IsReady' -Expression '1=1'
$activity = New-AdfPipelineActivity -Name 'CopyToArchive' -PipelineName 'ArchivePipeline'
$ifCondition.typeProperties | Add-Member -NotePropertyName ifTrueActivities -NotePropertyValue @($activity)
$pipeline | Add-AdfActivity -Activity $ifCondition
$pipeline | Get-AdfActivity -Recurse
Returns both the If Condition and its nested CopyToArchive activity.
```

## PARAMETERS

### -Pipeline
The pipeline from which to retrieve activities.

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

### -Name
An optional activity name used to filter the results.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Recurse
Include activities nested in If Condition branches.

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

### System.Management.Automation.PSCustomObject. One or more pipeline activities.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/Get-AdfActivity.html](https://abbgrade.github.io/PsDataFactory/docs/Get-AdfActivity.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

