/*
 * MIT License
 *
 * Copyright (c) 2019 Alexei Sintotski
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 * */

import 'package:pubspec_yaml/src/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with package description', () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithPackageDescriptionDefined,
    );

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct package description', () {
        expect(pubspec.description.valueOr(() => ''), packageDescription);
      });
      test('produces object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      final outputYaml = pubspec.toYamlString();
      test('produces string equivalent to the input', () {
        expect(outputYaml, pubspecWithPackageDescriptionDefined);
      });
    });
  });

  group('given pubspec.yaml with undefined package description', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithoutDescription);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object without package description defined', () {
        expect(pubspec.description.hasValue, isFalse);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      final outputYaml = pubspec.toYamlString();
      test('produces string equivalent to the input', () {
        expect(outputYaml, pubspecWithoutDescription);
      });
    });
  });

  group('given pubspec.yaml with multine package description', () {
    final pubspec =
        PubspecYaml.loadFromYamlString(pubspecWithMultilinePackageDescription);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct package description', () {
        expect(pubspec.description.valueOr(() => ''), packageDescription);
      });
      test('produces object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });
  });
}

const packageDescription =
    'Dart library to access and manipulate content of pubpec.yaml files';
const pubspecWithPackageDescriptionDefined = '''
name: pubspec_yaml
description: $packageDescription
''';

const pubspecWithoutDescription = '''
name: pubspec_yaml
''';

const pubspecWithMultilinePackageDescription = '''
name: pubspec_yaml
description: >-
  $packageDescription
''';
