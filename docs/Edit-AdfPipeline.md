---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Edit-AdfPipeline.html
schema: 2.0.0
---

# Edit-AdfPipeline

## SYNOPSIS
Applies a supported edit operation to a pipeline.

## SYNTAX

```
Edit-AdfPipeline [-Pipeline] <Object> [-Operation] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Performs the requested operation on the pipeline.
The supported operation, InvertDependencies, reverses the direction of dependencies between activities.

## EXAMPLES

### EXAMPLE 1
```
$pipeline | Edit-AdfPipeline -Operation InvertDependencies
Reverses the pipeline's activity dependencies.
```

## PARAMETERS

### -Pipeline
The pipeline to edit.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Operation
The operation to perform.
Currently supported value: InvertDependencies.

```yaml
Type: String
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

[https://abbgrade.github.io/PsDataFactory/docs/Edit-AdfPipeline.html](https://abbgrade.github.io/PsDataFactory/docs/Edit-AdfPipeline.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

