import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with package name', () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithPackageNameDefined,
    );

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct package name', () {
        expect(pubspec.name, packageName);
      });
      test('produces object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      final outputYaml = pubspec.toYamlString();
      test('produces string equivalent to the input', () {
        expect(outputYaml, pubspecWithPackageNameDefined);
      });
    });
  });
}

const packageName = 'pubspec_yaml';
const pubspecWithPackageNameDefined = '''
name: $packageName
''';
