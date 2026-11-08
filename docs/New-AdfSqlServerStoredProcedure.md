---
external help file: PsDataFactory-help.xml
Module Name: PsDataFactory
online version: https://abbgrade.github.io/PsDataFactory/docs/New-AdfSqlServerStoredProcedure.html
schema: 2.0.0
---

# New-AdfSqlServerStoredProcedure

## SYNOPSIS
Creates a SQL Server stored procedure activity.

## SYNTAX

### Expression
```
New-AdfSqlServerStoredProcedure -Name <String> -LinkedServiceReference <PSObject>
 -StoredProcedureExpression <String> [-Timeout <Object>] [-DependsOn <Object>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Name
```
New-AdfSqlServerStoredProcedure -Name <String> -LinkedServiceReference <PSObject> -StoredProcedureName <String>
 [-Timeout <Object>] [-DependsOn <Object>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Creates an activity that invokes a stored procedure using the supplied linked service.
Specify either a literal procedure name or an expression.

## EXAMPLES

### EXAMPLE 1
```
New-AdfSqlServerStoredProcedure -Name 'RunProcedure' -LinkedServiceReference $linkedService -StoredProcedureName 'dbo.LoadData'
Creates an activity that invokes the specified stored procedure.
```

## PARAMETERS

### -Name
The activity name.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -LinkedServiceReference
The linked service reference used to connect to SQL Server.

```yaml
Type: PSObject
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StoredProcedureExpression
An expression that resolves to the stored procedure name.
Used with the Expression parameter set.

```yaml
Type: String
Parameter Sets: Expression
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StoredProcedureName
The literal stored procedure name.
Used with the Name parameter set.

```yaml
Type: String
Parameter Sets: Name
Aliases:

Required: True
Position: Named
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
Position: Named
Default value: 0.12:00:00
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
Position: Named
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

### System.Management.Automation.PSCustomObject. The stored procedure activity definition.
## NOTES

## RELATED LINKS

[https://abbgrade.github.io/PsDataFactory/docs/New-AdfSqlServerStoredProcedure.html](https://abbgrade.github.io/PsDataFactory/docs/New-AdfSqlServerStoredProcedure.html)

[https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01](https://learn.microsoft.com/en-us/rest/api/datafactory/pipelines/create-or-update?view=rest-datafactory-2018-06-01)

