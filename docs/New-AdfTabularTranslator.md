---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/New-AdfTabularTranslator.html
schema: 2.0.0
---

# New-AdfTabularTranslator

## SYNOPSIS
Creates an empty tabular translator.

## SYNTAX

```
New-AdfTabularTranslator [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Returns a translator object with type TabularTranslator and an empty columnMappings collection.

## EXAMPLES

### EXAMPLE 1
```
$translator = New-AdfTabularTranslator
Creates an empty tabular translator for subsequent column mappings.
```

## PARAMETERS

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

### System.Management.Automation.PSCustomObject. The tabular translator.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/New-AdfTabularTranslator.html](https://abbgrade.github.io/PsDataFactory/docs/New-AdfTabularTranslator.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

