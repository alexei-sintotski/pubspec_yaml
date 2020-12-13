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

import 'package:pubspec_yaml/src/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with publish_to specification', () {
    final pubspec = PubspecYaml.loadFromYamlString(pubspecWithPublishToSpec);

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with publish_to data', () {
        expect(pubspec.publishTo.valueOr(() => ''), publishTo);
      });
      test('produces object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      final outputYaml = pubspec.toYamlString();
      test('produces string equivalent to the input', () {
        expect(outputYaml, pubspecWithPublishToSpec);
      });
    });
  });
}

const publishTo = 'none';
const pubspecWithPublishToSpec = '''
name: pubspec_yaml
publish_to: $publishTo
''';
