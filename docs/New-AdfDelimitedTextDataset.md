---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version:
schema: 2.0.0
---

# New-AdfDelimitedTextDataset

## SYNOPSIS
Creates a delimited text dataset definition.

## SYNTAX

```
New-AdfDelimitedTextDataset [-Name] <String> [[-LinkedServiceReference] <PSObject>] [[-Parameters] <PSObject>]
 [[-FolderName] <String>] [-Location] <PSObject> [-ColumnDelimiter] <String> [-EscapeChar] <String>
 [-FirstRowAsHeader] <Boolean> [-QuoteChar] <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates a dataset definition for delimited text and configures its location and delimiter, escape, header, and quote settings.

## EXAMPLES

### EXAMPLE 1
```
New-AdfDelimitedTextDataset -Name 'InputFile' -Location $location -ColumnDelimiter ',' -EscapeChar '\' -FirstRowAsHeader $true -QuoteChar '"'
Creates a delimited text dataset definition.
```

## PARAMETERS

### -Name
The dataset name.

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

### -LinkedServiceReference
The linked service reference for the dataset.

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

### -Parameters
The dataset parameters.
Defaults to an empty object.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: @{}
Accept pipeline input: False
Accept wildcard characters: False
```

### -FolderName
The optional dataset folder name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Location
The location configuration for the delimited text data.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ColumnDelimiter
The character used to separate columns.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EscapeChar
The escape character.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -FirstRowAsHeader
Specifies whether the first row is treated as a header.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: 8
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -QuoteChar
The quote character.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 9
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

### System.Management.Automation.PSCustomObject. The dataset definition.
## NOTES

## RELATED LINKS
