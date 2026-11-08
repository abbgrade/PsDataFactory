---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Add-AdfVariable.html
schema: 2.0.0
---

# Add-AdfVariable

## SYNOPSIS
Adds a variable definition to a pipeline.

## SYNTAX

```
Add-AdfVariable -Pipeline <PSObject> [-Name] <String> [-Type] <String> [-DefaultValue <String>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Adds a variable with the specified type to the pipeline's variables collection.
If a non-empty default value is provided, it is added to the variable definition.

## EXAMPLES

### EXAMPLE 1
```
$pipeline | Add-AdfVariable -Name 'RecordCount' -Type 'Int'
Adds an Int variable named RecordCount.
```

## PARAMETERS

### -Pipeline
The pipeline to update.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Name
The variable name.

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

### -Type
The variable type.

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

### -DefaultValue
An optional default value for the variable.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
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

[https://abbgrade.github.io/PsDataFactory/docs/Add-AdfVariable.html](https://abbgrade.github.io/PsDataFactory/docs/Add-AdfVariable.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

