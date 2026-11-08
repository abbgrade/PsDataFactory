---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/Export-AdfDataset.html
schema: 2.0.0
---

# Export-AdfDataset

## SYNOPSIS
Exports a dataset as a JSON file.

## SYNTAX

```
Export-AdfDataset [-Dataset] <Object> [-DatasetsDirectory] <DirectoryInfo> [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
Serializes the dataset to JSON and writes it to a file named after the dataset in the existing destination directory.
Outputs the resulting file path.

## EXAMPLES

### EXAMPLE 1
```
$dataset | Export-AdfDataset -DatasetsDirectory (Get-Item .\datasets)
Writes the dataset JSON file to the datasets directory.
```

## PARAMETERS

### -Dataset
The dataset to serialize.

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

### -DatasetsDirectory
The existing directory in which to write the dataset JSON file.

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

### System.IO.FileInfo. The path of the exported dataset file.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/Export-AdfDataset.html](https://abbgrade.github.io/PsDataFactory/docs/Export-AdfDataset.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/datasets/create-or-update?view=rest-datafactory-2018-06-01)

