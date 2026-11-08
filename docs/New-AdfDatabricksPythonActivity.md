---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# New-AdfDatabricksPythonActivity

## SYNOPSIS
Creates an Azure Databricks Python activity.

## SYNTAX

```
New-AdfDatabricksPythonActivity [-Name] <String> [[-Timeout] <Object>] [-PythonFilePath] <String>
 [-LinkedServiceReference] <PSObject> [[-DependsOn] <Object>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates an activity that runs the specified Python file using the supplied Azure Databricks linked service.

## EXAMPLES

### EXAMPLE 1
```
New-AdfDatabricksPythonActivity -Name 'RunNotebookScript' -PythonFilePath 'dbfs:/main.py' -LinkedServiceReference $linkedService
Creates an activity that runs the specified Python file.
```

## PARAMETERS

### -Name
The activity name.

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

### -Timeout
The activity timeout.
Defaults to 12 hours.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: 0.12:00:00
Accept pipeline input: False
Accept wildcard characters: False
```

### -PythonFilePath
The path of the Python file to run.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkedServiceReference
The Azure Databricks linked service reference.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DependsOn
The activity dependencies.
Defaults to an empty array.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
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

### System.Management.Automation.PSCustomObject. The activity definition.
## NOTES

## RELATED LINKS
