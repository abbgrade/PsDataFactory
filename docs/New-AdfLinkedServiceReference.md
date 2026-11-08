---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/New-AdfLinkedServiceReference.html
schema: 2.0.0
---

# New-AdfLinkedServiceReference

## SYNOPSIS
Creates a linked service reference.

## SYNTAX

```
New-AdfLinkedServiceReference [-Name] <String> [[-Parameters] <PSObject>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Creates a reference object containing the linked service name and reference type, with optional parameters.

## EXAMPLES

### EXAMPLE 1
```
New-AdfLinkedServiceReference -Name 'StorageLinkedService'
Creates a reference to the specified linked service.
```

## PARAMETERS

### -Name
The linked service name.

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

### -Parameters
Optional parameters to include in the reference.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
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

### System.Management.Automation.PSCustomObject. The linked service reference.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/New-AdfLinkedServiceReference.html](https://abbgrade.github.io/PsDataFactory/docs/New-AdfLinkedServiceReference.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/linked-services/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/linked-services/create-or-update?view=rest-datafactory-2018-06-01)

