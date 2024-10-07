# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
