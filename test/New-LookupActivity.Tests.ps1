#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }

Describe New-LookupActivity {
    
    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    BeforeEach {
        $Pipeline = New-AdfPipeline -Name MyPipeline -Description Test
        $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        $Source = New-AdfAzureSqlTable -Name MySourceDataset -TableName MyTable -LinkedServiceReference $LinkedServiceReference
    }

    It works {
        New-AdfLookupActivity -Name MyAcitivity -Source $Source -SourceType AzureSqlSource -ErrorAction Stop
    }
}
