---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Import-AdfDataflow.html
schema: 2.0.0
---

# Import-AdfDataflow

## SYNOPSIS
Imports a Data Factory data flow definition from a JSON file.

## SYNTAX

```
Import-AdfDataflow [-DataflowPath] <FileInfo> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Reads a data flow definition from a JSON file and converts the JSON
content to PowerShell objects.

## EXAMPLES

### EXAMPLE 1
```
Import-AdfDataflow -DataflowPath .\MyDataflow.json
Imports the data flow definition from MyDataflow.json.
```

## PARAMETERS

### -DataflowPath
The JSON file containing the data flow definition.

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

### System.Object
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/Import-AdfDataflow.html](https://abbgrade.github.io/PsDataFactory/docs/Import-AdfDataflow.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/?view=rest-datafactory-2018-06-01)

