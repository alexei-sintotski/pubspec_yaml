## [2.0.1] - 2020-04-23
* Support for functional_data 0.3.0

## [2.0.0] - 2020-03-23
* Support for command-line executables provided by the package
* PubspecYaml instances can be created from YAML using string extension method
* This version requires Dart 2.7
* Major refactoring to improve maintainability

## [1.0.0+1] - 2019-12-22
* README.md correction

## [1.0.0] - 2019-12-22
PubspecYaml is a data type representing data stored in pubspec.yaml files.

The following fields are supported:
* Package name
* Package version
* Package description
* Package author/authors
* Package homepage, repository, and issue tracker
* Package documentation
* Package server specification
* Dependency specifications: regular, dev, and overrides
* SDK constraints
* Command-line executables provided by the package

Other fields are accessible via PubspecYaml.customFields as a JSON structure (Map<String, dynamic>).
