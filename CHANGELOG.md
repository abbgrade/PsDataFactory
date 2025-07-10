# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- Fixed function `Edit-Pipeline` to invert dependencies.

## [0.6.0] - 2025-07-10

### Added

- New function `Edit-Pipeline` to invert dependencies.
- Added optional Name parameter to `Get-Activity` function.
- Added `Get-Dependency` and `Remove-Dependency` functions
- Added `Import-Pipeline` function.

## [0.5.0] - 2025-02-27

### Added

- Added support for DeltaLake datasets for copy activities.

## [0.4.0] - 2024-11-26

### Added

- Added new function `New-DatabricksPythonActivity`.

## [0.3.1] - 2024-11-05

### Fixed

- Fixed call of `New-Dataset` in `New-SqlServerTable`.

## [0.3.0] - 2024-10-25

### Changed

- Added schema parameter to `New-AzureDatabricksDeltaLakeTable`.
- Added delta lake support to `New-CopyActivity`.
- Added CSV specific parameters to `New-DelimitedTextDataset`.

## [0.2.0] - 2024-10-07

### Changed

- `Description` parameter of `New-Pipeline` is changed to be non mandatory.
- `New-SqlServerStoredProcedure` is changed that `StoredProcedureName` parameter is added in a parameterset next to `StoredProcedureExpression`.
- `New-CopyActivity` to support AdditionalSourceColumns and AzureDatabricksDeltaLakeSink.

### Added

- Added new `New-PipelineActivity` function.
- Added new `New-AzureDatabricksDeltaLakeTable` function.
- Added new `New-DelimitedTextDataset` function.

## [0.1.0] - 2023-03-21

<!-- markdownlint-configure-file {"MD024": { "siblings_only": true } } -->
