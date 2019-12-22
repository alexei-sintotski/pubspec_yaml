# pubspec_yaml [![Build Status](https://travis-ci.org/alexei-sintotski/pubspec_yaml.svg?branch=master)](https://travis-ci.org/alexei-sintotski/pubspec_yaml) [![codecov](https://codecov.io/gh/alexei-sintotski/pubspec_yaml/branch/master/graph/badge.svg)](https://codecov.io/gh/alexei-sintotski/pubspec_yaml) [![pubspec_lock version](https://img.shields.io/pub/v/pubspec_yaml?label=pubspec_yaml)](https://pub.dev/packages/pubspec_yaml)

Dart library to access and manipulate content of pubpec.yaml files

## Class PubspecYaml

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

## YAML Import / Export

PubspecYaml provides two methods to serialize pubspec.yaml content:
* The factory method PubspecYaml.loadFromYamlString() creates an object from a string with pubspec.yaml content
* PubspecYaml.toYamlString() produces pubspec.yaml content that can be written to a file

## Data Manipulation

PubspecYaml uses functional_data extensions to enable equality operations and lenses (https://pub.dev/packages/functional_data).

## Usage

To use pubspec_yaml, add the following dependency to pubspec.yaml:

```
dependencies:
  pubspec_yaml: ^1.0.0
```

## Example

The following Dart script checks whether production dependencies have overrides:
```
import 'dart:io';

import 'package:pubspec_yaml/pubspec_yaml.dart';

// ignore_for_file: avoid_print

void main() {
  final pubspecYamlContent = File('pubspec.yaml').readAsStringSync();
  final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlContent);

  final productionOverrides = pubspecYaml.dependencyOverrides.where(
    (override) => pubspecYaml.dependencies.any((
      productionDependency,
    ) =>
        productionDependency.package() == override.package()),
  );

  if (productionOverrides.isEmpty) {
    print('SUCCESS: No overrides of production dependencies detected');
  } else {
    print('WARNING: Overrides of production dependencies detected:');
    productionOverrides.forEach(print);
  }
}
```
