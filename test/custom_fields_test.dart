import 'package:pubspec_yaml/src/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with one custom field', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithOneCustomField);
    group('$PubspecYaml.loadFromYamlString', () {
      test('it produces object with a single custom field', () {
        expect(pubspecYaml.customFields.length, 1);
      });
      test('it produces object with correct custom field', () {
        expect(pubspecYaml.customFields.keys, contains(customFieldName));
      });
    });
    group('$PubspecYaml.toYamlString', () {
      test('preserves custom fields data', () {
        expect(PubspecYaml.loadFromYamlString(pubspecYaml.toYamlString()).customFields, pubspecYaml.customFields);
      });
    });
  });

  group('given pubspec.yaml with two custom fields', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithTwoCustomFields);
    group('$PubspecYaml.loadFromYamlString', () {
      test('it produces object with two custom field', () {
        expect(pubspecYaml.customFields.length, 2);
      });
    });
    group('$PubspecYaml.toYamlString', () {
      test('preserves custom fields data', () {
        expect(PubspecYaml.loadFromYamlString(pubspecYaml.toYamlString()).customFields, pubspecYaml.customFields);
      });
    });
  });
}

const customFieldName = 'custom_field';
const pubspecYamlWithOneCustomField = '''
$customFieldName:
  assets:
    - assets/my_icon.png
    - assets/background.png
''';

const pubspecYamlWithTwoCustomFields = '''
$customFieldName:
  assets:
    - assets/my_icon.png
    - assets/background.png
another_custom_field: value
''';
