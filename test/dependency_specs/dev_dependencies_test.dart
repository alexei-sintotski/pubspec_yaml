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
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 *
 */

import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with dev dependencies', () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(pubspecYamlWithDevDependency);

    group('$PubspecYaml.loadFromYamlString()', () {
      test('produces object with non-empty list of dev dependencies', () {
        expect(pubspecYaml.devDependencies, isNotEmpty);
      });

      test('produces dev dependency with correct name', () {
        expect(pubspecYaml.devDependencies.first.package(), dependency);
      });

      test('produces object without custom fields', () {
        expect(pubspecYaml.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString())', () {
      test('produces string identical to the original input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithDevDependency);
      });
    });
  });
}

const dependency = 'test';
const pubspecYamlWithDevDependency = '''
name: pubspec_yaml

dev_dependencies:
  $dependency: ">=0.5.0 <0.12.0"
''';
