import 'dart:io';

import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given realistic pubspec.yaml content', () {
    final realisticPubspecYaml = File('${gitRepoRoot()}/pubspec.lock').readAsStringSync();

    group('$PubspecYaml.loadFromYamlString', () {
      test('does not crash', () {
        PubspecYaml.loadFromYamlString(realisticPubspecYaml);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('preserves equivalence', () {
        final pubspecYaml = PubspecYaml.loadFromYamlString(realisticPubspecYaml);
        expect(PubspecYaml.loadFromYamlString(pubspecYaml.toYamlString()), pubspecYaml);
      });
    });
  });
}

// ignore: avoid_as
String gitRepoRoot() => (Process.runSync('git', ['rev-parse', '--show-toplevel']).stdout as String).trim();
