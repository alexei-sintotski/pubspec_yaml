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
  group('given pubspec.yaml with Git package dependency', () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithGitPackageDependency,
    );

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with single dependency', () {
        expect(pubspec.dependencies.length, 1);
      });
      test('produces object with GitPackageDependencySpec', () {
        expect(
          pubspec.dependencies.first.iswitcho(
            git: (p) => p,
            otherwise: () => null,
          ),
          isNotNull,
        );
      });
      test('produces object with correct dependency name', () {
        expect(pubspec.dependencies.first.package(), dependency);
      });
      test('produces object with correct url', () {
        expect(
          pubspec.dependencies.first.iswitcho(
            git: (p) => p.url,
            otherwise: () => '',
          ),
          url,
        );
      });
      test('produces object without custom fields', () {
        expect(pubspec.customFields, isEmpty);
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspec.toYamlString(), pubspecWithGitPackageDependency);
      });
    });
  });

  group('given pubspec.yaml with Git package dependency with ref specified',
      () {
    final pubspec = PubspecYaml.loadFromYamlString(
      pubspecWithGitRefSpecification,
    );

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct dependency name', () {
        expect(pubspec.dependencies.first.package(), dependency);
      });
      test('produces object with correct url', () {
        expect(
          pubspec.dependencies.first.iswitcho(
            git: (p) => p.url,
            otherwise: () => '',
          ),
          url,
        );
      });
      test('produces object with correct ref', () {
        expect(
          pubspec.dependencies.first.iswitcho(
            git: (p) => p.ref.valueOr(() => ''),
            otherwise: () => '',
          ),
          ref,
        );
      });
      test('produces object without path', () {
        expect(
          pubspec.dependencies.first.iswitcho(
            git: (p) => p.path.hasValue,
            otherwise: () => true,
          ),
          isFalse,
        );
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspec.toYamlString(), pubspecWithGitRefSpecification);
      });
    });
  });

  group('given pubspec.yaml with Git package dependency with path specified',
      () {
    final pubspecYaml = PubspecYaml.loadFromYamlString(
      pubspecYamlWithPathSpecification,
    );

    group('$PubspecYaml.loadFromYamlString', () {
      test('produces object with correct path', () {
        expect(
            pubspecYaml.dependencies.first.iswitcho(
              git: (p) => p.path.valueOr(() => ''),
              otherwise: () => '',
            ),
            path);
      });
      test('produces object without ref', () {
        expect(
          pubspecYaml.dependencies.first.iswitcho(
            git: (p) => p.ref.hasValue,
            otherwise: () => true,
          ),
          isFalse,
        );
      });
    });

    group('$PubspecYaml.toYamlString', () {
      test('produces string equivalent to the input', () {
        expect(pubspecYaml.toYamlString(), pubspecYamlWithPathSpecification);
      });
    });
  });
}

const dependency = 'kittens';
const url = 'git://github.com/munificent/kittens.git';
const pubspecWithGitPackageDependency = '''
name: pubspec_yaml

dependencies:
  $dependency:
    git: "$url"
''';

const ref = 'some-branch';
const pubspecWithGitRefSpecification = '''
name: pubspec_yaml

dependencies:
  $dependency:
    git:
      url: "$url"
      ref: "$ref"
''';

const path = 'path/to/kittens';
const pubspecYamlWithPathSpecification = '''
name: pubspec_yaml

dependencies:
  $dependency:
    git:
      url: "$url"
      path: $path
''';
