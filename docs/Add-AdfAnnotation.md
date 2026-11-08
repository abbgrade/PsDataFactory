---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Add-AdfAnnotation.html
schema: 2.0.0
---

# Add-AdfAnnotation

## SYNOPSIS
Adds an annotation to a pipeline.

## SYNTAX

```
Add-AdfAnnotation [-Pipeline] <PSObject> [-Annotation] <String> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Appends the supplied annotation to the pipeline's existing annotations.

## EXAMPLES

### EXAMPLE 1
```
$pipeline | Add-AdfAnnotation -Annotation 'Production'
Appends the supplied annotation to the pipeline's annotations.
```

## PARAMETERS

### -Pipeline
The pipeline to update.

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

### -Annotation
The annotation to append to the pipeline.

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

[https://abbgrade.github.io/PsDataFactory/docs/Add-AdfAnnotation.html](https://abbgrade.github.io/PsDataFactory/docs/Add-AdfAnnotation.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

