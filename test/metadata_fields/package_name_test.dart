import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with package name', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithPackageNameDefined);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct package name', () {
        expect(pubspecYaml.name, packageName);
      });
      test('produces object without custom fields', () {
        expect(pubspecYaml.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      final outputYaml = pubspecYaml.toYamlString();
      test('produces string equivalent to the input', () {
        expect(outputYaml, pubspecYamlWithPackageNameDefined);
      });
    });
  });
}

const packageName = 'pubspec_yaml';
const pubspecYamlWithPackageNameDefined = '''
name: $packageName
''';
