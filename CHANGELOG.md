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
