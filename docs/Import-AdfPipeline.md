---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# Import-AdfPipeline

## SYNOPSIS
Imports a pipeline from a JSON file.

## SYNTAX

```
Import-AdfPipeline [-PipelinePath] <FileInfo> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Reads the specified pipeline JSON file and converts its contents to a PowerShell object.

## EXAMPLES

### EXAMPLE 1
```
Import-AdfPipeline -PipelinePath (Get-Item .\MyPipeline.json)
Reads the pipeline from the specified JSON file.
```

## PARAMETERS

### -PipelinePath
The existing pipeline JSON file to import.
The path can be supplied through pipeline input.

```yaml
Type: FileInfo
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

### System.Management.Automation.PSCustomObject. The imported pipeline object.
## NOTES

## RELATED LINKS
