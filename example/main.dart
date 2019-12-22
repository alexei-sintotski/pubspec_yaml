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
