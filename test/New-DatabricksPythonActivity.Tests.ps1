#Requires -Modules @{ ModuleName='Pester'; ModuleVersion='5.0.0' }, PsDac

Describe New-DatabricksPythonActivity {

    BeforeAll {
        Import-Module $PSScriptRoot\..\src\PsDataFactory.psd1 -Force -ErrorAction Stop
    }

    Context AzureDatabricks {

        BeforeEach {
            $LinkedServiceReference = New-AdfLinkedServiceReference -Name MyLinkedService
        }

        It works {
            New-AdfDatabricksPythonActivity -Name MyPythonActivity -PythonFilePath "dbfs:/main.py" -LinkedServiceReference $LinkedServiceReference -ErrorAction Stop
        }

    }

}
