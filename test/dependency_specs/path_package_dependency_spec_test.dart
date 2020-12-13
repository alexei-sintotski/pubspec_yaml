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
 *
 */

import 'package:pubspec_yaml/pubspec_yaml.dart';
import 'package:test/test.dart';

void main() {
  group('given pubspec.yaml with path package dependency', () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithPathPackageDependency,
    );

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with single dependency', () {
        expect(pubspec.dependencies.length, 1);
      });
      test('produces object with PathPackageDependencySpec', () {
        expect(
          pubspec.dependencies.first.iswitcho(
            path: (p) => p,
            otherwise: () => null,
          ),
          isNotNull,
        );
      });
      test('produces object with correct dependency name', () {
        expect(pubspec.dependencies.first.package(), package);
      });
      test('produces object with correct path', () {
        expect(
          pubspec.dependencies.first.iswitcho(
            path: (p) => p.path,
            otherwise: () => '',
          ),
          path,
        );
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspec.toYamlString(), pubspecWithPathPackageDependency);
      });
    });
  });
}

const package = 'transmogrify';
const path = '/Users/me/transmogrify';
const pubspecWithPathPackageDependency = '''
name: pubspec_yaml

dependencies:
  $package:
    path: $path
''';
