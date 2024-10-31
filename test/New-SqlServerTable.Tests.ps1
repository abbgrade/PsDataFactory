#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-SqlServerTable {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
    }

    It works {
        New-AdfSqlServerTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop
    }

    It 'has property <structure>' {
        $dataset = New-AdfSqlServerTable -Name MyDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop
        $dataset.properties.PSobject.Properties.name -contains "structure" | Should -BeTrue
    }
}
