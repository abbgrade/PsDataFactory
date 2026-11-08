---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# New-AdfPipelineActivity

## SYNOPSIS
Creates a new Azure Data Factory pipeline activity that executes another pipeline.

## SYNTAX

```
New-AdfPipelineActivity [-Name] <String> [-PipelineName] <String> [[-Timeout] <Object>] [[-DependsOn] <Object>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates and configures an ExecutePipeline activity that invokes another pipeline.

## EXAMPLES

### EXAMPLE 1
```
New-AdfPipelineActivity -Name 'ExecuteChildPipeline' -PipelineName 'ChildPipelineName'
Creates an activity that invokes the specified child pipeline.
```

## PARAMETERS

### -Name
The name of the pipeline activity.

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

### -PipelineName
The name of the pipeline that this activity will execute.

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

### -Timeout
The timeout duration for the activity execution.
Default is '0.12:00:00' (12 hours).

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 0.12:00:00
Accept pipeline input: False
Accept wildcard characters: False
```

### -DependsOn
An array of dependencies for this activity.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: @()
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
