---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Get-AdfAnnotation.html
schema: 2.0.0
---

# Get-AdfAnnotation

## SYNOPSIS
Gets the annotations from a pipeline.

## SYNTAX

```
Get-AdfAnnotation [-Pipeline] <PSObject> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns each annotation configured on the pipeline as a separate string output.

## EXAMPLES

### EXAMPLE 1
```
$pipeline | Get-AdfAnnotation
Returns each annotation as a separate string.
```

## PARAMETERS

### -Pipeline
The pipeline from which to retrieve annotations.

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

### System.String. One or more pipeline annotations.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/Get-AdfAnnotation.html](https://abbgrade.github.io/PsDataFactory/docs/Get-AdfAnnotation.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

