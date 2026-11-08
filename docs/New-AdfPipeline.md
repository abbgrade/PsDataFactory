---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/New-AdfPipeline.html
schema: 2.0.0
---

# New-AdfPipeline

## SYNOPSIS
Creates an Azure Data Factory pipeline definition.

## SYNTAX

```
New-AdfPipeline [-Name] <String> [[-Description] <String>] [[-Activities] <PSObject[]>]
 [[-Parameters] <PSObject>] [[-Variables] <PSObject>] [[-FolderName] <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a pipeline object with its name, description, activities, parameters, variables, folder, and generated-pipeline annotation.

## EXAMPLES

### EXAMPLE 1
```
New-AdfPipeline -Name 'DailyLoad' -Description 'Loads daily data'
Creates a pipeline definition with the specified name and description.
```

## PARAMETERS

### -Name
The pipeline name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Description
The optional pipeline description.

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

### -Activities
The activities to include in the pipeline.
Defaults to an empty array.

```yaml
Type: PSObject[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @()
Accept pipeline input: False
Accept wildcard characters: False
```

### -Parameters
The pipeline parameters.
Defaults to an empty object.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -Variables
The pipeline variables.
Defaults to an empty object.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -FolderName
The optional pipeline folder name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
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

### System.Management.Automation.PSCustomObject. The pipeline definition.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/New-AdfPipeline.html](https://abbgrade.github.io/PsDataFactory/docs/New-AdfPipeline.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

