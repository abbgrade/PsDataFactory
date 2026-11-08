---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Export-AdfPipeline.html
schema: 2.0.0
---

# Export-AdfPipeline

## SYNOPSIS
Exports a pipeline as a JSON file.

## SYNTAX

```
Export-AdfPipeline [-Pipeline] <Object> [-PipelinesDirectory] <DirectoryInfo>
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Serializes the pipeline to JSON and writes it to a file named after the pipeline in the existing destination directory.
Outputs the resulting file path.

## EXAMPLES

### EXAMPLE 1
```
$pipeline | Export-AdfPipeline -PipelinesDirectory (Get-Item .\pipelines)
Writes the pipeline JSON file to the pipelines directory.
```

## PARAMETERS

### -Pipeline
The pipeline to serialize.

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

### -PipelinesDirectory
The existing directory in which to write the pipeline JSON file.

```yaml
Type: DirectoryInfo
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

### System.IO.FileInfo. The path of the exported pipeline file.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/Export-AdfPipeline.html](https://abbgrade.github.io/PsDataFactory/docs/Export-AdfPipeline.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

