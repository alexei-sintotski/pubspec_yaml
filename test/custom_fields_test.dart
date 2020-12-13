import 'package:pubspec_yaml/src/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with one custom field', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithOneCustomField);
    group('$PubspecYaml.loadFromYamlString', () {
      test('it produces object with a single custom field', () {
        expect(pubspec.customFields.length, 1);
      });
      test('it produces object with correct custom field', () {
        expect(pubspec.customFields.keys, contains(customFieldName));
      });
    });
    group('$PubspecYaml.toYamlString', () {
      test('preserves custom fields data', () {
        expect(
          PubspecYaml.loadFromYamlString(pubspec.toYamlString()).customFields,
          pubspec.customFields,
        );
      });
    });
  });

  group('given pubspec.yaml with two custom fields', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithTwoCustomFields);
    group('$PubspecYaml.loadFromYamlString', () {
      test('it produces object with two custom field', () {
        expect(pubspec.customFields.length, 2);
      });
    });
    group('$PubspecYaml.toYamlString', () {
      test('preserves custom fields data', () {
        expect(
            PubspecYaml.loadFromYamlString(pubspec.toYamlString()).customFields,
            pubspec.customFields);
      });
    });
  });
}

const customFieldName = 'custom_field';
const pubspecWithOneCustomField = '''
$customFieldName:
  assets:
    - assets/my_icon.png
    - assets/background.png
''';

const pubspecWithTwoCustomFields = '''
$customFieldName:
  assets:
    - assets/my_icon.png
    - assets/background.png
another_custom_field: value
''';
