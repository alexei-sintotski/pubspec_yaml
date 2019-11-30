import 'package:pubspec_yaml/src/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('$PubspecYaml.loadFromYamlString', () {
    group('given pubspec.yaml with one custom field', () {
      final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithOneCustomField);
      test('it produces object with a single custom field', () {
        expect(pubspecYaml.customFields.length, 1);
      });
      test('it produces object with correct custom field', () {
        expect(pubspecYaml.customFields.keys, contains(customFieldName));
      });
    });

    group('given pubspec.yaml with two custom fields', () {
      final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithTwoCustomFields);
      test('it produces object with two custom field', () {
        expect(pubspecYaml.customFields.length, 2);
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
